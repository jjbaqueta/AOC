# Exercício
# Implemente um programa que leia uma temperatura em graus Celsius 
# fornecida pelo usuário (C) (via terminal), converta para Fahrenheit (F) 
# e exiba o resultado no terminal.

.data
.text

  # Entrada de dados - leitura do valor C
  li $v0, 5
  syscall
  move $t0, $v0
  
  # Realizando a conversão
  li $t1, 5
  div $t0, $t1
  mflo $t0
  li $t1, 9
  mult $t0, $t1
  mflo $t0
  li $t1, 32
  add $t0, $t0, $t1
  
  # Exibindo o resultado
  move $a0, $t0
  li $v0, 1
  syscall
  
  # Finaliza o programa
  li $v0, 10
  syscall
