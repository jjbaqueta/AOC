# Exercício
# Considere que você está trabalhando com um formato de imagem em que cada pixel 
# é representado por um inteiro de 32 bits. Esse inteiro é dividido em quatro conjuntos de 8 bits, 
# conforme descrito abaixo. Os canais red (R), green (G) e blue (B) são as três componentes de cor do pixel, 
# enquanto a componente α representa o fator de transparência. Se pelo menos duas das componentes de cor 
# forem maiores ou iguais a 128, você deve somar 10 ao fator de transparência. 
#Caso contrário, você deve zerar a componente R.
#
# Considere que o valor do pixel será carregado a partir de uma variável de 32 bits chamada pixel. 
# Após a operação, o valor dessa variável deve ser atualizado na memória.
#
# Formtato de um pixel:
#   * bits[0 .. 7]: Componente blue (B)
#   * bits[8 .. 15]: Componente green (G)
#   * bits[16 .. 23]: Componente red (R)
#   * bits[24 .. 31]: Componente de transparência (α)
#
# Possíveis entradas: 0x02FFFFFF, 0xA0FF0000, 0x02800080, 0x10A291AA, 0x0CE1E980

.data:
  pixel: .word 0xA0FF0000   # Declara um espaço na memória chamado 'pixel' inicializado com o valor 0x02FFFFFF.

.text:
  lw $t0, pixel             # Carrega o valor armazenado em 'pixel' para o registrador $t0.
  li $t1, 0x000000FF        # Carrega a máscara para a componente blue (B) no registrador $t1.
  li $t2, 0x0000FF00        # Carrega a máscara para a componente green (G) no registrador $t2.
  li $t3, 0x00FF0000        # Carrega a máscara para a componente red (R) no registrador $t3.
  li $t4, 0xFF000000        # Carrega a máscara para a componente de transparência (α) no registrador $t4.
  
  and $t1, $t0, $t1         # Leitura do bits da componente B.
  and $t2, $t0, $t2         # Leitura do bits da componente G.
  srl $t2, $t2, 8           # Deslocamento para os bits de ordem menos significativa.
  and $t3, $t0, $t3         # Leitura do bits da componente R.
  srl $t3, $t3, 16          # Deslocamento para os bits de ordem menos significativa.
  and $t4, $t0, $t4         # Leitura do bits da componente α.
  srl $t4, $t4, 24          # Deslocamento para os bits de ordem menos significativa.

  move $t5, $zero           # Carrega o valor 0 para o registrador $t5 (contador)
  
  bge $t1, 128, INC_B       # Se $t1 (componente B) for maior ou igual a 128, desvia para o rótulo "INC_B".
  TESTE_G:
  bge $t2, 128, INC_G       # Se $t2 (componente G) for maior ou igual a 128, desvia para o rótulo "INC_G".
  TESTE_R:
  bge $t3, 128, INC_R       # Se $t3 (componente R) for maior ou igual a 128, desvia para o rótulo "INC_R".
  j ATUALIZAR_PIXEL
  
  INC_B:
  addi $t5, $t5, 1          # Incrementa o valor do registrador $t5 (contador) em uma unidade (Se componente B >= 128).
  j TESTE_G                 # Desvia para o teste da componente G.
 
  INC_G:
  addi $t5, $t5, 1          # Incrementa o valor do registrador $t5 (contador) em uma unidade (Se componente G >= 128).
  j TESTE_R                 # Desvia para o teste da componente R.
 
  INC_R:
  addi $t5, $t5, 1         # Incrementa o valor do registrador $t5 (contador) em uma unidade (Se componente R >= 128).
  
  ATUALIZAR_PIXEL:
  bge $t5, 2, ALPHA        # Se $t5 (contador) for maior ou igual a 2, desvia para o rótulo "ALPHA".
  li $t3, 0xFF00FFFF       # Carrega a máscara para zerar o componente R no registrador $t3.
  and $t0, $t0, $t3        # Zera os bits correspondentes à componente R do registrador $t0.
  j FIM
  
  ALPHA:
  addi $t4, $t4, 10        # Adiciona 10 ao componente α.
  sll $t4, $t4, 24         # Desloca os bits de α para suas ordens originais.
  li $t5, 0x00FFFFFF       # Carrega a máscara para escrever o valor atual de α no registrador $t0.
  and $t0, $t0, $t5        # Zera os bits em $tO referente a componente α
  or $t0, $t0, $t4         # Escreve em $t0 o novo valor de α
  
  FIM:
  sw $t0, pixel            # Atualiza o valor α na memória
  
  li $v0, 10               # Carrega o valor 1 no registrador $v0 (código para finalização do programa).
  syscall                  # Finalização do programa
