.data

.text
.globl main

main:
	li $v0, 5	# scanf("%d", &n);
	syscall		# 

	add $s0, $zero, $v0 # $s0 = int n; 
	slti $t0, $s0, 1	# if(n < 1){$t0 = 1} else {$t0 = 0}
	
	beq $t0, 1, main # do{scanf("%d", &n);} while(n < 1);

	addi $s1, $zero, 0  # int soma = 0
	
loop: #for
	
	beq $s0, 0, endloop	# (n = 0) encerra o loop;
	add $s1, $s1, $s0	# soma = soma + n; 
	subi $s0, $s0, 1	# n--;
	j loop				# (n > 0) continua o loop;
	
endloop:
	li $v0, 1 
	la $a0,($s1) #printf("%d", soma);
	syscall