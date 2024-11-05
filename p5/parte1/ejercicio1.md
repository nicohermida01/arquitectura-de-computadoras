a) ¿Qué hace el programa? ¿Cómo está estructurado el código del mismo?

El programa calcula la potencia de una BASE elevada a un EXPONENTE, ambos datos almacenados en memoria. El programa llama a una subrutina "potencia" a la que le pasa estos datos a traves de los registros $a0 y $a1, y la subrutina devuelve el resultado en el registro $v0

b) ¿Qué acciones produce la instrucción jal? ¿Y la instrucción jr?

La instruccion jal guarda la direccion de la siguiente instruccion en el registro $ra y salta a la direccion referenciada. La instruccion jr salta a la direccion almacenada en el registro $ra.

c) ¿Qué valor se almacena en el registro $ra? ¿Qué función cumplen los registros $a0 y $a1? ¿Y el
registro $v0? ¿Qué valores posibles puede recibir en $a0 y $a1 la subrutina potencia?

En el registro $ra se almacena la direccion de la instruccion "sd $v0, result($zero)". Los registros $a0 y $a1 sirven para pasarle los parametros a la subrutina "potencia". El registro $v0 sirve como valor de retorno de la subrutina "potencia". La subrutina recibe en $a0 la base y en $a1 el exponente para realizar el calculo.

d) Supongamos que el WinMIPS no posee la instrucción dmul ¿Qué sucede si la subrutina potencia necesita invocar a otra subrutina para realizar la multiplicación en lugar de usar la instrucción dmul? ¿Cómo sabe cada una de las subrutinas a que dirección de memoria debe retornar?

Para que la subrutina "potencia" puede llamar a otra subrutina para realizar la multiplicacion, primero debe preservar el registro $ra para no perder la direccion de retorno. Al finalizar la operacion, antes de ejecutar la instruccion "jr $ra", se debe hacer el pop correspondiente para volver a tener la direccion de retorno original.

Si antes de invocar a otra subrutina se preserva la direccion de retorno, todas las subrutinas pueden volver a su punto de invocacion sin problemas.
