# Exercício
# Você está implementando um protocolo de rede para receber mensagens de texto 
# enviadas pela internet. Nesse protocolo, sempre que uma mensagem de texto é transmitida, 
# cada letra ou dígito da mensagem é fragmentado em caracteres, e cada caractere
# é enviado em um pacote de 16 bits, conforme descrito abaixo. 
# Note que, no cabeçalho do pacote, um bit é reservado para controle de erro, 
# o qual indica se a informação foi corrompida durante o envio. 
# Escreva um programa para ler um pacote de informação e verificar se o pacote contém erro.
#
# Para resolver este exercício, considere que a última letra recebida foi armazenada 
# em uma variável de 16 bits chamada letra. Como saída, armazene no registrador 
# $a0 o valor 0 ou 1, onde 0 indica que o pacote não possui erro e 1 indica que há um erro.
#
# Formtato de um pixel:
#   * bits[0 .. 7]: Letra da mensagem
#   * bit[8]: Bit de erro
#   * bits[9 .. 15]: Outras informações
#
# Possíveis entradas: 0x0141, 0x0055, 0x034C, 0x0041, 0x005F, 0x0231, 0x0041, 0x006C

.data
  letra: .half 0x0141   # Declara um espaço na memória chamado 'letra' inicializado com o valor 0x0141.
  
.text
  lh $t0, letra         # Carrega o valor armazenado em 'letra' para o registrador $t0.
  li $t1, 0x0100        # Carrega a máscara no registrador $t1.
  
  and $t2, $t0, $t1     # Leitura do bit de erro.
  srl $t2, $t2, 8       # Deslocamento para os bits de ordem menos significativa.
  move $a0, $t2         # Carrega o valor 0 ou 1 para o registrador $a0.
  
  li $v0, 1		# Carrega o valor 1 no registrador $v0 (código para exibir um inteiro).
  syscall               # Exibe o conteúdo de $a0 no terminal

  li $v0, 10            # Carrega o valor 10 no registrador $v0 (código para finalização do programa).
  syscall               # Finalização do programa
