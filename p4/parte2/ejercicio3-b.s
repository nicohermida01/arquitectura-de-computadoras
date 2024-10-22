.data
CONTROL: .word 0x10000
DATA: .word 0x10008
msjIngresoNum: .asciiz "Ingrese un numero"
msjIngresoOperacion: .asciiz "Ingrese la operacion a realizar: +, -, *, /"
msjResultado: .asciiz "El resultado es: "
LF: .byte 0x0A


.code
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)

# ------ingreso de numero 1-------
daddi $t2, $zero, msjIngresoNum
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)
daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t2, 0($t1)
dadd $t3, $zero, $t2 # t3 = num 1

# salto de linea
daddi $t2, $zero, LF
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

# ------ingreso de numero 2-------
daddi $t2, $zero, msjIngresoNum
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)
daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t2, 0($t1)
dadd $t4, $zero, $t2 # t4 = num 2

# salto de linea
daddi $t2, $zero, LF
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

# ------ingreso de operacion-------
daddi $t2, $zero, msjIngresoOperacion
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)
daddi $t2, $zero, 9
sd $t2, 0($t0)
ld $t5, 0($t1) # t5 = operacion (+, -, *, /)

# salto de linea
daddi $t2, $zero, LF
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

daddi $t6, $zero, 0x2B # '+'
beq $t5, $t6, suma
daddi $t6, $zero, 0x2D # '-'
beq $t5, $t6, resta
daddi $t6, $zero, 0x2A # '*'
beq $t5, $t6, multiplicacion

# si llego aca es division
ddiv $t7, $t3, $t4
j fin

suma: dadd $t7, $t3, $t4
j fin

resta: dsub $t7, $t3, $t4
j fin

multiplicacion: dmul $t7, $t3, $t4

fin: daddi $t2, $zero, msjResultado
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)
sd $t7, 0($t1)
daddi $t2, $zero, 2
sd $t2, 0($t0)

halt