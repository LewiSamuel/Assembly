# Universidade de Bras�lia (UnB)
# Departamento de Ci�ncia da Computa��o (CIC)
# Introdu��o aos Sistemas Computacionais
#
# Assembly language: MIPS
# O que este c�digo faz: Estrutura Condicional switch - case
#
#	switch(amount)
#	{
#		case 20: fee=5;
#			break;
#		case 50: fee=3;
#			break;
#		case 100: fee=2;
#			break;
#		default: fee=0;
#	}
#

.text

# Fun��o principal 
main: 


	CASE20:					# Label "CASE20"
		addi $t0, $zero, 20		# Adiciona 0 + 20 ao registrador $t0
		bne $s0, $t0, CASE50		# Se o $s0, n�o for igual ao $t0, "jump" para o Label "CASE50"
		addi $s1, $zero, 5		# C�digo a ser executado caso a condi��o seja verdadeira
	j DONE					# Ir para o final do Switch
	
	CASE50: addi $t0, $zero, 50
		bne $s0, $t0, CASE100
		addi $s1, $zero, 3
	j DONE

	CASE100: addi $t0, $zero, 100
		bne $s0, $t0, DEFAULT
		addi $s1, $zero, 2
	j DONE
	
	DEFAULT:				# Label "DEFAULT"
		addi $s1, $zero, 0		# Codigo a ser executado caso nenum dos casos anteriores sejam verdadeiros
	DONE: 					# FIM DO switch - case


li $v0, 10 # comando de exit
syscall # efetua a chamada ao sistema
