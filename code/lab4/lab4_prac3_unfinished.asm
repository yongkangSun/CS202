.include "macro_print_str.asm"
.data
	ans:	.word 0
.text
main:
	li	$v0, 5
	syscall
	addi	$s0, $v0, 0
	addi	$s1, $zero, 10
	using_loop:
		addi	$t0, $s0, 0
		div	$t0, $s1
		mflo	$t0
		mfhi	$t1
		sb	$t1, 
	