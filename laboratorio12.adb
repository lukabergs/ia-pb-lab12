package body Laboratorio12 is

   ------------------------------------
   -- AUTHOR: BERGARETXE LOPEZ, LUKA --
   ------------------------------------

   -------------------------
   -- Clonar_y_Concatenar --
   -------------------------

   procedure Clonar_y_Concatenar
     (L1,L2: in T_Lista_Dinamica;
      L: out T_Lista_Dinamica)
   is
   begin
      if L1 = null then
         L := L2;
      elsif L2 = null then
         L := L1;
      else
         L := L1;
         while L.Sig /= null loop
            L := L.Sig;
         end loop;
         L.Sig := L2;
         L := L1;
      end if;
   end Clonar_y_Concatenar;

   ------------
   -- Borrar --
   ------------

   procedure Borrar (L: in out T_Lista_Dinamica; Num: Integer) is
      a : T_Lista_Dinamica;
   begin
      if L /= null then
         a := L;
         loop
            while a.Sig /= null and then a.Sig.Info = Num loop
               a.Sig := a.Sig.Sig;
            end loop;
            exit when a.Sig = null;
            a := a.Sig;
         end loop;
         if L.Info = Num then
            L := L.Sig;
         end if;
      end if;
   end Borrar;

   ------------------
   -- Interseccion --
   ------------------

   procedure Interseccion
     (L1,L2: in out T_Lista_Dinamica;
      Comunes, No_Comunes: out T_Lista_Dinamica)
   is
      a1 : T_Lista_Dinamica;
      a2 : T_Lista_Dinamica;
   begin
      Comunes := null;
      No_Comunes := null;
      if L1 = null then
         No_Comunes := L2;
         L2 := null;
      elsif L2 = null then
         No_Comunes := L1;
         L1 := null;
      else
         while L1 /= null and L2 /= null loop
            if L1.Info = L2.Info then
               loop
                  if Comunes /= null then
                     a1.Sig := L1;
                     a1 := a1.Sig;
                  else
                     Comunes := L1;
                     a1 := Comunes;
                  end if;
                  L1 := L1.Sig;
                  exit when L1 = null or else L1.Info /= a1.Info;
               end loop;
               loop
                  a1.Sig := L2;
                  a1 := a1.Sig;
                  L2 := L2.Sig;
                  exit when L2 = null or else L2.Info /= a1.Info;
               end loop;
            elsif L1.Info < L2.Info then
               if No_Comunes /= null then
                  a2.Sig := L1;
                  a2 := a2.Sig;
               else
                  No_Comunes := L1;
                  a2 := No_Comunes;
               end if;
               L1 := L1.Sig;
            else
               if No_Comunes /= null then
                  a2.Sig := L2;
                  a2 := a2.Sig;
               else
                  No_Comunes := L2;
                  a2 := No_Comunes;
               end if;
               L2 := L2.Sig;
            end if;
         end loop;
         if L1 /= null then
            if No_Comunes /= null then
               a2.Sig := L1;
            else
               No_Comunes := L1;
            end if;
            L1 := null;
         else
            if No_Comunes /= null then
               a2.Sig := L2;
            else
               No_Comunes := L2;
            end if;
            L2 := null;
         end if;
         if Comunes /= null then
            a1.Sig := null;
         end if;
      end if;
   end Interseccion;

   -----------------
   -- Son_iguales --
   -----------------

   function Son_iguales (L1,L2: in T_Lista_Dinamica) return Boolean is
      r : Boolean := TRUE;
      a1 : T_Lista_Dinamica := L1;
      a2 : T_Lista_Dinamica := L2;
   begin
      if L1 /= null and L2 /= null then
         loop
            r := r and a1.Info = a2.Info;
            exit when not r or a1.Sig = null or a2.Sig = null;
            a1 := a1.Sig;
            a2 := a2.Sig;
         end loop;
         if r then
            if a1.Sig = null xor a2.Sig = null then
               r := FALSE;
            end if;
         end if;
      elsif L1 /= null xor L2 /= null then
         r := FALSE;
      end if;
      return r;
   end Son_iguales;

   ------------------
   -- Simplificar1 --
   ------------------

   procedure Simplificar1 (L: in out T_Lista_Puntos; Cuantos: out Natural) is
      a : T_Lista_Puntos;
   begin
      Cuantos := 0;
      if L /= null then
         Cuantos := Cuantos + 1;
         if L.Sig /= null then
            Cuantos := Cuantos + 1;
            if L.Sig.Sig /= null then
               a := L;
               loop
                  while a.Sig.Sig /= null and (abs(a.Sig.Info.X - a.Info.X) < 0.001 and abs(a.Sig.Info.Y - a.Info.Y) < 0.001) loop
                     a.Sig := a.Sig.Sig;
                  end loop;
                  a := a.Sig;
                  exit when a.Sig = null;
                  Cuantos := Cuantos + 1;
               end loop;
            end if;
         end if;
      end if;
   end Simplificar1;

   ------------------
   -- Simplificar2 --
   ------------------

   procedure Simplificar2 (L: in out T_lista_Puntos; Cuantos: out Natural) is
      a : T_Lista_Puntos;
      j : Natural := 1;
   begin
      Cuantos := 0;
      if L /= null then
         Cuantos := Cuantos + 1;
         if L.Sig /= null then
            Cuantos := Cuantos + 1;
            if L.Sig.Sig /= null then
               a := L;
               while a.Sig.Sig /= null loop
                  if j mod 4 = 0 then
                     Cuantos := Cuantos + 1;
                     a := a.Sig;
                  else
                     a.Sig := a.Sig.Sig;
                  end if;
                  j := j + 1;
               end loop;
            end if;
         end if;
      end if;
   end Simplificar2;

   -------------------------
   -- Crear_Arbol_Binario --
   -------------------------

   procedure Crear_Arbol_Binario
     (V:in T_Vector_Enteros;
      A:out T_Arbol_Binario)
   is
      i : Integer := V'First + 1;
      pos : T_Arbol_Binario;
      r : Boolean;
   begin
      if V'length >= 1 then
         A := new T_Nodo_Arbol'(V(V'first), null, null);
         if V'Length > 1 then
            while i in V'range loop
               pos := A;
               r := FALSE;
               loop
                  if V(i) < pos.Info then
                     if pos.Menores /= null then
                        pos := pos.Menores;
                     else
                        pos.Menores := new T_Nodo_Arbol'(V(i), null, null);
                        r := TRUE;
                     end if;
                  elsif V(i) > pos.Info then
                     if pos.Mayores /= null then
                        pos := pos.Mayores;
                     else
                        pos.Mayores := new T_Nodo_Arbol'(V(i), null, null);
                        r := TRUE;
                     end if;
                  else
                     r := TRUE;
                  end if;
                  exit when r;
               end loop;
               i := i + 1;
            end loop;
         end if;
      end if;
   end Crear_Arbol_Binario;

end Laboratorio12;
