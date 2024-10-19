.data
cadena: .asciiz "ArquiTectuRa de ComPutaDoras"
longitud: .space 8

.code
daddi $t0, $zero, cadena
dadd $t2, $zero, $zero # t2 = longitud
loop: lbu $t1, 0($t0) # t1 = caracter actual
beqz $t1, fin 
daddi $t2, $t2, 1
daddi $t0, $t0, 1
j loop
fin: sd $t2, longitud($zero)
halt