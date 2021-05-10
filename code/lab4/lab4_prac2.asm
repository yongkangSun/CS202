.include "macro_print_str.asm"
.data
.text
main:
	li	$v0, 5
	syscall
	addi	$t1 ,$v0, 0
	addi	$a0, $zero, 1
	jal	calcu_1
	addi	$a0, $v0, 0
	li	$v0, 1
	syscall
	end
	
calcu_1:
	addi	$sp, $sp, -8
	sw	$ra, 4($sp)
	sw	$a0, 0($sp)
	
	bge	$t1, $a0, calcu_2
	
	addi	$sp, $sp, 8
	addi	$v0, $zero, 0
	jr	$ra
	
calcu_2:	
	addi	$a0, $a0, 1
	jal	calcu_1
	
	lw	$a0, 0($sp)
	lw	$ra, 4($sp)
	addi	$sp, $sp, 8
	
	add	$v0, $v0, $a0
	jr	$ra
		
		
		
		
		
		
		
		
		
