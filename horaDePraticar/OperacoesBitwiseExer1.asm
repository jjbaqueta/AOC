# Exercício
# Realize as seguintes operações utilizando shifts:
#   a) 16 * 4
#   b) 128 / 8
#   c) 2 * 32
#   d) 64 / 16

.data:
.text:
  # a) 16 * 4
  li $t0, 16
  sll $t0, $t0, 2

  # b) 128 / 8
  li $t1, 128
  srl $t1, $t1, 3
  
  # c) 2 * 32
  li $t2, 2
  sll $t2, $t2, 5

  # d) 64 / 16
  li $t3, 64
  srl $t3, $t3, 4

  li $v0, 10          # Carrega o valor 1 no registrador $v0 (código para finalização do programa).
  syscall             # Finalização do programa
