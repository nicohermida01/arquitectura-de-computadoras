.data
cadena: .asciiz "ABCdef1"
cadena2: .ascii "ABCdef11"
cadena3: .asciiz "ABCdef1111111"
num: .word 5
 
# 0000 00 31 66 65 64 43 42 41 cadena: .asciiz "ABCdef1"
# 0008 3131666564434241 cadena2: .ascii "ABCdef11"
# 0010 3131666564434241 cadena3: .asciiz "ABCdef1111111"
# 0018 0000003131313131
# 0020 0000000000000005 num: .word 5

# Podemos ver que los caracteres se almacenan en celdas consecutivas de memoria. Si el tipo de dato es .asciiz, se almacena el caracter nulo(00h) al final. 
# Podemos ver que la variable num arranca en la direccion 0020 y no luego de la cadena3, esto es porque todas las variables arancan en direcciones multiplos de 8 (aunque haya espacio libre antes)

