.data
N: .word 4
RESULTADO: .space 8 # Deberia guardar el valor 24(0x18)

.code
daddi $sp, $0, 0x400
ld $a0, N($0)
jal factorial
sd $v0, RESULTADO($0)
halt

factorial:
daddi $sp, $sp, -8
sd $s0, 0($sp)
daddi $sp, $sp, -8
sd $s1, 0($sp)

dadd $s0, $0, $a0
beqz $s0, base
daddi $sp, $sp, -8
sd $ra, 0($sp)
daddi $a0, $a0, -1
jal factorial
dadd $s1, $0, $v0
ld $ra, 0($sp)
daddi $sp, $sp, 8
dmul $v0, $s0, $s1
j terminar
base: daddi $v0, $0, 1

terminar:
ld $s1, 0($sp)
daddi $sp, $sp, 8
ld $s0, 0($sp)
daddi $sp, $sp, 8
jr $ra

# b) ¿Es posible escribir la subrutia factorial sin utilizar una pila?
# No es posible debido a que si no se salva el registro $ra, el retorno de las subrutinas fallaria
