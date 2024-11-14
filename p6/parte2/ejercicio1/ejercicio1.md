a)
Programa 1:

1. daddi $t1, $0, $5
2. daddi $t2, $0, 7
3. slt $t3, $t1, $t2
4. daddi $t1, $0, 1
5. and $t4, $t3, $t1
6. daddi $t1, $0, 8
7. sd $t4, A($t1)

Dependencias de datos de lectura:

- La instruccion 3 depende de la instruccion 1 y 2
- La instruccion 5 depende de la instruccion 3 y 4
- La instruccion 7 depende de la instruccion 5 y 6

Programa 2:

1. ld $t1, A($0)
2. ld $t2, B($0)
3. bne $t1, $t2, no
4. daddi $t3,$0,1
5. j fin
6. no: daddi $t3,$0, 0
7. fin: sd $t3, C($0)

Dependencias de datos de lectura:

- La instruccion 3 depende de la instr. 1 y 2
- La instruccion 7 depende de la instr. 4 y 6

Programa 3:

1. daddi $t1,$0,4
2. daddi $t2,$0,3
3. daddi $t3,$0,0
4. loop: dadd $t3,$t3,$t2
5. daddi $t1,$t1,-1
6. bnez $t1, loop
7. sd $t3, res($0)

Dependencias de datos de lectura:

- La instruccion 4 depende de si misma y de la instr. 2 y 3
- La instruccion 5 depende de si misma y de la instr. 1
- La instruccion 6 depende de la instr. 5
- La instruccion 7 depende de la instr. 4

Programa 4:

1. daddi $t1,$0,0
2. daddi $t2,$0,0
3. loop: ld $t3,A($t1)
4. dadd $t2,$t2,$t3
5. daddi $t1,$t1,8
6. bnez $t3, loop
7. sd $t2, RES($0)

Dependencias de datos de lectura:

- La instruccion 3 depende de la instr. 1
- La instruccion 4 depende de si misma y de la instr. 2 y 3
- La instruccion 5 depende de si misma y de la instr. 1
- La instruccion 6 depende de la instr. 3
- La instruccion 7 depende de la instr. 4

b) Ver las imagenes de cada programa

c) Programa 1: no se puede reordenar
Programa 2: no se puede reordenar
Programa 3: se puede reordenar de la siguiente forma:

```
.data
res: .word -1

.code
daddi $t1, $0, 4
daddi $t2, $0, 3
daddi $t3, $0, 0
loop: daddi $t1, $t1, -1 # instruccion cambiada
dadd $t3, $t3, $t2 # instruccion cambiada
bnez $t1, loop
sd $t3, res($0)
halt
```

De esta forma se redujo la cantidad de atascos RAW de 10 a 4, dando un CPI de 1,647

Programa 4: se puede reordenar de la siguiente forma:

```
.data
A: .word 3, 4, 5, 0
RES: .word -1

.code
daddi $t1, $0, 0
daddi $t2, $0, 0
loop: ld $t3, A($t1)
daddi $t1, $t1, 8
dadd $t2, $t2, $t3
bnez $t3, loop
sd $t2, RES($0)
halt
```

De esta forma se redujo la cantidad de atascos RAW de 9 a 6, dando un CPI de 1,650
