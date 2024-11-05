.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
MSJ_INGRESO_BASE: .asciiz "Ingrese la base: "
MSJ_INGRESO_EXPONENTE: .asciiz "Ingrese el exponente: "
MSJ_RESULTADO: .asciiz "El resultado es: "

.code
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)

# ----- Ingreso de la base -----
daddi $t0, $0, MSJ_INGRESO_BASE
sd $t0, 0($s1) # Guardo el offset de la cadena MSJ_INGRESO_BASE en DATA
daddi $t0, $0, 4
sd $t0, 0($s0) # Envio la señal a CONTROL para que imprima la cadena

daddi $t0, $0, 8
sd $t0, 0($s0) # Envio la señal a CONTROL para que lea un numero entero

ld $a0, 0($s1) # Cargo en $a0 el numero ingresado (base)

# ----- Ingreso del exponente -----
daddi $t0, $0, MSJ_INGRESO_EXPONENTE
sd $t0, 0($s1) 
daddi $t0, $0, 4
sd $t0, 0($s0) 

daddi $t0, $0, 8
sd $t0, 0($s0) 

ld $a1, 0($s1) # Cargo en $a1 el numero ingresado (exponente)

# ----- Calculo de la potencia -----
jal potencia

# ----- Imprimir resultado -----
daddi $t0, $0, MSJ_RESULTADO
sd $t0, 0($s1) 
daddi $t0, $0, 4
sd $t0, 0($s0) 

sd $v0, 0($s1) # Guardo el resultado en DATA

daddi $t0, $0, 1 
sd $t0, 0($s0) # Envio la señal a CONTROL para que imprima el resultado

halt

potencia: daddi $v0, $zero, 1
lazo: beqz $a1, terminar
daddi $a1, $a1, -1
dmul $v0, $v0, $a0
j lazo
terminar: jr $ra