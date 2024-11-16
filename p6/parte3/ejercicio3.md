B. Ejecutando el programa sin BTB activado ocurren 8 atascos BTS y un CPI de 1.682 (74c/44i).
Ejecutando el programa con BTB activado ocurren 8 atascos BTS y 6 atascos BMS, y un CPI de 1.818 (80c/44i)

Podemos ver que es mas eficiente el programa sin BTB activado. Esto es porque no siempre es util la opcion de BTB, en este caso no es util porque hay un salto en medio del loop que salta una vez si y otra no. Esto causa que la prediccion del BTB sea ineficiente, generando mas atascos que los necesarios.
