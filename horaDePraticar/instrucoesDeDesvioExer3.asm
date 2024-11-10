# Exercício
# Considere os seguintes valores para as variáveis A e B, ambas com 4 bytes: A = 40 e B = 8
# Realize as operações abaixo (salve o resultado em uma variável chamada R): 
#   1. Divida A por B
#   2. Some o resto da divisão (A % B) com o resultado da divisão (A / B)
#   3. Se a soma entre o resto e o resultado for maior que 5: R = resultado - resto.
#   4. Se a soma entre o resto e o resultado for menor que 5: R = resultado + 5.
#   5. Se a soma entre o resto e o resultado for igual a 5: R = resultado * 2.

.data
  A: .word 40             # Declara um espaço na memória chamado 'A' inicializado com o valor 40.
  B: .word 8              # Declara um espaço na memória chamado 'B' inicializado com o valor 8.
  R: .space 4             # Declara um espaço na memória chamado 'R' não inicializado.

.text
  lw $t0, A               # Carrega o valor armazenado em 'A' para o registrador $t0.
  lw $t1, B               # Carrega o valor armazenado em 'B' para o registrador $t1.
  div $t0, $t1            # Divide o conteúdo de $t0 (A) pelo conteúdo de $t1 (B)
  mflo $t2                # Move o resultado da divisão para $t2.
  mfhi $t3                # Move o resto da divisão para $t3.
  add $t4, $t2, $t3       # Carrega a soma $t2 (resultado da divisão) com $t3 (resto da divisão) no registrador $t4.
  li $t5, 5               # Carrega o valor 5 no registrador $t5,
  bgt $t4, $t5, MAIOR     # Se $t4 (soma) for maior que $t5 (valor 5), desvia para o rótulo "MAIOR".
  blt $t4, $t5, MENOR     # Se $t4 (soma) for menor que $t5 (valor 5), desvia para o rótulo "MENOR".
  li $t5, 2               # Se $t4 (soma) for igual a $t5 (valor 5), carrega o valor 2 no registrador $t5.
  mult $t2, $t5           # Multiplica o conteúdo de $t2 (resultado da divisão) pelo conteúdo de $t5 (valor 5) 
  mflo $t5                # Carrega o resultado da divisão para $t5
  sw $t5, R               # Escreve o resultado na variável 'R'
  j FIM                   # Desvia para o rótulo "FIM".
	
  MAIOR:
  sub $t2, $t2, $t3      # Subtrai o conteúdo de $t2 (resultado da divisão: A/B) do conteúdo de $t3 (resto da divisão: A%B).
  sw $t2, R              # Escreve o resultado na variável 'R'.
  j FIM                  # Desvia para o rótulo "FIM".
	
  MENOR:
  add $t2, $t2, $t3      # Soma o conteúdo de $t2 (resultado da divisão: A/B) com o conteúdo de $t3 (resto da divisão: A%B).
  sw $t2, R              # Escreve o resultado na variável 'R'.
	
  FIM:
  li $v0, 10             # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
  syscall                # Finalização do programa
