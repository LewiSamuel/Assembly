.data
.text
main:    
    li $a1,150   # $a1 = 150
    li $a2,155   # $a0 = 105

    jal addthem   # chamar a fun��o addthem

    la $a0, ($s2) # coloca o registrador $s2 para ser impresso
    li $v0,1 	  # comando de impress�o de inteiro na tela
    syscall
	
    li $v0, 10    # comando de exit
    syscall 
    
#Fun��o
addthem:	     
	add $s2,$a1,$a2  # soma o valor dos argumentos $a1 e $a2 e insere no registrador $s2
#Fim da fun��o
jr $ra       
