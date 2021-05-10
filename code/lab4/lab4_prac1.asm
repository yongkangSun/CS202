.include "macro_print_str.asm"
.data
.text
main:
	addi	$t0, $zero, 0
	addi	$t1 ,$zero, 1
	addi	$t2, $zero, 10
	
loop1:
	addi	$t0, $t0, 1
	bne	$t0, $t2, loop2
	end
	
loop2:
	jal	print
	beq	$t0, $t1, loop2_2
	loop2_1:
		addi	$t1, $t1, 1
		j	loop2
	loop2_2:
		addi	$t1, $zero, 1
		j	loop1

print:	
	addi	$sp, $sp, -4
	sw	$a0, 0($sp)

	add 	$a0, $zero, $t0
	li	$v0, 1
	syscall
	print_string(" * ")
	add	$a0, $zero, $t1
	li	$v0, 1
	syscall
	print_string(" = ")
	mult  	$t0, $t1
	mflo	$a0
	li	$v0, 1
	syscall
	beq 	$t0, $t1, print2
	print1:
		print_string("\t")
		j exit_0
	print2:
		print_string("\n")
		j exit_0
	exit_0:
		lw	$a0, 0($sp)
		addi	$sp, $sp, 4
		jr	$ra
	
	
	
