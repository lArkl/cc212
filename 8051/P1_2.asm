sdelay	equ 142h
	org 8000h
repite:	
	mov R1,#0
	mov R2,#10h
	;mov R3,#8
	mov A,R2
	;orl A,R3
	mov P1,A
	lcall sdelay
carga:
	mov A,R2
	;rl A
	add A,#1
	mov R2,A
	;mov A,R3
	;rr A
	;mov R3,A
	;orl A,R2
	mov P1,A
	lcall sdelay
	djnz R1,carga
	mov R1,#0
	sjmp repite
bucle:
	djnz R0,bucle
	ret
	end