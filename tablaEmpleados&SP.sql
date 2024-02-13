 --borrar tabla empelados anterior
 drop table perezlan.empleados;
	 --crear nueva tabla empleados
 create table PEREZLAN.empleados(
  documento char(8),
  nombre varchar2(20),
  apellido varchar2(20),
  sueldo number(6,2),
  fechaingreso date
 );


 --ingreso de datos
 insert into PEREZLAN.empleados values('22222222','Juan','Perez',300,to_date('10/10/1980','dd/mm/yyyy'));
 insert into PEREZLAN.empleados values('22333333','Luis','Lopez',300,to_date('12/05/1998','dd/mm/yyyy'));
 insert into PEREZLAN.empleados values('22444444','Marta','Perez',500,to_date('25/08/1990','dd/mm/yyyy'));
 insert into PEREZLAN.empleados values('22555555','Susana','Garcia',400,to_date('05/05/2000','dd/mm/yyyy'));
 insert into PEREZLAN.empleados values('22666666','Jose Maria','Morales',400,to_date('24/10/2005','dd/mm/yyyy'));

SELECT * FROM perezlan.EMPLEADOS e; 


 --procedimiento que aumenta sueldo a empleados
 create or replace procedure perezlan.aumentasueldo
 (anio in number, 
 porcentaje in NUMBER
 )
as
 begin
	 update perezlan.empleados set sueldo=sueldo+(sueldo*porcentaje/100)
	 where (extract(year from current_date)-extract(year from fechaingreso))>anio;
 end aumentasueldo;
 
 --ejecucion
 call perezlan.aumentasueldo(10,20);

SELECT * FROM perezlan.EMPLEADOS e; 
 
 --procedimiento que ingresa empleados
 create or replace procedure perezlan.ingresoemple(
 docu in char, 
 nom in varchar2, 
 ape in varchar2
 )
as
 begin
   insert into perezlan.empleados values(docu, nom, ape, null, null);
   end ingresoemple;
   
    --ejecucion
call perezlan.ingresoemple('25656589','Mario', 'Perez');
SELECT *FROM PEREZLAN.EMPLEADOS e ;