# Implemente um programa que, com base em uma string de 5 caracteres 
# armazenada na memória, inverta a ordem dos caracteres e exiba a string 
# resultante no terminal.
#
# Considere que:
# a) A string sempre terá exatamente 5 caracteres (não inclua o caractere nulo '\0' na contagem). 
#    Portanto, os índices inicial e final da string são 0 e 4, respectivamente
# b) A inversão deve ser feita trocando os caracteres nas posições opostas
#    até que o vetor esteja completamente invertido
# c) Não é necessário realizar entrada de dados, pois a string deve ser inicializada na seção .data
# 
# Exemplo de entrada:
# str = "ABCDE"
#
# Saída:
# str = "EDCBA"

.data
   str: .asciiz "ABCDE"     # Declaração de uma string com terminador '\0'.
   
.text
   la $t0, str              # Carrega o endereço base da string no registrador $t0
   li $t1, 0                # Carrega o índice do primeiro caractere em $t1.
   li $t2, 4                # Carrega o índice do último caractere em $t2.
   
   LOOP:
   add $t4, $t0, $t1        # Soma ao endereço base da string o deslocamento correspondente ao índice em $t1.
   add $t5, $t0, $t2        # Soma ao endereço base da string o deslocamento correspondente ao índice em $t2.
   lb $s0, ($t4)            # Realiza a leitura na posição especificada por base($t0) + índice($t1) e armazena o valor em $s0.
   lb $s1, ($t5)            # Realiza a leitura na posição especificada por base($t0) + índice($t2) e armazena o valor em $s1.
   bge $t1, $t2, BREAK      # Se $t1 for igual ou maior que $t2, desvia para o rótulo "BREAK".
   sb $s1, ($t4)            # Escreve o conteúdo de $s1 na posição especificada por base($t0) + índice($t1)
   sb $s0, ($t5)            # Escreve o conteúdo de $s0 na posição especificada por base($t0) + índice($t2)
   addi $t1, $t1, 1         # Incrementa o conteúdo do registrador $t1 em uma unidade
   addi $t2, $t2, -1        # Decrementa o conteúdo do registrador $t2 em uma unidade
   j LOOP

   BREAK:
   move $a0, $t0            # Move o endereço de uma string para o registrador $a0.
   li $v0, 4                # Carrega o valor 4 no registrador $v0 (código para imprimir uma string).
   syscall                  # Chamada de sistema para imprimir a string no terminal de saída.

   li $v0, 10               # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
   syscall                  # Finalização do programa
