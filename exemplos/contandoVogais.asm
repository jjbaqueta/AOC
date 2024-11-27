# Exercício
# Escreva um programa para contar a quantidade de vogais presentes em uma frase. 
# Essa frase deve ser armazenada em memória por meio de uma string (.asciiz). 
# A contagem de vogais deve ser armazenada em uma variável do tipo .word. 
# Assuma que a mensagem de entrada contém apenas caracteres minúsculos.
#
# Exemplo de entrada e saída:
# String de entrada: “testandoooo”
# Saída esperada: contagem = 6 

.data
  str: .asciiz "testandoooo" # Declaração da string de entrada.
  .align 2
  contagem: .space 4         # Declaração da variável 'contagem'.

.text
  la $t0, str                # Carrega o endereço base da string 'str' no registrador $t0
  move $1, $zero             # Contador de vogais
  
  LOOP:
  lb $t2, ($t0)              # Carrega o conteúdo de cada posição da string para o registrador $t2
  beq $t2, $zero, FIM        # Se o conteúdo de $t2 é igual a 0 ('\0'), desvia para o rótulo "FIM".
  beq $t2, 0x0061, VOGAL     # Se o conteúdo de $t2 é igual a 0x61 ('a'), desvia para o rótulo "VOGAL".
  beq $t2, 0x0065, VOGAL     # Se o conteúdo de $t2 é igual a 0x65 ('e'), desvia para o rótulo "VOGAL".
  beq $t2, 0x0069, VOGAL     # Se o conteúdo de $t2 é igual a 0x69 ('i'), desvia para o rótulo "VOGAL".
  beq $t2, 0x006F, VOGAL     # Se o conteúdo de $t2 é igual a 0x6F ('o'), desvia para o rótulo "VOGAL".
  beq $t2, 0x0075, VOGAL     # Se o conteúdo de $t2 é igual a 0x75 ('u'), desvia para o rótulo "VOGAL".
  CONTINUE:
  addi $t0, $t0, 1           # $t0 é incrementado em um 1 byte
  j LOOP
  
  VOGAL:
  addi $t1, $t1, 1           # O contador ($t1) é incrementado em uma unidade
  j CONTINUE

  FIM:
  sw $t1, contagem          # Atualiza o valor da variável 'contagem'
  li $v0, 10                # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
  syscall                   # Finalização do programa,
