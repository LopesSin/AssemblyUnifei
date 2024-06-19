.data

.text
.globl main

main:
	li $v0, 5	# scanf("%d", &n);
	syscall		# 

	add $s0, $zero, $v0 # $s0 = int n; 
	addi $s1, $zero, 1  # int faorial = 1
	
loop: #for
	
	beq $s0, 0, endloop	# (n = 0) encerra o loop; atuliazei para zero para o fatorial de zero ser 1
	mul $s1, $s1, $s0	# fatorial = fatorial * n; 
	subi $s0, $s0, 1	# n--;
	j loop				# (n > 1) continua o loop;
	
endloop:
	li $v0, 1 
	la $a0,($s1) #printf("%d", fatorial);
	syscall
