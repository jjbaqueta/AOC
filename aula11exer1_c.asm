.data
	a: .word 10
	sum: .word 0
.text
	lw $t0, a		# carrega o valor da variável 'a' da memória para $t0
	addi $t0, $t0, 10	# 10 é somado ao valor armazenado em $t0
	lw $t1, sum		# carrega o valor da variável 'sum' da memória para $t1
	add $t0, $t0, $t1	# soma o valor de $t0 com o valor de $t1, o resultado é armazenado em $t0
	sw $t0, sum		# escreve o valor de $t0 na variável 'sum'
	li $v0, 10		# finalização do programa
	syscall