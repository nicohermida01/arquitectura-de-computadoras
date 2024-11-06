.data
TABLA: .word 1, 2, 3, 4, 5
CANT: .word 5
RESULTADO: .space 8 # Deberia guardar el valor 15

.code
daddi $a0, $0, TABLA
ld $a1, CANT($0)
jal suma
sd $v0, RESULTADO($0)
halt

suma: daddi $v0, $0, 0 
beqz $a1, terminar
daddi $t1, $0, 0 # t1 = cantidad de elementos procesados
loop: ld $t0, 0($a0)
dadd $v0, $v0, $t0
daddi $t1, $t1, 1
beq $t1, $a1, terminar
daddi $a0, $a0, 8
j loop
terminar: jr $ra
