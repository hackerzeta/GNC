CLOSE ALL
CLEA ALL

SET CLASSLIB  TO \GESTION_COMERCIAL\vcx\system          
SET CLASSLIB  TO \GESTION_COMERCIAL\vcx\base            ADDITIVE
SET CLASSLIB  TO \GESTION_COMERCIAL\vcx\generica        ADDITIVE
SET CLASSLIB  TO \GESTION_COMERCIAL\vcx\herramientas    ADDITIVE
SET CLASSLIB  TO \GESTION_COMERCIAL\vcx\contabilidad    ADDITIVE
SET CLASSLIB  TO \GESTION_COMERCIAL\vcx\compras         ADDITIVE
SET CLASSLIB  TO \GESTION_COMERCIAL\vcx\produccion      ADDITIVE
SET CLASSLIB  TO \GESTION_COMERCIAL\vcx\productos       ADDITIVE
SET CLASSLIB  TO \GESTION_COMERCIAL\vcx\fondos          ADDITIVE
SET CLASSLIB  TO \GESTION_COMERCIAL\vcx\VENTAS          ADDITIVE

OPEN DATABASE \GESTION_COMERCIAL\DBC\ventas
OPEN DATABASE \GESTION_COMERCIAL\DBC\admin
OPEN DATABASE \GESTION_COMERCIAL\libres\libres
OPEN DATABASE \GESTION_COMERCIAL\dbc\equipos

selec 0
use equipos!fuentes_radio
selec 0
use equipos!equipos
set filt to !EMPTY(fuente)
go top
scan
	lccodi = fuente
	lcseriefuente = space(20)
	selec fuentes_radio
	go top
	locate for codigo=lccodi
	if found()
		lcseriefuente = serie
	endif
	selec equipos
	replace seriefuente with lcseriefuente
endscan