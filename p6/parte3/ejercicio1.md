Ejecutar el sigueinte programa con Forwarding habilitado:

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

Podemos ver que al ejecutarlo tiene 2 atascos BTS, dando un CPI de 1,462 (19c/13i)

1. Cambiando el valor de B a 1000, el programa tiene 999 atascos BTS con un CPI de 1,334 (4007c/3004i)
2. Al ejecutar un loop simple con N iteraciones, se producen N-1 atascos BTS
3. Los atascos BTS se producen debido a que:

- Una instruccion de salto sabe si tiene que saltar o no recien en la segunda etapa (etapa ID), por lo tanto cuando se llega a esa etapa y todavia no se sabe si tiene que saltar o no, la instruccion debajo de la instruccion del salto ya paso a la etapa IF. Esta instruccion cargada puede ser la correcta o no dependiendo la condicion del salto, en caso de que no sea la correcta el procesador debe sacar y poner en la etapa if la instruccion correcta. Es por esto que se pierde un ciclo.

4. No se puede evitar los BTS reordenando las instrucciones. Se puede evitar con otras estrategias como BTB o Delay Slot
5. Cuando una instruccion se descarta, es decir, no se termina de ejecutar, no se debe contar para el calculo del CPI. Solo se cuentan las instrucciones completadas.
