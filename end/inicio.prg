* --- Programa de arranque Gestion_comercial_caefe ---*
* --- 20-06-2004 

* --- Entorno general del Sistema

  _screen.visible         = .f.	
  _screen.enabled         = .f.
  _screen.windowstate     = 2      && maximiza la pantalla del visual (2)
  _screen.titlebar        = 1      && saca la barra de arriba.
  _screen.maxbutton       = .t.
  _screen.minbutton       = .t.
  _screen.closable        = .f.
  _screen.caption         = 'Sistemas de Gestión Comercial 5.1 '
  _screen.icon            = "\Gestion_comercial_caefe\imagenes\filtro.ico" 
  
  CLEAR ALL
  CLOSE ALL
  SET DEVICE TO SCREEN
  SET ANSI       ON 
  SET HELP       OFF
  SET HEADING    OFF
  SET SCOREBOARD OFF
  SET SAFETY     OFF
  SET DATE       TO ITALIAN
  SET CENTURY    ON
  SET STATUS     OFF
  SET ECHO       OFF
  SET TALK       OFF
  SET DELETED    ON
  SET CONFIRM    ON
  SET ESCAPE     OFF
  SET MOUSE      ON
  SET CLOCK      OFF
  SET HOURS      TO 24
  SET AUTOSAVE   ON
  SET SYSMENU    OFF
  SET EXCLUSIVE  OFF
  SET REFRESH    TO 1,1
  SET REPROCESS  TO 3    &&AUTOMATIC
  SET MULTILOCKS ON      && Impide m£lt. bloq. de reg. varios(pero no todos)
  SET LOCK       OFF     && Bloqueo aut. en reports, sums, etc. 
  SET STATUS BAR OFF

*  LCPATH = SYS(5)+"\GESTION_PRUEBA"
*  WAIT WIND LCPATH
*  SET DEFAULT    TO &LCPATH

*  SET DEFAULT    TO \Gestion_comercial_caefe

  lcunidad = alltrim(SYS(5))
*  lcunidad = "S:"
  lcex = "SET DEFAULT TO " + lcunidad + "\Gestion_comercial_caefe"
  &lcex

  SET PROCEDURE  TO \Gestion_comercial_caefe\FUENTES\RUTERR
  SET PROCEDURE  TO \Gestion_comercial_caefe\FUENTES\header         ADDITIVE
  SET PROCEDURE  TO \Gestion_comercial_caefe\FUENTES\header_carga   ADDITIVE
  SET PROCEDURE  TO \Gestion_comercial_caefe\FUENTES\codbar         ADDITIVE
  SET PROCEDURE  TO \Gestion_comercial_caefe\FUENTES\ftp            ADDITIVE
  SET PROCEDURE  TO \Gestion_comercial_caefe\FUENTES\decrypt        ADDITIVE

  SET NOTIFY OFF

  WAIT WINDOW 'Espere el sistema se está configurando' NOWAIT

* --- Rutina que activa la ayuda del sistema --------------------------------
*  SET HELP ON
*  SET HELP TO \Gestion_comercial_caefe\AYUDA\A&JAYUDA.CHM
* ---------------------------------------------------------------------------

* --- Apertura de Procedimientos, Bibliotecas y Bases -----------------------

SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\system          
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\base            ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\generica        ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\herramientas    ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\contabilidad    ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\compras         ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\produccion      ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\productos       ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\fondos          ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\VENTAS          ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\equipos         ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\sueldos         ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\mapimail        ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\reclamos        ADDITIVE
SET CLASSLIB  TO \Gestion_comercial_caefe\vcx\gnc             ADDITIVE

OPEN DATABASE \Gestion_comercial_caefe\DBC\ADMIN
OPEN DATABASE \Gestion_comercial_caefe\DBC\COMPRAS
OPEN DATABASE \Gestion_comercial_caefe\DBC\FONDOS
OPEN DATABASE \Gestion_comercial_caefe\DBC\VENTAS
OPEN DATABASE \Gestion_comercial_caefe\DBC\PRODUCTOS
OPEN DATABASE \Gestion_comercial_caefe\DBC\PRODUCCION
OPEN DATABASE \Gestion_comercial_caefe\LIBRES\LIBRES
OPEN DATABASE \Gestion_comercial_caefe\DBC\VENTAS
OPEN DATABASE \Gestion_comercial_caefe\DBC\EQUIPOS
OPEN DATABASE \Gestion_comercial_caefe\DBC\SUELDOS
OPEN DATABASE \Gestion_comercial_caefe\DBC\GNC
OPEN DATABASE \Gestion_comercial_caefe\RECLAMOS\RECLAMOS



*------ END subsistema
SET CLASSLIB  TO \Gestion_comercial_caefe\end\vcx\end             ADDITIVE
OPEN DATABASE \Gestion_comercial_caefe\end\DBC\end
* --------------------------------------------------------------------------------------------------------

* --- Definicion y arranque Pantalla Principal del Programa -----------------

PUBLIC eligeconclick,paso,pnError,m.logoE,poForm

pnError=0
m.LogoE = .t.
IF USED('USUARIOS')
	SELECT USUARIOS
ELSE	
	SELECT 0
	USE LIBRES\USUARIOS ALIAS USUARIOS
	GO TOP
ENDIF
oApp        = CREATEOBJECT("APP")
oAppS       = CREATEOBJECT("APP_SUELDOS")
*ocambia     = CREATEOBJECT("CAMBIA_RESOLUCION")
*ocambia.cambia(800,600,16)
oEntorno    = CREATEOBJECT("Entorno")
*loForm      = CREATEOBJECT("accesosistema")
oApp.oFondo = CREATEOBJECT("pantalla1")

* Esta llamada deja en oapp propiedades inicializadas con .t./.f. que indican si el
* módulo esta presente en la instalación.
* ###
*= oApp.Chequeo_Subsistemas() && VER BIEN QUE HACE

* --- Rutina que activa la caza de errores ----------------------------------
*ON ERROR oApp.Maneja_Error(ERROR(),LINE(),MESSAGE(),PROGRAM())
* ---------------------------------------------------------------------------

oEntorno.numerousuario = 0  && dejo en cero el usuario activo
oEntorno.usuariologin  = '' && Dejo en blanco en alias del usuario activo
eligeconclick          = .t.  && determina si pone el fondo inicial del menú
paso                   = .t.  && maneja el tipo de boton a mostrar

SELECT 0
USE LIBRES\EMPRESA
GO TOP
oEntorno.membrete      = EMPRESA.MEMBRETE
oEntorno.logo          = EMPRESA.PATHLOGO
oEntorno.logo_ori      = EMPRESA.PATHLOGO
_screen.caption        = EMPRESA.NOMBRE
USE

SELECT USUARIOS
GO TOP
* ---------------------------------------------------------------------------

_screen.enabled         = .t.

_screen.visible         = .t.
* ---------------------------------------------------------------------------
oentorno.numerousuario     = "1"
oentorno.usuariologin      = "SUPER"
DO end\fuentes\end.mpr

READ EVENTS