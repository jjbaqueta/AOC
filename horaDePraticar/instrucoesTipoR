# Exercício
# Realize as seguintes operações:
# 10 + 6 + 1
# -1 + 1
# (10 + 5) * 2
# (10 % 3) + (20 / 10)
# 10 - ((5 * 3) + 3) / 3
# 10 - (4 / 2) * (5 + 2)

.data
.text

  # 10 + 6 - 1
  li $t0, 10
  li $t1, 6
  add $t0, $t0, $t1
  li $t1, -1
  add $t0, $t0, $t1  # $t0 = 0x0000000f
  
  # -1 + 1
  li $t0, -1
  li $t1, 1
  add $t0, $t0, $t1 # $t0 = 0x00000000
  
  # (10 + 5) * 2
  li $t0, 10
  li $t1, 5
  add $t0, $t0, $t1
  li $t1, 2
  mult $t0, $t1
  mflo $t0 # $t0 = 0x0000001e
  
  # (10 % 3) + (20 / 10)
  li $t0, 10
  li $t1, 3
  div $t0, $t1
  mfhi $t0
  li $t1, 20
  li $t2, 10
  div $t1, $t2
  mflo $t1
  add $t0, $t0, $t1 # $t0 = 0x00000003

  # 10 - ((5 * 3) + 3) / 3
  li $t0, 5
  li $t1, 3
  mult $t0, $t1
  mflo $t0
  add $t0, $t0, $t1
  div $t0, $t1
  mflo $t0
  li $t1, 10
  sub $t0, $t1, $t0 # $t0 = 0x00000004
  
  # 10 - (4 / 2) * (5 + 2)
  li $t0, 4
  li $t1, 2
  div $t0, $t1
  mflo $t0
  li $t2, 5
  add $t1, $t1, $t2
  mult $t0, $t1
  mflo $t0
  li $t1, 10
  sub $t0, $t1, $t0 # $t0 = 0xfffffffc
  
  # Finaliza o programa
  li $v0, 10
  syscall
