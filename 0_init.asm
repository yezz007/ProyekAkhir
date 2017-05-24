.include "m64def.inc"

APP_INIT:
ldi lcd_temp, low(RAMEND)
out SPL, lcd_temp
ldi lcd_temp, high(RAMEND)
out SPH, lcd_temp
rcall LCD_INIT_ALL

QUIT: rjmp QUIT