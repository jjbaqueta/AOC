# Exercício
# Realize as seguintes operações utilizando o formato de 
# ponto flutuante em precisão simples, conforme o padrão IEEE 754:
# 
# 1) 3,5 + 2,0
# 2) 3,5 - 1,0
# 3) 10,25 / 2,0 + 2,5
# 4) 10,25 * -5,75 + 1,0
# 5) 2,0 - 1,0 + 2,5 * -6,25
#
# Representação dos operandos em hexadecimal:
# 1,0: 0x3F800000		-5,75: 0xC0B80000
# 2,0: 0x40000000		-6,25: 0xC0C80000
# 2,5: 0x40200000		10,25: 0x41240000
# 3,5: 0x40600000

.data
.text

  # 1) 3,5 + 2.0
  li $t0, 0x40600000	# 3,5
  li $t1, 0x40000000	# 2,0
  mtc1 $t0, $f0
  mtc1 $t1, $f1
  add.s $f4, $f0, $f1
  
  # 2) 3,5 - 1,0
  li $t0, 0x40600000	# 1,0
  li $t1, 0x3F800000	# 3,5
  mtc1 $t0, $f0
  mtc1 $t1, $f1
  sub.s $f5, $f0, $f1
  
  # 3) 10,25 / 2,0 + 2,5
  li $t0, 0x40000000	# 2,0
  li $t1, 0x40200000	# 2,5
  li $t2, 0x41240000	# 10,25
  mtc1 $t0, $f0
  mtc1 $t1, $f1
  mtc1 $t2, $f2
  div.s $f6, $f2, $f0
  add.s $f6, $f6, $f1
  
  # 4) 10,25 * -5,75 + 1,0
  li $t0, 0x3F800000	# 1,0
  li $t1, 0xC0B80000	# -5,75
  li $t2, 0x41240000	# 10,25
  mtc1 $t0, $f0
  mtc1 $t1, $f1
  mtc1 $t2, $f2
  mul.s $f7, $f2, $f1
  add.s $f7, $f7, $f0

  # 5) 2,0 - 1,0 + 2,5 * -6,25
  li $t0, 0x3F800000	# 1,0
  li $t1, 0x40000000	# 2,0
  li $t2, 0x40200000	# 2.5
  li $t3, 0xC0C80000	# -6,25
  mtc1 $t0, $f0
  mtc1 $t1, $f1
  mtc1 $t2, $f2
  mtc1 $t3, $f3
  mul.s $f8, $f2, $f3
  sub.s $f9, $f1, $f0
  add.s $f8, $f9, $f8
    
  # Finaliza o programa
  li $v0, 10
  syscall
