CREATE OR REPLACE FUNCTION perezlan.f_prueba(valor number)
RETURN NUMBER 
IS 
	BEGIN 
		RETURN valor*2;
	END;

SELECT perezlan.f_prueba(2) AS total FROM DUAL ;




SELECT * FROM PEREZLAN.LIBROS l ;

CREATE OR REPLACE FUNCTION perezlan.f_costo(valor number)
RETURN varchar
IS 
	costo varchar(20);
	
	BEGIN
		costo:='';
	
		IF valor<=500 THEN
			costo:='economico';
		ELSE costo:='costoso';
		END IF;
		
		RETURN costo;
	END;
	
SELECT l.TITULO ,l.AUTOR,l.PRECIO, perezlan.f_costo(l.PRECIO) AS economico FROM libros l;