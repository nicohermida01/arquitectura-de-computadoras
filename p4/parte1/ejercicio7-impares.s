.code
dadd $t0, $zero, $zero
daddi $t1, $zero, -1
daddi $t2, $zero, 10
loop: daddi $t1, $t1, 2
sd $t1, 0($t0)
daddi $t2, $t2, -1
beqz $t2, end
daddi $t0, $t0, 8
j loop
end: halt