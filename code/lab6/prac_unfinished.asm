.data
.text
main:
	#user input
	li	$v0, 5
	syscall
	addi	$s0, $v0, 0	#size of array
	li	$v0, 5
	syscall
	addi	$s1, $v0, 0	#space of array
	li	$v0, 5
	syscall
	addi	$s2, $v0, 0	#space of array item
	#create a heap
	addi	$a0, $s1, 0
	li	$v0, 9
	syscall
	#prepare for loop
	addi	$t0, $v0, 0	#start of the heap
	addi	$t1, $v0, 0	#pointer
	addi	$t2, $zero, 0
input_num_loop:
	
	li	$v0, 5
	syscall
	sw	$v0, ($t1)
	addu	$t1, $t1, $s2
	addi	$t2, $t2, 1
	
	
	
