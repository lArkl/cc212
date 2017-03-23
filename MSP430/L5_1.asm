
			bis.b #41h,&P1DIR      ; setea P1.0 y P1.6(LED verde) como salida
			bis.b #41h,&P1OUT		; pone el bit P1.0(LED ROJO) a alto
loop1		jmp loop1