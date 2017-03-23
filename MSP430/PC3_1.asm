
display	equ 11Bh
sndchr	equ 148h
	
	org 8000h
	lcall resetLCD4;al encendido del display llama a esta subrutina
	mov A,#1
	lcall delay
	lcall initLCD4
	mov A,#1
	lcall delay
	mov R0,#clrDsp
	lcall wrLCDcom4	;Permite escribir un comando al display
	mov A,#2	;Retardo de 2 milisegundos
	lcall delay
	mov R4,#0	;R4 hace de Largest
	mov R6,#10
	mov R2,#0
loop:
	mov A,R2
	lcall obtener_entero
	mov R5,A	;R5 hace de current
	mov A,R4
	subb A,R5	; A-R5 = largest - current
	jnc continue
	mov A,R5
	mov R4,A
continue:
	inc R2
	djnz R6,loop
	mov A,#1
	mov B,#0
	lcall placeCur4
	mov R0,#offCur
	lcall wrLCDcom4
	mov A,#1
	lcall delay
	lcall prtLCD4
	db "El mayor es :",0
	lcall print
	db 0dh,0ah,"El mayor es :",0
	mov A,#2
	mov B,#11
	lcall placeCur4
	mov A,R4
	mov B,#100
	div AB
	mov 31h,A
	mov A,B
	mov B,#10
	div AB
	mov 32h,A
	mov 33h,B
	mov A,31h
	add A,#30h
	mov R0,A
	lcall wrLCDdata4
	lcall sndchr
	mov A,32h
	add A,#30h
	mov R0,A
	lcall wrLCDdata4
	lcall sndchr
	mov A,33h
	add A,#30h
	mov R0,A
	lcall wrLCDdata4
	lcall sndchr
	ljmp 2F0h
obtener_entero:
	inc A
	movc A,@A+PC; mover codigo
	ret
	db 100,133,190,145,42,187,200,250,192,237
	
	$INCLUDE(subrutinasLCD.inc)
	end