# Exercício
# Implemente um programa em Assembly MIPS-32 que, com base no valor de uma string de 5 caracteres 
# armazenada na memória, inverta a ordem dos caracteres e exiba a string resultante na tela.
#
# Considere que:
#   * A string sempre terá exatamente 5 caracteres (não incluir o caractere nulo ‘\0’ na contagem). 
#     Portanto, os índices de início e fim da string são 0 e 4, respectivamente;
#   * A inversão deve ser feita trocando os caracteres nas posições 
#     opostas até que o vetor esteja completamente invertido;
#   * Não é necessário realizar entrada de dados. 
#     A string pode ser declarada diretamente na seção .data.

.data
   string: .asciiz "12345"   # Declara a string a ser invertida (terminada em '\0')

.text
   li $t0, 0                 # $t0 armazenará o índice inicial (início = 0)
   li $t1, 4                 # $t1 armazenará o índice final (fim = 4)
   la $t2, string            # $t2 recebe o endereço base da string

   LOOP:
   bge $t0, $t1, FIM         # Se início >= fim, termina o loop (inversão completa)
   add $t3, $t2, $t0         # $t3 = endereço do caractere no índice $t0
   add $t4, $t2, $t1         # $t4 = endereço do caractere no índice $t1
   lb $t5, ($t3)             # $t5 = caractere na posição $t0
   lb $t6, ($t4)             # $t6 = caractere na posição $t1
   sb $t5, ($t4)             # Escreve o caractere de $t0 na posição $t1
   sb $t6, ($t3)             # Escreve o caractere de $t1 na posição $t0
   addi $t0, $t0, 1          # Incrementa índice inicial
   addi $t1, $t1, -1         # Decrementa índice final
   j LOOP                    # Volta para o início do loop

   FIM:
   move $a0, $t2             # Coloca o endereço da string (já invertida) em $a0
   li $v0, 4                 # Código do syscall para imprimir string
   syscall                   # Exibe a string invertida na tela

   li $v0, 10                # Código do syscall para encerrar o programa
   syscall                   # Termina a execução
