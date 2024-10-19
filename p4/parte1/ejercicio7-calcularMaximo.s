.data
V: .word 10, 30, 8, 20, 5, 15, 25, 35, 40, 1
MAX: .space 8

.code
daddi $t0, $zero, V
daddi $t2, $zero, 10
daddi $t3, $zero, 0
loop: ld $t1, 0($t0)
#dadd $t4, $zero, $zero
slt $t4, $t3, $t1 # si t3 < t1 entonces actualizo t3
beqz $t4, saltarElem
dadd $t3, $zero, $t1
saltarElem: daddi $t2, $t2, -1
beqz $t2, end
daddi $t0, $t0, 8
j loop
end: sd $t3, MAX($zero)
halt