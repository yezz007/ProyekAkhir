@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "D:\Universitas Indonesia\Semester 2\POK\ProyekAkhir\labels.tmp" -fI -W+ie -o "D:\Universitas Indonesia\Semester 2\POK\ProyekAkhir\ProyekAkhir.hex" -d "D:\Universitas Indonesia\Semester 2\POK\ProyekAkhir\ProyekAkhir.obj" -e "D:\Universitas Indonesia\Semester 2\POK\ProyekAkhir\ProyekAkhir.eep" -m "D:\Universitas Indonesia\Semester 2\POK\ProyekAkhir\ProyekAkhir.map" "D:\Universitas Indonesia\Semester 2\POK\ProyekAkhir\main.asm"
