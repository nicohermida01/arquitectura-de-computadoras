.data
N: .word 4
M: .word 2
RESULTADO: .space 8

.code
daddi $sp, $0, 0x400
ld $a0, N($0)
ld $a1, M($0)
jal comb
sd $v1, RESULTADO($0) 
halt

comb: daddi $sp, $sp, -8
sd $ra, 0($sp)
daddi $sp, $sp, -8
sd $s0, 0($sp)
daddi $sp, $sp, -8
sd $s1, 0($sp)
daddi $sp, $sp, -8
sd $s2, 0($sp)

dadd $s0, $0, $a0 # s0 = n
dadd $s1, $0, $a1 # s1 = m
dsub $s2, $s0, $s1 # s2 = n-m
dadd $a0, $0, $s2
jal factorial
dadd $s2, $0, $v0 # s2 = (n-m)!
dadd $a0, $0, $s0
jal factorial
dmul $s2, $v0, $s2 # s2 = n!*(n-m)!
dadd $a0, $0, $s2
jal factorial
dadd $s2, $0, $v0 # s2 = (n!*(n-m)!)!
dadd $a0, $0, $s1
jal factorial
ddiv $v1, $v0, $s2 # v1 = resultado final

ld $s2, 0($sp)
daddi $sp, $sp, 8
ld $s1, 0($sp)
daddi $sp, $sp, 8
ld $s0, 0($sp)
daddi $sp, $sp, 8
ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra

factorial: beqz $a0, cero
dadd $v0, $0, $a0
loop: daddi $a0, $a0, -1
beqz $a0, terminar
dmul $v0, $v0, $a0
j loop
cero: daddi $v0, $0, 1
terminar: jr $ra
