.data
	matriz: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
	colunas: .word 3
.text
	addi $t1, $zero, 2	# índice de linha para leitura
	addi $t2, $zero, 2	# índice de coluna para leitura
	lw $t3, colunas		# número de colunas

	sll $t3, $t3, 2		# calcula o tamanho da linha: uma linha é composta por 3 colunas, somando 12 bytes.
	mult $t1,$t3 		# multiplica o índice de linha pelo tamanho da linha 
	mflo $t1		# carrega o resultado da multiplicação para $t1 (deslocamento de linha)
	sll $t2, $t2, 2		# multiplica o índice de coluna por 4 (4 bytes)
	add $t2, $t1, $t2	# calcula o deslocamento de coluna a partir do início da linha selecionada.
	
	lw $t4, matriz($t2)	# leitura do conteúdo da posição matriz[2][2] para $t4

	li $v0, 10
	syscall
