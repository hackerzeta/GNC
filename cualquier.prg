lddesde = {^2012/07/01}
ldhasta = GOMONTH(lddesde,1) - 1
*!*	*SET PATH TO dbc ADDITIVE

*!*	SELECT descrip, corredor, tipo+TRANSFORM(Ivaventa.ptoven,"@L 9999")+"-"+TRANSFORM(Ivaventa.factura,"@L 99999999") as cNrocomp, totalfactu, iva, fechaimp ;
*!*		FROM dbc/admin!ivaventa ;
*!*		WHERE BETWEEN(IVAVENTA.fechaimp,lddesde,ldhasta) AND Ivaventa.tipo <> "RE" AND  Ivaventa.tipo <> "DI" AND  Ivaventa.tipo <> "CI" ;
*!*		ORDER BY descrip;
*!*		INTO CURSOR cIva 
*!*	SELECT tipo+nrocomp as cNrocomp, SUM(Quecobro.montopago) AS totalmontopago FROM dbc/VENTAS!quecobro ;
*!*		WHERE tipo+nrocomp in(SELECT cNrocomp FROM cIva) ;
*!*		GROUP BY tipo, nrocomp ;
*!*		into cursor cQC
*!*	INDEX on cNrocomp TAG cNrocomp
*!*	SUM totalmontopago TO tmontopago

*!*	SELECT tipo+nro as cNrocomp, SUM( IIF(INLIST(tipo,'CA','CB'),-1,1)*Imp_cobros.aplica) AS totalaplica FROM dbc/VENTAS!imp_cobros ;
*!*		WHERE tipo+nro in(SELECT cNrocomp FROM cIva) ;
*!*		GROUP BY tipo, nro ;
*!*		into cursor cIC
*!*	INDEX on cNrocomp TAG cNrocomp	
*!*	SUM totalaplica TO taplica


*!*	SELECT cIva
*!*	SET RELATION TO cNrocomp INTO cQC, cNrocomp INTO cIC

*SELECT descrip, corredor, ivaventa.tipo+TRANSFORM(Ivaventa.ptoven,"@L 9999")+"-"+TRANSFORM(Ivaventa.factura,"@L 99999999") as cNrocomp, totalfactu, iva, fechaimp ;
	FROM dbc/admin!ivaventa ;
	LEFT OUTER JOIN dbc/VENTAS!quecobro ON quecobro.tipo+nrocomp = cNrocomp ;
	WHERE BETWEEN(IVAVENTA.fechaimp,lddesde,ldhasta) AND Ivaventa.tipo <> "RE" AND  Ivaventa.tipo <> "DI" AND  Ivaventa.tipo <> "CI" ;
	ORDER BY descrip;
	INTO CURSOR cIva2 READWRITE
	
	
SELECT DESCRIP, cod_suc+TIPO+TRANSFORM(IVACOMP.PTOVEN,"@L 9999")+"-"+TRANSFORM(IVACOMP.FACTURA,"@L 99999999") AS cNrocomp, TOTALFACTU, IVAFACTU, FECHAIMP ;
		FROM admin!IVACOMP ;
		WHERE DTOS(FECHAIMP) < dtos(lddesde) ; 
		ORDER BY DESCRIP;
		INTO CURSOR cIva2 READWRITE
		
		* AND IVACOMP.TIPO <> "OP" AND  IVACOMP.TIPO <> "DI" AND  IVACOMP.TIPO <> "CI" 
		*		IVACOMP.FECHAIMP >= lddesde AND IVACOMP.FECHAIMP <= ldhasta
