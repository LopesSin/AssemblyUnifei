.data

space: .asciiz " "

.text
.globl main

main:
	li $v0, 5	
	syscall
	
	add $s0, $zero, $v0
	
teste:
	bne $s0, 0, loop
	j endloop

loop:
	li $v0, 1
	la $a0,($s0)
	syscall
	la $a0, space
	li $v0, 4
	syscall
	subi $s0, $s0, 1
	j teste

endloop:
