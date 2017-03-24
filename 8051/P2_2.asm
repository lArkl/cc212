sndchr	equ 148h
display equ 11Bh
	org 8000h
	mov TMOD,#01h;modo 1
	mov TMOD,#01h;modo 1
	setb TR0
fibo:	
	mov R2,#1; Termino A
	mov R3,#1; Termino B
	mov A,R2
	add A,#30h
	lcall sndchr
	mov A,#20h
	lcall sndchr
	mov A,R3
	add A,#30h
	lcall sndchr
	mov A,#20h
	lcall sndchr
	mov A,R2
	lcall display
	cpl A
	mov P1,A
	mov R5,#3; hace de i
bucle:
	mov A,R2
	add A,R3
	mov R4,A	;hace de C
	mov A,R3
	mov R2,A
	mov A,R4
	mov R3,A
	mov A,R4
	add A,#30h
	lcall sndchr
	mov A,#20h
	lcall sndchr
	lcall display
	cpl A
	mov P1,A
	inc R5
	cjne R5,#5,bucle
	ljmp 2F0h
	
repite:
	mov R0,#10
	mov R1,#0
loop:
	mov A,R1
	sjmp bucle
	lcall segundo
	inc R1
	djnz R0,loop
	sjmp fibo
	sjmp repite
segundo:
	mov R7,#112
lazo:
	jnb TF0,$
	clr TF0
	djnz R7,lazo 
	ret
	end