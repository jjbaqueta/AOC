# Exercício
# Traduza as seguintes operações (em sintaxe C) para Assembly MIPS-32. Realize adequadamente as operações de leitura e escrita:
#
# a) Código C
# int main(){
#    int a = 10, result;
#	   result = a++
#	   return 0;
# }

.data
  a: .word 10
  result: .space 4

.text
  lw $t0, a         # Carrega o valor da variável 'a' da memória para $t0
  addi $t0, $t0, 1  # Incrementa o valor armazenado em $t0 em uma unidade
  sw $t0, result    # Escreve o valor de $t0 na variável 'result'
  li $v0, 10        # finalização do programa
  syscall
