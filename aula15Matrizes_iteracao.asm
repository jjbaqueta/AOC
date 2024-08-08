.data
	.align 2
	matriz: .space 36	# matriz 3x3, onde cada elemento possui 32 bits (4 bytes)
	linhas: .word 3
	colunas: .word 3
.text
	addi $t1, $zero, 0	# índice de linha (i)
	addi $t2, $zero, 0	# índice de coluna (j)
	addi $t3, $zero, 1	# valor do termo matriz[i][j]
	addi $t4, $zero, 0	# offset (controla deslocamento da base)
	lw $t5, linhas		# número de linhas
	lw $t6, colunas		# número de colunas

	LOOP_LINHA:
	beq $t1, $t5, FIM	# verifica se é a última linha
	addi $t2, $zero, 0
	
	LOOP_COLUNA:
	beq $t2, $t6, PROXIMA_LINHA	# verifica se é a última coluna
	sw $t3, matriz($t4)		# escreve o conteúdo de $t3 na posição base(matriz) + $t4
	addi $t2, $t2, 1		# incrementa o índice de coluna em uma unidade
	addi $t3, $t3, 1		# incrementa o conteúdo de $t3 em uma unidade
	addi $t4, $t4, 4		# incrementa o offset em 4 bytes
	j LOOP_COLUNA

	PROXIMA_LINHA:
	addi $t1, $t1, 1	# incrementa o índice de linha em uma unidade
	j LOOP_LINHA
	
	FIM:
	li $v0, 10
	syscall