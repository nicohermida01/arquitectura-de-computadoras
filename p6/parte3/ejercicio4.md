!!! ME CONFUNDI Y USE EL PROGRAMA DEL EJERCICIO 3 DE ESTA PARTE EN VEZ DE LA PARTE 2
Asi que este documento tambien tiene las respuestas del ejercicio 5

A) Todo desactivado: BTS=8; BMS=0; CPI=2.114 (93 ciclos / 44 instrucciones)

B) Con BTB: BTS=8; BMS=6; CPI=2.250 (99 ciclos / 44 instrucciones)

C) Con DS y Forwarding: BTS=0; BMS=0; CPI=1.423 (74 ciclos / 52 instrucciones).
La instruccion "sd $t1, C($0)" se ejecuta todas las veces despues de "bnez $t3, loop", en total se ejecuta 6 veces, de las cuales solo era necesaria la ultima.

D) Con DS y nop: BTS=0; BMS=0; CPI=1.415 (75 ciclos / 53 instrucciones).

E) Con DS y reordenamiento: BTS=0; BMS=0; CPI= 1.432 (63 ciclos / 44 instrucciones)

```
.data
A: .word 2, 1, 3, 1 , 4, 1
MAX: .word -1

.code
ld $t1, MAX($0)
daddi $t2, $0, 0
daddi $t3, $0, 6
loop: ld $t4, A($t2)
slt $t5, $t1, $t4
beqz $t5, chico
daddi $t3, $t3, -1
daddi $t1, $t4, 0
chico: bnez $t3, loop
daddi $t2, $t2, 8
sd $t1, MAX($0)
halt
```
