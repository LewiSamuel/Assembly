# Universidade de Bras�lia (UnB)
# Departamento de Ci�ncia da Computa��o (CIC)
# Introdu��o aos Sistemas Computacionais
#
# Assembly language: MIPS
# O que este c�digo faz: Estrutura Condicional b�sico (IF ELSE)
#
#		if (i==j)
#			f=g+h;
#		else
#			f=f-i;
#

.text

# Fun��o principal 
main: 

	bne $s3,$s4,ELSE # Se n�o for igual pular para o label "ELSE"
		add $s0,$s1,$s2 # Codigo a ser executado caso a condi��o seja verdadeira
		j DONE # JUMP, pular para o label "DONE:", ignorando o ELSE
	ELSE: # Label ELSE
		sub $s0,$s0,$s3 #C�digo a ser executado caso a condi��o seja falsa
	DONE: #FIM do IF


li $v0, 10 # comando de exit
syscall # efetua a chamada ao sistema
