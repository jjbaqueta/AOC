# Escreva um programa em Assembly MIPS-32 que encontre o maior elemento em um vetor de inteiros com 10 elementos. 
# O maior valor deve ser armazenado em uma variável chamada max. Por fim, exiba o valor da variável max na tela, 
# conforme demonstrado na saída abaixo:
#
# Exemplo de entrada:
# vetor = [7, 2, 8, 3, 5, 9, 14, 3, 1, 12]
#
# Saída:
# max = 14
# Saída de texto: “O maior valor armazenado no vetor é: 14”

.data:
   vetor: .word 7, 2, 8, 3, 5, 9, 14, 3, 1, 12                   # Declara um vetor de 10 elementos chamado 'vetor'.
   conteudo: .asciiz "O maior valor armazenado no vetor é: "     # Declaração de uma string com terminador '\0'.
   quebra: .asciiz "\n"                                          # Declaração de uma string com terminador '\0'.

.text:
  la $t0, vetor                      # Carrega o endereço base do vetor 'vetor' no registrador $t0
  move $t1, $zero                    # Definição de um índice para iterar no vetor.
  lw $t2, ($t0)                      # $t2 recebe o primeiro elemento do vetor, considerado o maior elemento até então.

  LOOP:
  beq $t1, 10, FIM                   # Se $t1 (índice) for igual a 4, desvia para o rótulo "FIM".
  sll $t3, $t1, 2                    # Multiplica o valor do índice por 4 (cada elemento possui 4 bytes)
  add $t4, $t0, $t3                  # Soma ao endereço base do vetor 'vetor' o deslocamento correspondente ao índice desejado.
  lw $t5, ($t4)                      # Realiza a leitura na posição especificada do vetor e armazena o valor em $t5.
  bge $t5, $t2, ATUALIZA_MAIOR       # Se o valor em $t5 for maior ou igual ao valor em $t2, desvia para o rótulo "ATUALIZAR_MAIOR".
  CONTINUE:
  addi $t1, $t1, 1                   # Incrementa o conteúdo do registrador $t1 em uma unidade (índice)
  j LOOP
  
  ATUALIZA_MAIOR:
  move $t2, $t5                      # Move o conteúdo de $t5 para $t2 (atualização do maior elemento)
  j CONTINUE

  FIM:
  la $a0, conteudo                   # Move o endereço de uma string para o registrador $a0
  li $v0, 4                          # Carrega o valor 4 no registrador $v0 (código para imprimir uma string).
  syscall                            # Chamada de sistema para imprimir a string no terminal de saída.
  
  move $a0, $t2                      # Move o maior valor encontrado no vetor para o registrador $a0
  li $v0, 1                          # Carrega o valor 1 no registrador $v0 (código para imprimir um inteiro).
  syscall                            # Chamada de sistema para imprimir um inteiro no terminal de saída.
  
  la $a0, quebra                     # Move o endereço de uma string para o registrador $a0
  li $v0, 4                          # Carrega o valor 4 no registrador $v0 (código para imprimir uma string).
  syscall                            # Chamada de sistema para imprimir um inteiro no terminal de saída.
  
  li $v0, 10                         # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
  syscall                            # Finalização do programa
