# Exercício
# Implemente um programa que leia dois valores inteiros positivos 
# informados pelo usuário (via terminal), A e B, e exiba o resultado
# da seguinte operação (X) no terminal:
#
# X = ((A % (B - 1)) * 2) - ((A + B + 1) / 2)
#
# Exemplo de entrada e saída:
# A: 10
# B: 1
# X: 6 

.data
.text

  # Entrada de dados - leitura do valor A
  li $v0, 5
  syscall
  move $t0, $v0
 
  # Entrada de dados - leitura do valor B
  li $v0, 5
  syscall
  move $t1, $v0
   
  # Realizando o processamento
  # ((A % (B - 1)) * 2)
  li $t2, 1
  sub $t3, $t1, $t2
  div $t0, $t3
  mfhi $t3
  li $t2, 2
  mult $t3, $t2
  mflo $t3
  
  # ((A + B + 1) / 2)  
  li $t2, 1
  add $t4, $t0, $t1
  add $t4, $t4, $t2
  li $t2, 2
  div $t4, $t2
  mflo $t4
  
  # ((A + B + 1) / 2) - ((A % (B - 1)) * 2)
  sub $t3, $t4, $t3
  
  # Exibindo o resultado
  move $a0, $t3
  li $v0, 1
  syscall
  
  # Finaliza o programa
  li $v0, 10
  syscall
