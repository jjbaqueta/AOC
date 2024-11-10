# Exercício
# Escreva um programa em Assembly MIPS-32 que calcule o fatorial 
# de um número inteiro positivo indicado por uma variável chamada 'num' (de 4 bytes). 
# Armazene o resultado da operação em uma variável chamada 'resultado' (de 4 bytes).
#
# Exemplo de entrada:
# 'num' = 5
#
# Saída esperada:
# 'resultado' = 120

.data
  num: .word 5                 # Declara um espaço na memória chamado 'num' inicializado com o valor 5.
  resultado: .space 4          # Declara um espaço na memória chamado 'resultado' não inicializado.

.text
  lw $t0, num                  # Carrega o valor armazenado em 'num' para o registrador $t0.
  ble $t0, 1, CASO_BASE        # Se $t0 (num) for igual a 1 ou 0, desvia para o rótulo "CASO_BASE".
  move $t1, $t0                # Copia o valor de $t0 para $t1 ($t1 será utilizado como um acumulador).
  
  LOOP:
  beq $t0, 1, FIM_FATORIAL     # Se $t0 (num) for igual a 1, desvia para o rótulo "FIM_FATORIAL".
  sub $t0, $t0, 1              # Decrementa $t0 em uma unidade (num - 1).
  mult $t0, $t1                # Multiplica $t0 (num - 1) por $t1 (acumulador).
  mflo $t1                     # Carrega o resultado da multiplicação para o regitrador $t1.
  j LOOP                       # Desvia para o rótulo "LOOP"
  
  CASO_BASE:
  li $t1, 1                    # Carrega o valor 1 para o registrador $t1.
  
  FIM_FATORIAL:
  sw $t1, resultado            # Escreve o resultado do fatorial na variável 'resultado'.
  
  li $v0, 10                   # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
  syscall                      # Finalização do programa,
