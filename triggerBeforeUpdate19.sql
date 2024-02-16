--creacion tabla empleados
DROP TABLE EMPLEADOS ; 
CREATE table empleados(
  documento char(9),
  apellido varchar2(20),
  nombre varchar2(20),
  seccion varchar2(30),
  sueldo number(8,2)
 );
select * from EMPLEADOS;
--creacion tala control
DROP TABLE CONTROL ;
 create table control(
  usuario varchar2(30),
  fecha DATE,
  accion varchar2(20),
  extra varchar2(20)
 );
select * from CONTROL;
TRUNCATE TABLE CONTROL ;
--ingreso de datos
 insert into empleados values('22333444','ACOSTA','Ana','Secretaria',500);
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria',560);
 insert into empleados values('22999000','FUENTES','Federico','Sistemas',680);
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);
 
select * from EMPLEADOS e ;

CREATE OR REPLACE TRIGGER perezlan.actualizar
	BEFORE UPDATE 
	ON EMPLEADOS 
	FOR EACH ROW 
		BEGIN 
			INSERT INTO PEREZLAN.CONTROL  VALUES (USER, SYSDATE, 'Actualizacion', :NEW.documento);
		END actualizar;

UPDATE PEREZLAN.EMPLEADOS e 
SET e.SUELDO =e.sueldo+e.sueldo*0.1
WHERE e.SECCION ='Secretaria';

