DECLARE
	valor number(2):=10;


BEGIN	
	LOOP
		dbms_output.put_line(valor);
		valor:=valor+10;
		EXIT WHEN (valor>50);
		
		
	END LOOP;
	
	dbms_output.put_line('valor final = '||valor);
	
END;
