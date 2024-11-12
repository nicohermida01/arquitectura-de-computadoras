2. Indicar, para las siguientes instrucciones, qué realizan en cada una de las etapas IF/ID/EX/MEM/WB.

Instrucciones:
daddi $t1, $t3, 4 -> IF: busca la instruccion en memoria y la lleva a la CPU.
-> ID: Comprueba si $t3 esta disponible, en caso de estarlo trae su valor. Calcula el valor del operando inmediato.
-> EX: Realiza la suma entre $t3 y 4.
-> MEM: -
-> WB: Accede al banco de registros para guardar el resultado de la operacion en $t1

dadd $t2, $t4, $t3 -> IF: busca la instruccion en memoria y la lleva a la CPU.
-> ID: Comprueba si $t4 y $t3 estan disponibles para traer su contenido.
-> EX: Realiza la suma entre $t4 y $t3.
-> MEM: -
-> WB: Accede al banco de registros para guardar el resultado en $t2.

sd $t3, tabla($t2) -> IF: busca la instruccion en memoria y la lleva a la CPU.
-> ID: Comprueba si $t3 y $t4 estan disponibles para traer su contenido.
-> EX: Calcula la direccion efectiva de memoria (offset tabla + $t2).
-> MEM: Accede a memoria para guardar $t3.
-> WB: -

ld $t3, tabla($t2) -> IF: busca la instruccion en memoria y la lleva a la CPU.
-> ID: Comprueba si $t2 esta disponible para traer su contenido.
-> EX: Calcula la direccion efectiva de memoria (offset tabla + $t2).
-> MEM: Accede a memoria para leer el dato y llevarlo a un registro intermedio.
-> WB: Accede al banco de registros para guardar en $t3 el valor leido.

bneq $t1, $t2, loop -> IF: busca la instruccion en memoria y la lleva a la CPU.
-> ID: Comprueba si $t1 y $t2 estan diponibles para traer su contenido. Se verifica la condicion para comprobar si se salta o no. Calcula la direccion del salto.
-> EX: Almacena la direccion del salto en el registro PC.
-> MEM: -
-> WB: -

j loop -> IF: busca la instruccion en memoria y la lleva a la CPU.
-> ID: Calcula la direccion de salto.
-> EX: Almacena la direccion de salto en el registro PC.
-> MEM: -
-> WB: -
