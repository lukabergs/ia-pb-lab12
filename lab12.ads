package Lab12 is

   type T_Nodo_enteros;

   type T_Lista_Dinamica is access T_Nodo_enteros;

   type T_Nodo_Enteros is record
      Info : Integer;
      Sig  : T_Lista_Dinamica;
   end record;

   procedure Clonar_y_Concatenar
     (L1, L2 : in T_Lista_Dinamica; L : out T_Lista_Dinamica);
   -- Post: L es una copia de L1 con L2 anadida a su final

   procedure Borrar (L : in out T_Lista_Dinamica; Num : Integer);
   -- Post: L no contiene ninguna aparicion de Num

   procedure Interseccion
     (L1, L2              : in out T_Lista_Dinamica;
      Comunes, No_Comunes :    out T_Lista_Dinamica);
   -- Pre:  L1 y L2 ordenadas ascendentemente
   -- Post: Comunes contiene los elementos comunes de L1 y L2 (una vez).
   --       No_Comunes contiene los elementos de L1 y L2 que no estan en la otra lista

   function Son_iguales (L1, L2 : in T_Lista_Dinamica) return Boolean;
   -- Post: Resultado = True <-> L1 y L2 son de la misma longitud y tienen los mismos elementos en el mismo orden

   type T_Punto is record
      X, Y : Float;
   end record;

   type T_Nodo_Punto;

   type T_Lista_Puntos is access T_Nodo_Punto;

   type T_Nodo_Punto is record
      Info : T_Punto;
      Sig  : T_Lista_Puntos;
   end record;

   procedure Simplificar1 (L : in out T_Lista_Puntos; Cuantos : out Natural);

   procedure Simplificar2 (L : in out T_Lista_Puntos; Cuantos : out Natural);
   -- Post: L contiene la lista de puntos original quitando 1 de cada 4 (excepto primero y ultimo)
   --       Cuantos: indica cuantos elementos quedan en L.

   type T_Vector_Enteros is array (Integer range <>) of Integer;

   type T_Nodo_Arbol;

   type T_Arbol_Binario is access T_Nodo_Arbol;

   type T_Nodo_Arbol is record
      Info             : Integer;
      Menores, Mayores : T_Arbol_Binario;
   end record;

   procedure Crear_Arbol_Binario
     (V : in T_Vector_Enteros; A : out T_Arbol_Binario);
   -- Post: A es el arbol binario correspondiente a los elementos de V

end Lab12;
