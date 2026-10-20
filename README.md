# Asal Sayı Avcısı

6. sınıf matematik, 1. tema için asal sayıları bulma oyunu. Ekranda 1'den 100'e kadar 10x10 bir sayı tablosu var. Öğrenci, alttaki bölen kartlarından birini (2, 3, 4, 5, 6, 7, 9, 10, 11, 13) tutup tablodaki bir sayının üstüne bırakır:

- Kart o sayıyı tam bölüyorsa sayı **buzlanır**.
- Bölmüyorsa hata sesi çıkar ve sayı değişmez.
- **Asal sayılar** yalnızca 1'e ve kendisine bölündüğü için hiç buzlanmaz.

74 bileşik sayının hepsi buzlanınca geriye kalan 25 asal sayı altın renkte parlar. 1 ise kırmızıyla gösterilir: 1 asal da değildir, bileşik de değildir.

## Hemen oyna

- **Tarayıcıda:** depo GitHub Pages ile yayınlandıysa `https://ekerem.github.io/asal-sayi-avcisi/` adresinden açılır.
- **İnternetsiz (bilgisayar, Pardus etkileşimli tahta):** [`indir/Asal-Sayi-Avcisi.html`](indir/Asal-Sayi-Avcisi.html) dosyasını USB belleğe kopyalayıp çift tıklayın.
- **Android telefon ve tablet:** [`indir/AsalSayiAvcisi.apk`](indir/AsalSayiAvcisi.apk) dosyasını cihaza indirip kurun. "Bilinmeyen kaynaklardan yükleme" iznini vermeniz gerekebilir. İnternet gerektirmez, Android 5.0 ve sonrası.

## Özellikler

- Sürükle-bırak ya da dokun-dokun ile oynanır. Önce karta, sonra sayıya dokunmak etkileşimli tahtalarda kolaylık sağlar.
- Kartların üstüne gelince bölünebilme kuralı ipucu olarak görünür (2, 3, 4, 5, 6, 9, 10).
- Açılışta hareketli bir örnekle "Nasıl oynanır?" ekranı gelir. Bu ekran istendiğinde üst menüden yeniden açılabilir.
- Sesler tarayıcıda üretilir, ek dosya gerekmez. Ses açılıp kapatılabilir.

## Klasörler

| Yol | İçerik |
| --- | --- |
| `index.html` | Oyunun kendisi (tek dosya) |
| `indir/` | İnternetsiz HTML ve Android APK |
| `android/kaynak/` | APK'nın kaynak kodu (WebView kabuğu, simge, derleme betiği) |

## APK'yı yeniden derlemek

`android/kaynak/build.sh` Gradle olmadan derler. Android SDK'daki `android.jar`, `d8.jar`, `apksigner.jar` ve `aapt2` gerekir; Unity'nin Android modülüyle gelen SDK'daki dosyalar da olur. Telefonlardaki uygulamanın silinmeden güncellenebilmesi için aynı imza anahtarı kullanılmalıdır. Anahtar bu depoda **bulunmaz**.
