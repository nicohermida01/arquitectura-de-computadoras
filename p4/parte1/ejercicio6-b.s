.data
V: .word 5, 2, 6
RES: .space 8

.code
daddi $t3, $zero, 3 
daddi $t4, $zero, 0
dadd $t2, $zero, $zero
loop: ld $t1, V($t2)
dadd $t4, $t4, $t1
daddi $t3, $t3, -1
beqz $t3, end
daddi $t2, $t2, 8
j loop
end: sd $t4, RES($zero)
halt