.data
	base:	.float 1
	ten:	.float 10
	dot:	.asciiz "."
.text 
main:
	#读入数据
	li	$v0, 6
	syscall
	mov.s	$f1, $f0
	li	$v0, 5
	syscall
	move	$s1, $v0
	
	lwc1	$f3, base
	lwc1	$f5, ten
	li	$s0, -1

loop_mul:
	beq 	$s0, $s1, main_continue
	mul.s 	$f3, $f3, $f5
	addi	$s0, $s0, 1
	j	loop_mul

main_continue:
	#将舍入位置后一位之后的所有小数清理掉
	mul.s	$f1, $f1, $f3
	floor.w.s	$f1, $f1
	cvt.w.s 	$f3, $f3
	mfc1 	$t1, $f1
	mfc1	$t2, $f3
	
	#将四舍五入处理好
	li	$t3, 10
	div	$t1, $t3
	mflo 	$a1
	mfhi	$t4
	bge 	$t4, 5, add_1
	add_0:
		j	exit_add
	add_1:
		addi	$a1, $a1, 1
		j	exit_add
	exit_add:
	div	$a2, $t2, 10

	#恢复数据并执行打印
	div	$a1, $a2
	mflo	$a0
	mfhi	$t0
	li	$v0, 1
	syscall
	beqz 	$s0, main_end
	la	$a0, dot
	li	$v0, 4
	syscall
	
loop_print:
	div	$a2, $a2, 10
	div	$t0, $a2
	mflo	$a0
	mfhi 	$t0
	li	$v0, 1
	syscall
	beq 	$a2, 1, main_end
	j	loop_print
		
main_end:
	li	$v0, 10
	syscall
	
	
	
	