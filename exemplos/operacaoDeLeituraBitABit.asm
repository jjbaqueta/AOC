# Exercício
# Você está implementando um protocolo de rede para receber mensagens de texto enviadas pela internet. 
# Nesse protocolo, sempre que uma mensagem de texto é transmitida, cada letra ou dígito da mensagem 
# é fragmentado em caracteres, e cada caractere é enviado em um pacote de 16 bits, conforme descrito abaixo. 
# Note que, no cabeçalho do pacote, um bit é reservado para controle de erro, o qual indica se 
# a informação foi corrompida durante o envio. 
#
# Escreva um programa em Assembly para ler um pacote de informação (letra) e verificar se o pacote contém erro.
#
# Formtato de uma mensagem:
#   * bits[0 .. 7]: Letra da mensagem
#   * bits[8]: Bit de erro
#   * bits[15 .. 9]: Outras informações
#
# Possíveis entradas (mensagem): 0x0141, 0x0055, 0x034C, 0x0041, 0x005F, 0x0231, 0x0041, 0x006C

.data
  letra: .half 0x0231   # Declara um espaço na memória chamado 'letra' inicializado com a mensagem 0x0231.

.text
  lh $t0, letra        # Carrega o valor armazenado em 'letra' para o registrador $t0.
  li $t1, 0x0100       # Carrega a máscara bits no registrador $t1 (apenas a posição na ordem do bit de erro é definida como 1).
  and $a0, $t0, $t1    # Realiza a operação lógica E. O registrador $a0 recebe o resultado.
  srl $a0, $a0, 8      # Desloca o bit de erro para a posição de ordem 0.
  li $v0, 1            # Carrega o valor 1 no registrador $v0 (código para imprmir um inteiro).
  syscall              # Executa a impressão do valor em $a0.

  li $v0, 10          # Carrega o valor 1 no registrador $v0 (código para finalização do programa).
  syscall             # Finalização do programa
