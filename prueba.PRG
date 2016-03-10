lddesde =  {^2012-05-01}
ldhasta = {^2012-05-31}

SELECT * FROM dbc/admin!IVAVENTA ;
WHERE BETWEEN(FECHAIMP,lddesde,ldhasta) .AND. TIPO#'RE' .AND. TIPO#'DI' .AND. TIPO#'CI' ;
ORDER BY FECHA,PTOVEN,FACTURA ;
INTO CURSOR reporte

SELECT * FROM dbc/admin!IVAVENTA INNER JOIN dbc/VENTAS!quecobro ;
		 ON transform(ivaventa.ptoven,'@L 9999')+'-'+transform(ivaventa.factura,'@L 99999999') = quecobro.nrocomp AND ivaventa.tipo = quecobro.tipo ;
		 WHERE BETWEEN(FECHAIMP,lddesde,ldhasta) .AND. ivaventa.TIPO#'RE' .AND. ivaventa.TIPO#'DI' .AND. ivaventa.TIPO#'CI' ;
		 ORDER BY quecobro.nrocomp ;
		 INTO CURSOR reporte_cobros