.data
	sum:	.double	4
	down:	.double	1
	up:	.double 4
	inc:	.double 2
.text
main:
	#原始数据
	ldc1 	$f2, sum
	ldc1 	$f4, down
	ldc1 	$f6, up
	ldc1 	$f8, inc
	
	#读入数据
	li	$v0, 7
	syscall
	mov.d	$f10, $f0
	
	li	$s0, 1
loop:
	add.d	$f4, $f4, $f8
	div.d 	$f14, $f6, $f4
	c.lt.d  $f14, $f10
	beqz 	$s0, add
	bnez 	$s0, sub
add:
	add.d 	$f2, $f2, $f14
	bc1t 	exit
	li	$s0, 1
	j	loop
sub:
	sub.d 	$f2, $f2, $f14
	bc1t 	exit
	li	$s0, 0
	j	loop 
exit:
	li	$v0, 3
	mov.d	$f12, $f2
	syscall
	
	li	$v0,10
	syscall
	
	
	