# Exercício
# Implemente um programa que:
# - Solicite ao usuário a base (B) e a altura (A) de um triângulo, 
#   lidas como valores reais pelo terminal
# - Calcule a área do triângulo (At) utilizando a seguinte equação:
#   At = (B * A) / 2
# - Exiba no terminal o resultado do cálculo.
#
# Exemplo de entrada e saída:
# B: 4.5
# A: 7.2
# At: 16.2

.data
  base: .space 4
  altura: .space 4
  area: .space 4

.text
  # Entrada de dados - leitura da base
  li $v0, 6
  syscall
  s.s $f0, base
  
  # Entrada de dados - leitura da altura
  li $v0, 6
  syscall
  s.s $f0, altura
  
  # Cálculo da área
  li $t0, 0x40000000	# 2.0
  mtc1 $t0, $f0
  l.s $f1, base
  l.s $f2, altura
  mul.s $f3, $f1, $f2
  div.s $f3, $f3, $f0
  
  # Exibindo o resultado
  mov.s $f12, $f3
  li $v0, 2
  syscall
  
  # Finaliza o programa
  li $v0, 10
  syscall
