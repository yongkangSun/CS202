# text segment
.text

main:	
	ldc1 $f12,double
	li $v0,3	
	syscall	
	
	li $v0,10
	syscall
#data segment
.data
	double:	.double 119.114
