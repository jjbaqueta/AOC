# Escreva uma função recursiva para encontrar o menor elemento em um vetor. 
# Sua função deve operar em um vetor do tipo .word com 10 elementos, inicializado de forma arbitrária. 
# O índice do menor elemento no vetor deve ser retornado pela função. 
# Imprima o retorno de sua função na função main utilizando uma chamada de sistema (syscall). 
# Utilize o seguinte código para implementar sua função recursiva:
#
# int minimo(int* vetor,  int inicio, int fim) {
#    if (inicio == fim){
#       return inicio
#    }
#    int m = minimo(vetor, inicio, fim - 1)
#    if (vetor[fim] < vetor[m]) {
#       m = fim
#    } 
#    return m
# }

.data
vetor: .word 4, 5, 10, 39, 48, 2, 1, 20, 7, 54   # Define o vetor de inteiros
inicio: .word 0                                  # Índice do primeiro elemento do vetor
fim: .word 9                                     # Índice do último elemento do vetor

.text
.globl main                                      # Define o ponto de entrada global do programa.

# Função minimo:
# $a0: endereço base do vetor
# $a1: índice do primeiro elemento do vetor (início)
# $a2: índice do último elemento do vetor (fim)
minimo:
   bgt $a2, $a1, RECURSAO                        # Se fim ($a2) for maior que início ($a1), desvia para RECURSAO
   move $v0, $a1                                 # $v0 = $a1, retorna o ínicio (índice do primeiro elemento)
   jr $ra                                        # Retorna para a função chamadora.

RECURSAO:
   addi $sp, $sp, -8                             # Aloca 8 bytes de espaço na pilha
   sw $a2, ($sp)                                 # Salva o registrador fim atual ($a2) na pilha. 
   sw $ra, 4($sp)                                # Salva o registrador o endereço de retorno ($ra) na pilha.
   add $a2, $a2, -1                              # $a2 = $a2 - 1 (fim do vetor é decrementado em uma unidade).
   jal minimo                                    # Chamada recursiva.
   
   lw $a2, ($sp)                                 # Restaura o valor de $a2.
   lw $ra, 4($sp)                                # Restaura o endereço de retorno ($ra).
   
   sll $t1, $v0, 2                               # Multiplica o índice do menor elemento ($v0) por 4 e armazena em $t1.
   add $t1, $t1, $a0                             # Calcula o endereço do elemento no menor elemento e armazena em $t1.
   lw $t3, ($t1)                                 # Carrega o valor do menor elemento para $t3.
   sll $t2, $a2, 2                               # Multiplica o índice de fim ($a2) por 4 e armazena em $t2.
   add $t2, $t2, $a0                             # Calcula o endereço do último elemento do vetor e armazena em $t2.
   lw $t4, ($t2)                                 # Carrega o valor do úlitmo elemento para $t4.
   bge $t4, $t3, RETORNA                         # Se o último elemento for maior do que o menor elemento, desvia para RETORNA.
   move $v0, $a2                                 # O menor elemento é atualizado, recebe o índice do último elemento.

   RETORNA:
   addi $sp, $sp, 8                              # Libera o espaço de 8 bytes na pilha.
   jr $ra                                        # Retorna para a função chamadora.
    
main:
   la $a0, vetor                                # $a0 = endereço base do vetor (parâmetro 1)
   lw $a1, inicio                               # $a1 = índice do primeiro elemento do vetor (parâmetro 2)
   lw $a2, fim                                  # $a2 = índice do último elemento do vetor (parâmetro 3)
   jal minimo                                   # Chamda para função 'minimo'
   move $a0, $v0                                # Move o valor de retorno da função para o registrador $a0
   li $v0, 1                                    # Carrega o código para imprimir um inteiro (1) no registrador $v0.
   syscall                                      # Executa o syscall para exibir o valor em $a0 no terminal.
   li $v0, 10                                   # Carrega o código para encerrar o programa (10).
   syscall                                      # Finaliza o programa.
