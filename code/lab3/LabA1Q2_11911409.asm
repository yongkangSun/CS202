.include "macro_print_str.asm"
.data
	#distribute two integers for immediate value addressing method
	var1:	.word 5
	var2:	.word 3
	#define all the labels of address in memory in which operands and results are stored
	add_ans:	.space 4
	sub_ans:	.space 4
	mul_ans:	.space 4
	div_ans:	.space 8
.text
#immediate value addressing
	#fetch the operands
	li	$t0, 5
	li	$t1, 3
	#calculate
	add	$s0, $t0, $t1	
	#store the result at address 0x********
 	sw	$s0, add_ans
	#print the equation on screen in the form of A + B = C		
	li	$v0, 1
	lw	$a0, var1
	syscall
	
	print_string(" + ")
	
	li	$v0, 1
	lw	$a0, var2
	syscall
	
	print_string(" = ")
	
	li	$v0, 1
	lw	$a0, add_ans
	syscall
	
	print_string("\n")
	
#direct addressing
	#fetch the operands
	la	$t0, var1
	la	$t1, var2
	lw	$t0, ($t0)
	lw	$t1, ($t1)
	#calculate
	sub	$s0, $t0, $t1
	#store the result at address 0x********
 	sw	$s0, sub_ans
 	#print the equation on screen in the form of A - B = C
 	li	$v0, 1
	lw	$a0, var1
	syscall
	
	print_string(" - ")
	
	li	$v0, 1
	lw	$a0, var2
	syscall
	
	print_string(" = ")
	
	li	$v0, 1
	lw	$a0, sub_ans
	syscall
	
	print_string("\n")
	
#indirect addressing
	#fetch the operands
	lw	$t0, var1
	lw	$t1, var2
	#calculate
	mult	$t2, $t3
	mflo	$s2 
	#store the result at address 0x********
 	sw	$s2, mul_ans
 	#print the equation on screen in the form of A * B = C
 		li	$v0, 1
	lw	$a0, var1
	syscall
	
	print_string(" * ")
	
	li	$v0, 1
	lw	$a0, var2
	syscall
	
	print_string(" = ")
	
	li	$v0, 1
	lw	$a0, mul_ans
	syscall
	
	print_string("\n")
 	
 	
#baseline addressing
	#fetch the operands
	la	$t0, var1
	lw	$t1, 4($t0)
	lw	$t0, ($t0)
	#calculate
	div	$t2, $t3
	mflo	$s3
	mfhi	$s4
	#store the result at address 0x********
	la	$t4, div_ans
 	sw	$s3, ($t4)
 	sw	$s4, 4($t4)
 	#print the equation on screen in the form of A / B = C ... D
	li	$v0, 1
	lw	$a0, var1
	syscall
	
	print_string(" / ")
	
	li	$v0, 1
	lw	$a0, var2
	syscall
	
	print_string(" = ")
	
	la	$t0, div_ans
	li	$v0, 1
	lw	$a0, ($t0)
	syscall
	
	print_string(" ... ")
	
	li	$v0, 1
	lw	$a0, 4($t0)
	syscall
	
	print_string("\n")