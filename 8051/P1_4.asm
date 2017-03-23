sdelay	equ 118h
	org 8000h
inicio:
	jnb P3.2, repite
	sjmp inicio

repite:	
	mov R1,#0
	mov R2,#10h
	mov R3,#8
	mov A,R2
	orl A,R3
	mov P1,A
	lcall sdelay
ida:
	mov A,R2
	rl A
	mov R2,A
	orl A,R2
	mov P1,A
	lcall sdelay
	djnz R1,ida
	mov R1,#0
	sjmp repite
bucle:
	djnz R0,bucle
	ret
	end