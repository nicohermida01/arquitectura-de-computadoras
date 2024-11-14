a) La instrucción de shift genera un atasco RAW al principio y la instrucción BNEZ genera 2 atascos RAW en cada iteración. Esto es porque cuando necesitan leer el registro, este no está disponible aún. Los atascos son en la etapa ID, de 1 ciclo y de 2 ciclos de atasco.
Tiene un CPI de 2 (26 ciclos y 13 instrucciones)
Cambian el valor de B a 1000, el CPI sigue siendo de 2, pero la cantidad de ciclos paso a 6008 con 2001 atascos RAW.

b) Con Forwarding habilitado el programa tiene un CPI de 1,692 (22 ciclos y 13 instrucciones), esta ejecucion tarda menos ciclos que sin forwarding.
Cambiando el valor de B a 1000 y activando forwarding, la cantidad de ciclos paso a 5007 en vez de 6008 como fue sin forwarding. CPI=1,667

C) Asi queda el codigo del programa reordenandolo para que no haya atascos RAW con forwarding habilitado:

```
.data
A: .word 1
B: .word 3
C: .word 0

.code
ld $t2, B($0)
ld $t1, A($0)
loop: daddi $t2, $t2, -1
dsll $t1, $t1, 1
bnez $t2, loop
sd $t1, C($0)
halt
```

Cambiando el valor de B a 1000 el CPI disminuye, pasando de 1,462 (19ciclos/13 instrucciones) a 1,334 (4007/3004 instrucciones)
Segun lo visto antes, conviene ordenar el codigo de tal forma que las instrucciones con dependencia de datos esten alejadas para que no se generen los atascos, siempre y cuando no cambie el resultadod el programa.

D) La diferencia sale de que, al ejecutar el programa, se ejecuta un bucle donde repite las instrucciones, por lo tanto se ejecutan mas instrucciones que las estaticas. Para calcular la cantidad de instrucciones de un programa con un lazo hay que analizar el programa para ver la cantidad de veces que se ejecutaria ese lazoy y multiplicar la cantidad de instrucciones dentro del lazo por la cantidad de veces que itera.
