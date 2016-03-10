LOCAL lndebe, lnhaber
lndebe  = 0
lnhaber = 0
SELECT conciliado AS C1, referencia AS C2, fecha AS C3, fechadepo AS C4, debe AS C5, haber AS C6, concepto AS C7, dador AS C8, nrocheque, cargobanco, u_conci, f_conci, nrobanco FROM dbc/banco ORDER BY 4 INTO CURSOR cBanco READWRITE 

INDEX on C4 TAG C4
dFec1 = C4
contador = 0

dFec = DATE() - 90
DO WHILE .T.
	dFec = dFec +1
	IF DOW(dFec) = 7
*		INSERT INTO (thisform.ccu)(C3,C4,C6,C7)values(dFec,'totalizador', 0,0)
		APPEND BLANK
		REPLACE C4 WITH dFec, C7 WITH 'TOTALIZADOR'
	ENDIF
	IF dFec = DATE() + 180
		EXIT
	ENDIF
ENDDO
GO TOP

DO WHILE !EOF()
	dFec =  C4
	DO WHILE dFec =  C4 AND !EOF()
		lndebe = lndebe + C5
		lnhaber = lnhaber + C6	
		SKIP
	ENDDO
	
	IF DOW(dFec) = 7
		SKIP -1
		contador = contador + 1	
		* insertar totales 
		* restear variables
		IF C7 = 'TOTALIZADOR'
			REPLACE C5 WITH lndebe, C6 WITH lnhaber
		ENDIF
*		INSERT INTO cBanco (C4,C7,C5,C6)values(dFec,ALLTRIM(STR(DOW(dFec1)))+' - '+ALLTRIM(STR(DOW(dFec))),lndebe,lnhaber)
		lndebe  = 0
		lnhaber = 0
		dFec1 = C4
		SKIP 1
	ENDIF
ENDDO
BROW