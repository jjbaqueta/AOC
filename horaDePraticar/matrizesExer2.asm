# Com base na matriz definida abaixo, realize a seguinte operação:
# matriz: .word 0, 1, 2, 3, 4, 5, 6, 7, 8 
#
# Acesse o elemento matriz[a][b] e multiplique todos os elementos da matriz por esse elemento. 
# Os índices a e b são duas variáveis inteiras que podem assumir valores de 0 a 2.
#
# Exemplo de entrada:
# * matriz: [0, 1, 2, 3, 4, 5, 6, 7, 8]
# * a = 2
# * b = 0
# * matriz[2][0] = 6
#
# Saída esperada:
# * matriz: [0, 6, 12, 18, 24, 30, 36, 42, 48]

.data
  matriz: .word 0, 1, 2, 3, 4, 5, 6, 7, 8     # Declaração da matriz.
  a: .word 2                                  # Declaração da variável 'a'.
  b: .word 0                                  # Declaração da variável 'b'.

.text
  la $t0, matriz                # Carrega o endereço base da matriz no registrador $t0
  move $t1, $zero               # Inicialização do índice de linha ($t1)
  move $t2, $zero               # Inicialização do índice de coluna ($t2)
  move $t3, $zero               # Deslocamento em bytes da base ($t3)
  
  lw $t4, a                     # Carrega o valor da variável 'a' no registrador $t4
  lw $t5, b                     # Carrega o valor da variável 'b' no registrador $t5
  
  # Deslocamento de linha
  sll $t4, $t4, 2               # Multiplica o índice da linha ($t4) por 4.
  li $t6, 3                     # Carrega o número de elementos por linha no registrador $t6.
  mult $t4, $t6                 # Multiplica o deslocamento atual ($t4) por 3, considerando que cada linha contém 3 elementos.
  mflo $t4                      # Carrega o deslocamento de linha para o registrador $t4

 # Deslocamento de coluna
  sll $t5, $t5, 2               # Multiplica o índice da coluna ($t5) por 4.
  add $t6, $t4, $t5             # Soma o deslocamento da linha com o deslocamento da coluna para obter o deslocamento final.
  
  add $t6, $t6, $t0             # Soma o deslocamento final com a base. O endereço de leitura é carregado em $t6
  lw $t7, ($t6)                 # Realiza a leitura do elemento da matriz (matriz[a][b]), o valor é carregado para $t7
  
  NOVA_LINHA:
  beq $t1, 3, FIM               # Se $t1 for igual a 3, desvia para o rótulo "FIM" (todas as linhas já foram processadas).
  move $t2, $zero               # O índice de coluna ($t2) é zerado sempre que uma nova linha é iniciada.

  # Multiplicando a matriz por matriz[a][b]
  NOVA_COLUNA:
  beq $t2, 3, PROXIMA_LINHA     # Se $t2 for igual a 3, desvia para o rótulo "PROXIMA_LINHA" (todas as colunas já foram processadas).
  add $t5, $t0, $t3             # Endereço de leitura ($t5) = base ($t0) + deslocamento ($t3)
  lw $t6, ($t5)                 # O valor lido é armazenado em $t6 (valor do endereço de leitura)
  mult $t6, $t7                 # Multiplica o valor da matriz[i][j] pelo valor da matriz[a][b]
  mflo $t6                      # Carrega o resultado da multiplicação para o registrador $t6
  sw $t6, ($t5)                 # Atualiza o conteúdo da matriz[a][b]
  addi $t3, $t3, 4              # $t3 é incrementado em 4 bytes.
  addi $t2, $t2, 1              # $t2 é incrementado em uma unidade.
  j NOVA_COLUNA
  
  PROXIMA_LINHA:
  addi $t1, $t1, 1              # $t1 é incrementado em uma unidade.
  j NOVA_LINHA
  
  FIM:
  li $v0, 10                    # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
  syscall                       # Finalização do programa,
