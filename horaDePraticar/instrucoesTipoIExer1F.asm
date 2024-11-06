# Exercício
# Traduza as seguintes operações (em sintaxe C) para Assembly MIPS-32. Realize adequadamente as operações de leitura e escrita:
#
# f) Código C
# int main(){
#    char a = 1;
#    short b = 2;
#    int c = 3, result;
#    result = a + b + c;
#    return 0;
# }

.data
  a: .byte 1
  b: .half 2
  c: .word 3
  result: .space 4

.text
  lb $t0, a          # Carrega o valor da variável 'a' da memória para $t0
  lh $t1, b          # Carrega o valor da variável 'b' da memória para $t1
  lw $t2, c          # Carrega o valor da variável 'c' da memória para $t2
  add $t0, $t0, $t1  # Soma o valor de $t0 com o valor de $t1, o resultado é armazenado em $t0
  add $t2, $t2, $t0  # Soma o valor de $t0 com o valor de $t2, o resultado é armazenado em $t2
  sw $t2, result     # Escreve o valor de $t2 na variável 'result'
  li $v0, 10         # Finalização do programa
  syscall
