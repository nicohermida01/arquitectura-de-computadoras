.data
TABLA: .word 1, -1, 2, -2, 3, -4
CANT: .word 6
RESULTADO: .space 8 # Deberia guardar el valor 3

.code
daddi $sp, $0, 0x400
daddi $a0, $0, TABLA
ld $a1, CANT($0)
jal positivos
sd $v0, RESULTADO($0)
halt

positivos: daddi $sp, $sp, -8
sd $ra, 0($sp)
daddi $sp, $sp, -8
sd $s0, 0($sp)
daddi $sp, $sp, -8
sd $s1, 0($sp)
daddi $sp, $sp, -8
sd $s2, 0($sp)
daddi $sp, $sp, -8
sd $s3, 0($sp)

dadd $s0, $0, $a0 # s0 = referencia tabla
dadd $s1, $0, $a1 # s1 = cantidad elementos
daddi $s2, $0, 0 # s2 = resultado final

beqz $s1, terminar
daddi $s3, $0, 0 # indice del loop
loop: ld $a0, 0($s0)
jal es_positivo
beqz $v0, siguiente
daddi $s2, $s2, 1
siguiente: daddi $s3, $s3, 1
beq $s3, $s1, terminar
daddi $s0, $s0, 8
j loop

terminar: dadd $v0, $0, $s2

ld $s3, 0($sp)
daddi $sp, $sp, 8
ld $s2, 0($sp)
daddi $sp, $sp, 8
ld $s1, 0($sp)
daddi $sp, $sp, 8
ld $s0, 0($sp)
daddi $sp, $sp, 8
ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra

es_positivo: slt $v0, $0, $a0 
jr $ra
