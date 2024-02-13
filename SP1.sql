create table PEREZLAN.Libros(
idlibro int not null,
titulo varchar2(30) not null,
autor varchar2(60) not null,
precio number(5,2)
);

--VALORES
insert into PEREZLAN.libros values(1,'El quijote','Miguel de Cervantes',454.5);
insert into PEREZLAN.libros values(2,'Cien años de soledad','Gabriel G. Marquez',545.4);
insert into PEREZLAN.libros values(3,'El alquimista','Paulo Coehlo',636.3);

SELECT * FROM PEREZLAN.LIBROS;

CREATE OR REPLACE PROCEDURE PEREZLAN.saludo 
AS 
BEGIN 
   dbms_output.put_line('Hola a todos'); 
END saludo; 

call PEREZLAN.saludo();

BEGIN 
	perezlan.saludo();
END;


SELECT * FROM PEREZLAN.libros;
create or replace procedure perezlan.precio_articulos
  as
  begin
   update PEREZLAN.libros set precio=precio+(precio*0.1);
  end;
 
BEGIN
	perezlan.precio_articulos();
END;

DROP PROCEDURE perezlan.SALUDO; 

 
select *from user_objects where object_type='PROCEDURE';

