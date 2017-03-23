	.data
intro:	
	.asciiz "Ingrese nota: "
text1:	
	.asciiz "El promedio de números ingresados es: "
text2:	
	.asciiz "Ud. "
no:	
	.asciiz "no "
ap:	
	.asciiz "aprueba."
num:
	.word 10
ini:
	.word 0

	.text
	li $t1,10 #cantidad de notas
	li $t0,0
ciclo:
	#ingrese nota
	li $v0,4
	la $a0,intro
	syscall
	#ingresa del teclado
	li $v0,5
	syscall
	#suma
	add $t0,$t0,$v0
	addi $t1, $t1 ,-1
	bgtz $t1 ,ciclo
	
	
	li $t2,10
	div $t0,$t2
	mflo $t0
	mfhi $t3
	#imprime
	li $v0,4
	la $a0,text1
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall
	
	li $v0,1
	move $a0,$t3
	syscall
	li $v0,1
	la $a0,text2
	syscall	
	blt $t0,$t2,desaprueba
continue:
	li $v0,1
	la $a0,ap
	syscall	
	li $v0,10
	syscall
desaprueba:
	li $v0,1
	la $a0,no
	syscall	
	b continue