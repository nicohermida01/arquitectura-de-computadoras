.data
msjIngreso: .asciiz "Ingrese una clave de 4 caracteres"
msjCorrecto: .asciiz "Clave correcta: acceso permitido"
msjIncorrecto: .asciiz "Clave incorrecta"
clave: .ascii "boca"
input: .space 4
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)

daddi $t2, $zero, msjIngreso
sd $t2, 0($t1)
daddi $t3, $zero, 4
sd $t3, 0($t0)

daddi $t5, $zero, input
daddi $t2, $zero, 4
daddi $t3, $zero, 9
loop: sd $t3, 0($t0) # envio la señal a control para leer un caracter
lbu $t4, 0($t1) # cargo el caracter ingresado
sb $t4, 0($t5) # cargo el caracter ingresado en la variable input
daddi $t5, $t5, 1
daddi $t2, $t2, -1
bnez $t2, loop
# ------fin de ingreso de clave------

# ------inicio de verificacion de clave-------
daddi $t2, $zero, 4
daddi $t5, $zero, 0 # offset indice del caracter actual
loopCheck: daddi $t3, $t5, clave
daddi $t4, $t5, input
lbu $t6, 0($t3) 
lbu $t7, 0($t4)
bne $t6, $t7, inputIncorrecto
daddi $t2, $t2, -1
beqz $t2, exitCheck
daddi $t5, $t5, 1 # incremento offset para verificar el siguiente carcter
j loopCheck

exitCheck: daddi $t2, $zero, msjCorrecto
sd $t2, 0($t1) 
daddi $t3, $zero, 4
sd $t3, 0($t0)
j fin

inputIncorrecto: daddi $t2, $zero, msjIncorrecto
sd $t2, 0($t1) 
daddi $t3, $zero, 4
sd $t3, 0($t0)

fin: halt
