# contiene: Recibe en $a0 la dirección de un string y en $a1 un carácter (código ascii) y devuelve en $v0 1 si el string contiene el carácter $a1 y 0 de lo contrario.

.data
CADENA: .asciiz "Hola locooo, aguante bocaa"
CHAR: .ascii "a"
FLAG: .space 1 # deberia guardar el valor 1

.code
daddi $a0, $0, CADENA
ld $a1, CHAR($0)

jal contiene

sd $v0, FLAG($0)

halt

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