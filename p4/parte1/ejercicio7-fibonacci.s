.data
V: .space 80 # Reservar espacio para 10 elementos (10*8=80)

.code
daddi $t0, $zero, V
dadd $t1, $zero, $zero # t1 = primer numero fibonacci
sd $t1, 0($t0)
daddi $t0, $t0, 8
daddi $t1, $t1, 1 # t1 = segundo numero fibonacci
sd $t1, 0($t0)
daddi $t0, $t0, 8 # queda apuntando al tercer elemento
daddi $t2, $zero, 8 # quedan 8 elementos por agregar
loop: ld $t3, -8($t0) 
ld $t4, -16($t0)
dadd $t1, $t3, $t4
sd $t1, 0($t0)
daddi $t2, $t2, -1
beqz $t2, end
daddi $t0, $t0, 8
j loop
end: halt



