# Exercício
# Traduza as seguintes operações (em sintaxe C) para Assembly MIPS-32. Realize adequadamente as operações de leitura e escrita:
#
# e) Código C
# int main(){
#    int a = 10, b = 5, result;
#    result = a/2 + b*2
#    return 0;
# }

.data
  a: .word 10
  b: .word 5
  result: .space 4

.text
  lw $t0, a          # carrega o valor da variável 'a' da memória para $t0
  lw $t1, b          # carrega o valor da variável 'b' da memória para $t1
  li $t2, 2          # carrega a constante 2 em $t2
  div $t0, $t2       # divide o valor de $t0 pelo valor de $t2
  mflo $t0           # move o resultado da divisão para $t0
  mult $t1, $t2      # multiplica o valor de $t1 pelo valor de $t2
  mflo $t1           # move o resultado da multiplicação para $t1
  add $t0, $t0, $t1  # soma o valor de $t0 com o valor de $t1, o resultado é armazenado em $t0
  sw $t0, result     # escreve o valor de $t0 na variável 'result'
  li $v0, 10         # finalização do programa
  syscall
