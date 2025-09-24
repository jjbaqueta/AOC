# Exercício
# Implemente um programa que leia do usuário o raio (R) 
# de um círculo, calcule sua área e exiba o resultado no terminal.
# 
# Área do círculo (Ac):
# Ac = π * R^2 
# Considere π = 3,14  (0x4048F5C3)
#
# Exemplo de entrada e saída:
# R: 2,5
# Ac: 19,625

.data
.text

  # Entrada de dados - leitura do valor R
  li $v0, 6
  syscall	# $f0 = R
  
  # Cálculo da área
  li $t1, 0x4048F5C3	# 3,14
  mtc1 $t1, $f1
  mul.s $f2, $f0, $f0
  mul.s $f2, $f2, $f1
  
  # Exibindo o resultado
  mov.s $f12, $f2
  li $v0, 2
  syscall
      
  # Finaliza o programa
  li $v0, 10
  syscall
