.data
CONTROL: .word 0x10000
DATA: .word 0x10008
msjIngreso: .asciiz "Ingrese un numero"

.code
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)

# ------ingreso de numero 1-------
daddi $t2, $zero, msjIngreso
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)
daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t2, 0($t1)
dadd $t3, $zero, $t2 # t3 = num 1

# ------ingreso de numero 2-------
daddi $t2, $zero, msjIngreso
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)
daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t2, 0($t1)
dadd $t4, $zero, $t2 # t4 = num 2


halt