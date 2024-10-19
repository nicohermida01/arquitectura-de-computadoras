.data
datos: .byte -2, 2, 2, 2, 2, 2

.code
ld $t1, datos($zero)
lb $t2, datos($zero)
lbu $t3, datos($zero)
halt

# El registo $t2 contiene el valor correcto del primer elemento del array, ya que se ha cargado un byte con signo, es decir, -2.
# Para cargar un codigo ASCII, se debe cargar un byte sin signo, por lo tanto se debe utilizar la instruccion lbu.
