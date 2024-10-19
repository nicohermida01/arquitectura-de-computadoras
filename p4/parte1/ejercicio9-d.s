.data
cadena: .space 37

.code
daddi $t0, $zero, 8 # 8 caracteres diferentes (a, b, c, d, e, f, g, h)
daddi $t1, $zero, 1 # contador de caracteres
daddi $t3, $zero, cadena

loop: daddi $t5, $zero, 0
daddi $t2, $t1, 0x60 # caracter a guardar

loop2: sb $t2, 0($t3)
daddi $t5, $t5, 1
beq $t5, $t1, next_char
daddi $t3, $t3, 1
j loop2

next_char: daddi $t1, $t1, 1
daddi $t3, $t3, 1
slt $t4, $t0, $t1 # cuando $t1 valga 9, termina el loop
beqz $t4, loop

daddi $t2, $zero, 0
sb $t2, 0($t3)

halt