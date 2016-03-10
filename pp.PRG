	SELECT a.ptoven , a.talonario ,b.tipo			;	
													;
		FROM libres!comprob 			a			;
													;
		RIGHT JOIN  libres!puntosventa	b			;
			ON b.CODIGO = a.PTOVEN 					;
													;			
	WHERE a.codigo="RV" .AND. a.default='S' .AND.	;
		  b.cod_suc = '0001'