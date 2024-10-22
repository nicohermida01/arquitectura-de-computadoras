.data
CONTROL: .word 0x10000
DATA: .word 0x10008
superficie: .space 8

.text
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)
daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t3, 0($t1) # t3 = base
sd $t2, 0($t0)
ld $t4, 0($t1) # t4 = altura
dmul $t3, $t3, $t4
daddi $t4, $zero, 2
ddiv $t3, $t3, $t4
sd $t3, superficie($zero)
halt