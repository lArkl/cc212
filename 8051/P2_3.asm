display equ 11Bh
	org 8000h
lazo:
	jnb P3.2,repite
	sjmp lazo;
repite:
	mov A,#4
	lcall display
	cpl A
	mov P1,A
	sjmp $;
	end