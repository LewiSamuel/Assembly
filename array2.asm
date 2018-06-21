
.text

# Array 
main:

# $s0= endereço base do array
# $s1=i

# Carrega o endereço 0x1000 em $s0 ( os 4 bits mais significativos / os 4 primeiros bits )
lui $s0,0x1000
# Concatena 0x7000 ao $s0 ( os 4 bits menos significativos / os 4 ultimos bits )
ori $s0,$s0,0x7000

# Adiciona ZERO ao $s1 ( $s1 = contador )
add $s1,$zero,$zero
# Adiciona 1000 ao $t2 ( $t2 =  limite do contador )
addi $t2,$zero,1000


LOOP:
	# $t0 igual a 1 caso $s1 menor que $t2
	slt $t0,$s1,$t2
	# Se a condição anterior for falsa, pular para o label DONE
	beq $t0,$zero,DONE
	
# CORPO DO LOOP
	
	# Uma vez que cada indice do array tem o tamanho de 4 bits,
	# Utiliza-se o contador (multiplicado por 4) para acessar dinamicamente
	# os próximos indices do array. Ou seja
	
	#  contador    |   indice do array
	#     0        |         0
	#     1        |         4
	#     2        |         8

	
	# t0 = contador*4
	sll $t0,$s1,2
	# t0 = array[] + t0
	add $t0,$s0,$t0
	
	# Pegar o valor de $t0 / multiplica por 8 / armazena de novo em $t0
	lw $t1,0($t0)
	sll $t1,$t1,3
	sw $t1,0($t0)
	
	# contador ++
	addi $s1,$s1,1
	j LOOP
DONE:


# Fim do programa
	li $v0, 10 # comando de exit
	syscall # efetua a chamada ao sistema
	
	