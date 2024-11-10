# Exercício
# Escreva um programa em Assembly MIPS-32 que calcule o resultado das seguintes operações utilizando laços de repetição. 
# A estrutura de repetição empregada fica a seu critério. Assuma que ambas as variáveis a e b possuem 4 bytes de tamanho 
# e armazene o resultado de cada operação em uma variável distinta na memória:
#    a) a * b, a partir de somas sucessivas
#    b) a / b, a partir de subtrações sucessivas
#    c) a % b, a partir de subtrações sucessivas

.data
  a: .word 7                   # Declara um espaço na memória chamado 'a' inicializado com o valor 7.
  b: .word 2                   # Declara um espaço na memória chamado 'b' inicializado com o valor 2.
  multiplicacao: .space 4      # Declara um espaço na memória chamado 'multiplicacao' não inicializado.
  divisao: .space 4            # Declara um espaço na memória chamado 'divisao' não inicializado.
  resto: .space 4              # Declara um espaço na memória chamado 'resto' não inicializado.
  
.text
  lw $t0, a                    # Carrega o valor armazenado em 'a' para o registrador $t0.
  lw $t1, b                    # Carrega o valor armazenado em 'b' para o registrador $t1.
  move $t2, $t0                # Inicializa o registrador $t2 com o valor da variável 'a' (acumulador para a operação de multiplicação)
  move $t3, $zero              # Inicializa o registrador $t3 com o valor 0 (contador: conta o número de vezes que 'b' é subtraído de 'a').

  # a) a * b
  move $t4, $t1                # Realiza uma cópia do conteúdo de $t1 (b) no registrador $t4.
  LOOP1:
  beq $t4, 1, FIM_MULT         # Se $t1 (b) for igual a 1, desvia para o rótulo "FIM_MULT".
  add $t2, $t2, $t0            # Soma o valor de $t0 (a) com o valor acumulado em $t2.
  addi $t4, $t4, -1            # Decrementa o valor de $t4 (b) em uma unidade.
  j LOOP1                      # Desvia para o rótulo "LOOP1"
  
  FIM_MULT:
  sw $t2, multiplicacao        # Escreve o resultado da multiplicação na variável 'multiplicacao'.
 
  # b) a / b e c) a % b
  move $t4, $t0                # Realiza uma cópia do conteúdo de $t0 (a) no registrador $t4.
  LOOP2:
  ble $t4, $t1, FIM_DIV        # Se $t4 (a) for menor ou igual a $t1 (b), desvia para o rótulo "FIM_DIV".
  sub $t4, $t4, $t1            # Subtrai $t1 (b) de $t4 (a).
  addi $t3, $t3, 1             # Incrementa o valor de $t3 (contagem de subtrações realizadas) em uma unidade.
  j LOOP2                      # Desvia para o rótulo "LOOP2".
  
  FIM_DIV:
  sw $t3, divisao              # Escreve o resultado da divisão na variável 'divisao' (número de vezes que 'b' foi subtraído de 'a').
  sw $t4, resto                # Escreve o resto da divisão na variável 'resto' (valor que sobrou em $t4 após a última subtração).
  
  li $v0, 10                   # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
  syscall                      # Finalização do programa,
