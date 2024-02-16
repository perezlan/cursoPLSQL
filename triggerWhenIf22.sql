ol
drop table empleados;

 create table empleados(
  documento char(8),
  apellido varchar2(20),
  nombre varchar2(20),
  seccion varchar2(30),
  sueldo number(8,2)
 );
   drop table control;
 create table control(
  usuario varchar2(30),
  fecha date,
  documento char(8),
  antiguosueldo number(8,2),
  nuevosueldo number(8,2)
 ); 


 insert into empleados values('22333444','ACOSTA','Ana','Secretaria',500);
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria',560);
 insert into empleados values('22999000','FUENTES','Federico','Sistemas',680);
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);
 
CREATE OR REPLACE TRIGGER tr_aumentarSueldo
	BEFORE UPDATE OF sueldo
	ON perezlan.EMPLEADOS 
	FOR EACH ROW WHEN(NEW.sueldo>OLD.sueldo)
		BEGIN 
			INSERT INTO CONTROL c values(USER,sysdate,:OLD.documento,:OLD.sueldo,:NEW.sueldo);
		END tr_aumentarSueldo;

select * from EMPLEADOS;
select * from CONTROL c ORDER BY c.FECHA desc  ;

UPDATE EMPLEADOS e SET e.SUELDO =500 WHERE e.DOCUMENTO = 22333444;
