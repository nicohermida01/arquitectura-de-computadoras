.data
coorX: .byte 24
coorY: .byte 24
color: .byte 255, 0, 255, 0 # color magenta
CONTROL: .word 0x10000
DATA: .word 0x10008

.code 
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)

lwu $t2, color($zero) # t2 = color a pintar (4 bytes)
sw $t2, 0($t1) # Guardo en DATA el color a pintar
lbu $t2, coorX($zero) # t2 = coordenada X
sb $t2, 5($t1) # Guardo la coordenada X en DATA+5
lbu $t2, coorY($zero) # t2 = coordenada Y
sb $t2, 4($t1) # Guardo la coordenada Y en DATA+4

daddi $t2, $zero, 5
sd $t2, 0($t0) 
halt
