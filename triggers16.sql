 --borrar tablas (si existen)
 drop table PEREZLAN.libros;
 DROP TABLE PEREZLAN.control;

 --crear tablas
 create table PEREZLAN.libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
 );
 create table PEREZLAN.control(
  usuario varchar2(30),
  fecha date
 );
 
SELECT * FROM PEREZLAN.control;
SELECT * FROM PEREZLAN.libros l;

CREATE OR REPLACE TRIGGER PEREZLAN.tr_ingresoLibros
	BEFORE INSERT 
	ON PEREZLAN.libros
		BEGIN 
			INSERT INTO PEREZLAN.CONTROL values(USER,sysdate); 
		END tr_ingresoLibros;

INSERT INTO PEREZLAN.libros values(101,'Dos','Mario Perez','Planet',40);
	