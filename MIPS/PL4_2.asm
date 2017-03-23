	.data
intro: 	.asciiz "cadena de prueba"
long:	.asciiz "La longitud de la cadena es: "

	.text
	#mostrar mensaje
	li $v0,4
	la $a0,long
	syscall
	
	li $t1,0
	la $t0,intro
ciclo:  lb $a0,0($t0)
	beqz $a0,fin
	addi $t0,$t0,1
	addi $t1,$t1,1
	b ciclo
fin:    
	li $v0,1
	move $a0,$t1
	syscall
	#salida
	li $v0,10
	syscall