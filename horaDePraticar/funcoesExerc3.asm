# Exercício
# Implemente uma função chamada eImpar que recebe, por parâmetro, um número inteiro. 
# Essa função deve retornar 1 se o número informado for ímpar, ou 0 caso seja par. 
# O número passado por parâmetro deve ser lido de uma variável chamada num (com 4 bytes de tamanho). 
# Utilize apenas registradores do tipo S em seu programa.

.data
  num: .word 4                  # Declara um espaço na memória chamado 'num' incializado em 5.
  strImpar: .asciiz "é ímpar!"  # Declara uma variável string com o conteúdo 'é ímpar'
  strPar: .asciiz "é par!"      # Declara uma variável string com o conteúdo 'é par'
  
.text
.globl main                    # Define o ponto de entrada global do programa.

   # Função eImpar: 
   # Parâmetro ($a0): um número inteiro  
   # Retorno ($v0): retorna 1 se o número informado for ímpar; caso contrário, retorna 0.
   eImpar:
   addi $sp, $sp, -4      # Aloca 4 bytes de espaço na pilha para armazenar o registrador $s0.
   sw $s0, ($sp)          # Salva o registrador $s0 na pilha.
   li $s0, 2              # $s0 = 2
   div $a0, $s0           # Divide o valor em $a0 (parâmetro) por $0 (2)
   mfhi $v0               # Carrega o resto da divisão em $v0 (retorno)
   lw $s0, ($sp)          # Restaura o valor de $s0 da pilha.
   addi $sp, $sp, 4       # Libera o espaço de 4 bytes na pilha.
   jr $ra                 # Retorna para a função chamadora (main).
 
   # Função main
   main:
   lw $a0, num            # Carrega o valor de num para $a0.
   jal eImpar             # Chama a função 'eImpar'.
   
   beq $v0, $zero, PAR    # Se retorno ($v0) é 0, desvia para PAR
   la $a0, strImpar       # Se retorno ($v0) é 1, carrega endereço da string strImpar em $a0
   j FIM
   PAR:
   la $a0, strPar         # Se retorno ($v0) é 0, carrega endereço da string strPar em $a0
   FIM:
   li $v0, 4              # Carrega o valor 4 no registrador $v0 (código para exibir um string).
   syscall                # Exibe a string no terminal.
       
   li $v0, 10             # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
   syscall                # Finalização do programa
