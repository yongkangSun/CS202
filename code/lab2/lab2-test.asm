.data
	name:	.space 32
	mick:	.asciiz "mick\n"
	alice:	.asciiz "alice\n"
	tony:	.asciiz "tony\n"
	chen:	.asciiz "chen\n"
	
.text
main:
	la $t0, name
	
	lw $t1, mick
	sw $t1, ($t0)
	lw $t1, alice
	sw $t1, 8($t0)
	lw $t1, tony
	sw $t1, 16($t0)
	lw $t1, chen
	sw $t1, 24($t0)
	
	li $v0, 4
	lw $a0, name
	syscall 
	
	li $v0, 10
	syscall 
	