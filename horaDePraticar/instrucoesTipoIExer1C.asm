# Exercício
# Traduza as seguintes operações (em sintaxe C) para Assembly MIPS-32. Realize adequadamente as operações de leitura e escrita:
#
# c) Código C
# int main(){
#    int a = 10, sum = 0;
#    sum += (a + 10)
#    return 0;
# }

.data
  a: .word 10
  sum: .word 0

.text
  lw $t0, a          # Carrega o valor da variável 'a' da memória para $t0
  addi $t0, $t0, 10  # 10 é somado ao valor armazenado em $t0
  lw $t1, sum        # Carrega o valor da variável 'sum' da memória para $t1
  add $t0, $t0, $t1  # Soma o valor de $t0 com o valor de $t1, o resultado é armazenado em $t0
  sw $t0, sum        # Escreve o valor de $t0 na variável 'sum'
  li $v0, 10         # Finalização do programa
  syscall
