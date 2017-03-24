display equ 11Bh
	org 8000h
inicio:
	mov R1,#0
mostrar:
	mov A,R1
	lcall display
	cpl A
	mov P1,A
repite:
	jnb P3.2, aumentar
	jnb P3.3, restar
	sjmp repite
aumentar:
	clr P3.2
	inc R1
	cjne R1,#10,inicio
	sjmp mostrar
restar:
	clr P3.3
	cjne R1,#0,nueve
	dec R1
	sjmp mostrar
nueve:
	mov R1,#9
	sjmp mostrar
	end