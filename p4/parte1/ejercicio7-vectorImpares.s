.data
V: .word 10, 30, 8, 20, 5, 15, 25, 35, 40, 1
W: .space 80

.code
daddi $t0, $zero, V
daddi $t1, $zero, W
daddi $t2, $zero, 10
loop: ld $t3, 0($t0)
andi $t4, $t3, 1
beqz $t4, saltarElem
sd $t3, 0($t1)
daddi $t1, $t1, 8
saltarElem: daddi $t2, $t2, -1
beqz $t2, end
daddi $t0, $t0, 8
j loop
end: halt

