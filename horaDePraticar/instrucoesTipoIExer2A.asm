# Exercício
# Indique quais dos códigos abaixo possuem problemas de alinhamento de memória. Resolva esses problemas utilizando a diretiva .align:
# Resolução do exercício a):

.data
  var1: .space 2
  var2: .space 1
  .align 1         # Alinhando o endereço da próxima variável com um endereço múltiplo de 2 (2^1)
  var3: .space 2

.text
  li $t0, 5
  sh $t0, var1
  sb $t0, var2
  sh $t0, var3
  li $v0, 10
  syscall 
