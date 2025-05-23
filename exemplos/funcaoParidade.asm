# Exercício
# Implemente uma função chamada eImpar que recebe, por parâmetro, um número inteiro. 
# Essa função deve retornar 1 se o número informado for ímpar, ou 0 caso seja par. 
# O número passado por parâmetro deve ser lido de uma variável chamada num (com 4 bytes de tamanho). 
# Utilize apenas registradores do tipo S em seu programa.
#
# Exemplo de entrada:
# -  Entrada 1: num = 10
# -  Entrada 2: num = 5
#
# Saída esperada:
# -  Saída 1: 10 é par
# -  Saída 2: 5 é ímpar

.data
   num: .word 25                 # Define uma variável inteira chamada 'num' com valor 25
   par: .asciiz " é par\n"       # Define uma string terminada em nulo com a mensagem " é par"
   impar: .asciiz " é ímpar\n"   # Define uma string terminada em nulo com a mensagem " é ímpar"
   
.text
   .globl main           # Define o rótulo 'main' como global (ponto de entrada do programa)

   # Função epar: verifica se um número é par
   # Recebe um número inteiro por parâmetro ($a0)
   # Retorna o resto da divisão do número por 2 ($v0)
   
   eImpar:
   addi $sp, $sp, -4     # Aloca espaço na pilha para salvar $s0
   sw $s0, ($sp)         # Salva o valor de $s0 na pilha
   li $s0, 2             # Carrega o valor 2 em $s0 (divisor)
   div $a0, $s0          # Divide o valor em $a0 por 2
   mfhi $v0              # Move o resto da divisão para $v0
   lw $s0, ($sp)         # Restaura o valor original de $s0 da pilha
   addi $sp, $sp, 4      # Libera o espaço na pilha
   jr $ra                # Retorna para a função chamadora

   # Função principal
   main:
   lw $s0, num           # Carrega o valor da variável 'num' em $s0
   move $a0, $s0         # Move o valor de $s0 para $a0 (argumento para função 'epar')
   jal eImpar            # Chama a função 'eImpar'
   move $s1, $v0         # Armazena o retorno da função em $s1   

   move $a0, $s0         # Move o número de entrada (em $s0) para $a0 (para impressão)
   li $v0, 1             # Código de impressão de inteiro
   syscall               # Imprime o número

   beq $s1, $zero, PAR   # Se $s1 == 0, salta para PAR
   la $a0, impar         # Caso contrário, carrega o endereço da string "é ímpar"
   j FIM                 # Salta para FIM
   PAR:
   la $a0, par           # Carrega o endereço da string "é par"
   FIM:
   li $v0, 4             # Código de impressão de string
   syscall               # Imprime a string correspondente
   li $v0, 10            # Código para encerrar o programa
   syscall               # Termina o programa
