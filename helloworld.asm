# Universidade de Brasília (UnB)
# Departamento de Ciência da Computação (CIC)
# Introdução aos Sistemas Computacionais
# Prof. Dr. Vinicius Ruela Pereira Borges - viniciusrpb@unb.br
#
# Assembly language: MIPS
# O que este código faz: imprime Hello World na tela

# Declaração das variáveis
.data
	out_string: .asciiz "\nHello, World!\n"     # Variável (label) do string

# Indica que as instruções vem a seguir
.text

# Função principal 
main: 
	li $v0, 4                                   # Indica no registrador $v0 o modo de impressão 4 - string
	la $a0, out_string                          # Inclui a mensagem a ser impressa na tela no registrador $a0
	syscall                                     # Chamada de sistema, que coleta dos registradores $v0 e $a0 como o SO conduz a interação com E/S, isto é, será impresso na tela o tipo de dado indicado em $v0$ (4 - string) que está no registrador $a0

	li $v0, 10                                  # Indica no registrador $v0 o modo de encerrar execução do programa
	syscall					    # Chamada de sistema