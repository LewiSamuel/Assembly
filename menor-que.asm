# Universidade de Bras�lia (UnB)
# Departamento de Ci�ncia da Computa��o (CIC)
# Introdu��o aos Sistemas Computacionais
#
# Assembly language: MIPS
# O que este codigo faz: Verifica se um numero � menor que 10 e se um numero � menor ou igual a 10


.text

# Funcao principal 
main: 
		slti $t0,$s0,10  	# retorna um valor booleano 1 para o registrador $t0 caso $s0 seja menor que 10
		beq $t0,$zero,DONE	## Se $t0 igual a zero, ir at� o label "Done"
		
		sle  $t0,$s0,10  	# retorna um valor booleano 1 para o registrador $t0 caso $s0 seja menor ou igual que 10
		beq $t0,$zero,DONE	## Se $t0 igual a zero, ir at� o label "Done"
	

li $v0, 10 # comando de exit
syscall # efetua a chamada ao sistema
