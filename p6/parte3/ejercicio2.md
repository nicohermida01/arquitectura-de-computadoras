1. Ejecutando el programa sin BTB nos da que tiene 2 atascos BTS y un CPI de 1.462 (19c/13i). Ahora si lo ejecutamos con BTB activado nos da que tiene 2 atascos BTS y 2 atascos BMS y el CPI aumenta a 1.615 (21c/13i)

2. El atasco BMS ocurre cuando esta la opcion de BTB activado. Al tener esta opcion activada, el simulador puede predecir si debe saltar o no. Cuando salta pero no lo tendria que haber hecho, es decir, fallo en predecir que salta, ocurren 2 atascos BMS. En cambio si no salta pero si lo tendria que haber hecho, ocurren 2 atascos BTS.

3. Cambiando el valor de B a 1000 sin BTB activado nos da que el programa tiene 999 atascos BTS con un CPI de 1.334 (4007c/3004i). Ahora activando BTB nos da que tiene 2 atascos BTS y 2 atascos BMS, es decir, en total 4 atascos en vez de 999 como antes. El CPI disminuyo a 1.003 (3012c/3004i), se redujeron casi 1000 ciclos.

4. Al ejecutar un loop con N iteraciones, si se habilita BTB, se producen 2 atascos de tipo BTS y 2 atascos de tipo BMS.

5. BTB es util cuando se realizan muchas iteraciones. En general, si tenemos un bucle con menos de 4 iteraciones, es mejor no usarlo.
