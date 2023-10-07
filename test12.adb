with Ada.Text_IO, Ada.Integer_Text_IO, Lab12;
use Ada.Text_IO, Ada.Integer_Text_IO, Lab12;

procedure Test12 is

   L12345 : constant T_Lista_Dinamica := -- (1 2 3 4 5)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4,
      new T_Nodo_Enteros'(5, null)))));

   L67890 : constant T_Lista_Dinamica := -- (6 7 8 9 0)
      new T_Nodo_Enteros'(6,
      new T_Nodo_Enteros'(7,
      new T_Nodo_Enteros'(8,
      new T_Nodo_Enteros'(9,
      new T_Nodo_Enteros'(0, null)))));

   L1, L2, Res, Res2 : T_Lista_Dinamica := null;
   L_copia           : T_Lista_Dinamica := null;
   L_copia_2         : T_Lista_Dinamica := null;
   Lp_Copia          : T_Lista_Puntos;
   cuantos           : Integer;

   -- Listas de puntos

   -- LP10 -> LP1_res, 3 borrados
   -- LP11 -> LP4_res, 9 borrados
   -- LP12 -> LP5_res, 7 borrados

   LP10 : T_Lista_Puntos   :=
      new T_Nodo_Punto'((1.1, 1.1),
      new T_Nodo_Punto'((1.100_01, 1.100_01),
      new T_Nodo_Punto'((1.100_02, 1.100_02),
      new T_Nodo_Punto'((4.4, 4.4),
      new T_Nodo_Punto'((5.5, 5.5),
      new T_Nodo_Punto'((5.500_01, 5.500_01),
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
      new T_Nodo_Punto'((1.111_1, 1.111_1),
      new T_Nodo_Punto'((1.111_0, 1.111_0),
      new T_Nodo_Punto'((1.111_2, 1.111_2),
      new T_Nodo_Punto'((1.111_1, 1.111_1),
      new T_Nodo_Punto'((1.111_0, 1.111_0),
      new T_Nodo_Punto'((1.111_2, 1.111_2),
      new T_Nodo_Punto'((1.111_1, 1.111_1),
      new T_Nodo_Punto'((1.111_0, 1.111_0),
      new T_Nodo_Punto'((1.111_2, 1.111_2), null)))))))));

   LP13 : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.111_1, 1.111_1), null);

   LPX : T_Lista_Puntos :=
      new T_Nodo_Punto'((3.333_1, 3.333_1),
      new T_Nodo_Punto'((3.333_2, 3.333_0),
      new T_Nodo_Punto'((3.333_3, 3.332_9),
      new T_Nodo_Punto'((3.333_4, 3.332_8),
      new T_Nodo_Punto'((3.333_5, 3.332_7),
      new T_Nodo_Punto'((3.333_6, 3.332_6),
      new T_Nodo_Punto'((3.333_7, 3.332_5),
      new T_Nodo_Punto'((3.333_8, 3.332_4),
      new T_Nodo_Punto'((3.333_9, 3.332_3),
      new T_Nodo_Punto'((3.334_0, 3.332_2),
      new T_Nodo_Punto'((3.334_1, 3.332_1),
      new T_Nodo_Punto'((3.334_2, 3.332_0), null))))))))))));

   LPX_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((3.333_1, 3.333_1),
      new T_Nodo_Punto'((3.334_1, 3.332_1),
      new T_Nodo_Punto'((3.334_2, 3.332_0), null)));

   LP0, LP0_Res : T_Lista_Puntos := null;

   LP1_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.1, 1.1),
      new T_Nodo_Punto'((4.4, 4.4),
      new T_Nodo_Punto'((5.5, 5.5),
      new T_Nodo_Punto'((7.7, 7.7),
      new T_Nodo_Punto'((8.8, 8.8), null)))));

   LP2_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((3.300_0, 3.300_0),
      new T_Nodo_Punto'((3.298_2, 3.301_8),
      new T_Nodo_Punto'((3.296_4, 3.303_6), null)));

   LP4_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99), null));

   LP5_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.111_1, 1.111_1),
      new T_Nodo_Punto'((1.111_2, 1.111_2), null));

   -- Programa auxiliar para copiar objetos de tipo T_Lista_Dinamica

   function copiar (L : T_Lista_Dinamica) return T_Lista_Dinamica is
   begin
      if L = null then
         return null;
      else
         return new T_Nodo_Enteros'(L.Info, copiar (L.all.Sig));
      end if;
   end copiar;

   -- Programa auxiliar para mostrar objetos T_Lista_Dinamica por consola

   procedure recorrer (L : T_Lista_Dinamica) is
   begin
      if L /= null then
         Put (L.Info'Img);
         recorrer (L.Sig);
      end if;
   end recorrer;

   -- Programa auxiliar para mostrar objetos T_Lista_Puntos por consola

   procedure recorrer (L : T_Lista_Puntos) is
   begin
      if L /= null then
         Put_Line (L.Info.X'Img & L.Info.Y'Img);
         recorrer (L.Sig);
      end if;
      New_Line;
   end recorrer;

   -- Programa auxiliar para copiar objetos de tipo T_Lista_Puntos

   function copiar_lista_puntos (LP : T_Lista_Puntos) return T_Lista_Puntos is
   begin
      if LP = null then
         return null;
      else
         return new T_Nodo_Punto'(LP.Info, copiar_lista_puntos (LP.all.Sig));
      end if;
   end copiar_lista_puntos;

   -- Programa auxiliar que comprueba si el programa simplificar devuelve el resultado correcto

   function eval_simplificar
     (LP, LP_correcta           : in T_Lista_Puntos;
      cuantos, cuantos_correcto : in Integer) return Boolean
   is
   begin
      if LP = null and LP_correcta = null and cuantos = cuantos_correcto then
         return True;
      else
         if (LP /= null and LP_correcta /= null)
           and then LP.Info = LP_correcta.Info
         then
            return
              eval_simplificar
                (LP.all.Sig, LP_correcta.all.Sig, cuantos, cuantos_correcto);
         else
            return False;
         end if;
      end if;
   end eval_simplificar;

begin

   -------------------------
   -- Clonar y concatenar --
   -------------------------

   Put_Line ("*** Clonar y concatenar ***");
   New_Line;

   Put_Line ("Caso 1: Concatenar dos listas");
   Put_Line ("Concatenar (1 2 3 4 5) y (6 7 8 9 0)? (1 2 3 4 5 6 7 8 9 0)");

   L1 := copiar (L12345);
   L2 := copiar (L67890);
   Clonar_y_Concatenar (L1, L2, Res);
   recorrer (Res);

   New_Line (2);

   Put_Line ("Caso 2: Lista de un elemento y lista completa.");
   Put_Line ("Concatenar (1) y (6 7 8 9 0)? (1 6 7 8 9 0)");

   L1 := new T_Nodo_Enteros'(1, null);
   L2 := copiar (L67890);
   Clonar_y_Concatenar (L1, L2, Res);
   recorrer (Res);

   New_Line (2);

   Put_Line ("Caso 3: Lista completa y un elemento.");
   Put_Line ("Concatenar (6 7 8 9 0) y (1)? (6 7 8 9 0 1)");

   L1 := new T_Nodo_Enteros'(1, null);
   L2 := copiar (L67890);
   Clonar_y_Concatenar (L2, L1, Res);
   recorrer (Res);

   New_Line (2);

   Put_Line ("Caso 4: Dos listas de un elemento.");
   Put_Line ("Concatenar (6) y (1)? (6 1)");

   L1 := new T_Nodo_Enteros'(6, null);
   L2 := new T_Nodo_Enteros'(1, null);
   Clonar_y_Concatenar (L1, L2, Res);
   recorrer (Res);

   New_Line (2);

   Put_Line ("Caso 5: lista vacia y otra lista.");
   Put_Line ("Concatenar () y (6 7 8 9 0)? (6 7 8 9 0)");

   L1 := null;
   L2 := copiar (L67890);
   Clonar_y_Concatenar (L1, L2, Res);
   recorrer (Res);

   New_Line (2);

   Put_Line ("Caso 6: lista y lista vacia.");
   Put_Line ("Concatenar (1 2 3 4 5) y ()? (1 2 3 4 5)");

   L1 := null;
   L2 := copiar (L12345);
   Clonar_y_Concatenar (L1, L2, Res);
   recorrer (Res);

   New_Line (2);

   Put_Line ("Caso 7: lista vacia y lista vacia.");
   Put_Line ("Concatenar () y ()? ()");

   L1 := null;
   L2 := null;
   Clonar_y_Concatenar (L1, L2, Res);
   recorrer (Res);

   ------------
   -- Borrar --
   ------------

   New_Line (3);

   Put_Line ("*** Borrar ***");
   New_Line;

   Put_Line ("Caso 1: un numero por el medio.");
   Put_Line ("Borrar 2 de (1 2 3 4 5): (1 3 4 5)");

   L1 := -- (1 2 3 4 5)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4,
      new T_Nodo_Enteros'(5, null)))));
   Borrar (L1, 2);
   recorrer (L1);

   New_Line (2);

   Put_Line ("Caso 2: numeros 2 al principio.");
   Put_Line ("Borrar 2 de (2 2 3 4 5): (3 4 5)");

   L1 := -- (2 2 3 4 5)
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4,
      new T_Nodo_Enteros'(5, null)))));
   Borrar (L1, 2);
   recorrer (L1);

   New_Line (2);

   Put_Line ("Caso 3: numeros 2 al final.");
   Put_Line ("Borrar 2 de (1 3 4 2 2): (1 3 4)");

   L1 := -- (1 3 4 2 2)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(2, null)))));
   Borrar (L1, 2);
   recorrer (L1);

   New_Line (2);

   Put_Line ("Caso 4: numero no existe en la lista.");
   Put_Line ("Borrar 6 de (1 2 3 4 5): (1 2 3 4 5)");

   L1 := -- (1 2 3 4 5)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4,
      new T_Nodo_Enteros'(5, null)))));
   Borrar (L1, 6);
   recorrer (L1);

   New_Line (2);

   Put_Line ("Caso 5: lista vacia.");
   Put_Line ("Borrar 2 de (): ()");

   L1 := null; -- ()
   Borrar (L1, 2);
   recorrer (L1);

   New_Line (2);

   Put_Line ("Caso 6: lista con un unico nodo.");
   Put_Line ("Borrar 2 de (2): ()");

   L1 := -- (2)
     new T_Nodo_Enteros'(2, null);
   Borrar (L1, 2);
   recorrer (L1);

   New_Line (2);

   Put_Line ("Caso 6: lista con dos nodos.");
   Put_Line ("Borrar 2 de (2 2): ()");

   L1 := -- (2 2)
     new T_Nodo_Enteros'(2,
     new T_Nodo_Enteros'(2, null));
   Borrar (L1, 2);
   recorrer (L1);

   ------------------
   -- Interseccion --
   ------------------

   New_Line (3);

   Put_Line ("*** Interseccion ***");
   New_Line;

   Put_Line ("Caso 1: Varios comunes y varios no comunes");
   Put_Line
     ("Interseccion (1 3 5 7 9 11 15 17) y (1 2 3 4 5 6 7 8) : (1 1 3 3 5 5 7 7) y (2 4 6 8 9 11 15 17)");

   L1 := -- (1 3 5 7 9 11 15 17)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(5,
      new T_Nodo_Enteros'(7,
      new T_Nodo_Enteros'(9,
      new T_Nodo_Enteros'(11,
      new T_Nodo_Enteros'(15,
      new T_Nodo_Enteros'(17, null))))))));

   L2 := -- (1 2 3 4 5 6 7 8)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4,
      new T_Nodo_Enteros'(5,
      new T_Nodo_Enteros'(6,
      new T_Nodo_Enteros'(7,
      new T_Nodo_Enteros'(8, null))))))));

   Interseccion (L1, L2, Res, Res2);
   Put ("Comunes:");
   recorrer (Res);
   New_Line;
   Put ("No comunes:");
   recorrer (Res2);
   New_Line;

   New_Line (2);

   Put_Line ("Caso 2:");
   Put_Line
     ("Interseccion (1 3 5 7 9 11 15 17) y (1 3 5 7) : (1 1 3 3 5 5 7 7) y (9 11 15 17)");

   L1 := -- (1 3 5 7 9 11 15 17)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(5,
      new T_Nodo_Enteros'(7,
      new T_Nodo_Enteros'(9,
      new T_Nodo_Enteros'(11,
      new T_Nodo_Enteros'(15,
      new T_Nodo_Enteros'(17, null))))))));

   L2 := -- (1 3 5 7)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(5,
      new T_Nodo_Enteros'(7, null))));

   Interseccion (L1, L2, Res, Res2);
   Put ("Comunes:");
   recorrer (Res);
   New_Line;
   Put ("No comunes:");
   recorrer (Res2);
   New_Line;

   New_Line (2);

   Put_Line ("Caso 3:");
   Put_Line ("Interseccion (1 3 5 7) y (2 4 8 9) : () y (1 2 3 4 5 7 8 9)");

   L1 := -- (1 3 5 7)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(5,
      new T_Nodo_Enteros'(7, null))));

   L2 := -- (1 3 5 7)
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(4,
      new T_Nodo_Enteros'(8,
      new T_Nodo_Enteros'(9, null))));

   Interseccion (L1, L2, Res, Res2);
   Put ("Comunes:");
   recorrer (Res);
   New_Line;
   Put ("No comunes:");
   recorrer (Res2);
   New_Line;

   New_Line (2);

   Put_Line ("Caso 4:");
   Put_Line ("Interseccion (1 3 5 7) y (5) : (5 5) y (1 3 7)");

   L1 := -- (1 3 5 7)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(5,
      new T_Nodo_Enteros'(7, null))));

   L2 := -- (5)
      new T_Nodo_Enteros'(5, null);

   Interseccion (L1, L2, Res, Res2);
   Put ("Comunes:");
   recorrer (Res);
   New_Line;
   Put ("No comunes:");
   recorrer (Res2);
   New_Line;

   New_Line (2);

   Put_Line ("Caso 5: ");
   Put_Line ("Interseccion () y () : () y ()");

   L1 := null; -- ()

   L2 := null; -- ()

   Interseccion (L1, L2, Res, Res2);
   Put ("Comunes:");
   recorrer (Res);
   New_Line;
   Put ("No comunes:");
   recorrer (Res2);
   New_Line;

   -----------------
   -- Son Iguales --
   -----------------

   New_Line (3);

   Put_Line ("*** Son Iguales ***");
   New_Line;

   L_copia := copiar (L12345);

   Put_Line ("Caso 1: una lista estandar");
   Put_Line ("(1 2 3 4 5) = (1 2 3 4 5)? True");

   L1 := -- (1 2 3 4 5)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4,
      new T_Nodo_Enteros'(5, null)))));

   L2 := -- (1 2 3 4 5)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4,
      new T_Nodo_Enteros'(5, null)))));

   Put_Line (Son_iguales (L1, L2)'Img);

   New_Line (2);

   Put_Line ("Caso 2: lista1 incluye a la lista2");
   Put_Line ("(1 2 3 4) = (1 2 3 4 5)? False");

   L1 := -- (1 2 3 4 5)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4, null))));

   L2 := -- (1 2 3 4 5)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4,
      new T_Nodo_Enteros'(5, null)))));

   Put_Line (Son_iguales (L1, L2)'Img);

   New_Line (2);

   Put_Line ("Caso 3: Lista2 incluye a lista1");
   Put_Line ("(1 2 3) = (1)? False");

   L1 := -- (1 2 3)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3, null)));

   L2 := -- (1)
      new T_Nodo_Enteros'(1, null);

   Put_Line (Son_iguales (L1, L2)'Img);

   ------------------
   -- Simplificar1 --
   ------------------

   New_Line (3);

   Put_Line ("*** Simplificar 1 ***");
   New_Line;

   Lp_Copia := copiar_lista_puntos (LP10);
   Put_Line ("Caso 1: No todos los puntos distan menos de 0.001");

   recorrer (Lp_Copia);
   Simplificar1 (Lp_Copia, cuantos);
   recorrer (Lp_Copia);
   Put_Line ("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line (eval_simplificar (Lp_Copia, LP1_Res, cuantos, 5)'Img);
   recorrer (LP1_Res);

   New_Line (2);

   Lp_Copia := copiar_lista_puntos (LP11);
   Put_Line ("Caso 2: Todos los puntos distan menos de 0.001");

   recorrer (Lp_Copia);
   Simplificar1 (Lp_Copia, cuantos);
   recorrer (Lp_Copia);
   Put_Line ("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line (eval_simplificar (Lp_Copia, LP4_Res, cuantos, 2)'Img);
   recorrer (LP4_Res);

   New_Line (2);

   Lp_Copia := copiar_lista_puntos (LP12);
   Put_Line
     ("Caso 3: Todos los puntos distan menos de 0.001. Algunos negativos.");

   recorrer (Lp_Copia);
   Simplificar1 (Lp_Copia, cuantos);
   recorrer (Lp_Copia);
   Put_Line ("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line (eval_simplificar (Lp_Copia, LP5_Res, cuantos, 2)'Img);
   recorrer (LP5_Res);

   New_Line (2);

   Lp_Copia := copiar_lista_puntos (LP13);
   Put_Line ("Caso 4: Lista de un solo punto");

   recorrer (Lp_Copia);
   Simplificar1 (Lp_Copia, cuantos);
   recorrer (Lp_Copia);
   Put_Line ("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line (eval_simplificar (Lp_Copia, LP13, cuantos, 1)'Img);
   recorrer (LP13);

   New_Line (2);

   Lp_Copia := copiar_lista_puntos (LP0);
   Put_Line ("Caso 5: Lista vacia");

   recorrer (Lp_Copia);
   Simplificar1 (Lp_Copia, cuantos);
   recorrer (Lp_Copia);
   Put_Line ("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line (eval_simplificar (Lp_Copia, LP0_Res, cuantos, 0)'Img);
   recorrer (LP0_Res);

   New_Line (2);

   Lp_Copia := copiar_lista_puntos (LPX);
   Put_Line ("Caso 6");

   recorrer (Lp_Copia);
   Simplificar1 (Lp_Copia, cuantos);
   recorrer (Lp_Copia);
   Put_Line ("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line (eval_simplificar (Lp_Copia, LPX_Res, cuantos, 3)'Img);
   recorrer (LPX_Res);

   -------------------
   -- Arbol binario --
   -------------------

end Test12;
