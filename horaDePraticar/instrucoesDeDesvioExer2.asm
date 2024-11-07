# Exercício
# Implemente um programa em Assembly MIPS-32 que, 
# com base no valor de uma variável chamada temperatura (de 4 bytes), 
# seja capaz de exibir uma das seguintes saídas:
#   * Se temperatura >= 30, exiba: 1
#   * Se temperatura <= 10, exiba: -1
#   * Se temperatura > 10 e temperatura < 30, exiba: 0

.data
  temperatura: .word 5   # Declara um espaço na memória chamado 'temperatura' inicializado com o valor 24.

.text
  lw $t0, temperatura     # Carrega o valor armazenado em 'temperatura' para o registrador $t0.
  li $t1, 30              # Carrega o valor 30 no registrador $t1 (limite superior).
  li $t2, 10              # Carrega o valor 10 no registrador $t2 (limite inferior)
  bge $t0, $t1, QUENTE    # Se $t0 (temperatura) for maior ou igual que $t1 (30), desvia para o rótulo "QUENTE".
  ble $t0, $t2, FRIO      # Se $t0 (temperatura) for menor ou igual que $t2 (10), desvia para o rótulo "FRIO".
  li $a0, 0               # Se $t0 (temperatura) estiver entre o limite inferior e superior, carrega o valor 0 para $a0".
  li $v0, 1               # Carrega o valor 1 no registrador $v0 (código para imprmir um inteiro).
  syscall                 # Executa a impressão do valor em $a0.
  j FIM                   # Desvia para o rótulo "FIM".
	
  FRIO:
  li $a0, -1             # Carrega o valor -1 em $a0.
  li $v0, 1              # Carrega o valor 1 no registrador $v0 (código para imprmir um inteiro).
  syscall                # Executa a impressão do valor em $a0.
  j FIM                  # Desvia para o rótulo "FIM".
	
  QUENTE:
  li $a0, 1              # Carrega o valor 1 em $a0.
  li $v0, 1              # Carrega o valor 1 no registrador $v0 (código para imprmir um inteiro).
  syscall                # Executa a impressão do valor em $a0.
	
  FIM:
  li $v0, 10            # Carrega o valor 1 no registrador $v0 (código para finalização do programa).
  syscall               # Finalização do programa
