# Exercício
# Traduza a função abaixo para Assembly MIPS-32:
#
# void funcao(int a,  int b, int c, int d, int e) {
#	int soma = a + b * e;
#	int sub = c - d;
#	imprimir(soma + sub);
# }
# void imprimir(int valor)
#    printf(“%d\n”, valor);
# } 
# int main() {
#    funcao(5, 10, 15, 20, 1);
#    return 0;
# }

.data                           
.text                           
.globl main                     # Define o ponto de entrada global do programa.

# Função imprimir: exibe o valor armazenado em $a0 no terminal.
imprimir:
    li $v0, 1                   # Carrega o código para imprimir um inteiro (1) no registrador $v0.
    syscall                     # Executa o syscall para exibir o valor em $a0 no terminal.
    jr $ra                      # Retorna à função chamadora.

# Função funcao: $a0 = a, $a1 = b, $a2 = c, $a3 = d.
funcao:
   addi $sp, $sp -12            # Aloca 16 bytes de espaço na pilha para armazenar os registradores $s1, $s2, $s3, $s4.
   sw $ra, 8($sp)               # Salva o valor do registrador $ra na pilha.
   sw $fp, 4($sp)               # Salva o valor antigo de $fp
   sw $a0, 0($sp)               # Salva o valor do registrador $a0 na pilha.
   move $fp, $sp                # Estabelecer a âncora do frame
   lw $t0, 12($fp)		        # Carrega o parâmetro e para $t0
   mult $t0, $a1                # multiplicação = b * e
   mflo $t0                     # move o valor do resultado da multiplicação para $t0
   add $t0, $a0, $t0            # soma = a + b * e
   sub $t1, $a2, $a3            # sub = c - d
   add $a0, $t0, $t1            # $a0 = soma + sub
   jal imprimir                 # Chama a função imprimir
   move $sp, $fp                # Alinhar $sp com $fp
   lw $fp, 4($sp)               # Restaura o valor antigo de $fp
   lw $ra, 8($sp)		        # Restaura o endereço de retorno
   addi $sp, $sp, 12            # Libera o espaço de 8 bytes na pilha.
   jr $ra                       # Retorna para o chamador (função 'main')

main:                           # Função principal
   li $a0, 5                    # a = 5
   li $a1, 10                   # b = 10
   li $a2, 15                   # c = 15
   li $a3, 20                   # d = 20
   li $t0, 1			        # e = 1
   addi $sp, $sp, -4		    # Aloca espaço na pilha para o argumento e
   sw $t0, ($sp)
   jal funcao                   # Chama a função funcao
   addi $sp, $sp, 4		        # Libera o espaço dos argumentos
   
   li $v0, 10                   # Carrega o código para encerrar o programa (10).
   syscall                      # Finaliza o programa.
