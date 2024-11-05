# Pasando los parámetros por valor desde el programa principal a través de la pila, 
# y devolviendo el resultado a través de un registro por valor.

.data
BASE: .word 2
EXPONENTE: .word 3
RESULTADO: .word 0

.code
daddi $sp, $0, 0x400 # Inicializo el puntero de pila
ld $t0, BASE($0) # Cargo la base
ld $t1, EXPONENTE($0) # Cargo el exponente

daddi $sp, $sp, -16 # Reservo espacio para los parámetros
sd $t0, 8($sp) # Guardo la base en la pila
sd $t1, 0($sp) # Guardo el exponente en la pila

jal potencia

sd $v0, RESULTADO($0)

ld $t0, 8($sp) # Restauro la base
ld $t1, 0($sp) # Restauro el exponente
daddi $sp, $sp, 16 # Vuelvo el sp a su valor original

halt

potencia: daddi $v0, $0, 1
ld $t0, 8($sp) # Cargo la base desde la pila
ld $t1, 0($sp) # Cargo el exponente desde la pila
lazo: beqz $t1, terminar
daddi $t1, $t1, -1
dmul $v0, $v0, $t0
j lazo
terminar: jr $ra
