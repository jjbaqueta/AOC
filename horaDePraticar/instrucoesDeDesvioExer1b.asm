# Exercício
# Implemente um programa que, com base no valor de uma variável 
# chamada idade (4 bytes), exiba uma das seguintes saídas:
#   * Se idade > 18, exiba: 1
#   * Se idade < 18, exiba: -1
#   * Se idade == 18, exiba: 0

.data
  idade: .word 20   # Declara um espaço na memória chamado 'idade' inicializado com o valor 20.

.text
  lw $t0, idade		# Carrega o valor armazenado em 'idade' para o registrador $t0.
  li $t1, 18		# Carrega o valor 18 no registrador $t1.
  bgt $t0, $t1, MAIOR	# Se $t0 (idade) for maior que $t1 (18), desvia para o rótulo "MAIOR".
  blt $t0, $t1, MENOR	# Se $t0 (idade) for menor que $t1 (18), desvia para o rótulo "MENOR".
  li $a0, 0             # Se $t0 (idade) for igual a $t1 (18), carrega o valor 0 para $a0.
  li $v0, 1		# Carrega o valor 1 no registrador $v0 (código para imprmir um inteiro).
  syscall		# Executa a impressão do valor em $a0.
  j FIM			# Desvia para o rótulo "FIM".
	
  MENOR:
  li $a0, -1             # Carrega o valor -1 em $a0.
  li $v0, 1              # Carrega o valor 1 no registrador $v0 (código para imprmir um inteiro).
  syscall                # Executa a impressão do valor em $a0.
  j FIM                  # Desvia para o rótulo "FIM".
	
  MAIOR:
  li $a0, 1              # Carrega o valor 1 em $a0.
  li $v0, 1              # Carrega o valor 1 no registrador $v0 (código para imprmir um inteiro).
  syscall                # Executa a impressão do valor em $a0.
	
  FIM:
  li $v0, 10            # Carrega o valor 1 no registrador $v0 (código para finalização do programa).
  syscall               # Finalização do programa
