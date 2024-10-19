.data
cadena: .asciiz "adbdcdedfdgdhdid" # cadena a analizar
car: .ascii "d" # carácter buscado
cant: .word 0 # cantidad de veces que se repite el carácter car en cadena.

.code
daddi $t0, $zero, cadena
dadd $t1, $zero, $zero
lbu $t2, car($zero)
loop: lbu $t3, 0($t0)
beqz $t3, fin
bne $t3, $t2, saltarCaracter
daddi $t1, $t1, 1
saltarCaracter: daddi $t0, $t0, 1
j loop
fin: sd $t1, cant($zero)
halt