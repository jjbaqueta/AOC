# Exercício
# Escreva um programa em Assembly MIPS-32 que calcule o resultado da operação a^b a partir de multiplicações sucessivas. 
# Assuma que ambas as variáveis a e b possuem 4 bytes de tamanho e que o resultado da operação será armazenado
# em uma variável chamada resultado (de 4 bytes).

.data
  a: .word 2                   # Declara um espaço na memória chamado 'a' inicializado com o valor 2.
  b: .word 4                   # Declara um espaço na memória chamado 'b' inicializado com o valor 4.
  resultado: .space 4          # Declara um espaço na memória chamado 'resultado' não inicializado.
  
.text
  lw $t0, a                    # Carrega o valor armazenado em 'a' para o registrador $t0.
  lw $t1, b                    # Carrega o valor armazenado em 'b' para o registrador $t1.
  move $t2, $t0                # Copia o valor de $t0 para $t2 (resultado da operação).

  beq $t1, $zero, ELEVADO_0    # Se $t1 (expoente) for igual a 0, desvia para o rótulo "ELEVADO_0".

  LOOP:
  beq $t1, 1, BREAK            # Se $t1 (expoente) for igual a 1, desvia para o rótulo "BREAK".
  mult $t0, $t2                # Multiplica a base ($t0) pelo valor acumulado em $t2 (produto).
  mflo $t2                     # O registrador $t2 recebe o resultado da multiplicação
  addi $t1, $t1, -1            # Decrementa o valor de $t1 (expoente) em uma unidade
  j LOOP                       # Desvia para o rótulo "LOOP"
  
  ELEVADO_0:
  li $t2, 1                    # Caso em que o expoente é 0, portanto o resultado da operação deve ser 1.

  BREAK:
  sw $t2, resultado            # Escreve o resultado na variável 'resultado'
  li $v0, 10                   # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
  syscall                      # Finalização do programa,
