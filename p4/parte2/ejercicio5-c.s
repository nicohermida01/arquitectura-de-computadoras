.data
X: .byte 0
Y: .byte 0
color: .byte 0, 255, 0, 0
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
lwu $s0, CONTROL($zero) # s0 = 0x10000 (CONTROL)
lwu $s1, DATA($zero) # s1 = 0x10008 (DATA)
lwu $t0, color($zero) # t0 = color a pintar
sw $t0, 0($s1) # Guardo en DATA el color

lbu $t1, Y($0) # t1 = coordenada y

lbu $t2, X($zero) # t2 = coordenada x
daddi $t4, $zero, 50 
daddi $t5, $zero, 50
loop: sb $t1, 4($s1) # Guardo en DATA+4 la coordenada y

sb $t2, 5($s1) # Guardo en DATA+5 la coordenada x

daddi $t3, $zero, 5
sd $t3, 0($s0) # Imprimo en pantalla grafica el pixel
daddi $t2, $t2, 1
bne $t4, $t2, loop

daddi $t2, $zero, 0

daddi $t0, $t0, -0x200
sw $t0, 0($s1) # actualizo el green de rgba

daddi $t1, $t1, 1
bne $t5, $t1, loop
halt
