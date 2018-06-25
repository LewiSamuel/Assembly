# Universidade de Bras�lia (UnB)
# Departamento de Ci�ncia da Computa��o (CIC)
# Introdu��o aos Sistemas Computacionais
# Prof. Dr. Vinicius Ruela Pereira Borges - viniciusrpb@unb.br

# Integrantes do grupo/ matricula:
# Lewi Samuel dos Santos Nery Nunes Ribeiro - 16/0132070
# Marcos Vinicius Pereira Marques - 14/0071989

# Assembly language: MIPS
# O que este c�digo faz:  Programa para ordenar um vetor de n�meros
# inteiros utilizando o algoritmo de Ordena��o por Sele��o, dado a seguir em linguagem C++. 

#   void swap( int &a, int &b){
#  	int t;
#  	t = a;
#  	a = b;
#  	b = t;
#   }

# retorna o indice do menor valor entre x[b] .. x[n-1]

#   int menor( int x[], int b, int n ){
# 	int m, k;
#	m = b;
#	for( k=b+1; k<n; k++ )
#		if( x[k] < x[m] )
#  			m = k;
#	return m;
#   }

#  ordena os n valores do vetor �a� de n posi��es

#   void ordena( int a[], int n ){
#	int k, indMenor;
#	for( k=0; k < n-1; k++ ){
#		indMenor = menor( a, k, n );
#		swap( a[k], a[indMenor] );
#   	}
#   } 

.data
	msg_swap: .asciiz "\n Entrou no swap! \n"
.text
main:
#------------------------------------------------# 
#						 #
#		 CORPO DO CÓDIGO	 	 #
#						 #
#------------------------------------------------#     

    # Chamar funcao de swap
    li $a0, 7  
    li $a1, 6  
    #jal swap  
    
    # Print do resultado
    #la $a2, ($a0)   
    #li $v0, 1
    #syscall 
    
    # Chamar funcao de menor
    jal menor
    
    li $v0, 10    # comando de exit
    syscall 
    
#------------------------------------------------# 
#						 #
#		  FUNÇÕES		 	 #
#						 #
#------------------------------------------------# 

# SWAP: troca os valores entre A e B
swap:	     
	add $t2, $s0, $a0
	add $a0, $s0, $a1
	add $a1, $s0, $t2
jr $ra    

   
# MENOR: retorna o indice do menor valor entre x[b] .. x[n-1]
menor:	     
	slt $t0, $a0, $a1
	beq $t0, $zero,label1
	
	label1:
		la $a2, ($t0)   
    		li $v0, 1
		syscall
		
jr $ra     



# ORDENAR: ordena os n valores do vetor �a� de n posi��es
ordenar:	     
	li $v0, 4
	la $a0, msg_swap
	syscall
jr $ra   
