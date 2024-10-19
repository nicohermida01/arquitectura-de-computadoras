.data
V: .word 1, -2, 3, -4, 5, -6, 7, -8, 9, -10
POS: .space 8

.code
daddi $t0, $zero, V
daddi $t2, $zero, 10
daddi $t3, $zero, 0
loop: lb $t1, 0($t0) # lb carga un byte con extension de signo por ende si el numero es negativo el bit 8 se pone en 1
andi $t1, $t1, 0x100 # uso 0x100 porque el bit 8 es el signo 
bnez $t1, saltarElem
daddi $t3, $t3, 1
saltarElem: daddi $t2, $t2, -1
beqz $t2, end
daddi $t0, $t0, 8
j loop
end: sd $t3, POS($zero)
halt