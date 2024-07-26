.data
	temperatura: .word 10
	saida1: .asciiz "está quente"
	saida2: .asciiz "está frio"
	saida3: .asciiz "temperatura agradável"
.text
	lw $t0, temperatura
	li $t1, 30
	li $t2, 10
	bge $t0, $t1, QUENTE
	ble $t0, $t2, FRIO 
	la $a0, saida3
	li $v0, 4
	syscall
	j FIM
	
	FRIO:
	la $a0, saida2
	li $v0, 4
	syscall
	j FIM
	
	QUENTE:
	la $a0, saida1
	li $v0, 4
	syscall
	
	FIM:
	li $v0, 10
	syscall