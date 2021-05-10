.data #demo2
fneg1: .double -1
fpos1: .double 1
.text
#直接load到cop1的寄存器
ldc1 $f0,fneg1
ldc1 $f2,fpos1

#先load到主处理器的寄存器，再move到cop1的寄存器
ld	$t0, fneg1
ld	$t2, fpos1
mtc1.d 	$t0, $f4
mtc1.d 	$t2, $f6

#cop1内部寄存器数据挪动
mov.d 	$f8, $f0
mov.d	$f10, $f2

#cop1中脑血栓地用single处理double，意外发现可行 (恰巧，编码方式不同，不要使用）
mov.s	$f15, $f1
mov.s	$f17, $f3

#主处理器与cop1之间用single处理double，意外发现可行 (恰巧，编码方式不同，不要使用）
mov.s	$f15, $f1
mtc1	$t1, $f19

c.eq.d 	7, $f0, $f0
c.eq.s 	6, $f1, $f1

bc1t 	7, yes

add.d	$f14,$f0,$f2
add.s 	$f12,$f1,$f3

yes:
floor.w.d $f4, $f0
ceil.w.d  $f6, $f0
cvt.s.d   $f9, $f0

li $v0,3
syscall
li $v0,10
syscall