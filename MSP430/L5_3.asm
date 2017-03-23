SetupP1		bis.b	#001h,&P1DIR            ; P1.0  como salida

Mainloop	mov.b	#41h,&P1OUT            ; Cambia el estado de salida de P1.0
Wait		mov.w	#050000,R15             ; Retardo en R15
L1			dec.w	R15                     ; Decrementa R15
			jnz	L1                      	; Retardo se ha terminado?
			mov.b	#0,&P1OUT
Wait1		mov.w	#050000,R15             ; Retardo en R15
L2			dec.w	R15                     ; Decrementa R15
			jnz	L2                      	; Retardo se ha terminado?
			jmp		Mainloop				; salta a Main loop