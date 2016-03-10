USE dbc/mov_vehiculos
SCAN 
	maxCod = 0
	SELECT MAX(codigo) as codveh from EQUIPOS!mov_vehiculos INTO CURSOR cInc
	maxCod = cInc.codveh + 1
*	UPDATE EQUIPOS!mov_vehiculos SET codigo = maxCod
	REPLACE mov_vehiculos.codigo WITH maxCod
	USE IN cInc
ENDSCAN
