.data
V: .word 10, 30, 8, 20, 5, 15, 25, 35, 40, 1

.code
daddi $t0, $zero, V
daddi $t2, $zero, 10
daddi $t3, $zero, 2
loop: ld $t1, 0($t0)
dmul $t1, $t1, $t3
sd $t1, 0($t0)
daddi $t2, $t2, -1
beqz $t2, end
daddi $t0, $t0, 8
j loop
end: halt