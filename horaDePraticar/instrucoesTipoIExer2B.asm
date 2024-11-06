# Exercício
# Indique quais dos códigos abaixo possuem problemas de alinhamento de memória. Resolva esses problemas utilizando a diretiva .align:
# Resolução do exercício b):

.data
  var1: .space 1
  .align 2        # alinhando o endereço da próxima variável com um endereço múltiplo de 4 (2^2)
  var2: .space 4
  var3: .space 2

.text
  li $t0, 5
  sb $t0, var1
  sw $t0, var2
  sh $t0, var3
  li $v0, 10
  syscall
