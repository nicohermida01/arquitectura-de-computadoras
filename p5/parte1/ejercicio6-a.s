.data
N: .word 4
RESULTADO: .space 8 # Deberia guardar el valor 24 (0x18)

.code
ld $a0, N($0)
jal factorial
sd $v0, RESULTADO($0)
halt

factorial: beqz $a0, cero
dadd $v0, $0, $a0
loop: daddi $a0, $a0, -1
beqz $a0, terminar
dmul $v0, $v0, $a0
j loop
cero: daddi $v0, $0, 1
terminar: jr $ra
