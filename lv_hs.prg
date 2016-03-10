set database to VENTAS
create view lv_hs as;
SELECT Hoja_serv.codigo AS codigo_hs, Hoja_serv.fecha,;
  Hoja_serv.fecha_inicio, Hoja_serv.hora_inicio, Hoja_serv.fecha_fin,;
  Hoja_serv.hora_fin, Hoja_serv.codobra, Hoja_serv.nomobra,;
  Hoja_serv.coordina, _empleados.nombre, Hoja_serv.remito,;
  Hoja_serv.factura, Hoja_serv.ptov_rv, Hoja_serv.ptov_fa,;
  ALLTRIM(LEFT(Hoja_serv.descrip,120)) AS descrip,;
  cliente.codigo as cod_cli, cliente.nombre as nom_cli;
 FROM  ventas!hoja_serv; 
 	INNER JOIN sueldos!_empleados ON  Hoja_serv.coordina = _empleados.codigo;
	INNER JOIN VENTAS!obras ON  Hoja_serv.codobra = obras.codigo;
	INNER JOIN VENTAS!cliente ON  obras.cliente = cliente.codigo;	
 GROUP BY Hoja_serv.codigo;
 ORDER BY Hoja_serv.codigo
