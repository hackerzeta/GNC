OPEN DATABASE c:\sistemagnc\libres\libres
REMOVE TABLE usuarios DELETE
REMOVE TABLE tipospago DELETE
REMOVE TABLE talonarios DELETE
REMOVE TABLE seguridad DELETE
REMOVE TABLE puntosventa DELETE
REMOVE TABLE provincia DELETE
REMOVE TABLE parametros DELETE
REMOVE TABLE monedas DELETE
REMOVE TABLE localidad DELETE
REMOVE TABLE jurisdicciones DELETE
REMOVE TABLE empresa DELETE
REMOVE TABLE conceptos DELETE
REMOVE TABLE comprob DELETE
REMOVE TABLE comprobantes DELETE
REMOVE TABLE ctaplan DELETE
REMOVE TABLE subsistemas DELETE
REMOVE TABLE ivas DELETE
REMOVE TABLE leyenda DELETE
close all

OPEN DATABASE c:\gestion_comercial\libres\libres

USE usuarios AGAIN IN 0
SELECT Usuarios

COPY TO c:/sistemagnc/libres/usuarios.dbf DATABASE c:/sistemagnc/libres/libres.dbc WITH cdx

close tables all
USE subsistemas AGAIN IN 0
SELECT Subsistemas
COPY TO c:/sistemagnc/libres/subsistemas.dbf DATABASE c:/sistemagnc/libres/libres.dbc WITH cdx

close tables all
USE seguridad AGAIN IN 0
SELECT Seguridad

COPY TO c:/sistemagnc/libres/seguridad.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx
close tables all
USE puntosventa AGAIN IN 0
SELECT Puntosventa

COPY TO c:/sistemagnc/libres/puntosventa.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx
close tables all
USE provincia AGAIN IN 0
SELECT Provincia

COPY TO c:/sistemagnc/libres/provincia.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx
close tables all
USE monedas EXCLUSIVE IN 0
SELECT Monedas

COPY TO c:/sistemagnc/libres/monedas.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx
close tables all
USE localidad AGAIN IN 0
SELECT Localidad

COPY TO c:/sistemagnc/libres/localidad.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx
close tables all
USE jurisdicciones AGAIN IN 0
SELECT Jurisdicciones

COPY TO c:/sistemagnc/libres/jurisdicciones.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx
close tables all
USE ctaplan AGAIN IN 0
SELECT Ctaplan

COPY TO c:/sistemagnc/libres/ctaplan.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx
close tables all
USE conceptos AGAIN IN 0
SELECT Conceptos

COPY TO c:/sistemagnc/libres/conceptos.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx
close tables all
USE comprobantes AGAIN IN 0
SELECT Comprobantes

COPY TO c:/sistemagnc/libres/comprobantes.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx
close tables all
USE comprob AGAIN IN 0
SELECT Comprob

COPY TO c:/sistemagnc/libres/comprob.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx

close tables all
USE leyenda AGAIN IN 0
SELECT Leyenda

COPY TO c:/sistemagnc/libres/leyenda.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx
close tables all
USE ivas AGAIN IN 0
SELECT Ivas

COPY TO c:/sistemagnc/libres/ivas.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx
close tables all
USE empresa AGAIN IN 0
SELECT Empresa

COPY TO c:/sistemagnc/libres/empresa.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx
close tables all
USE tipospago AGAIN IN 0
SELECT Tipospago

COPY TO c:/sistemagnc/libres/tipospago.dbf DATABASE c:/sistemagnc/libres/libres.dbc with cdx

CLOSE DATABASES all
CLOSE ALL
OPEN DATABASE c:\sistemagnc\dbc\gnc

REMOVE TABLE vehiculos_usos DELETE
REMOVE TABLE vehiculos_marcas DELETE
REMOVE TABLE valvulas DELETE
REMOVE TABLE usuario_clave DELETE
REMOVE TABLE tipocil DELETE
REMOVE TABLE sucursales DELETE
REMOVE TABLE servicios DELETE
REMOVE TABLE roscas DELETE
REMOVE TABLE marcas DELETE
REMOVE TABLE gases DELETE
REMOVE TABLE crpc DELETE
REMOVE TABLE colores DELETE
REMOVE TABLE reguladores DELETE
REMOVE TABLE operaciones DELETE


CLOSE ALL
OPEN DATABASE c:\gestion_comercial\dbc\gnc

USE operaciones AGAIN IN 0
SELECT operaciones
COPY TO c:/sistemagnc/dbc/operaciones.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx


USE vehiculos_usos AGAIN IN 0
SELECT Vehiculos_usos 
COPY TO c:/sistemagnc/dbc/vehiculos_usos.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
close tables all
USE vehiculos_marcas AGAIN IN 0
SELECT Vehiculos_marcas

COPY TO c:/sistemagnc/dbc/vehiculos_marcas.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
close tables all
USE valvulas AGAIN IN 0
SELECT Valvulas

COPY TO c:/sistemagnc/dbc/valvulas.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
close tables all
USE usuario_clave AGAIN IN 0
SELECT Usuario_clave

COPY TO c:/sistemagnc/dbc/usuario_clave.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
USE tipocil AGAIN IN 0
SELECT tipocil

COPY TO c:/sistemagnc/dbc/tipocil.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
close tables all
USE sucursales AGAIN IN 0
SELECT Sucursales

COPY TO c:/sistemagnc/dbc/sucursales.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
close tables all
USE servicios AGAIN IN 0
SELECT Servicios

COPY TO c:/sistemagnc/dbc/servicios.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
close tables all
USE roscas AGAIN IN 0
SELECT Roscas

COPY TO c:/sistemagnc/dbc/roscas.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx

USE marcas AGAIN IN 0
SELECT Marcas

COPY TO c:/sistemagnc/dbc/marcas.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
USE marcas AGAIN IN 0
SELECT Marcas

COPY TO c:/sistemagnc/dbc/marcas.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
USE gases AGAIN IN 0
SELECT Gases

COPY TO c:/sistemagnc/dbc/gases.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
USE crpc AGAIN IN 0
SELECT Crpc

COPY TO c:/sistemagnc/dbc/crpc.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
USE crpc AGAIN IN 0
SELECT Crpc

COPY TO c:/sistemagnc/dbc/crpc.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
close tables all
USE colores AGAIN IN 0
SELECT Colores

COPY TO c:/sistemagnc/dbc/colores.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx
close tables all
USE reguladores AGAIN IN 0
SELECT Reguladores

COPY TO c:/sistemagnc/dbc/reguladores.dbf DATABASE c:/sistemagnc/dbc/gnc.dbc with cdx