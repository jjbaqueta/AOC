.data
	a: .half 10
	b: .half 5
	result: .space 2
.text
	lh $t0, a		# carrega o valor da variável 'a' da memória para $t0
	lh $t1, b		# carrega o valor da variável 'b' da memória para $t1
	add $t0, $t0, $t1	# soma o valor de $t0 com o valor de $t1, o resultado é armazenado em $t0
	sh $t0, result		# escreve o valor de $t0 na variável 'result'
	li $v0, 10		# finalização do programa
	syscall