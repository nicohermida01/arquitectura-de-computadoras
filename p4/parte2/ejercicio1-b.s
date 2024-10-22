.data
texto: .asciiz "Hola, Mundo!"
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)
daddi $t2, $zero, texto
sd $t2, 0($t1) # Cargo offset texto en DATA
daddi $t2, $zero, 4
daddi $t3, $zero, 10

loop: sd $t2, 0($t0) # Cargo 4 en CONTROL
daddi $t3, $t3, -1
bnez $t3, loop

halt

