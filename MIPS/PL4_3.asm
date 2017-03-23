	.data
origen:	.word 12000,23000,34000,45000,56000,65000
n:	.word 6
txt: 	.asciiz "Los elementos desde la dirección destino son: "
destino: .word 1,1,1,1,1,1

	.text
	la $t0, origen
	la $t1, destino
	la $t3, n
	lw $t3, ($t3)
	#mostrar mensaje
	li $v0,4
	la $a0,txt
	syscall
ciclo:
	 #salto de linea
	li $v0,11
	li $a0,10
	syscall
	lw $t2, ($t0) #pasamos el valor de origen a t2
	sw $t2,0($t1) #pasamos el valor de t2 a destino
	#verificamos pasando el valor de t1 a t2 y luego imprimimos 
	lw $t2,($t1)
	li $v0,1
	move $a0,$t2
	syscall

	#salto de ciclo
	addi $t0, $t0, 4
	addi $t1, $t1, 4
	addi $t3, $t3 ,-1
	bgtz $t3 ,ciclo
	
	#fin del programa
	li $v0,10
	syscall