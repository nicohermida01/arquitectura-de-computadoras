1. La fórmula de CPI presentada anteriormente ¿se cumple para los dos programas?

Se cumple

2. En el segundo programa, se utilizan las instrucciones ddiv y dmul ¿cuántos se requieren para su ejecución?

La instruccion ddiv requiere 24 etapas de EX, y la instruccion dmul requiere de 7 etapas de EX

3. ¿Por qué la instrucción dmul tiene varias etapas llamadas M1, M2, etc, y ddiv no? Modificar el segundo programa, duplicando las instrucciones ddiv y dmul, de manera que cada una aparezca dos veces, y volver a simular. ¿Qué sucede en el caso de la división?

La instruccion dmul tiene varias etapas llamas M1, M2, .., M7 porque esa etapa esta segmentada en 7 fases de multiplicacion, en cambio la etapa DIV no esta segmentada.

4. La instrucción HALT solo detiene la ejecución del programa ¿se cuenta en el cálculo del CPI?

Si, se cuenta.

5. El simulador considera a la instrucción NOP para calcular el CPI. No obstante, dicha instrucción no realiza ninguna tarea. Agregar 20 instrucciones NOP más en el primer programa, y calcular nuevamente el CPI. ¿Qué valor toma? En el caso de que sea menor, ¿eso quiere decir que el programa es más eficiente?

Agregar 20 instrucciones NOP en el primer programa va a agregar 20 ciclos mas al tiempo de ejecucion. Suponiendo que el CPI es menor, se consideraria que es mas eficiente.
