.def lcd_temp = r16
.def LCD_SETTINGS = r17
.def LCD = r18
.equ LCD_A = 0
.equ LCD_B = 1
.equ LCD_C = 2
.equ LCD_D = 3
.equ LCD_E = 4
.equ LINE1 = 0b10000000    //First char on line 1
.equ LINE2 = 0b11000000    //First char on line 2
.equ LINE3 = 0b10010100    //First char on line 3
.equ LINE4 = 0b11010100    //First char on line 4

; LCD R/S All 	: PORTA[1]
; LCD R/W All 	: PORTA[2]
; LCD DATA ALL 	: PORTB[0:7]
; LCD1 ENABLE 	: PORTA[0]
; LCD2 ENABLE 	: PORTA[3]
; LCD3 ENABLE 	: PORTA[4]
; LCD4 ENABLE 	: PORTA[5]
; LCD5 ENABLE 	: PORTA[6]
;
; Cara pemakaian module:
; rcall LCD_INIT_ALL
; ldi LCD, LCD_[A-E] ; pilih lcd
;
; ldi LCD_SETTINGS, LINE[1-4]  ; jangan pakai ini kalau mau lanjut
; rcall WRITE_LCD
;
; ldi ZH, high(PROGRAM_MEM_ENTRY*2)
; ldi ZL, low(PROGRAM_MEM_ENTRY*2)
; rcall LOAD_BYTES


LCD_INIT_ALL:

ldi LCD, LCD_A
rcall INIT_LCD
rcall CLEAR_LCD

ldi LCD, LCD_B
rcall INIT_LCD
rcall CLEAR_LCD

ldi LCD, LCD_C
rcall INIT_LCD
rcall CLEAR_LCD

ldi LCD, LCD_D
rcall INIT_LCD
rcall CLEAR_LCD

ldi LCD, LCD_E
rcall INIT_LCD
rcall CLEAR_LCD

ldi lcd_temp, 0xFF
out DDRA, lcd_temp
out DDRB, lcd_temp
;rcall WRITE_CACAD_TO_LCD_A
;rcall WRITE_KONYOL_TO_LCD_B
;rcall WRITE_KEREN_TO_LCD_C
;rcall WRITE_GAUL_TO_LCD_D
;rcall WRITE_AMPAS_TO_LCD_E
rjmp LCD_INIT_ALL_END

WRITE_CACAD_TO_LCD_A:
ldi LCD, LCD_A
ldi ZH, high(TEXT_CACAD*2)
ldi ZL, low(TEXT_CACAD*2)
rcall LOAD_BYTES
ret

WRITE_KONYOL_TO_LCD_B:
ldi LCD, LCD_B
ldi ZH, high(TEXT_KONYOL*2)
ldi ZL, low(TEXT_KONYOL*2)
rcall LOAD_BYTES
ret

WRITE_KEREN_TO_LCD_C:
ldi LCD, LCD_C
ldi ZH, high(TEXT_KEREN*2)
ldi ZL, low(TEXT_KEREN*2)
rcall LOAD_BYTES
ret

WRITE_GAUL_TO_LCD_D:
ldi LCD, LCD_D
ldi ZH, high(TEXT_GAUL*2)
ldi ZL, low(TEXT_GAUL*2)
rcall LOAD_BYTES
ret

WRITE_AMPAS_TO_LCD_E:
ldi LCD, LCD_E
ldi ZH, high(TEXT_AMPAS*2)
ldi ZL, low(TEXT_AMPAS*2)
rcall LOAD_BYTES
ret

LOAD_BYTES:
lpm
tst r0
breq WRITE_END
mov LCD_SETTINGS, r0
rcall TEXT_LCD
adiw ZL, 1
rjmp LOAD_BYTES

WRITE_END:
ret



LCD_INIT_ALL_END:
ret

INIT_LCD:
cbi PORTA, 1 ;add instruction
ldi LCD_SETTINGS, 0b00111000 ; 8 bit 2 line 5x11
rcall WRITE_LCD
ldi LCD_SETTINGS, 0b00001111 ; Display ON, curson ON, blink ON
rcall WRITE_LCD
ldi LCD_SETTINGS, 0b00000110 ; increment cursor, disable shift
rcall WRITE_LCD
ret

WRITE_LCD:
ldi lcd_temp, LCD_A
cp LCD, lcd_temp
breq WRITE_LCD_A

ldi lcd_temp, LCD_B
cp LCD, lcd_temp
breq WRITE_LCD_B

ldi lcd_temp, LCD_C
cp LCD, lcd_temp
breq WRITE_LCD_C

ldi lcd_temp, LCD_D
cp LCD, lcd_temp
breq WRITE_LCD_D

ldi lcd_temp, LCD_E
cp LCD, lcd_temp
breq WRITE_LCD_E

ret


WRITE_LCD_A: ;take data from LCD_SETTINGS
out PORTB, LCD_SETTINGS
sbi PORTA, 0 ; enable 1
cbi PORTA, 0 ; enable 0
ret

WRITE_LCD_B: ;take data from LCD_SETTINGS
out PORTB, LCD_SETTINGS
sbi PORTA, 3 ; enable 1
cbi PORTA, 3 ; enable 0
ret

WRITE_LCD_C: ;take data from LCD_SETTINGS
out PORTB, LCD_SETTINGS
sbi PORTA, 4 ; enable 1
cbi PORTA, 4 ; enable 0
ret

WRITE_LCD_D: ;take data from LCD_SETTINGS
out PORTB, LCD_SETTINGS
sbi PORTA, 5 ; enable 1
cbi PORTA, 5 ; enable 0
ret

WRITE_LCD_E: ;take data from LCD_SETTINGS
out PORTB, LCD_SETTINGS
sbi PORTA, 6 ; enable 1
cbi PORTA, 6 ; enable 0
ret

TEXT_LCD: ;take char from LCD_SETTINGS
sbi PORTA, 1 ;add data
rcall WRITE_LCD
cbi PORTA, 1 ;by default, add instruction not data
ret


CLEAR_LCD:
cbi PORTA, 1
ldi LCD_SETTINGS, 0x01
rcall WRITE_LCD
ret

;-----------------

TEXT_CACAD:
.db "cacadBgt"
.db 0

TEXT_KONYOL:
.db "konyolBgt"
.db 0

TEXT_KEREN:
.db "kerenBgt"
.db 0

TEXT_GAUL:
.db "gaulBgt"
.db 0

TEXT_AMPAS:
.db "ampasBgt"
.db 0

TEXT_OP:
.db "overpowered"
.db 0
