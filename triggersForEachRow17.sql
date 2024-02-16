drop table PEREZLAN.empleados;

 create table PEREZLAN.empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  seccion varchar2(20)
 );

--INSERTS
 insert into PEREZLAN.empleados values('22333444','ACOSTA','Ana','Secretaria');
 insert into PEREZLAN.empleados values('22777888','DOMINGUEZ','Daniel','Secretaria');
 insert into PEREZLAN.empleados values('22999000','FUENTES','Federico','Sistemas');
 insert into PEREZLAN.empleados values('22555666','CASEROS','Carlos','Contaduria');
 insert into PEREZLAN.empleados values('23444555','GOMEZ','Gabriela','Sistemas');
 insert into PEREZLAN.empleados values('23666777','JUAREZ','Juan','Contaduria');
 
SELECT * FROM PEREZLAN.EMPLEADOS e ;
DELETE FROM PEREZLAN.EMPLEADOS e ;
SELECT * FROM PEREZLAN.CONTROL c ;
TRUNCATE TABLE PEREZLAN.CONTROL ;

CREATE OR REPLACE TRIGGER perezlan.tr_ingresaEmpleados
	BEFORE INSERT 
	ON perezlan.EMPLEADOS 
	FOR EACH ROW 
		BEGIN 
			INSERT INTO PEREZLAN.CONTROL c values(USER,sysdate);
		END tr_ingresaEmpleados;

	