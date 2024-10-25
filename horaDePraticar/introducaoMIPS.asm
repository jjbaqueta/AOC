# Exercício
# Realize as seguintes operações:
# - Mova o valor 15 para o registrador $t5
# - Mova o valor 64 para o registrador $s0
# - Exiba o valor 34 na saída do simulador
# - Exiba o valor 50 na saída do simulador
#
# Saída esperada (aba Run I/O):
# 3450

.data
.text

  # Move o valor 15 para o registrador $t5
  li $t5, 15
  
  # Move o valor 64 para o registrador $s0
  li $s0, 64
  
  # Exibe o valor 34 na saída do simulador
  li $a0, 34
  li $v0, 1
  syscall
  
  # Exibe o valor 50 na saída do simulador
  li $a0, 50
  li $v0, 1
  syscall
  
  # Finaliza o programa
  li $v0, 10
  syscall
