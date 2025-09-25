# Exercício
# Implemente um programa que:
# - Solicite ao usuário uma distância em quilômetros (Q), 
#   que deve ser lida como um valor real pelo terminal.
# - Converta o valor para milhas (M) utilizando a seguinte equação:
#   M = (Q * 0,621371)
#   0,621371 em precisão simples: 0x3F1F122B
# - Exiba no terminal o resultado do cálculo.
#
# Exemplo de entrada e saída:
# Q: 5
# M: 3,106855

.data
.text
  # Entrada de dados - leitura da distância
  li $v0, 6
  syscall
    
  # Conversão para milhas
  li $t0, 0x3F1F122B	# 0,621371
  mtc1 $t0, $f1
  mul.s $f2, $f0, $f1
  
  # Exibindo o resultado
  mov.s $f12, $f2
  li $v0, 2
  syscall
  
  # Finaliza o programa
  li $v0, 10
  syscall
