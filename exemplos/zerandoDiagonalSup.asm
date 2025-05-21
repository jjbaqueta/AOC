# Exercício
# Com base em uma matriz 2x2, verifique se o elemento a11 é zero.
# Nesse caso, zere os elementos da diagonal superior da matriz (onde i < j). 
# Inicialize a matriz diretamente na seção .data 
# para evitar a entrada de dados pelo usuário.

.data
   matriz: .word 10, 20, 30, 0 # declaração da matriz

.text
   la $t0, matriz              # Carrega o endereço base da matriz em $t0
   li $t1, 1                   # Índice da linha (i = 1)
   li $t2, 1                   # Índice da coluna (j = 1)
   li $t3, 2                   # Número de colunas por linha (n = 2)

   # Parte 1: Cálculo do deslocamento para acessar matriz[i][j]
	
   sll $t4, $t3, 2             # $t4 = n * 4 (tamanho de uma linha em bytes)
   mult $t4, $t1               # $lo = (n * 4) * i
   mflo $t4                    # $t4 = deslocamento de linha
	
   sll $t5, $t2, 2             # $t5 = j * 4 (deslocamento da coluna)
   add $t6, $t4, $t5           # $t6 = deslocamento total (linha + coluna)
   add $t6, $t6, $t0           # $t6 = endereço final (base + deslocamento)
   lw $t7, ($t6)               # $t7 = matriz[i][j]
	
   # Parte 2: zerando a diagonal superior da matriz (onde i < j)
        
   li $t1, 0                   # Índice da linha (i = 0)
   li $t2, 0                   # Índice da coluna (j = 0)
   li $t3, 0                   # $t3 = deslocamento em bytes (para acesso à matriz)
	
   NOVA_LINHA:
   beq $t1, 2, FIM             # Se i == 2, fim da matriz (2 linhas)
   move $t2, $zero             # j = 0 (reinicia coluna)

   NOVA_COLUNA:
   beq $t2, 2, PROXIMA_LINHA   # Se j == 2, vai para próxima linha
   blt $t1, $t2, TESTE_ZERO    # Se i < j (diagonal superior), testa valor

   VOLTAR:
   addi $t3, $t3, 4            # Avança 4 bytes (1 elemento)
   addi $t2, $t2, 1            # j++
   j NOVA_COLUNA

   PROXIMA_LINHA:
   addi $t1, $t1, 1            # i++
   j NOVA_LINHA
	
   FIM:
   li $v0, 10                  # Encerrar programa
   syscall
	
   TESTE_ZERO:
   bne $t7, $zero, VOLTAR      # Se matriz[1][1] != 0, não zera
   add $t4, $t0, $t3           # Calcula endereço do elemento atual
   sw $zero, ($t4)             # Zera o elemento na matriz [i][j]
   j VOLTAR
