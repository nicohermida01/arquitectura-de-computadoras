.data
CONTROL: .word 0x10000
DATA: .word 0x10008
msjResultado: .asciiz "El resultado de la operacion es: "

.code
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)

daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t3, 0($t1) # t3 = num ingresado

loop: daddi $t2, $zero, 9
sd $t2, 0($t0)
ld $t4, 0($t1) # t4 = operacion ingresada

daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t5, 0($t1) # t5 = num2 ingresado

daddi $t6, $zero, 0x2B # '+'
beq $t4, $t6, suma
daddi $t6, $zero, 0x2D # '-'
beq $t4, $t6, resta
daddi $t6, $zero, 0x2A # '*'
beq $t4, $t6, multiplicacion

# si llego aca es division
ddiv $t3, $t3, $t5
j fin

suma: dadd $t3, $t3, $t5
j fin

resta: dsub $t3, $t3, $t5
j fin

multiplicacion: dmul $t3, $t3, $t5

fin: daddi $t2, $zero, msjResultado
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)
sd $t3, 0($t1)
daddi $t2, $zero, 2
sd $t2, 0($t0)

j loop

halt