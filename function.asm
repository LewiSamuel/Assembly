.text
main:    
    add $a0,$0,$t0   # $a0 = $0 + $t0
    add $a1,$0,$t1   # $a1 = $0 + $t1
    
    jal addthem      # chamar a fun��o addthem
    
    add $t3,$0,$v0   # mover o retorno da fun��o que esta em $v0 para o $t3
    syscall


#Fun��o
addthem:	     
    addi $sp,$sp,-4     # $sp = $sp - 4
    sw $t0, 0($sp)      # Armazenar em $t0 o valor de $sp

    # corpo da fun��o
    add $t0,$a0,$a1     # $t0 = $a0 + $a1 ( valores passados para a fun��o na linha 3 e 4 )
    add $v0,$0,$t0      # $v0 =  $0 + $t0 ( resultado da fun��o salvo em $v0 )


    lw $t0, 0($sp)      # Carregar valor anterior que foi armazenado em $t0
    addi $sp,$sp,4      # Mover stack pointer $sp = $sp + 4
    
jr $ra              # fim da fun��o, voltar para a linha 6 +
