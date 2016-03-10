SET ENGINEBEHAVIOR 70

	USE dbc/facturav

	SELECT remito,ptovenremi, fecha, Codigoar ,provedor,deposito, sum(cantidad) as canti FROM VENTAS!remitov;
    GROUP BY ptovenremi,remito ;
    INTO CURSOR RESU
	totreg = _tally
	nActual = 0
SCAN 
	nActual = nActual + 1

	lnre = remito	
	lcco  = TRANSFORM(ptovenremi,'@L 9999')+'-'+TRANSFORM(remito,'@L 99999999')
	lcprovedor  = alltrim(provedor)
	lnptovenremi= ptovenremi

	select remitov
	SUM cantidad FOR remito = val(righ(lcco,8)) AND ptovenremi=lnptovenremi AND alltrim(provedor)=alltrim(lcprovedor) to lnremi

	select facturav

	* Este bolinqui es para generar "1234" a partir de 0001-00001234
	lcre = alltrim(str(val(righ(lcco,8)))) 

	SUM cantidad FOR AT(lcre,remitos) > 0  AND ptovenremi=lnptovenremi AND alltrim(provedor)=alltrim(lcprovedor) to lnfactu
	cant = lnremi - lnfactu

	select resu
	if cant = 0
		UPDATE remitov SET facturado = .t. WHERE remito = lnre
	endif	
	SELECT resu
	WAIT WINDOW STR(nActual)+' / '+STR(totReg) NOWAIT
ENDSCAN

