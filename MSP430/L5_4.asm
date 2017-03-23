SetupP1 bis.b #001h,&P1DIR ; P1.0 como salida
 ;
Mainloop	xor.b #001h,&P1OUT ; Cambia P1.0,
			call #Espera
			call #Espera
			call #Espera
			call #Espera
			jmp Mainloop ; Lazo principal aqui
Espera		mov.w #050000,R15 ; Retardo se mueve a R15
L1			dec.w R15 ; Decrementa R15
 			jnz L1 ; se acabó el retardo?
 			Ret