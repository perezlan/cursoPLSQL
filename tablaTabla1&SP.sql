create table PEREZLAN.tabla1( 
   titulo varchar2(40),
   precio number(6,2)
  );
  
/* creacion del procedimiento*/

   create or replace procedure perezlan.autorlibro(atitulo in varchar2)
 as
   v_autor varchar2(20);
  error NUMBER;
 BEGIN
	 
  select autor into v_autor from perezlan.libros li where li.titulo=atitulo;
 
  insert into tabla1 --insertamos en la tabla1
   select titulo,precio --el titluo y precion
   from perezlan.libros li --de la tabla libros
   where li.autor=v_autor; --donde el autor sea al v_autor
   
    -- Si llegamos aquí, la operación fue exitosa, así que mostramos un mensaje
  	DBMS_OUTPUT.PUT_LINE('Los libros del autor ' || v_autor || ' se han insertado en tabla1.');
	
  
  EXCEPTION
  -- Manejar una excepción específica si la consulta no devuelve resultados
 	 WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se encontró ningún libro con el título especificado: ' || atitulo);
  -- Manejar cualquier otra excepción
  	WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
   
   
 END autorlibro;
 
SELECT * FROM PEREZLAN.LIBROS l ;
SELECT * FROM PEREZLAN.TABLA1 t; 

CALL perezlan.AUTORLIBRO('El quijote'); 
CALL perezlan.AUTORLIBRO('Cien años de soledad'); 

DELETE FROM PEREZLAN.TABLA1 t  WHERE t.TITULO='El quijote';
