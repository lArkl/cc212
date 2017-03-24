display	equ 11Bh
sndchr	equ 148h
	
	org 8000h
	mov R4,#176 ; R4 minimo
	mov R6,#10
	mov R2,#0
loop:
	mov A,R2
	lcall obtener_dato
	mov R5,A	
	subb A,R4	
	jnc sigue
	mov A,R5
	mov R4,A
sigue:
	inc R2
	djnz R6,loop
	mov A,R4
	add A,#30h
	lcall sndchr
	mov A,R4	
	lcall display
	cpl A
	mov P1,A
	ljmp 2F0h
obtener_dato:
	inc A
	movc A,@A+PC; mover codigo
	ret
	db 133,142,50,175,32,7,60,3,92,2
	end