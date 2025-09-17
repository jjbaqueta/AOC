# Exercício
# Realize as seguintes operações:
# 1) Mova o valor 15 para o registrador $t5
# 2) Mova o valor 64 para o registrador $s0
# 3) Exiba o valor 34 no terminal do simulador
# 4) Exiba o valor 50 no terminal do simulador
# 5) Leia um número inteiro informado pelo usuário e exiba-o no terminal do simulador

.data
.text

  # 1) Move o valor 15 para o registrador $t5
  li $t5, 15
  
  # 2) Move o valor 64 para o registrador $s0
  li $s0, 64
  
  # 3) Exibe o valor 34 no terminal
  li $a0, 34
  li $v0, 1
  syscall
  
  # 4) Exibe o valor 50 no terminal
  li $a0, 50
  li $v0, 1
  syscall

  # 5) Exibe um número inteiro informado pelo usuário
  li $v0, 5
  syscall
  move $a0, $v0
  li $v0, 1
  syscall
  
  # Finaliza o programa
  li $v0, 10
  syscall
