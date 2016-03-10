* SACA LA BARRA / DE OBLEAS NUEVAS Y ANTERIORES

SELECT OBLEAS

SCAN FOR EOF() = .F.
	cNuevo = alltrim(obleas.OBLEA_NUE)
	cAnterior = alltrim(obleas.OBLEA_ant)

	replace oblea_nue with ALLTRIM(SUBSTR(cNuevo, 1, ATC("/", cNuevo)-1) + SUBSTR(cNuevo, ATC("/", cNuevo) + 1, LEN(cNuevo) - ATC("/", cNuevo)))
	replace oblea_ant with ALLTRIM(SUBSTR(cAnterior, 1, ATC("/", cAnterior)-1) + SUBSTR(cAnterior, ATC("/", cAnterior) + 1, LEN(cAnterior) - ATC("/", cAnterior)))
endscan

SELECT OBLEAS_cilindros

SCAN FOR EOF() = .F.
	cNuevo = alltrim(obleas_cilindros.OBLEA)

	replace oblea with ALLTRIM(SUBSTR(cNuevo, 1, ATC("/", cNuevo)-1) + SUBSTR(cNuevo, ATC("/", cNuevo) + 1, LEN(cNuevo) - ATC("/", cNuevo)))
endscan