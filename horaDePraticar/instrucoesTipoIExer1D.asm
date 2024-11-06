# Exercício
# Traduza as seguintes operações (em sintaxe C) para Assembly MIPS-32. Realize adequadamente as operações de leitura e escrita:
#
# d) Código C
# int main(){
#    short a = 10, b = 5, result;
#    result = a + b
#    return 0;
# }

.data
  a: .half 10
  b: .half 5
  result: .space 2

.text
  lh $t0, a           # Carrega o valor da variável 'a' da memória para $t0
  lh $t1, b		        # Carrega o valor da variável 'b' da memória para $t1
  add $t0, $t0, $t1	  # Soma o valor de $t0 com o valor de $t1, o resultado é armazenado em $t0
  sh $t0, result		  # Escreve o valor de $t0 na variável 'result'
  li $v0, 10		      # Finalização do programa
  syscall
