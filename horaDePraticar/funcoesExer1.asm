# Exercício
# Implemente um programa para converter dias em minutos. 
# O número de dias a ser convertido é definido por uma variável inteira chamada dias. 
# Com base no valor dessa variável, o programa deve calcular o total de minutos 
# e armazenar o resultado em outra variável inteira chamada minutos.
#
# Implemente as seguintes funções:
# Função de conversão: recebe o número de dias como entrada e retornar o total de minutos correspondente.
# Função de exibição: exibe o resultado da conversão no terminal de saída.
#
# Exemplo de entrada:
# dias: 10 dias
#
# Saída esperada:
# minutos: 14400 (cálculo: 10 * 24 horas * 60 minutos)

.data
  dias: .word 10         # Declara uma variável 'dias' e inicializa com o valor 10 (número de dias a serem convertidos).
  .align 2               # Alinha os dados na memória.
  minutos: .space 4      # Reserva 4 bytes para armazenar o número de minutos após a conversão.

.text
.globl main              # Define o ponto de entrada global do programa.

# Função converter: converte o número de dias em minutos e armazena o resultado.
# $a0: número dias.
# $a1: endereço da variável minutos.
converter:
   li $t0, 24            # Carrega o valor 24 (número de horas por dia) no registrador $t0.
   li $t1, 60            # Carrega o valor 60 (número de minutos por hora) no registrador $t1.
   mult $a0, $t0         # Multiplica o número de dias ($a0) por 24.
   mflo $v0              # Move o resultado da multiplicação para o registrador $v0.
   mult $v0, $t1         # Multiplica o resultado por 60 (minutos por hora).
   mflo $v0              # Move o resultado da multiplicação para o registrador $v0.
   sw $v0, ($a1)         # Armazena o valor resultante de minutos no endereço apontado por $a1.
   jr $ra                # Retorna à função chamadora.

# Função imprimir: exibe o valor armazenado em $a0 no terminal.
imprimir:
   li $v0, 1             # Carrega o código para imprimir um inteiro (1) no registrador $v0.
   syscall               # Executa o syscall para exibir o valor em $a0 no terminal.
   jr $ra                # Retorna à função chamadora.

# Função principal.
main:
   lw $a0, dias          # Carrega o valor armazenado na variável 'dias' no registrador $a0.
   la $a1, minutos       # Carrega o endereço da variável 'minutos' no registrador $a1.
   jal converter         # Chama a função 'converter' para calcular o número de minutos.
   move $a0, $v0         # Move o resultado da conversão ($v0) para $a0 (parâmetro para a função 'imprimir').
   jal imprimir          # Chama a função 'imprimir' para exibir o número de minutos no terminal.
   li $v0, 10            # Carrega o código para encerrar o programa (10).
   syscall               # Finaliza o programa.
