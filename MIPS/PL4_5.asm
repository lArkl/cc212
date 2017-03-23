	.data
resultado:
	.asciiz "La altura es: "
gravedad:
	.double 9.80665
tiempo:
	.double 0.65

vel:
	.double 0.35
divisor:
	.double 2

	.text
	
	la $a2,tiempo
	l.d $f12,0($a2)
	la $a2,vel
	l.d $f2,0($a2)
	la $a2,gravedad
	l.d $f4,0($a2)
	la $a2,divisor
	l.d $f6,0($a2)	
	mul.d $f2,$f12,$f2 #v*t
	mul.d $f12,$f12,$f12
	mul.d $f4,$f4,$f12 #g*t*t
	div.d $f4,$f4,$f6 #g/2*t*t
	add.d $f12,$f12,$f4
	
	#Muestro el mensaje del resultado
	li $v0,4
	la $a0,resultado
	syscall
	
	li $v0,3
	syscall
	
	li $v0,10
	syscall