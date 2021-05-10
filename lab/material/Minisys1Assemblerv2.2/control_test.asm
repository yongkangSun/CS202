.data
.text 0x0000
start:add 	$t0, $t0, $t0
	jr	$t0
	addi	$t0, $t0, 1
	lw	$t0, 0($t0)
	sw	$t0, 0($t0)
	beq	$t0, $t1, start
	bne	$t0, $t1, start
	j	start
	jal	start
	srl	$t0, $t1, 1