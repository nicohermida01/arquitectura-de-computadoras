.data
cadena: .asciiz "ArquiTectuRa de ComPutaDoras"
cantMayus: .word 0

.code
daddi $t0, $zero, cadena
daddi $t3, $zero, 0

loop: lbu $t1, 0($t0)
beqz $t1, fin

slti $t2, $t1, 0x41 # si es menor que "A", voy a la siguiente iteración
bnez $t2, next

slti $t2, $t1, 0x5B # si es menor que "Z+1", es una mayúscula
beqz $t2, next

# en este punto, $t1 es una mayúscula
daddi $t3, $t3, 1

next: daddi $t0, $t0, 1
j loop

fin: sd $t3, cantMayus($zero)
halt
