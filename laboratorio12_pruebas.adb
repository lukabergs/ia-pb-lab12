with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
with Laboratorio12; use Laboratorio12;
PROCEDURE laboratorio12_pruebas IS
   L12345: constant T_Lista_Dinamica := --(1 2 3 4 5)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4,
      new T_Nodo_Enteros'(5,null)))));
   L67890: constant T_Lista_Dinamica := --(6 7 8 9 0)
      new T_Nodo_Enteros'(6,
      new T_Nodo_Enteros'(7,
      new T_Nodo_Enteros'(8,
      new T_Nodo_Enteros'(9,
      new T_Nodo_Enteros'(0,null)))));

   L1, L2, Res, Res2: T_Lista_Dinamica := null;
   L_copia: T_Lista_Dinamica := null;
   L_copia_2: T_Lista_Dinamica := null;
   Lp_Copia: T_Lista_Puntos;
   cuantos: Integer;
   -- Listas de puntos
   -- LP10 -> LP1_res, 3 borrados
   -- LP11 -> LP4_res, 9 borrados
   -- LP12 -> LP5_res, 7 borrados
   LP10 : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.1, 1.1),
      new T_Nodo_Punto'((1.10001, 1.10001),
      new T_Nodo_Punto'((1.10002, 1.10002),
      new T_Nodo_Punto'((4.4, 4.4),
      new T_Nodo_Punto'((5.5, 5.5),
      new T_Nodo_Punto'((5.50001, 5.50001),
      new T_Nodo_Punto'((7.7, 7.7),
      new T_Nodo_Punto'((8.8, 8.8), null))))))));

   LP11 : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99), null)))))))))));

   LP12 : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.1111, 1.1111),
      new T_Nodo_Punto'((1.1110, 1.1110),
      new T_Nodo_Punto'((1.1112, 1.1112),
      new T_Nodo_Punto'((1.1111, 1.1111),
      new T_Nodo_Punto'((1.1110, 1.1110),
      new T_Nodo_Punto'((1.1112, 1.1112),
      new T_Nodo_Punto'((1.1111, 1.1111),
      new T_Nodo_Punto'((1.1110, 1.1110),
      new T_Nodo_Punto'((1.1112, 1.1112), null)))))))));

   LP13 : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.1111, 1.1111), null);

   LPX : T_Lista_Puntos :=
      new T_Nodo_Punto'(( 3.3331, 3.3331),
      new T_Nodo_Punto'(( 3.3332, 3.3330),
      new T_Nodo_Punto'(( 3.3333, 3.3329),
      new T_Nodo_Punto'(( 3.3334, 3.3328),
      new T_Nodo_Punto'(( 3.3335, 3.3327),
      new T_Nodo_Punto'(( 3.3336, 3.3326),
      new T_Nodo_Punto'(( 3.3337, 3.3325),
      new T_Nodo_Punto'(( 3.3338, 3.3324),
      new T_Nodo_Punto'(( 3.3339, 3.3323),
      new T_Nodo_Punto'(( 3.3340, 3.3322),
      new T_Nodo_Punto'(( 3.3341, 3.3321),
      new T_Nodo_Punto'(( 3.3342, 3.3320), null))))))))))));

   LPX_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'(( 3.3331, 3.3331),
      new T_Nodo_Punto'(( 3.3341, 3.3321),
      new T_Nodo_Punto'(( 3.3342, 3.3320), null)));

   LP0, LP0_Res: T_Lista_Puntos := null;
   LP1_Res: T_Lista_Puntos :=
      new T_Nodo_Punto'((1.1, 1.1),
      new T_Nodo_Punto'((4.4, 4.4),
      new T_Nodo_Punto'((5.5, 5.5),
      new T_Nodo_Punto'((7.7, 7.7),
      new T_Nodo_Punto'((8.8, 8.8), null)))));
   LP2_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((3.3000,3.3000),
      new T_Nodo_Punto'((3.2982,3.3018),
      new T_Nodo_Punto'((3.2964,3.3036), null)));
   LP4_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.99,1.99),
      new T_Nodo_Punto'((1.99,1.99), null));
   LP5_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.1111,1.1111),
      new T_Nodo_Punto'((1.1112,1.1112), null));


   -- Programa auxiliar para copiar objetos de tipo T_Lista_Dinamica
   FUNCTION copiar(L: T_Lista_Dinamica) return T_Lista_Dinamica IS
   BEGIN
      if L = null then
         return null;
      else
         return New T_Nodo_Enteros'(L.info, copiar(L.all.sig));
      end if;
   END copiar;

   -- Programa auxiliar para mostrar objetos T_Lista_Dinamica por consola
   procedure recorrer(L: T_Lista_Dinamica) IS
   BEGIN
      if L /= null then
         put(L.info'img);
         recorrer(L.sig);
      end if;
   END recorrer;

   -- Programa auxiliar para mostrar objetos T_Lista_Puntos por consola
   procedure recorrer(L: T_Lista_Puntos) IS
   BEGIN
      if L /= null then
         put_line(L.info.x'img & L.info.y'img);
         recorrer(L.sig);
      end if;
      new_line;
   END recorrer;

   -- Programa auxiliar para copiar objetos de tipo T_Lista_Puntos
   FUNCTION copiar_lista_puntos(LP: T_Lista_Puntos) return T_Lista_Puntos IS
   BEGIN
     if LP = null then
        return null;
     else
        return New T_Nodo_Punto'(LP.info, copiar_lista_puntos(LP.all.sig));
     end if;
   END copiar_lista_puntos;

   -- Programa axiliar que comprueba si el programa simplificar devuelve el resultado correcto
   FUNCTION eval_simplificar(LP, LP_correcta: in T_Lista_Puntos; cuantos, cuantos_correcto: in Integer) return Boolean IS
   BEGIN
      if LP = null and LP_correcta = null and cuantos = cuantos_correcto then
         return True;
      else
         if (LP /= null and LP_correcta /= null) and then LP.info = LP_correcta.info then
            return eval_simplificar(LP.all.sig, LP_correcta.all.sig, cuantos, cuantos_correcto);
         else
            return False;
         end if;
      end if;
   END eval_simplificar;
BEGIN
--   -------------------------
--   -- Clonar y concatenar --
--   -------------------------
--   Put_Line("*** Clonar y concatenar ***");
--   new_line;

--   Put_Line("Caso 1: Concatenar dos listas");
--   Put_Line("Concatenar (1 2 3 4 5) y (6 7 8 9 0)? (1 2 3 4 5 6 7 8 9 0)");
--   L1 := Copiar(L12345);
--   L2 := Copiar(L67890);
--   Clonar_Y_Concatenar(L1, L2, Res);
--   Recorrer(Res);

--   new_line(2);

--   Put_Line("Caso 2: Lista de un elemento y lista completa.");
--   Put_Line("Concatenar (1) y (6 7 8 9 0)? (1 6 7 8 9 0)");
--   L1 := new T_Nodo_Enteros'(1,null);
--   L2 := Copiar(L67890);
--   Clonar_Y_Concatenar(L1, L2, Res);
--   Recorrer(Res);

--   new_line(2);

--   Put_Line("Caso 3: Lista completa y un elemento.");
--   Put_Line("Concatenar (6 7 8 9 0) y (1)? (6 7 8 9 0 1)");
--   L1 := new T_Nodo_Enteros'(1,null);
--   L2 := Copiar(L67890);
--   Clonar_Y_Concatenar(L2, L1, Res);
--   Recorrer(Res);

--   new_line(2);

--   Put_Line("Caso 4: Dos listas de un elemento.");
--   Put_Line("Concatenar (6) y (1)? (6 1)");
--   L1 := new T_Nodo_Enteros'(6,null);
--   L2 := new T_Nodo_Enteros'(1,null);
--   Clonar_Y_Concatenar(L1, L2, Res);
--   Recorrer(Res);

--   new_line(2);

--   Put_Line("Caso 5: lista vacia y otra lista.");
--   Put_Line("Concatenar () y (6 7 8 9 0)? (6 7 8 9 0)");
--   L1 := null;
--   L2 := Copiar(L67890);
--   Clonar_Y_Concatenar(L1, L2, Res);
--   Recorrer(Res);

--   new_line(2);

--   Put_Line("Caso 6: lista y lista vacia.");
--   Put_Line("Concatenar (1 2 3 4 5) y ()? (1 2 3 4 5)");
--   L1 := null;
--   L2 := Copiar(L12345);
--   Clonar_Y_Concatenar(L1, L2, Res);
--   Recorrer(Res);

--   new_line(2);
--   Put_Line("Caso 7: lista vacia y lista vacia.");
--   Put_Line("Concatenar () y ()? ()");
--   L1 := null;
--   L2 := null;
--   Clonar_Y_Concatenar(L1, L2, Res);
--   Recorrer(Res);


--   ------------
--   -- Borrar --
--   ------------
--   new_line(3);
--   Put_Line("*** Borrar ***");
--   new_line;

--   Put_Line("Caso 1: un numero por el medio.");
--   Put_Line("Borrar 2 de (1 2 3 4 5): (1 3 4 5)");
--   L1:= --(1 2 3 4 5)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(4,
--      new T_Nodo_Enteros'(5,null)))));
--   Borrar(L1,2);
--   recorrer(L1);

--   new_line(2);

--   Put_Line("Caso 2: numeros 2 al principio.");
--   Put_Line("Borrar 2 de (2 2 3 4 5): (3 4 5)");
--   L1:= --(2 2 3 4 5)
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(4,
--      new T_Nodo_Enteros'(5,null)))));
--   Borrar(L1,2);
--   recorrer(L1);

--   new_line(2);

--   Put_Line("Caso 3: numeros 2 al final.");
--   Put_Line("Borrar 2 de (1 3 4 2 2): (1 3 4)");
--   L1:= --(1 3 4 2 2)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(4,
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(2,null)))));
--   Borrar(L1,2);
--   recorrer(L1);

--   new_line(2);

--   Put_Line("Caso 4: numero no existe en la lista.");
--   Put_Line("Borrar 6 de (1 2 3 4 5): (1 2 3 4 5)");
--   L1:= --(1 2 3 4 5)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(4,
--      new T_Nodo_Enteros'(5,null)))));
--   Borrar(L1,6);
--   recorrer(L1);

--   new_line(2);

--   Put_Line("Caso 5: lista vacia.");
--   Put_Line("Borrar 2 de (): ()");
--   L1:= null; --()
--   Borrar(L1,2);
--   recorrer(L1);

--   new_line(2);

--   Put_Line("Caso 6: lista con un unico nodo.");
--   Put_Line("Borrar 2 de (2): ()");
--   L1:= --(2)
--      new T_Nodo_Enteros'(2,null);
--   Borrar(L1,2);
--   recorrer(L1);

--   new_line(2);

--   Put_Line("Caso 6: lista con dos nodos.");
--   Put_Line("Borrar 2 de (2 2): ()");
--   L1:= --(2 2)
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(2,null));
--   Borrar(L1,2);
--   recorrer(L1);


--   ------------------
--   -- Interseccion --
--   ------------------
--   new_line(3);
--   Put_Line("*** Interseccion ***");
--   new_line;

--   Put_Line("Caso 1: Varios comunes y varios no comunes");
--   Put_Line("Interseccion(1 3 5 7 9 11 15 17)y(1 2 3 4 5 6 7 8):(1 1 3 3 5 5 7 7)y(2 4 6 8 9 11 15 17)");
--   L1:= --(1 3 5 7 9 11 15 17)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(5,
--      new T_Nodo_Enteros'(7,
--      new T_Nodo_Enteros'(9,
--      new T_Nodo_Enteros'(11,
--      new T_Nodo_Enteros'(15,
--      new T_Nodo_Enteros'(17,null))))))));
--   L2:= --(1 2 3 4 5 6 7 8)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(4,
--      new T_Nodo_Enteros'(5,
--      new T_Nodo_Enteros'(6,
--      new T_Nodo_Enteros'(7,
--      new T_Nodo_Enteros'(8,null))))))));
--   Interseccion(L1,L2,Res,Res2);
--   Put("Comunes:");Recorrer(Res);New_Line;
--   Put("No comunes:");Recorrer(Res2);New_Line;

--   new_line(2);

--   Put_Line("Caso 2:");
--   Put_Line("Interseccion(1 3 5 7 9 11 15 17)y(1 3 5 7):(1 1 3 3 5 5 7 7)y(9 11 15 17)");
--   L1:= --(1 3 5 7 9 11 15 17)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(5,
--      new T_Nodo_Enteros'(7,
--      new T_Nodo_Enteros'(9,
--      new T_Nodo_Enteros'(11,
--      new T_Nodo_Enteros'(15,
--      new T_Nodo_Enteros'(17,null))))))));
--   L2:= --(1 3 5 7)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(5,
--      new T_Nodo_Enteros'(7,null))));
--   Interseccion(L1,L2,Res,Res2);
--   Put("Comunes:");Recorrer(Res);New_Line;
--   Put("No comunes:");Recorrer(Res2);New_Line;

--   new_line(2);

--   Put_Line("Caso 3:");
--   Put_Line("Interseccion(1 3 5 7)y(2 4 8 9):()y(1 2 3 4 5 7 8 9)");
--   L1:= --(1 3 5 7)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(5,
--      new T_Nodo_Enteros'(7,null))));
--   L2:= --(1 3 5 7)
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(4,
--      new T_Nodo_Enteros'(8,
--      new T_Nodo_Enteros'(9,null))));
--   Interseccion(L1,L2,Res,Res2);
--   Put("Comunes:");Recorrer(Res);New_Line;
--   Put("No comunes:");Recorrer(Res2);New_Line;

--   new_line(2);

--   Put_Line("Caso 4:");
--   Put_Line("Interseccion(1 3 5 7)y(5):(5 5)y(1 3 7)");
--   L1:= --(1 3 5 7)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(5,
--      new T_Nodo_Enteros'(7,null))));
--   L2:= --(5)
--      new T_Nodo_Enteros'(5,null);
--   Interseccion(L1,L2,Res,Res2);
--   Put("Comunes:");Recorrer(Res);New_Line;
--   Put("No comunes:");Recorrer(Res2);New_Line;

--   new_line(2);

--   Put_Line("Caso 5: ");
--   Put_Line("Interseccion() y ():() y ()");
--   L1:= null; --()
--   L2:= null;
--   Interseccion(L1,L2,Res,Res2);
--   Put("Comunes:");Recorrer(Res);New_Line;
--   Put("No comunes:");Recorrer(Res2);New_Line;

--   -----------------
--   -- Son Iguales --
--   -----------------
--   new_line(3);
--   Put_Line("*** Son Iguales ***");
--   new_line;

--   L_copia := copiar(L12345);
--   Put_Line("Caso 1: una lista estandar");
--   Put_Line("(1 2 3 4 5) = (1 2 3 4 5)? True");
--   L1:= --(1 2 3 4 5)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(4,
--      new T_Nodo_Enteros'(5,null)))));
--   L2:= --(1 2 3 4 5)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(4,
--      new T_Nodo_Enteros'(5,null)))));
--   Put_LINE(Son_iguales(L1,L2)'img);

--   new_line(3);

--   Put_Line("Caso 2: lista1 incluye a la lista2");
--   Put_Line("(1 2 3 4) = (1 2 3 4 5)? False");
--   L1:= --(1 2 3 4 5)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(4,null))));
--   L2:= --(1 2 3 4 5)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(3,
--      new T_Nodo_Enteros'(4,
--      new T_Nodo_Enteros'(5,null)))));
--   Put_LINE(Son_iguales(L1,L2)'img);

--   new_line(3);

--   Put_Line("Caso 3: Lista2 incluye a lista1");
--   Put_Line("(1 2 3) = (1)? False");
--   L1:= --(1 2 3)
--      new T_Nodo_Enteros'(1,
--      new T_Nodo_Enteros'(2,
--      new T_Nodo_Enteros'(3,null)));
--   L2:= --(1)
--      new T_Nodo_Enteros'(1,null);
--   Put_LINE(Son_iguales(L1,L2)'img);


   ------------------
   -- Simplificar1 --
   ------------------
   new_line(3);
   Put_Line("*** Simplificar 1 ***");
   new_line;

   LP_copia := copiar_lista_puntos(LP10);
   Put_Line("Caso 1: No todos los puntos distan menos de 0.001");
   recorrer(LP_copia);
   simplificar1(LP_copia, cuantos);
   recorrer(LP_copia);
   Put_Line("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line(eval_simplificar(LP_copia, LP1_Res, cuantos, 5)'img);
   recorrer(LP1_Res);

   new_line(2);

   LP_copia := copiar_lista_puntos(LP11);
   Put_Line("Caso 2: Todos los puntos distan menos de 0.001");
   recorrer(LP_copia);
   simplificar1(LP_copia, cuantos);
   recorrer(LP_copia);
   Put_Line("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line(eval_simplificar(LP_copia, LP4_Res, cuantos, 2)'img);
   recorrer(LP4_Res);

   new_line(2);

   LP_copia := copiar_lista_puntos(LP12);
   Put_Line("Caso 3: Todos los puntos distan menos de 0.001. Algunos negativos.");
   recorrer(LP_copia);
   simplificar1(LP_copia, cuantos);
   recorrer(LP_copia);
   Put_Line("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line(eval_simplificar(LP_copia, LP5_Res, cuantos, 2)'img);
   recorrer(LP5_Res);

   new_line(2);

   LP_copia := copiar_lista_puntos(LP13);
   Put_Line("Caso 4: Lista de un solo punto");
   recorrer(LP_copia);
   simplificar1(LP_copia, cuantos);
   recorrer(LP_copia);
   Put_Line("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line(eval_simplificar(LP_copia, LP13, cuantos, 1)'img);
   recorrer(LP13);

   new_line(2);

   LP_copia := copiar_lista_puntos(LP0);
   Put_Line("Caso 5: Lista vacia");
   recorrer(LP_copia);
   simplificar1(LP_copia, cuantos);
   recorrer(LP_copia);
   Put_Line("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line(eval_simplificar(LP_copia, LP0_Res, cuantos, 0)'img);
   recorrer(LP0_Res);

   new_line(2);

   LP_copia := copiar_lista_puntos(LPX);
   Put_Line("Caso 6");
   recorrer(LP_copia);
   simplificar1(LP_copia, cuantos);
   recorrer(LP_copia);
   Put_Line("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line(eval_simplificar(LP_copia, LPX_Res, cuantos, 3)'img);
   recorrer(LPX_Res);


----   -------------------
----   -- Arbol binario --
----   -------------------

END laboratorio12_pruebas;