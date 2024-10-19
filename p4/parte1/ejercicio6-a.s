.data
V: .word 5, 2, 6
RES: .space 8

.code
dadd $t7, $zero, $zero
ld $t1, V($t7) # t1 = V[0]
daddi $t7, $t7, 8
ld $t2, V($t7) # t2 = V[1]
daddi $t7, $t7, 8
ld $t3, V($t7) # t3 = V[2]
dadd $t4, $t1, $t2
dadd $t4, $t4, $t3
sd $t4, RES($zero)
halt