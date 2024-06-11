.data

equilatero: .asciiz "equilatero"
isosceles: .asciiz "isosceles"
escaleno: .asciiz "escaleno"

.text
.globl main

main:
	li $s0, 0 # atribui zero a esse registrador
	
	# Lê o lado 1
	li $v0, 5
	syscall
	add $t1, $zero, $v0

	# Lê o lado 2 
	li $v0, 5	# função para ler o número
	syscall		# chama a função
	add $t2, $zero, $v0	# guarda o valor em $t1	
	
	# Lê o lado 3
	li $v0, 5
	syscall
	add $t3, $zero, $v0

# supondo que seja um equilatero			
testeUm:
	beq $t1, $t2, testeDois
	j testeTres
	
testeDois:
	bne $t1, $t3, iso
	j equi

testeTres:
	beq $t1, $t3, iso
	j testeQuatro
	
testeQuatro:
	beq $t2, $t3, iso
	j esca
	  	
iso: 	
	li $v0, 4
	la $a0, isosceles
	syscall
	j fim
	
equi:
	li $v0, 4
	la $a0, equilatero
	syscall
	j fim

esca:
	li $v0, 4
	la $a0, escaleno
	syscall
	j fim
	
fim:
