# Universidade de Brasï¿½lia (UnB)
# Departamento de Ciï¿½ncia da Computaï¿½ï¿½o (CIC)
# Introduï¿½ï¿½o aos Sistemas Computacionais
#
# Assembly language: MIPS
# O que este codigo faz: Estrutura de Loop FOR
#
#	int sum=0;
#	for(i=0;i<10;i++)
#	{
#	sum=sum+i;
#	}
#

.text

# Funcao principal 
main: 


	add $s1,$zero,$zero  		# adiciona 0 + 0 ao registrador $s1
	addi $s0,$zero,0		# adiciona 0 + 0 ao registrador $s0
	
	FOR:				# Label "FOR"

		#  Condição de fim do LOOP
		slti $t0,$s0,10  	# retorna valor booleano 1 para variavel $t0, caso  $s0 seja menor que 10
		beq $t0,$zero,DONE	## Se $t0 igual a zero ( ou seja, $0 maior ou igual a 10 ), ir até o label "Done"

		# Codigo a ser executado dentro do loop: 
		add $s1,$s1,$s0		## Adicionar ao registrador $s1, a soma $s1 + $s0
		
		# Incremento do contador do loop	
		addi $s0,$s0,1		## Adicionar +1 ao $s0
		
		j FOR			# Ir para o label "FOR" ( Inicio do loop )
	DONE:

li $v0, 10 # comando de exit
syscall # efetua a chamada ao sistema
