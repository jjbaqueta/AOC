# Escreva um programa em Assembly MIPS-32 que multiplique cada elemento de um vetor de inteiros (.word), 
# chamado 'v1', composto por 4 elementos, por uma constante armazenada em uma variável de memória chamada 'var'. 
# O resultado deve ser armazenado em um novo vetor, chamado 'v2' (.word).
#
# Exemplo de entrada:
# v1 = [1, 2, 3, 4]
# var = 2
#
# Saída:
# v2 = [2, 4, 6, 8]

.data:
  v1: .word 1, 2, 3, 4    # Declara um vetor de 4 elementos chamado 'v1' inicializado com os valores: 1, 2, 3, 4.
  var: .word 2            # Declara um espaço na memória chamado 'var' inicializado com o valor 2.
  .align 2                # Alinhando o bloco de memória definido a seguir a um endereço múltiplo de 4 (2^2)
  v2: .space 16           # Declara um bloco de memória de 16 bytes, que será utilizado como um vetor contendo 4 elementos de 4 bytes.

.text:
  la $t0, v1              # Carrega o endereço base do vetor 'v1' no registrador $t0
  la $t1, v2              # Carrega o endereço base do vetor 'v2' no registrador $t1
  lw $t2, var             # Carrega o valor da variável 'var' no registrador $t2
  move $t3, $zero         # Definição de um índice para iterar nos vetores.
  
  LOOP:
  beq $t3, 4, FIM         # Se $t3 (índice) for igual a 4, desvia para o rótulo "FIM".
  sll $t5, $t3, 2         # Multiplica o valor do índice por 4 (cada elemento possui 4 bytes)
  add $t6, $t0, $t5       # Soma ao endereço base do vetor 'v1' o deslocamento correspondente ao índice desejado.
  lw $t7, ($t6)           # Realiza a leitura na posição especificada do vetor e armazena o valor em $t7.
  mult $t7 $t2            # Multiplica o conteúdo de $t7 pelo conteúdo de $t2 (2).
  mflo $t7                # Carrega o resultado da multiplicação em $t7
  add $t6, $t1, $t5       # Soma ao endereço base do vetor 'v2' o deslocamento correspondente ao índice desejado.
  sw $t7, ($t6)           # Escreve o conteúdo do registrador $t7 na posição especificada do vetor 'v2'.
  addi $t3, $t3, 1        # Incrementa o conteúdo do registrador $t3 em uma unidade (índice)
  j LOOP 
 
  FIM: 
  li $v0, 10              # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
  syscall                 # Finalização do programa
