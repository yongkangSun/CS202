.include "macro_print_str.asm"
.text
main:
	print_string("please input an integer : ")
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	slti	$t1, $t0, 0
	print_string("The abs is : ")
	bnez	$t1, Neg
	move	$a0, $t0
	j	Exit
Neg:
	neg	$a0, $t0
Exit:
	li	$v0, 1
	syscall

end