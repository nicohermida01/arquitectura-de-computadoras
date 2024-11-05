# Pasando los parámetros por referencia desde el programa principal a través de registros, 
# y devolviendo el resultado a través de un registro por valor.

.data
BASE: .word 2
EXPONENTE: .word 3
RESULTADO: .word 0

.code
daddi $a0, $0, BASE
daddi $a1, $0, EXPONENTE

jal potencia

sd $v0, RESULTADO($0)

halt

potencia: daddi $v0, $0, 1
ld $t0, 0($a0) # Cargo la base utilizando la referencia pasada por parametro
ld $t1, 0($a1) # Cargo el exponente utilizando la referencia pasada por parametro
lazo: beqz $t1, terminar # Si el exponente es 0, terminar
daddi $t1, $t1, -1
dmul $v0, $v0, $t0
j lazo
terminar: jr $ra