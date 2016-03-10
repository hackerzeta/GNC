************************
****** MES.PRG
************************
Parameter dFecha
if Type('dFecha') # 'D'
OR EMPTY(dFecha)
Return ''
Endif

LOCAL cDevuelve

Store '' to cDevuelve
Dimension aMeses(12)
aMeses(1) = 'Enero'
aMeses(2) = 'Febrero'
aMeses(3) = 'Marzo'
aMeses(4) = 'Abril'
aMeses(5) = 'Mayo'
aMeses(6) = 'Junio'
aMeses(7) = 'Julio'
aMeses(8) = 'Agosto'
aMeses(9) = 'Septiembre'
aMeses(10) = 'Octubre'
aMeses(11) = 'Noviembre'
aMeses(12) = 'Diciembre'

cDevuelve = aMeses(Month(dFecha))
Return cDevuelve 