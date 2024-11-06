# cant_vocales Usando la subrutina escrita en el ejercicio anterior, cant_vocales recibe una cadena terminada en cero y devuelve la cantidad de vocales que tiene esa cadena.

.data
VOCALES: .asciiz "AaEeIiOoUu"
CADENA: .asciiz "Aguante bocaaaa"
CANTIDAD: .space 1 # deberia guardar el valor 9

.code
daddi $sp, $0, 0x400
daddi $a0, $0, CADENA
jal cant_vocales
sd $v0, CANTIDAD($0)
halt

cant_vocales: daddi $sp, $sp, -8
sd $ra, 0($sp)
daddi $sp, $sp, -8
sd $s0, 0($sp)
daddi $sp, $sp, -8
sd $s1, 0($sp)
daddi $sp, $sp, -8
sd $s2, 0($sp)

dadd $s0, $0, $a0 # s0 = referencia de la cadena a procesar
daddi $s2, $0, 0 # s2 = cantidad de vocales
lazo: lbu $s1, 0($s0)
beqz $s1, fin
dadd $a1, $0, $s1 # seteo el parametro de es_vocal 
jal es_vocal
beqz $v0, next # si no es vocal, paso al siguiente caracter
# en este punto el caracter es vocal
daddi $s2, $s2, 1
next: daddi $s0, $s0, 1
j lazo

fin: dadd $v0, $0, $s2

ld $s2, 0($sp)
daddi $sp, $sp, 8
ld $s1, 0($sp)
daddi $sp, $sp, 8
ld $s0, 0($sp)
daddi $sp, $sp, 8
ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra

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