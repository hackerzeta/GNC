PARAMETER cursoraconvertir

if pcount()<>1
   messagebox("Error en el parametro",48,"ATENCION")
   return .F.
endif

local AliasAnterior,AliasNuevo
AliasNuevo="nombreauxiliar"

************************************************************************
***        Uso: Crea un cursor de escritura a partir de uno abierto
***             El original se cierra y queda abierto el de escritura
***             con el mismo alias.
***
***       Nota: No se fija si es un cursor o una tabla
***
*** Parametros: Alias del cursor a convertir en forma de cadena de texto
***
***    Retorna: Verdadero si pudo convertir, caso contrario falso
************************************************************************

*** Selecciona el cursor
IF USED(cursoraconvertir)
   select (cursoraconvertir)
else
   return .F.
ENDIF

*** recupera el alias
AliasAnterior=ALIAS()

*** recupera el nombre del archivo
Archivo=DBF(AliasAnterior)


USE (Archivo) AGAIN ALIAS (AliasNuevo) IN 0

USE IN (AliasAnterior)

USE (dbf(AliasNuevo)) AGAIN ALIAS (AliasAnterior) IN 0

USE IN (AliasNuevo)

SELE (AliasAnterior)

RETURN .T.