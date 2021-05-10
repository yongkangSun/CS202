.include "macro_print_str.asm"
.data
	arrayx:	.space 10
	str:	.asciiz "\nThe array is: "
.text
main:
	print_string("please input 10 integers:")
	add $t0,$zero,$zero
	addi $t1,$zero,10
	la $t2,arrayx
loop_r:
	li $v0, 5
	syscall
	sb $v0, ($t2)
	addi $t0, $t0, 1
	addi $t2, $t2, 1
	bne $t0, $t1, loop_r
	
	la $a0, str
	li $v0, 4
	syscall
	
	addi $t0, $zero, 0
	la $t2, arrayx
loop_w:
	lb $a0, ($t2)
	li $v0, 1
	syscall
	print_string(" ")
	addi $t2, $t2, 1
	addi $t0, $t0, 1
	bne $t0, $t1, loop_w
	end
	
	