# comparar: Recibe como parametros las direcciones del comienzo de dos cadenas terminadas en cero y retorna la posicion en la que las dos cadenas difieren. En caso de que las dos cadenas sean identicas, debe retornar -1

.data
CADENA1: .asciiz "Aguante bocaa"
CADENA2: .asciiz "Aguante el pinchaa"
RESULTADO: .space 8 # Deberia guardar el valor 9 correspondiente a la posicion 9 de las cadenas donde difieren

.code
daddi $a0, $0, CADENA1
daddi $a1, $0, CADENA2
jal comparar
sd $v0, RESULTADO($0)
halt

comparar: daddi $v0, $0, 1 # v0 = posicion a comparar 
loop: lbu $t0, 0($a0)
lbu $t1, 0($a1)
slti $t2, $t0, 1
slti $t3, $t1, 1
bnez $t2, terminar # si t2 es cero, entonces en t0 habia un caracter. Si t2 es 1, entonces habia un 0 (fin de cadena), salgo del loop y comparo con el otro caracter
bnez $t3, fin # si t3 es 1, entonces las cadenas difieren, termino.
# en este punto las cadenas siguen identicas
# pasar a la siguiente iteracion
daddi $v0, $v0, 1
daddi $a0, $a0, 1
daddi $a1, $a1, 1
j loop
terminar: beqz $t3, fin # si t3 es 1, entonces terminaron ambas cadenas y son identicas. Si t3 es 0, entonces no son identicas
# en este punto las cadenas son identicas
daddi $v0, $0, -1
fin: jr $ra