.data

.text
.globl main

main:
	# Lê o primeiro número
	li $v0, 5
	syscall
	add $t0, $zero, $v0

	# Lê o segundo número
	li $v0, 5
	syscall
	add $t1, $zero, $v0	

	# Lê o terceiro número
	li $v0, 5
	syscall
	add $t2, $zero, $v0

	# Lê o quarto número
	li $v0, 5
	syscall
	add $t3, $zero, $v0

# compara o primeiro com o segundo número
comparar:
	slt $t4, $t0, $t1  # $t0 < $t1 então $t4 = 1 então $t1 é maior	
	beq $t4, 1, primeiro
	j segundo # pula para o segundo valor

# se o primeiro for maior, salva ele em um registrador
primeiro:
	add $s0, $zero, $t1
	j comparar_novamente # pula para a próxima comparação
	
# se o segundo for maior, salva ele em um registrador
segundo:
	add $s0, $zero, $t0

# compara o terceiro com o quarto número
comparar_novamente:
	slt $t5, $t2, $t3  # $t2 < $t3 então $t5 = 1 então $t3 é maior
	
	beq $t5, 1, terceiro
	j quarto # pula para salvar o quarto valor

# se o terceiro for maior, salva ele em um registrador	
terceiro:
	add $s1, $zero, $t3
	j ultimo_comparacao # pula para a última comparação
	
# se o quarto for maior, salva ele em um registrador
quarto:
	add $s1, $zero, $t2
	
# compara os dois maiores (frutos da duas comparações anteriores
ultimo_comparacao:
	slt $t6, $s0, $s1  # $s0 < $s1 então $t6 = 1 então $s1 é maior
	
	beq $t6, 1, s1
	j s2 # pula para o s2 para não imprimir o s1
	
# se o da primeira comparação for maior, imprime ele
s1:
	li $v0, 1
	la $a0, ($s1)
	syscall
	j final # pula para o final para não imprimir s2

# se o da segunda comparação for maior, imprime ele	
s2:
	li $v0, 1
	la $a0, ($s0)
	syscall	
	
# finaliza o programa	
final:	
