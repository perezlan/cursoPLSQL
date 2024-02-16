drop table libros;
drop table ofertas;

 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar(20),
  precio number(6,2)
 );
select * from LIBROS;
 create table ofertas(
  codigo number(6),
  precio number(6,2),
  usuario varchar2(20),
  fecha date
 );
select * from ofertas;
select * from LIBROS;


 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);
 
CREATE OR REPLACE TRIGGER tr_ingresaLibros
	BEFORE INSERT 
	ON perezlan.LIBROS 
	FOR EACH ROW 
		BEGIN 
			IF (:NEW.precio<=30) THEN 
				INSERT INTO OFERTAS values(:NEW.codigo,:NEW.precio,USER,sysdate);
			END IF;
		END tr_ingresaLibros;

CREATE OR REPLACE TRIGGER tr_actualizaLibros
	BEFORE UPDATE 
	ON perezlan.LIBROS 
	FOR EACH ROW 
		BEGIN 
			IF (:OLD.precio<=30) AND (:NEW.precio>30) THEN 
				DELETE FROM OFERTAS o WHERE o.codigo=:OLD.codigo;
			END IF;
			
			IF (:OLD.precio>30) AND (:NEW.precio<=30) THEN 
				INSERT INTO ofertas values(:NEW.codigo,:NEW.precio,USER,sysdate);
			END IF;
		END tr_actualizaLibros;
	
	
select * from LIBROS;
select * from OFERTAS ORDER BY FECHA desc;

select o.USUARIO Creador, l.CODIGO ,l.TITULO ,o.PRECIO,o.FECHA Modificacion from LIBROS l 
RIGHT JOIN OFERTAS o ON l.CODIGO =o.CODIGO ;

select o.USUARIO Creador, l.CODIGO ,l.TITULO ,o.PRECIO,o.FECHA Modificacion from OFERTAS o  
LEFT JOIN libros l ON l.CODIGO =o.CODIGO ;


UPDATE LIBROS l SET l.precio=22 WHERE l.CODIGO =120; 
		