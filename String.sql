DECLARE
	nombre varchar2(20);
	direccion varchar2(30);
	detalles clob;
	eleccion char(1);


BEGIN	
	nombre:='Mario Landeros';
	direccion:='cozumel 1328';
	detalles:='Este es el detalle de la variable clob que iniciamos en la seccion declarativa,
				es una variable de gran almacenamiento';
	eleccion:='d';

	IF	(eleccion = 'y') then
		dbms_output.put_line(nombre);
		dbms_output.put_line(direccion);
		dbms_output.put_line(detalles);

	ELSE	
	dbms_output.put_line('nada');
	
	END IF;
	
	
	
	
END;
