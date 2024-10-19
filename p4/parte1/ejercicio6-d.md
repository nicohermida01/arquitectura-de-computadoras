Si los elementos fueran de 32 bits, es decir:
`V: .word32 5, 2, 6`
el unico cambio que habria que hacer es en la instruccion:
`daddi $t2, $t2, 8`
donde en vez de sumar 8 al desplazamiento, habria que sumarle 4 por los 4 bytes de 32bits
