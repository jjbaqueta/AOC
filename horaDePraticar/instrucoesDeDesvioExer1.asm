# Exercício
# Implemente um programa em Assembly MIPS-32 que, 
# com base no valor de uma variável chamada num (de 4 bytes), 
# seja capaz de exibir uma das seguintes saídas:
#   * Se num for par, exiba: 1
#   * Se num for ímpar, exiba: 0

.data
  num: .word 4           # Declara um espaço na memória chamado 'num' inicializado com o valor 4.

.text
  lw $t0, num            # Carrega o valor armazenado em 'num' para o registrador $t0.
  li $t1, 2              # Carrega o valor 2 no registrador $t1.
  div $t0, $t1           # Divide o conteúdo de $t0 (num) pelo conteúdo de $t1 (2)
  mfhi $t0               # Move o resto da divisão para $t0.
  beq $t0, $zero, PAR    # Se $t0 (resto) for igual a $zero (0), desvia para o rótulo "PAR".
  li $a0, 0              # Carrega o valor 0 em $a0.
  li $v0, 1              # Carrega o valor 1 no registrador $v0 (código para imprmir um inteiro).
  syscall                # Executa a impressão do valor em $a0.
  j FIM                  # Desvia para o rótulo "FIM".
	
  PAR:
  li $a0, 1              # Carrega o valor 1 em $a0.
  li $v0, 1              # Carrega o valor 1 no registrador $v0 (código para imprmir um inteiro).
  syscall                # Executa a impressão do valor em $a0.
	
  FIM:
  li $v0, 10             # Carrega o valor 1 no registrador $v0 (código para finalização do programa).
  syscall                # Finalização do programa
