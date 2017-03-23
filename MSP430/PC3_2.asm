sndchr	equ 148h
	org 8000h
	setb IT0
	setb EX0
	setb EA
	
	lcall resetLCD4
	mov A,#1
	lcall delay
	lcall initLCD4
	mov A,#1
	lcall delay
	
;Para limpiar el display LCD
	mov R0,#clrDsp
	lcall wrLCDcom4	
	mov A,#2	
	lcall delay


;Coloco el mensaje en la primera fila
	mov A,#1
	mov B,#0
	lcall placeCur4
	mov R0,#offCur
	lcall wrLCDcom4
	mov A,#1
	lcall delay
	lcall prtLCD4
	db " :",0
	lcall print
	db 0dh,0ah," :",0ah,0
;Coloco el mensaje en la segunda fila
	mov A,#2
	mov B,#11
	lcall placeCur4
	
repite:
	mov R7,#10
	mov R0,#30h
	mov 30h,R0
lazo:
	lcall wrLCDdata4
	mov R0,#shLfCur	
	lcall wrLCDcom4
	mov A,#0dh	
	lcall sndchr
	lcall espacios_blanco
	mov A,30h
	lcall sndchr
	lcall sdelay
	mov R0,30h
	inc R0
	mov 30h,R0
	djnz R7,lazo
	sjmp repite
	;ljmp 2F0h
espacios_blanco:

	mov A,#20h
	lcall sndchr
	mov A,#20h
	lcall sndchr
	
	$INCLUDE(subrutinasLCD.inc)
	end