#!/usr/bin/env bash
# Asal Sayı Avcısı - APK derleme betiği (Gradle gerektirmez)
# Gerekenler: JDK 11+, aapt2, android.jar (API 36), d8.jar, apksigner.jar, python3
# Kullanım: ANDROID_JAR=... D8_JAR=... APKSIGNER_JAR=... AAPT2=... KEYSTORE=... ./build.sh
set -euo pipefail
cd "$(dirname "$0")"
: "${ANDROID_JAR:?android.jar yolu}" "${D8_JAR:?d8.jar yolu}" "${APKSIGNER_JAR:?apksigner.jar yolu}" "${AAPT2:?aapt2 yolu}" "${KEYSTORE:?imza anahtarı yolu}"
rm -rf build assets && mkdir -p build/res build/gen build/classes build/dex assets
# Oyun dosyası: internetsiz çalışsın diye Google Fonts satırı çıkarılır
grep -v 'fonts.googleapis.com' ../../index.html > assets/index.html
"$AAPT2" compile --dir res -o build/res/
"$AAPT2" link -o build/base.apk -I "$ANDROID_JAR" --manifest AndroidManifest.xml -A assets \
  --java build/gen build/res/*.flat --min-sdk-version 21 --target-sdk-version 34
javac --release 8 -classpath "$ANDROID_JAR" -d build/classes $(find src build/gen -name '*.java')
java -cp "$D8_JAR" com.android.tools.r8.D8 --release --min-api 21 --lib "$ANDROID_JAR" \
  --output build/dex $(find build/classes -name '*.class')
cp build/base.apk build/unaligned.apk && (cd build/dex && zip -q ../unaligned.apk classes.dex)
python3 zipalign.py build/unaligned.apk build/aligned.apk
java -jar "$APKSIGNER_JAR" sign --ks "$KEYSTORE" --out build/AsalSayiAvcisi.apk build/aligned.apk
echo "Hazır: build/AsalSayiAvcisi.apk"
