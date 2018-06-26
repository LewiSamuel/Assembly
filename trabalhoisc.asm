# Universidade de Brasilia (UnB)
# Departamento de Ciencia da Computacao (CIC)
# Introducao aos Sistemas Computacionais

# Integrantes do grupo/ matricula:
# Lewi Samuel dos Santos Nery Nunes Ribeiro - 16/0132070
# Marcos Vinicius Pereira Marques - 14/0071989

# Assembly language: MIPS
# O que este codigo faz:  Programa para ordenar um vetor de numeros
# inteiros utilizando o algoritmo de Ordenacao por Selecao
.data
	barraEne: .asciiz "\n"
	

.text
	main:
#------------------------------------------------# 
#						 #
#		 CORPO DO CODIGO	 	 #
#						 #
#------------------------------------------------#  
	#Definir Vetor a[] ( $a0 )
	lui $a1, 0x1004
	ori $a0, $a0, 0x0000
	
	#--------------------------------#
	#   Inserindo valores no vetor   #
	#--------------------------------#
	
	# vetor[0] = 10
	addi $t0,$zero,10
	sw $t0,0($a1)
	
	# vetor[1] = 3
	addi $t0,$zero,3
	sw $t0,4($a1)
	
	# vetor[2] = 17
	addi $t0,$zero,17
	sw $t0,8($a1)
	
	# vetor[3] = 5
	addi $t0,$zero,5
	sw $t0,12($a1)
	

	# Tamanho do vetor n ( $a1 )
	addi $a2,$zero,4
	

	#---------------------------------#
	#   Chamando funcao de ordenar    #
	#---------------------------------#

	#jal ordenar
	
	#---------------------------------#
	#   Imprimindo valores do vetor   #
	#---------------------------------#
 

	# vetor[0]
	lw $t0,0($a1)
	la $a0,($t0) 
	li $v0,1
	syscall 
	
	li $v0, 4                               
	la $a0, barraEne                      
	syscall   

	
	# vetor[1]
	lw $t0,4($a1)
	la $a0,($t0) 
	li $v0,1
	syscall 
	
	li $v0, 4                               
	la $a0, barraEne                      
	syscall   


	# vetor[2]
	lw $t0,8($a1)
	la $a0,($t0) 
	li $v0,1
	syscall 
	
	li $v0, 4                               
	la $a0, barraEne                      
	syscall   

	
	# vetor[3]
	lw $t0,12($a1)
	la $a0,($t0) 
	li $v0,1
	syscall 
	

	
	#-------------------#
	# Encerrar programa #
	#-------------------#
	li $v0, 10
	syscall
	
	
	
	
	
#------------------------------------------------# 
#						 #
#		  FUNCOES		 	 #
#						 #
#------------------------------------------------# 


# SWAP: troca os valores entre A e B
#   void swap( int &a, int &b){
#  	int t;
#  	t = a;
#  	a = b;
#  	b = t;
#   }
swap:	  
	# t = a
	add $t4, $zero, $a2
	# a = b
	add $a2, $zero, $a3
	# b = t
	add $a3, $zero, $t4
jr $ra    











# MENOR: retorna o indice do menor valor entre x[b] .. x[n-1]
#   int menor( int x[], int b, int n ){
# 	int m, k;
#	m = b;
#	for( k=b+1; k<n; k++ )
#		if( x[k] < x[m] )
#  			m = k;
#	return m;
#   }
menor:	     
	# m = b
	add $t5,$zero,$a3
	# b + 1
	addi $t6,$a3,1
	# k = b + 1
	add $t7,$zero,$t6
	
	MENOR_FOR:				
		#  Condição de fim do LOOP ( k < n )
		slt $t3, $t7, $a1
		beq $t3, $zero,MENOR_DONE	

		# Codigo a ser executado dentro do loop: 

		#---------------#
		# t3 = vetor[m] #
		#---------------#
			# t3 = m*4
			sll $t3,$t5,2
			# t3 = array[] + t3
			add $t3,$a0,$t3
			# t3 = vetor[m]
			lw $t3,0($t3)
		
		#---------------#
		# t4 = vetor[k] #
		#---------------#
			# t4 = k*4
			sll $t4,$t7,2
			# t4 = array[] + t3
			add $t4,$a0,$t3
			# t4 = vetor[m]
			lw $t4,0($t4)
		
		slt $t0,$t3,$t4 
		beq $t0,$zero,MENOR_DONE_IN
			# m = k
			add $t5,$zero,$t7
		MENOR_DONE_IN:
		# Incremento do contador do loop ( K )	
		addi $t7,$t7,1		
		j MENOR_FOR			
	MENOR_DONE:
	
	# RETORNO = M
	add $s0,$zero,$t5
jr $ra















# ORDENAR: ordena os n valores do vetor a de n posicoes
#   void ordena( int a[], int n ){
#	int k, indMenor;
#	for( k=0; k < n-1; k++ ){
#		indMenor = menor( a, k, n );
#		swap( a[k], a[indMenor] );
#   	}
#   }
ordenar:
	# k = 0	  CONTADOR
	add $t0,$zero,$zero
	# n - 1	  CONDICAO DE PARADA	
	subi $t2,$a1,1	
	ORDENAR_FOR:				
		#  Condição de fim do LOOP ( k < n-1 )
		slt $t3,$t0,$t2  	
		beq $t3,$zero,ORDENAR_DONE	

		# Codigo a ser executado dentro do loop: 
		jal menor
		jal swap	
				
		# Incremento do contador do loop ( K )	
		addi $t0,$t0,1		
		j ORDENAR_FOR			
	ORDENAR_DONE:
jr $ra   
