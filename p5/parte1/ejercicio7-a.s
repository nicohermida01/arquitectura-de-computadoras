# longitud: Recibe en $a0 la dirección de un string y retorna su longitud en $v0
.data
CADENA: .asciiz "Hola locooo, aguante bocaa"
LONGITUD: .space 8 # Deberia guardar el valor 26

.code
daddi $a0, $0, CADENA
jal longitud
sd $v0, LONGITUD($0)
halt

longitud: daddi $v0, $0, 0
loop: lbu $t0, 0($a0)
beqz $t0, terminar
daddi $v0, $v0, 1
daddi $a0, $a0, 1
j loop
terminar: jr $ra