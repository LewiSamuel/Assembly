# Universidade de Bras�lia (UnB)
# Departamento de Ci�ncia da Computa��o (CIC)
# Introdu��o aos Sistemas Computacionais
# Prof. Dr. Vinicius Ruela Pereira Borges - viniciusrpb@unb.br
#
# Assembly language: MIPS
# O que este c�digo faz: imprime Hello World na tela

# Declara��o das vari�veis
.data
	out_string: .asciiz "\nHello, World!\n"     # Vari�vel (label) do string

# Indica que as instru��es vem a seguir
.text

# Fun��o principal 
main: 
	li $v0, 4                                   # Indica no registrador $v0 o modo de impress�o 4 - string
	la $a0, out_string                          # Inclui a mensagem a ser impressa na tela no registrador $a0
	syscall                                     # Chamada de sistema, que coleta dos registradores $v0 e $a0 como o SO conduz a intera��o com E/S, isto �, ser� impresso na tela o tipo de dado indicado em $v0$ (4 - string) que est� no registrador $a0

	li $v0, 10                                  # Indica no registrador $v0 o modo de encerrar execu��o do programa
	syscall					    # Chamada de sistema