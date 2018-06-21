# Universidade de Brasília (UnB)
# Departamento de Ciência da Computação (CIC)
# Introdução aos Sistemas Computacionais
# Prof. Dr. Vinicius Ruela Pereira Borges - viniciusrpb@unb.br

# Integrantes do grupo/ matricula:
# Lewi Samuel dos Santos Nery Nunes Ribeiro - 16/0132070
# Marcos... - xx/xxxxxx

# Assembly language: MIPS
# O que este código faz:  Programa para ordenar um vetor de números
# inteiros utilizando o algoritmo de Ordenação por Seleção, dado a seguir em linguagem C++. 

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

#  ordena os n valores do vetor ‘a’ de n posições

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
    
    # Chamar função de ordenar
    jal ordenar  
    
    # Fim de programa
    li $v0, 10   
    syscall 
    
#------------------------------------------------# 
#						 #
#		  FUNÇÕES		 	 #
#						 #
#------------------------------------------------# 

# SWAP: troca os valores entre A e B
swap:	     
	li $v0, 4
	la $a0, msg_swap
	syscall
jr $ra    


   
# MENOR: retorna o indice do menor valor entre x[b] .. x[n-1]
menor:	     
	li $v0, 4
	la $a0, msg_swap
	syscall
jr $ra     



# ORDENAR: ordena os n valores do vetor ‘a’ de n posições
ordenar:	     
	li $v0, 4
	la $a0, msg_swap
	syscall
jr $ra   
