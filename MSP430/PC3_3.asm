;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file

;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section
            .retainrefs                     ; Additionally retain any sections
                                            ; that have references to current
                                            ; section
;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer

;-------------------------------------------------------------------------------
                                            ; Main loop here
;-------------------------------------------------------------------------------
SetupP1 	mov.b #041h,&P1DIR ; P1.0 y P1.6 como salida
			mov.b #08h,&P1OUT ; P1.3 se pone a uno, sino cero //se pone como salida
			bis.b #08h,&P1REN
			mov.b #01h,&P1OUT
Mainloop 	bit.b #08h,&P1IN
			jc ON
OFF			mov.b #004,R10
			call #parpadeo1
			jmp Mainloop ;
ON			mov.b #08h,&P1OUT
			jmp Mainloop
parpadeo1	mov.b #49h,&P1OUT
			call #espera
			mov.b #09h,&P1OUT
			call #espera
			dec.b R10
			jnz parpadeo1
			mov.b #004,R10
parpadeo2	mov.b #08h,&P1OUT
			call #espera
			mov.b #48h,&P1OUT
			call #espera
			dec.b R10
			jnz parpadeo2
			ret

espera		mov.w #050000,R15 ;
L1			dec.w R15 ;
 			jnz L1 ;
 			ret

;-------------------------------------------------------------------------------
;           Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect 	.stack

;-------------------------------------------------------------------------------
;           Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET