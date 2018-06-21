# Universidade de Brasília (UnB)
# Departamento de Ciência da Computação (CIC)
# Introdução aos Sistemas Computacionais
#
# Assembly language: MIPS
# O que este código faz: Soma dois numeros e imprime na tela

.text

# Função principal 
main: 
	li $s0, 10 # insere o valor 10 no regitrador $s0
	li $s1, 20 # insere o valor 17 no regitrador $s1
	add $s2,$s1,$s0 # soma o valor dos registradores $s0 e $s1 e insere no registrador $s2

	la $a0, ($s2) #coloca o registrador $s2 para ser impresso
	li $v0,1 #comando de impressão de inteiro na tela
	syscall # efetua a chamada ao sistema

	li $v0, 10 # comando de exit
	syscall # efetua a chamada ao sistema
