# Com base na matriz definida abaixo, realize a seguinte operação:
# matriz: .word 0, 1, 2, 3, 4, 5, 6, 7, 8 
#
# Some os elementos da diagonal principal e exiba o resultado no terminal de saída. 
# Um elemento pertence à diagonal principal se a sua linha e a sua coluna tiverem o mesmo índice (i == j). 
# Considere que cada elemento da matriz ocupa 4 bytes.

.data
  matriz: .word 0, 1, 2, 3, 4, 5, 6, 7, 8     # Declaração da matriz.

.text
  la $t0, matriz                # Carrega o endereço base da matriz no registrador $t0
  move $t1, $zero               # Inicialização do índice de linha ($t1)
  move $t2, $zero               # Inicialização do índice de coluna ($t2)
  move $t3, $zero               # Deslocamento em bytes da base ($t3)
  move $a0, $zero               # Acumulador ($a0)
  
  NOVA_LINHA:
  beq $t1, 3, FIM               # Se $t1 for igual a 3, desvia para o rótulo "FIM" (todas as linhas já foram processadas).
  move $t2, $zero               # O índice de coluna ($t2) é zerado sempre que uma nova linha é iniciada.

  NOVA_COLUNA:
  beq $t2, 3, PROXIMA_LINHA     # Se $t2 for igual a 3, desvia para o rótulo "PROXIMA_LINHA" (todas as colunas já foram processadas).
  beq $t1, $t2, DIAGONAL_P      # Se $t1 for igual a $t2 (i == j), desvia para o rótulo "DIAGONAL_P".
  PROXIMO_ELEMENTO:
  addi $t3, $t3, 4              # $t3 é incrementado em 4 bytes.
  addi $t2, $t2, 1              # $t2 é incrementado em uma unidade.
  j NOVA_COLUNA
  
  PROXIMA_LINHA:
  addi $t1, $t1, 1              # $t1 é incrementado em uma unidade.
  j NOVA_LINHA
  
  DIAGONAL_P:
  add $t5, $t0, $t3             # Endereço de leitura ($t5) = base ($t0) + deslocamento ($t3)
  lw $t6, ($t5)                 # O valor lido é armazenado em $t6 (valor do endereço de leitura)
  add $a0, $a0, $t6             # Acumula a soma da diagonal principal no registrador $a0.
  j PROXIMO_ELEMENTO
  
  FIM:
  li $v0, 1                     # Carrega o valor 1 no registrador $v0 (código para imprimir um inteiro).
  syscall                       # Chamada de sistema para imprimir um inteiro no terminal de saída.
  li $v0, 10                    # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
  syscall                       # Finalização do programa,
