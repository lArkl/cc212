SetupP1 	mov.b #041h,&P1DIR ; P1.0 y P1.6 como salida
			mov.b #08h,&P1OUT ; P1.3 se pone a uno, sino cero //se pone como salida
			bis.b #08h,&P1REN ; P1.3 pullup
			mov.b #9h,&P1OUT	;Enciendo el LED rojo
Mainloop 	bit.b #08h,&P1IN ; P1.3 alto/bajo?
			jc ON ; jmp--> si P1.3 es 1
			;bic.b #001h,&P1OUT ; P1.0 = 0 / LED OFF
OFF			call #parpadeo	;P1.6=1/Led verde off/+8 ya que siempre debe mantener el 8 por la salida a P1.3
			jmp Mainloop ;
ON			mov.b #9h,&P1OUT ; P1.0 = 1 / LED rojo ON / +8 ya que siempre debe mantener el 8 por la salida a P1.3
			jmp Mainloop 
parpadeo	mov.b #49h,&P1OUT
			call #espera
			call #espera
			mov.b #48h,&P1OUT
			call #espera
			call #espera
			ret
espera		mov.w #050000,R15 ; Retardo se mueve a R15
L1			dec.w R15 ; Decrementa R15
 			jnz L1 ; se acabó el retardo?
 			ret