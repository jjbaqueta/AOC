# Exercício
# Traduza a função abaixo para Assembly MIPS-32:
#
# void funcao(int a,  int b, int c, int d) {
#	int soma = a + b;
#	int sub = c - d;
#	imprimir(soma + sub);
# }
# void imprimir(int valor)
#    printf(“%d\n”, valor);
# } 
# int main() {
#    funcao(5, 10, 15, 20);
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
   addi $sp, $sp -8             # Aloca 16 bytes de espaço na pilha para armazenar os registradores $s1, $s2, $s3, $s4.
   sw $a0, ($sp)                # Salva o valor do registrador $a0 na pilha.
   sw $ra, 4($sp)               # Salva o valor do registrador $ra na pilha.
   add $t0, $a0, $a1            # soma = a + b
   sub $t1, $a2, $a3            # sub = c - d
   add $a0, $t0, $t1            # $a0 = soma + sub
   jal imprimir                 # Chama a função imprimir
   lw $a0, ($sp)                # Restaura o valor de $a0 da pilha.
   lw $ra, 4($sp)               # Restaura o valor de $sp da pilha.
   addi $sp, $sp, 8             # Libera o espaço de 8 bytes na pilha.
   jr $ra                       # Retorna para o chamador (função 'main')

main:                           # Função principal
   li $a0, 5                    # a = 5
   li $a1, 10                   # b = 10
   li $a2, 15                   # c = 15
   li $a3, 20                   # d = 20
   jal funcao                   # Chama a função funcao
   li $v0, 10                   # Carrega o código para encerrar o programa (10).
   syscall                      # Finaliza o programa.
