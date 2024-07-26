.data
	a: .word 10
	result: .space 4
.text
	lw $t0, a		# carrega o valor da variável 'a' da memória para $t0
	addi $t0, $t0, -1	# decrementa o valor armazenado em $t0 em uma unidade
	sw $t0, result		# escreve o valor de $t0 na variável 'result'
	li $v0, 10		# finalização do programa
	syscall