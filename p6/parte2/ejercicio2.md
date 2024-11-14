a) Hay 2 atascos RAW y CPI = 2,2

b) Con forwarding habilitado no hay atascos RAW porque el dato que la instrucción “sd $t2, A($0)” necesita está disponible en la etapa MEM de la instrucción “ld $t2, B($0)”, así se reduce un atasco y el otro se soluciona porque la instrucción sd necesita el dato recién en la etapa MEM, por lo que al llegar ahí el dato ya esta disponible y no se generan atascos.
El nuevo CPI es de 1,8
