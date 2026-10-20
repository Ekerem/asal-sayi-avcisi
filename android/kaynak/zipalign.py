"""APK içindeki sıkıştırılmamış dosyaları 4 bayta hizalar (zipalign yerine)."""
import sys, zipfile
src, dst = sys.argv[1], sys.argv[2]
zin = zipfile.ZipFile(src)
with open(dst, "wb") as f:
    zout = zipfile.ZipFile(f, "w")
    for info in zin.infolist():
        data = zin.read(info.filename)
        ni = zipfile.ZipInfo(info.filename, date_time=info.date_time)
        ni.external_attr = info.external_attr
        if info.filename == "resources.arsc" or info.filename.endswith(".png"):
            ni.compress_type = zipfile.ZIP_STORED
            off = f.tell() + 30 + len(ni.filename.encode())
            ni.extra = b"\x00" * ((4 - off % 4) % 4)
        else:
            ni.compress_type = zipfile.ZIP_DEFLATED
        zout.writestr(ni, data)
    zout.close()
