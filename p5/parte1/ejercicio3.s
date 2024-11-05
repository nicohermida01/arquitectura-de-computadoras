.code
daddi $sp, $0, 0x400
daddi $t0, $0, 5
daddi $t1, $0, 8

daddi $sp, $sp, -16 # libero espacio para guardar dos datos (8bytes + 8bytes)
sd $t0, 8($sp)
sd $t1, 0($sp)

ld $t0, 0($sp)
ld $t1, 8($sp)
daddi $sp, $sp, 16 # vuelvo a poner el sp en su lugar

halt