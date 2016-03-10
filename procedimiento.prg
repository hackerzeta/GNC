img1=GETFILE('jpg|png')
SET PATH TO end/dbc
SELECT * FROM END!procedimientos WHERE codigo = 1 INTO CURSOR cproc
loWord = CREATEOBJECT("Word.Application")
lodoc = loWord.Documents.open("C:\Users\x\desktop\proc2.doc")

**********   INGRESA AL HEADER, SE MUEVE AL CENTRO Y ESCRIBE 'PROCE..' ***********
loword.ActiveWindow.ActivePane.View.SeekView = 9
loword.Selection.MoveRight(1,3)
loword.Selection.TypeText("PROCEDIMIENTO DE INSPECCIÓN POR PARTICULAS MAGNETICAS Nº "+cproc.tipo_ensayo+" "+ALLTRIM(STR(cproc.codigo))+'/'+"2012 Revisión "+ALLTRIM(STR(cproc.revision)))
**********************************************************************************

**********   VUELVE AL CUERPO DEL DOCUMENTO ***********
loword.ActiveWindow.ActivePane.View.SeekView = 0
*******************************************************

************* SE VA AL FINAL DE LO ESCRITO EN ESE RENGLÓN Y BAJA UNA LINEA (ENTER) ************
LOWORD.Selection.MoveRight(1,22)
loword.Selection.TypeParagraph
***********************************************************************************************

WITH loWord.SELECTION
	.Font.Name = "Century Gothic"
	.Font.Bold = 0
	.TypeText(descripcion)
	
	****** SELECCIONAR TODO *******
	* loword.Selection.WholeStory *
	*******************************
	*************** CAMBIAR FUENTE ******************
	* loword.Selection.Font.Name = "Century Gothic" *
	*************************************************
	******* PONER EN NEGRITA *********
	* loword.Selection.Font.Bold = 1 *
	**********************************
	
*	.InlineShapes.AddPicture("C:\Users\x\Pictures\3E\show_image_in_imgtag.jpg", .F., .T.)

	.InlineShapes.AddPicture(img1, .F., .T.)

*	.FIELDS.ADD(.RANGE, -1, 'MERGEFIELD  descripcion ')
ENDWITH

******* INGRESA AL FOOTER Y AGREGA LOS REG. MIENTRAS SE MUEVE POR LAS DISTINTAS CELDAS *******
loword.ActiveWindow.ActivePane.View.SeekView = 10
loword.Selection.MoveDown
loword.Selection.TypeText(cproc.tipo_ensayo+" "+ALLTRIM(STR(cproc.codigo))+'/'+"2012")
loword.Selection.Move(1,1)
loword.Selection.TypeText("REV. "+ALLTRIM(STR(cproc.revision)))
loword.Selection.Move(1,1)
loword.Selection.TypeText("Ing Jorge A Amsler")
loword.Selection.Move(1,1)
loword.Selection.TypeText("Ing Jorge A Amsler")
loword.Selection.Move(1,1)
loword.Selection.TypeText("Ing Jorge A Amsler")
loword.Selection.Move(1,1)
loword.Selection.TypeText(DTOC(FMODI))
**********************************************************************************************

loWord.ActiveDocument.SAVEAS('C:\Users\x\Desktop\pruebaDoc.doc')
*loword.ActiveDocument.SAVEAS('C:\Users\x\Desktop\pruebaDoc.PDF')
*loword.ActiveDocument.ExportAsFixedFormat('C:\Users\x\Desktop\pruebaDoc.doc','PDF',.T.,1,1,1,1)
loword.Quit

