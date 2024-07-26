.data
	A: .word 40
	B: .word 8
	R: .space 4
.text

	lw $t0, A
	lw $t1, B
	div $t0, $t1
	mflo $t2
	mfhi $t3
	add $t4, $t2, $t3
	li $t5, 5
	bgt $t4, $t5, MAIOR
	blt $t4, $t5, MENOR
	li $t5, 2
	mult $t2, $t5
	mflo $t5
	sw $t5, R
	j FIM
	
	MAIOR:
	sub $t2, $t2, $t3
	sw $t2, R
	J FIM
	
	MENOR:
	add $t2, $t2, $t3
	sw $t2, R
	
	FIM:
	li $v0, 10
	syscall