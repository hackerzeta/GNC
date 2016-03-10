CREATE CURSOR resu(codigo C(10),nombre C(40),direccion C(40),telefono C(30),cuit C(11),saldope N(15,2))

SELECT cta_cte_pro.codigo as codc, ivacomp.codigo as codi, cta_cte_pro.debepeso, cta_cte_pro.haberpeso, ivacomp.totalfactu ;
FROM COMPRAS!cta_cte_pro INNER JOIN ADMIN!ivacomp ON cta_cte_pro.codigo = ivacomp.codigo ;
WHERE cta_cte_pro.ptoven = ivacomp.ptoven AND cta_cte_pro.factura = ivacomp.factura AND INLIST(val(cta_cte_pro.codigo),2,989) ;
INTO CURSOR cUnion

*SUM totalfactu TO a

SELECT cta_cte_pro.codigo as codc, cta_cte_pro.debepeso, provedor.nombre,provedor.direccion,provedor.telefono,provedor.cuit ;
FROM COMPRAS!cta_cte_pro INNER JOIN compras!provedor ON cta_cte_pro.codigo = provedor.codigo ;
WHERE INLIST(val(cta_cte_pro.codigo),2,989) AND !EMPTY(cta_cte_pro.debepeso);
INTO CURSOR cCte

SELECT cCte.codc, cUnion.totalfactu, cCte.debepeso, cCte.nombre, cCte.direccion, cCte.telefono, cCte.cuit FROM cUnion ;
INNER JOIN cCte ON cUnion.codc = cCte.codc ;
GROUP BY cCte.codc ; 
INTO CURSOR cFinal

*SUM debepeso TO b

SCAN 
	nSaldo = cFinal.totalfactu - cFinal.debepeso
	cCod = cFinal.codc
	cNombre = cFinal.nombre
	cDire = cFinal.direccion
	cTel = cFinal.telefono
	cCuit = cFinal.cuit
	INSERT INTO resu(codigo,nombre,direccion,telefono,cuit,saldope) VALUES(cCod,cNombre,cDire,cTel,cCuit,nSaldo)
ENDSCAN 
