*-------------------------------------------------
* Combinar.prg
*-------------------------------------------------
LOCAL lo AS OBJECT, loDoc AS OBJECT
lo = NEWOBJECT('cWord','cWord.prg')
IF lo.CrearServidor()
   *-- Ejecuto métodos de la clase
   loDoc = lo.AbrirCarta('MiCarta')
   lo.GenerarDataSource()
   lo.CombinarCarta(loDoc)
   lo.GuardarCarta(loDoc, .T.)
ELSE
   MESSAGEBOX('No se pudo instanciar el servidor', 16, 'Error!')
ENDIF
lo = .NULL.
RETURN
*-------------------------------------------------
* Fin Combinar.prg
*-------------------------------------------------