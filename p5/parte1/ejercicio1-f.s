.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
MSJ_INGRESO_EXPONENTE: .asciiz "Ingrese el exponente: "
MSJ_RESULTADO: .asciiz "El resultado es: "

.code 
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)

# ----- Ingreso del exponente -----
daddi $t0, $0, MSJ_INGRESO_EXPONENTE
sd $t0, 0($s1) 
daddi $t0, $0, 4
sd $t0, 0($s0) 

daddi $t0, $0, 8
sd $t0, 0($s0) 

ld $s3, 0($s1) # Cargo en $s3 el numero ingresado (exponente)

# ----- Primera llamada a potencia -----
daddi $a0, $zero, 2
dadd $a1, $zero, $s3
jal potencia
dadd $s2, $0, $v0 # En $s2 guardo el resultado de 2^exp

# ----- Segunda llamada a potencia -----
daddi $a0, $zero, 3
dadd $a1, $zero, $s3
jal potencia

# ----- Imprimir resultado -----
daddi $t0, $0, MSJ_RESULTADO
sd $t0, 0($s1) 
daddi $t0, $0, 4
sd $t0, 0($s0) 

dadd $s2, $s2, $v0 # Sumo los resultados de 2^exp y 3^exp

sd $s2, 0($s1) # Guardo el resultado en DATA

daddi $t0, $0, 1
sd $t0, 0($s0) # Envio la señal a CONTROL para que imprima el resultado

halt

potencia: daddi $v0, $zero, 1
lazo: beqz $a1, terminar
daddi $a1, $a1, -1
dmul $v0, $v0, $a0
j lazo
terminar: jr $ra