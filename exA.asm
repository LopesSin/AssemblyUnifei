.data

inteiro:	.space 4
positivo:  	.asciiz "positivo"
negativo:  	.asciiz "negativo"

.text
.globl main

main:
		li $s0, 0

		li $v0, 5
		syscall

		slti $t0, $v0, 0

		beq $t0, $s0, maior
		j menor

maior:
		li $v0, 4
		la $a0, positivo
		syscall
		j final
menor:
		li $v0, 4
		la $a0, negativo
		syscall
final: