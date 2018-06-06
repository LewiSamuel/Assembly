.data
str: .asciiz "Hello world!.\n"
.text
.globl main #necessary for the assembler

main:
jal message # Vai para o label "messagem"
jal message

li $v0,10
syscall #exit

message:
	la $a0,str
	li $v0,4
	syscall #imprimi a mensagem
jr $ra # Volta para o endereço do ultimo jal
