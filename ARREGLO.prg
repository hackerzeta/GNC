IF thisform.ntipoinsc # '5'  && exento
	SELECT nombre,imputacion FROM libres!conceptos WHERE ALLTRIM(codigo)==ALLTRIM(lcimpuesto) AND codigo#"RG" AND codigo#"RB" AND codigo#"RI" INTO CURSOR resu
else
	SELECT nombre,imputacion FROM libres!conceptos WHERE ALLTRIM(codigo)==ALLTRIM(lcimpuesto) AND codigo#"RG" AND codigo#"RB" AND codigo#"RI" AND !INLIST(CODIGO,'IG','IV') INTO CURSOR resu
endif	
