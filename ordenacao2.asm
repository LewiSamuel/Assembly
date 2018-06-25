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
tamanho:
	.word	0x0010			# 16

array:
	.word	0xffff7e81
	.word	0x00000001
	.word	0x00000002
	.word	0xffff0001
	.word	0x00000000
	.word	0x00000001
	.word	0xffffffff
	.word	0x00000000
	.word	0xe3456687
	.word	0xa001aa88
	.word	0xf0e159ea
	.word	0x9152137b
	.word	0xaab385a1
	.word	0x31093c54
	.word	0x42102f37
	.word	0x00ee655b
array1:
	.word	64,42,1,13,61,31,88,9,19,73,4,5,0,11,24,10
	
resultado: .asciiz "Selection Sort:\n"
	
newline: .asciiz "\n"	
	
.text
				
main:
	lw	$s3, tamanho		# Guarda tamanho
	la	$s5, 0			# Iterador do loop de print
	
	la	$s0, array1 		# Array
	la	$s1, array1		# posicao do array
	la	$t7, array1		# posicao do menor valor

	li	$s4, 0			# quantidade de iteracoes y
	li	$s2, 0			# swap
	li	$s6, 0			# quantidade de iteracoes x
		
forx:	
	# 16 loops.				
	bge	$s6, $s3, print	
	nop
	
	# add x ao endereco s2
	lw	$s2, 0($s1)			
			
	fory:
		# novo y
		addi	$s0, $s0, 4	
		addi	$s4, $s4, 1
		
		bge 	$s4, $s3, menor		
		nop 
		
		# Add y ao endereco a1
		lw 	$s7, 0($s0)		
		nop 
	
		ble 	$s7, $s2, swap
		nop			
		
		j fory	
		nop				

moveX:
	addi	$s1, $s1, 4		# nova posicao de inicio pro loop do sort
	nop
	addi	$s6, $s6, 1		# atualiza o numero de loops x
	add	$s0, $0, $s1		# nova posicao de inicio para o loop
	
	add	$s4, $s6, $0		# y para x
	
	j forx
	nop
	
menor:		
   
	lw	$t0, 0($s1)	
	beq  $s2, $t0, moveX
	nop
	sw	$s2, 0($s1)		# Add o novo menor para o array
	sw	$t0, 0($t7)		# Add o valor substituido para o loop
	
	
	j moveX
	nop	

swap:
	add	$s2, $0, $s7		
	add	$t7, $0, $s0
	bge	$s4, $s3, menor
	nop	
	j	fory
	nop

print:

	la	$s1, array1		
	la	$a0, resultado
	li	$v0, 4
	syscall
	
	for:
		bge 	$s5, $s3, exit
		nop
	
		lw	$a0, 0($s1)	
		li	$v0, 1
		syscall
		
		la 	$a0, newline
		li 	$v0, 4
		syscall
		
		# incrementa o iterador
		addi 	$s5, $s5, 1		 
		addi 	$s1, $s1, 4
		j for
		nop

exit:
	ori	$v0, $zero, 10
	syscall	