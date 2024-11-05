# Pasando los parámetros por referencia desde el programa principal a través de la pila, 
# y devolviendo el resultado a través de un registro por valor.

.data
BASE: .word 2
EXPONENTE: .word 3
RESULTADO: .word 0

.code
daddi $sp, $0, 0x400
daddi $t0, $0, BASE 
daddi $t1, $0, EXPONENTE

daddi $sp, $sp, -16
sd $t0, 8($sp) # Guardo primero la referencia a la base
sd $t1, 0($sp) # Guardo segundo la referencia al exponente

jal potencia

sd $v0, RESULTADO($0)

ld $t0, 8($sp)
ld $t1, 0($sp)
daddi $sp, $sp, 16 

halt

potencia: daddi $v0, $0, 1
ld $t0, 8($sp) # Cargo la referencia de la base
ld $t1, 0($sp) # Cargo la referencia del exponente
ld $t2, 0($t0) # Cargo la base
ld $t3, 0($t1) # Cargo el exponente
lazo: beqz $t3, terminar
daddi $t3, $t3, -1
dmul $v0, $v0, $t2
j lazo
terminar: jr $ra