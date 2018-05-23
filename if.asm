# Universidade de Brasília (UnB)
# Departamento de Ciência da Computação (CIC)
# Introdução aos Sistemas Computacionais
#
# Assembly language: MIPS
# O que este código faz: Estrutura Condicional básico (IF ELSE)
#
#		if (i==j)
#			f=g+h;
#		else
#			f=f-i;
#

.text

# Função principal 
main: 

	bne $s3,$s4,ELSE # Se não for igual pular para o label "ELSE"
		add $s0,$s1,$s2 # Codigo a ser executado caso a condição seja verdadeira
		j DONE # JUMP, pular para o label "DONE:", ignorando o ELSE
	ELSE: # Label ELSE
		sub $s0,$s0,$s3 #Código a ser executado caso a condição seja falsa
	DONE: #FIM do IF


li $v0, 10 # comando de exit
syscall # efetua a chamada ao sistema
