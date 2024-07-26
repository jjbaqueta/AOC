.data
	idade: .word 18
	saida1: .asciiz "maior que 18 anos"
	saida2: .asciiz "menor que 18 anos"
	saida3: .asciiz "igual a 18 anos"
.text
	lw $t0, idade
	li $t1, 18
	bgt $t0, $t1, MAIOR
	blt $t0, $t1, MENOR 
	la $a0, saida3
	li $v0, 4
	syscall
	j FIM
	
	MENOR:
	la $a0, saida2
	li $v0, 4
	syscall
	j FIM
	
	MAIOR:
	la $a0, saida1
	li $v0, 4
	syscall
	
	FIM:
	li $v0, 10
	syscall