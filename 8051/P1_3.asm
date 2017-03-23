	org 8000h
	mov R0,#10h	;T
	mov A,R0
	mov B,#2h
	mul AB
	mov B,#7h	;U
	mul AB
	mov R1,A; guardamos 2*T*U
	mov A,#50h	;V
	mov B,#10h	;W
	div AB
	mov R2,A; guardamos V/W
	mov A,R1
	clr c; para limpiar el carry
	subb A,R2
	mov R3,#12h;	X
	add A,R3;
	mov R4,#6h;	Y
	add A,R3;
	mov R5,#55h;	z
	add A,R3;
	mov 30h,A
fin:
	sjmp fin
	end