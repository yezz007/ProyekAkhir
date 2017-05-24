# Setup Development
1. Instal git
2. Eksekusi perintah:
```
git clone https://github.com/yezz007/ProyekAkhir
```
3. Kalo mau ngoding, buat file .asm baru, jangan langsung di main.asm
4. Kalo kodingan kelar, eksekusi :
```
python compile.py
```

# Push Kodingan
Kalo ente merasa bahwa kodingan ente udah layak, silakan push ke repository dengan cara:
```
git remote add origin https://github.com/yezz007/ProyekAkhir
git push origin [nama Anda tanpa spasi]
```
Dengan cara ini semua orang bisa menggunakan fitur yang Anda tambahkan

# Reserved Registers
Haram memakai register berikut:
```
lcd_module.asm : r16, r17, r18
```