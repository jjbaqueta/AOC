# Exercício
# Implemente uma função que recebe como parâmetros um vetor, o índice de início e o índice de fim do vetor. 
# Por exemplo, em um vetor de 5 posições, o índice de início é 0 e o índice de fim é 4. 
# Em sua função, utilize apenas registradores do tipo S para armazenar valores temporários. 
# Lembre-se de que, antes de utilizar um registrador, devemos salvar seus valores, 
# e após o uso, restaurá-los para garantir que não ocorram sobrescritas indesejadas.
#
# Exemplo de entrada:
# vetor: 2, 3, 4, 5, 6, 7 
#
# Saída esperada:
# vetor: 7, 6 ,5, 4, 3, 2

.data
  vetor: .word 1, 2, 3, 4, 5      # Define o vetor de inteiros, com os valores 1, 2, 3, 4, 5.
  inicio: .word 0                 # Define o índice de início do vetor (0).
  fim: .word 4                    # Define o índice de fim do vetor (4, corresponde ao último índice).

.text
.globl main                       # Define o ponto de entrada global do programa.

# Função inverter: inverte os elementos do vetor.
inverter: 
   addi $sp, $sp, -16             # Aloca 16 bytes de espaço na pilha para armazenar os registradores $s1, $s2, $s3, $s4.
   sw $s1, 0($sp)                 # Salva o registrador $s1 na pilha.
   sw $s2, 4($sp)                 # Salva o registrador $s2 na pilha.
   sw $s3, 8($sp)                 # Salva o registrador $s3 na pilha.
   sw $s4, 12($sp)                # Salva o registrador $s4 na pilha.

   LOOP:
   beq $a1, $a2, FIM             # Se o índice de início ($a1) for igual ao índice de fim ($a2), termina o loop (fim da inversão).
   sll $s1, $a1, 2               # Multiplica o índice de início ($a1) por 4 e armazena em $s1.
   sll $s2, $a2, 2               # Multiplica o índice de fim ($a2) por 4 e armazena em $s2.
   add $s3, $a0, $s1             # Calcula o endereço do elemento no índice de início e armazena em $s3.
   add $s4, $a0, $s2             # Calcula o endereço do elemento no índice de fim e armazena em $s4.
   lw $s1, ($s3)                 # Carrega o valor do elemento na posição de início do vetor para $s1.
   lw $s2, ($s4)                 # Carrega o valor do elemento na posição de fim do vetor para $s2.
   sw $s1, ($s4)                 # Armazena o valor de $s1 (início) na posição de fim do vetor.
   sw $s2, ($s3)                 # Armazena o valor de $s2 (fim) na posição de início do vetor.
   addi $a1, $a1, 1              # Incrementa o índice de início ($a1).
   addi $a2, $a2, -1             # Decrementa o índice de fim ($a2).
   j LOOP                        # Volta para o início do loop.
   FIM:
   lw $s1, 0($sp)                # Restaura o valor de $s1 da pilha.
   lw $s2, 4($sp)                # Restaura o valor de $s2 da pilha.
   lw $s3, 8($sp)                # Restaura o valor de $s3 da pilha.
   lw $s4, 12($sp)               # Restaura o valor de $s4 da pilha.
   addi $sp, $sp, 16             # Libera o espaço de 16 bytes na pilha.
   jr $ra                        # Retorna para a função chamadora (main).

# Função main
main:
   la $a0, vetor                 # Carrega o endereço do vetor para $a0.
   lw $a1, inicio                # Carrega o índice de início (0) para $a1.
   lw $a2, fim                   # Carrega o índice de fim (4) para $a2.
   jal inverter                  # Chama a função 'inverter'.
   li $v0, 10                    # Carrega o código para encerrar o programa (10).
   syscall                       # Finaliza o programa.
