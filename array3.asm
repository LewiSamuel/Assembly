.data
	VETOR: .word 1, 2, 3

.text
main:
	#lui $s2, 0x1000
	#ori $s2, $s2, 0x7001
	
	#lui $s3, 0x1000
	#ori $s3, $s3, 0x1000
	
	la $s2, vetor
	
	addi $s2, $s2, 4
	
	
	
	
	
	
	li $t1, 4
	li $t2, 4
	
	
	
	sw $t1, 4($s2)
	sw $t2, 4($s3)
	
	
	
	lw $t3, 4($s3)
	
	la 
	lw $t4, $t3($s2)
		
	lw $t4,0($s2)
	la $a0,($t4)
	li $v0,1 
	syscall 