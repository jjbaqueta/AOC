.data
	num: .word 5
	saida1: .asciiz "par"
	saida2: .asciiz "ímpar"
.text
	lw $t0, num
	li $t1, 2
	div $t0, $t1
	mfhi $t0
	beq $t0, $zero, PAR 
	la $a0, saida2
	li $v0, 4
	syscall
	j FIM
	
	PAR:
	la $a0, saida1
	li $v0, 4
	syscall
	
	FIM:
	li $v0, 10
	syscall