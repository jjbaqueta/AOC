# Exercício
# Escreva uma função capaz de para somar (acumular) todos os elemento de um vetor.
# O vetor e seu tamanho devem ser passados por parâmetro para a função.
# Exiba a soma dos elementos no terminal de saída.
#
# Exemplo de entrada e saída:
# Entrada: vetor = {1, 2, 3, 4, 5}
# Saída esperada: 15 

.data
  vetor: .word 1, 2, 3, 4, 5     # Declaração de um vetor com os valores [1, 2, 3, 4, 5].
  tamanho: .word 5               # Declaração do tamanho do vetor (número de elementos).

.text
.globl main                      # Define o ponto de entrada principal do programa.

# Função somar: soma todos os elementos de um vetor. 
# $a0: endereço base do vetor.
# $a1: tamanho do vetor.
# Saída: 
# $v0: soma de todos os elementos do vetor.
somar:
   move $v0, $zero               # Inicializa o acumulador (soma) em 0.
   move $t1, $zero               # Inicializa o índice do vetor em 0.
   
   LOOP:
   beq $t1, $a1, FIM             # Se o índice ($t1) atingiu o tamanho do vetor ($a1), desvia para o rótulo "FIM".
   sll $t2, $t1, 2               # Multiplica o índice atual por 4 (tamanho de uma palavra em bytes) 
   add $t3, $a0, $t2             # Soma o deslocamento ao endereço base do vetor ($a0) 
   lw $t4, ($t3)                 # Carrega o valor do elemento atual do vetor no registrador $t4.
   add $v0, $v0, $t4             # Adiciona o valor do elemento atual ao acumulador ($v0).
   addi $t1, $t1, 1              # Incrementa o índice do vetor.
   j LOOP                        # Volta para o início do laço.
   FIM:
   jr $ra                        # Retorna da função somar.

# Função imprimir: imprime um valor inteiro armazenado no registrador $a0.
# $a0: valor a ser impresso.
imprimir:
   li $v0, 1                     # Carrega o código de impressão de inteiros no registrador $v0.
   syscall                       # Realiza a chamada de sistema para imprimir o valor em $a0.
   jr $ra                        # Retorna da função imprimir.

# Função principal (main)
main:
   la $a0, vetor                 # Carrega o endereço base do vetor no registrador $a0.
   lw $a1, tamanho               # Carrega o tamanho do vetor no registrador $a1.
   jal somar                     # Chama a função somar. O resultado será armazenado em $v0.
   move $a0, $v0                 # Move o resultado da soma ($v0) para $a0 (parâmetro da função imprimir).
   jal imprimir                  # Chama a função imprimir para exibir o resultado.
   li $v0, 10                    # Carrega o código de finalização do programa.
   syscall                       # Finaliza o programa.
