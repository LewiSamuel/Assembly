
.text

# Array 
main:

# INDICANDO O INICIO DO ARRAY

	# Carrega o endereço 0x1000 em $s0 ( os 4 bits mais significativos / os 4 primeiros bits )
	lui $s0,0x1000
	# Concatena 0x7000 ao $s0 ( os 4 bits menos significativos / os 4 ultimos bits )
	ori $s0,$s0,0x7000
	
	

# INSERINDO O NUMERO 2 NOS INDICES 0 E 1 DO ARRAY

	li $s1, 5 # insere o valor 2 no regitrador $s1
	add $t1,$zero,$s1 # soma o valor dos registradores $zero e $s1 e insere no registrador $t1
	sw $t1,0($s0)
	sw $t1,4($s0)

# MULTIPLICANDO O CONTEÚDO DO PRIMEIRO ELEMENTO DO ARRAY POR 8

	# Carregando no $t1 o conteudo do indice 0 do array que começa em $s0
	lw $t1,0($s0)
	# Faz 3 deslocamentos para esquerda ( 2*2*2 == *8 )
	sll $t1,$t1,3
	# Armazena o conteudo de $t1 no indice 0 do array que começa em $s0
	sw $t1,0($s0)

# MULTIPLICANDO 1 CONTEÚDO DO PRIMEIRO ELEMENTO DO ARRAY POR 8

	# Carregando no $t1 o conteudo do indice 1 do array que começa em $s0
	lw $t1,4($s0)
	# Faz 3 deslocamentos para esquerda ( 2*2*2 == *8 )
	sll $t1,$t1,3
	# Armazena o conteudo de $t1 no indice 0 do array que começa em $s0
	sw $t1,4($s0) 
	
	
# Imprimir valores dos indices do array

	lw $t1,0($s0)
	la $a0, ($t1) #coloca o registrador $t1 para ser impresso
	li $v0,1 #comando de impressão de inteiro na tela
	syscall # efetua a chamada ao sistema

	
	lw $t1,4($s0)
	la $a0, ($t1) #coloca o registrador $t1 para ser impresso
	li $v0,1 #comando de impressão de inteiro na tela
	syscall # efetua a chamada ao sistema


# Fim do programa
	li $v0, 10 # comando de exit
	syscall # efetua a chamada ao sistema
	