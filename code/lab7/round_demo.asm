.include "macro_print_str.asm"
.data
f1: .float 12.625
.text
lwc1 $f0,f1
floor.w.s $f1,$f0
cvt.s.w $f1,$f1
ceil.w.s $f2,$f0
cvt.s.w $f2,$f2
round.w.s $f3,$f0
cvt.s.w $f3,$f3
print_string("orignal float: ")
mov.s $f12,$f0
li $v0,2
syscall
print_string("\nafter floor:")
mov.s $f12,$f1
li $v0,2
syscall
print_string("\nafter ceil:")
mov.s $f12,$f2
li $v0,2
syscall
print_string("\nafter round:")
mov.s $f12,$f3
li $v0,2
syscall
end