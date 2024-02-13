--ARRAYS EJEMPLO1	
DECLARE
	TYPE a_paises IS varray(5) OF varchar2(20);
	nombre a_paises;
BEGIN	
	nombre:=a_paises('Mexico','Argentina','Brazil','Peru','EUA');
	
	FOR i IN 1..5 LOOP
		dbms_output.put_line('Nombre: ' ||nombre(i));
	END LOOP;
	
END;

--ARRAYS EJEMPLO2
DECLARE
	TYPE matriz_nombres IS varray(5) OF varchar2(20);
	TYPE matriz_edad IS varray(5) OF integer;
	nombres matriz_nombres;
	edad matriz_edad;
	total integer;
BEGIN
	nombres:=matriz_nombres('Mario','Lalo','Alberto','Daniel','Martha');
	edad:=matriz_edad(25,22,25,22,48);
	total:=nombres.count;
	FOR i IN 1..total LOOP
		dbms_output.put_line('Nombre: ' ||nombres(i)||' Edad: '||edad(i));
	END LOOP; 

END;
