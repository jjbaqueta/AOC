.data
	a: .byte 1
	b: .half 2
	c: .word 3
	result: .space 4
.text
	lb $t0, a		# carrega o valor da variável 'a' da memória para $t0
	lh $t1, b		# carrega o valor da variável 'b' da memória para $t1
	lw $t2, c		# carrega o valor da variável 'c' da memória para $t2
	add $t0, $t0, $t1	# soma o valor de $t0 com o valor de $t1, o resultado é armazenado em $t0
	add $t2, $t2, $t0	# soma o valor de $t0 com o valor de $t2, o resultado é armazenado em $t2
	sw $t2, result		# escreve o valor de $t2 na variável 'result'
	li $v0, 10		# finalização do programa
	syscall