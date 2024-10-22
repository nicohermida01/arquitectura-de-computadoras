.data
msjCoorX: .asciiz "Ingrese la coordenada X: "
msjCoorY: .asciiz "Ingrese la coordenada Y: "
coorX: .space 1
coorY: .space 1
color: .byte 255, 0, 255, 0 # color magenta
CONTROL: .word 0x10000
DATA: .word 0x10008

.code 
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)

daddi $t2, $zero, msjCoorX
sd $t2, 0($t1) 
daddi $t2, $zero, 4
sd $t2, 0($t0) # Imprimo el mensaje de coordenada X
daddi $t2, $zero, 8
sd $t2, 0($t0) # Leo de teclado la coordenada X
sd $t2, coorX($zero) # Guardo la coordenada X

daddi $t2, $zero, msjCoorY
sd $t2, 0($t1) 
daddi $t2, $zero, 4
sd $t2, 0($t0) # Imprimo el mensaje de coordenada Y
daddi $t2, $zero, 8
sd $t2, 0($t0) # Leo de teclado la coordenada Y
sd $t2, coorY($zero) # Guardo la coordenada Y

lwu $t2, color($zero) # t2 = color a pintar (4 bytes)
sw $t2, 0($t1) # Guardo en DATA el color a pintar
lbu $t2, coorX($zero) # t2 = coordenada X
sb $t2, 5($t1) # Guardo la coordenada X en DATA+5
lbu $t2, coorY($zero) # t2 = coordenada Y
sb $t2, 4($t1) # Guardo la coordenada Y en DATA+4

daddi $t2, $zero, 5
sd $t2, 0($t0) 
halt
