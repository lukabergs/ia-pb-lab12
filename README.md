# LABORATORIO 12
## Apuntadores y Listas dinámicas - Avanzado
### TAREA 1. Ejercicios para pensar
1. **Clonar y concatenar.** Implementa la _función_ **Clonar_y_Concatenar** que, dadas dos listas dinámicas L1 y L2, cree una nueva lista L, diferente de las anteriores que tenga una copia de todos los elementos de L1 y, a continuación, una copia de todos los elementos de L2.
2. **Borrar todas las apariciones.** Implementa el _procedimiento_ **Borrar** que, dada una lista dinámica y un entero N, modifique la lista eliminando de la lista _**todas las apariciones**_ del entero N en la lista.
3. **Intersección.** Implementa el _procedimiento_ **Interseccion** que, dadas dos listas dinámicas L1 y L2, ordenadas ascendentemente, reorganice los elementos en otras dos listas, comunes y no_comunes, también ordenadas ascendentemente, de manera que la primera contenga los elementos que están en ambas listas (dos veces) y la segunda los que solo están en una de ellas. L1 y L2 después de la llamada al procedimiento quedan deshechas. En la implementación de este subprograma, no puede haber instrucciones new.
4. **Listas dinámicas iguales.** Implementa la _función_ **Son_iguales** que, dadas dos listas dinámicas de enteros, ordenadas o no, indique si ambas listas contienen el mismo número de elementos y en el mismo orden.
5. **Simplificar lista dinámica.** Implementa el _procedimiento_ **Simplificar** que, dada una lista dinámica de puntos, la modifique eliminando los puntos que estén a una distancia menor a 0.001 en ambas coordenadas. Los puntos que queden en la lista deben mantener el orden de la lista original y los puntos inicial y final siempre se habrán de mantener. Se penalizará el uso de listas auxiliares en la resolución del problema.
6. **Simplificar lista de puntos.** Implementa el _procedimiento_ **Simplificar** r que, a partir de una lista de puntos no vacía L, la modifique para que solo tenga un cuarto de los puntos, respetando uno sí y tres no del original. Los puntos que se queden deben mantener el orden de la lista original y los puntos inicial y final siempre se habrán de mantener. También se devolverá el número de puntos resultantes en la lista resultado. (Es el mismo ejercicio que el laboratorio 7 avanzado, pero con listas dinámicas).
7. **Crear árbol binario.** Implementa el _procedimiento_ **Crear_arbol_binario** que, dado un vector de enteros, cree un árbol binario de la siguiente manera. Se mira el valor del entero de la raíz. Si el valor a insertar es menor que él, se introduce en el subárbol izquierdo y si no en el derecho (si es igual, se ignora). Si no hay subárbol izquierdo o derecho, se crea un nodo con el elemento a insertar y si no, se decide en qué rama hay que introducir el nuevo elemento de la misma manera que antes (menores a la izquierda y mayores a la derecha). Por ejemplo, si el vector contiene los valores (7 2 17 1 3 11 6 16 4 5 18 8). Del árbol vacío se crearía uno con solo el 7. Luego, el 17 se pondría colgando de la rama derecha (porque 17>7) y el 2 colgando de la rama izquierda (porque 2<7). Con los siguientes números se haría parecido: el 1 va por la rama izquierda del 7 y la izquierda del 2. El 3 seguiría la rama izquierda del 7 y la derecha del 2. Y así sucesivamente.
8. 
![Fig. 1](https://github.com/lukabergs/ia-pb-lab12/assets/52601751/e8f267ef-b31c-4000-92fa-caee913ec2cc) &#8594;

![Fig. 2](https://github.com/lukabergs/ia-pb-lab12/assets/52601751/14f01bfe-0296-4fb0-9e08-235a36a50bb1) &#8594;

![Fig. 3](https://github.com/lukabergs/ia-pb-lab12/assets/52601751/71710687-410a-4872-8958-7b8631f44765) &#8594;

![Fig. 4](https://github.com/lukabergs/ia-pb-lab12/assets/52601751/adcfade8-b23d-4847-b766-59f98ef71ef7) &#8594;

![Fig. 5](https://github.com/lukabergs/ia-pb-lab12/assets/52601751/745b4fc5-ce96-4269-943f-bc65a2672fdb)
