	.data
intro:	
	.asciiz "Ingrese un número real: "
num1:
	.double 556
num2:
	.double 48
out:
	.asciiz "El resultado de la multiplicación y la división es: "
	.text
	#mostrar mensaje de ingreso
	li $v0,4
	la $a0,intro
	syscall
	
	#ingreso de numero
	li $v0,7
	syscall
	#carga num
	la $a2,num1
	l.d $f2,0($a2)#multiplicando
	la $a2,num2
	l.d $f4,0($a2)#divisor
	
	#operaciones
	mul.d $f12,$f0,$f2
	div.d $f12,$f12,$f4
	
	#muestra el mensaje final
	li $v0,4
	la $a0,out
	syscall
	
	#imprime resultado
	li $v0,3
	syscall
	#cierra el programa
	li $v0,10,
	syscall