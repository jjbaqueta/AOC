# Exercício
# Dado um intervalo numérico, escreva duas funções:
# A primeira função, 'somatorio', deve calcular o somatório dos valores presentes no intervalo.
# A segunda função, 'produtorio', deve calcular o produtório dos valores presentes no intervalo.
# As funções devem ser chamadas em sequência na função principal, e seus respectivos resultados
# devem ser exibidos no terminal de saída, conforme apresentado abaixo:
#
# Exemplo de entrada e saída:
# Entrada: início do intervalo: 2, fim do intervalo: 5
# Saída esperada:
# 14
# 120

.data
   novaLinha: .asciiz "\n"        # Declaração de uma string que representa uma nova linha ("\n").

.text
.globl main                       # Define o ponto de entrada principal do programa.

# Função somatorio: calcula o somatório dos números inteiros em um intervalo [a0, a1].
# $a0: limite inferior do intervalo (inicio).
# $a1: limite superior do intervalo (fim).
# Saída:
# $v0: resultado do somatório.
somatorio:
   addi $sp, $sp, -4              # Reserva espaço na pilha para salvar o registrador $s0.
   sw $s0, ($sp)                  # Salva o valor atual de $s0 na pilha.
   li $s0, 0                      # Inicializa o acumulador do somatório em 0.
   LOOP1:
   bgt $a0, $a1, FIM1             # Se $a0 (limite inferior) for maior que $a1 (limite superior), desvia para FIM1.
   add $s0, $s0, $a0              # Soma o valor atual de $a0 ao acumulador $s0.
   addi $a0, $a0, 1               # Incrementa $a0 para o próximo número no intervalo.
   j LOOP1                        # Repete o laço.
   FIM1:
   move $v0, $s0                  # Move o resultado do somatório ($s0) para $v0 (valor de retorno).
   lw $s0, ($sp)                  # Restaura o valor original de $s0 da pilha.
   addi $sp, $sp, 4               # Libera o espaço reservado na pilha.
   jr $ra                         # Retorna da função somatorio.

# Função produtorio: calcula o produtório dos números inteiros em um intervalo [a0, a1].
# $a0: limite inferior do intervalo (inicio).
# $a1: limite superior do intervalo (fim).
# Saída:
# $v0: resultado do produtório.
produtorio:
   addi $sp, $sp, -4              # Reserva espaço na pilha para salvar o registrador $s0.
   sw $s0, ($sp)                  # Salva o valor atual de $s0 na pilha.
   li $s0, 1                      # Inicializa o acumulador do produtório em 1.
   LOOP2:
   bgt $a0, $a1, FIM2             # Se $a0 (limite inferior) for maior que $a1 (limite superior), desvia para FIM2.
   mult $s0, $a0                  # Multiplica o acumulador $s0 pelo valor atual de $a0.
   mflo $s0                       # Armazena o resultado da multiplicação no acumulador $s0.
   addi $a0, $a0, 1               # Incrementa $a0 para o próximo número no intervalo.
   j LOOP2                        # Repete o laço.
   FIM2:
   move $v0, $s0                  # Move o resultado do produtório ($s0) para $v0 (valor de retorno).
   lw $s0, ($sp)                  # Restaura o valor original de $s0 da pilha.
   addi $sp, $sp, 4               # Libera o espaço reservado na pilha.
   jr $ra                         # Retorna da função produtorio.

# Função principal (main)
main:
   li $s0, 2                      # Define o limite inferior do intervalo (2).
   li $s1, 5                      # Define o limite superior do intervalo (5).
   
   # Calcula o somatório
   move $a0, $s0                  # Move o limite inferior ($s0) para $a0.
   move $a1, $s1                  # Move o limite superior ($s1) para $a1.
   jal somatorio                  # Chama a função somatorio.
   move $a0, $v0                  # Move o resultado do somatório ($v0) para $a0 (parâmetro para impressão).
   li $v0, 1                      # Código para imprimir inteiros.
   syscall                        # Realiza a chamada de sistema para imprimir o somatório.
   
   # Imprime uma nova linha
   la $a0, novaLinha              # Carrega o endereço da string de nova linha em $a0.
   li $v0, 4                      # Código para imprimir strings.
   syscall                        # Realiza a chamada de sistema para imprimir uma nova linha.
   
   # Calcula o produtório
   move $a0, $s0                  # Move o limite inferior ($s0) para $a0.
   move $a1, $s1                  # Move o limite superior ($s1) para $a1.
   jal produtorio                 # Chama a função produtorio.
   move $a0, $v0                  # Move o resultado do produtório ($v0) para $a0 (parâmetro para impressão).
   li $v0, 1                      # Código para imprimir inteiros.
   syscall                        # Realiza a chamada de sistema para imprimir o produtório.

   # Finaliza o programa
   li $v0, 10                     # Código de serviço para finalizar o programa.
   syscall                        # Finaliza o programa.
