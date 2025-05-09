# Exercício
# Implemente um programa em Assembly MIPS-32 que, 
# com base no valor de uma variável chamada idade (de 4 bytes), 
# exiba uma das seguintes saídas:
#   * Se idade > 18, exiba: 1
#   * Se idade < 18, exiba: -1
#   * Se idade == 18, exiba: 0
#
# O valor da variável idade deve ser obtido por meio de entrada 
# de dados do usuário. As validações devem ser repetidas 
# até que o usuário informe um valor negativo como idade.

.data
   idade: .space 4	    # Declara um espaço na memória (4 bytes) chamado 'idade' não inicializado.
   
.text
   LOOP:
   li $v0, 5             # Código para leitura de um inteiro
   syscall               # Executa a rotina de leitura via terminal.
   
   move $t0, $v0         # Move o inteiro lido ($v0) para $t0
   blt $t0, 0, FIM       # Se $t0 (idade) for negativa, desvia para o rótulo "FIM".
   bgt $t0, 18, MAIOR    # Se $t0 (idade) for maior que 18, desvia para o rótulo "MAIOR".
   blt $t0, 18, MENOR    # Se $t0 (idade) for menor que 18, desvia para o rótulo "MENOR"
   li $a0, 0             # Se $t0 (idade) for igual a 18, carrega o valor 0 no registrador $a0.
   li $v0, 1             # Carrega o valor 1 no registrador $v0 (código para imprmir um inteiro).
   syscall               # Executa a impressão do valor em $a0.
   j LOOP                # Desvia para o rótulo "LOOP".
   
   MAIOR:
   li $a0, 1             # Carrega o valor 1 em $a0.
   li $v0, 1             # Carrega o valor 1 no registrador $v0 (código para imprmir um inteiro).
   syscall               # Executa a impressão do valor em $a0.
   j LOOP                # Desvia para o rótulo "LOOP".
   
   MENOR:
   li $a0, -1            # Carrega o valor -1 em $a0.
   li $v0, 1             # Carrega o valor 1 no registrador $v0 (código para imprmir um inteiro).
   syscall               # Executa a impressão do valor em $a0.
   j LOOP                # Desvia para o rótulo "LOOP".
   
   FIM:
   li $v0, 10            # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
   syscall               # Finalização do programa
