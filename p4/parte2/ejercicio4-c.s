.data
coorX: .byte 0
coorY: .byte 0
color: .byte 0, 0, 255, 0 # color azul
CONTROL: .word 0x10000
DATA: .word 0x10008

.code 
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)
daddi $t4, $zero, 50

lwu $t2, color($zero) # t2 = color a pintar (4 bytes)
sw $t2, 0($t1) # Guardo en DATA el color a pintar
lbu $t3, coorX($zero) # t2 = coordenada X
sb $t3, 5($t1) # Guardo la coordenada X en DATA+5
lbu $t2, coorY($zero) # t2 = coordenada Y
sb $t2, 4($t1) # Guardo la coordenada Y en DATA+4

loop: daddi $t2, $zero, 5
sd $t2, 0($t0) 
beqz $t4, fin
daddi $t4, $t4, -1
daddi $t3, $t3, 1
sb $t3, 5($t1)
j loop

fin: halt
