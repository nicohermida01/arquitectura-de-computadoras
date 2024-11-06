# es_vocal: Determina si un carácter es vocal o no, ya sea mayúscula o minúscula. 
# La rutina debe recibir el carácter y debe retornar el valor 1 si es una vocal ó 0 en caso contrario. Para implementar es_vocal, 
# utilizar la subrutina contiene, de modo que para preguntar si un carácter es una vocal, se pregunte si un string con todas las vocales posibles contiene a este carácter.

.data
VOCALES: .asciiz "AaEeIiOoUu"
CHAR: .ascii "a"
ES_VOCAL_FLAG: .space 1 # deberia guardar el valor 1

.code 
daddi $sp, $0, 0x400
ld $a1, CHAR($0)
jal es_vocal
sd $v0, ES_VOCAL_FLAG($0)
halt

es_vocal: daddi $sp, $sp, -8
sd $ra, 0($sp)
daddi $a0, $0, VOCALES
jal contiene
ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra

contiene: daddi $v0, $0, 0 # inicializo en false
loop: lbu $t0, 0($a0)
beqz $t0, terminar
bne $t0, $a1, siguiente # si no son iguales, salto a siguiente
# en este punto son iguales los caracteres
daddi $v0, $0, 1
j terminar
siguiente: daddi $a0, $a0, 1
j loop
terminar: jr $ra