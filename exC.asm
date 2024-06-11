.data

sim: .asciiz "sim"
nao: .asciiz "nao"

.text
.globl main

main:
	li $s0, 0 # atribui zero a esse registrador
	# Lê a idade
	li $v0, 5
	syscall
	add $t0, $zero, $v0

	# Lê o tempo de serviço 
	li $v0, 5	# função para ler o número
	syscall		# chama a função
	add $t1, $zero, $v0	# guarda o valor em $t1	
	
	slti $t2, $t0, 65 # se for 1 $t0 é  menor que 65
	slti $t3, $t1, 35 # se for 1 $t1 é  menor que 35
	slti $t4, $t0, 60 # se for 1 $t0 é  menor que 60
	slti $t5, $t1, 30 # se for 1 $t1 é  menor que 30

testeUm:	
	beq $t2, $s0, positivo
	j testeDois
	
testeDois:
	beq $t3, $s0, positivo
	j testeTres

testeTres:
	beq $t4, $s0, testeQuatro	
	j negativo

testeQuatro:
	beq $t5, $s0, positivo
	j negativo
	 	 	
positivo:
	li $v0, 4
	la $a0, sim
	syscall
	j fim

negativo:
	li $v0, 4
	la $a0, nao
	syscall
	j fim
	
fim: