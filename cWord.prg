*--------------------------------------------------
* Clase cWord
*--------------------------------------------------
DEFINE CLASS cWord AS CUSTOM
  *--
  * Propiedades
  *--
  oWord = .NULL.   &&   Objeto Word
  cDirApp = ADDBS(SYS(5) + SYS(2003))
  cDirDat = ADDBS(HOME(2) + 'Northwind')
  cDataSource = ''
  *--------------------------------------------------
  * Creo el servidor de automatización
  *--------------------------------------------------
  PROCEDURE CrearServidor()
    *-- Creo el objeto
    THIS.oWord = CREATEOBJECT('Word.Application')
    RETURN VARTYPE(THIS.oWord) = 'O'
  ENDPROC
  *--------------------------------------------------
  * Cierro el servidor de automatización
  *--------------------------------------------------
  PROCEDURE CerrarServidor()
    *-- Cierro Word
    THIS.oWord.QUIT()
    THIS.oWord = .NULL.
    RETURN
  ENDPROC
  *--------------------------------------------------
  * Abro la Carta, si no existe la creo
  *--------------------------------------------------
  PROCEDURE AbrirCarta(tcArchivo)
    LOCAL loDoc AS 'Word.Document'
    tcArchivo = FORCEEXT(tcArchivo,'DOC')
    IF NOT FILE(THIS.cDirApp + tcArchivo)
      *-- Si no existe la carta, la creo
      loDoc = THIS.CrearCarta(tcArchivo)
    ELSE
      *-- Si existe la carta, la abro
      loDoc = THIS.oWord.Documents.OPEN(THIS.cDirApp + tcArchivo)
      *-- y me aseguro que no tiene un documento asociado
      loDoc.MailMerge.MainDocumentType = -1  && wdNotAMergeDocument
    ENDIF
    *-- Retorno un objeto Document
    RETURN loDoc
  ENDPROC
  *--------------------------------------------------
  * Creo la Carta
  *--------------------------------------------------
  PROCEDURE CrearCarta(tcArchivo)
    LOCAL loDoc AS 'Word.Document'
    *-- Creo un nuevo documento
    loDoc = THIS.oWord.Documents.ADD(,,0)
    *-- Guardo el documento como ...
    loDoc.SAVEAS(THIS.cDirApp + tcArchivo)
    *-- Activo el documento
    loDoc.ACTIVATE
    *-- Comienzo a 'escribir' el documento
    WITH THIS.oWord.SELECTION
      .FONT.NAME = 'Tahoma'
      .FONT.SIZE = 10
      .ParagraphFormat.ALIGNMENT = 2 && wdAlignParagraphRight
      .TypeText('San Miguel de Tucumán, ' + DTOC(DATE()))
      .TypeParagraph
      .ParagraphFormat.ALIGNMENT = 0 && wdAlignParagraphLeft
      .TypeParagraph
      .TypeParagraph
      .TypeParagraph
      .TypeParagraph
      .TypeParagraph
      .TypeParagraph
      .TypeText('Señores: ')
      .FONT.Bold = .T.
      .FIELDS.ADD(.RANGE, -1, 'MERGEFIELD  CompanyName ')
      .FONT.Bold = .F.
      .TypeParagraph
      .TypeText('At: ')
      .FIELDS.ADD(.RANGE, -1, 'MERGEFIELD  ContactName ')
      .TypeParagraph
      .FIELDS.ADD(.RANGE, -1, 'MERGEFIELD  Address ')
      .TypeParagraph
      .FIELDS.ADD(.RANGE, -1, 'MERGEFIELD  PostalCode')
      .TypeText(' - ')
      .FIELDS.ADD(.RANGE, -1, 'MERGEFIELD  City ')
      .TypeParagraph
      .FONT.Underline = 1  && wdUnderlineSingle
      .FIELDS.ADD(.RANGE, -1, 'MERGEFIELD  Country ')
      .FONT.Underline = 0  && wdUnderlineSingle
      .TypeParagraph
      .TypeParagraph
      .TypeParagraph
      .TypeParagraph
      .TypeText(CHR(9) + 'Estimado/a ')
      .FIELDS.ADD(.RANGE, -1, 'MERGEFIELD  ContactName ')
      .TypeParagraph
      .TypeParagraph
      .TypeText(CHR(9) + 'Nos dirigimos a Ud. con el objeto de comunicarle ' + ;
        'la nueva dirección de nuestra empresa')
      .TypeParagraph
      .TypeParagraph
      .FONT.Bold = .T.
      .TypeText('Informática del Tucumán')
      .FONT.Bold = .F.
      .TypeParagraph
      .TypeText('9 de Julio 123, 1° Piso')
      .TypeParagraph
      .TypeText('4000 - San Miguel de Tucumán')
      .TypeParagraph
      .TypeText('Tucumán, Argentina')
      .TypeParagraph
      .TypeText('Teléfono (+54) (381) 681-4521')
      .TypeParagraph
      .TypeParagraph
      .TypeText(CHR(9) + 'Sin otro particular lo saludamos atte.')
      .TypeParagraph
      .TypeParagraph
      .TypeParagraph
      .TypeParagraph
      .TypeParagraph
      .TypeParagraph
      .TypeText('Manuel Belgrano')
      .TypeParagraph
      .TypeText('Socio Gerente')
      .TypeParagraph
      .TypeText('Informática del Tucumán')
      .TypeParagraph
    ENDWITH
    *-- Retorno un objeto Document
    RETURN loDoc
  ENDPROC
  *--------------------------------------------------
  * Creo archivo DataSource
  *--------------------------------------------------
  PROCEDURE GenerarDataSource
    LOCAL lcArchivo AS CHARACTER
    IF NOT DBUSED('Northwind')
      OPEN DATABASE (THIS.cDirDat + 'Northwind') SHARED
    ENDIF
    SET DATABASE TO 'Northwind'
    *-- Consulta a los Clientes de Northwind
    SELECT CompanyName, ContactName, ;
      Address, PostalCode, City, Country ;
      FROM Customers ;
      INTO CURSOR Clientes
    *-- Copio el cursor al archivo para combinar
    lcArchivo = SYS(2015)
    COPY TO (THIS.cDirApp + lcArchivo) TYPE CSV
    USE IN Clientes
    THIS.cDataSource = THIS.cDirApp + FORCEEXT(lcArchivo,'CSV')
    RETURN
  ENDPROC
  *--------------------------------------------------
  * Combino la Carta
  *--------------------------------------------------
  PROCEDURE CombinarCarta(toDoc)
    WITH toDoc.MailMerge
      .MainDocumentType = 0  && wdFormLetters
      .OpenDataSource(THIS.cDataSource)
      .Execute()
    ENDWITH
    WITH THIS.oWord
      *-- Cambio la Carpeta del cuadro de diálogo 'Guardar...'
      .ChangeFileOpenDirectory(THIS.cDirApp)
      *-- Maximizo y hago visible
      .WINDOWSTATE = 1  && wdWindowStateMaximize
      .VISIBLE = .T.  && True
    ENDWITH
    RETURN
  ENDPROC
  *--------------------------------------------------
  * Guardo el Documento, si tlCierra = .T. lo cierra
  *--------------------------------------------------
  PROCEDURE GuardarCarta(toDoc, tlCierra)
    *-- Guardo el documento
    toDoc.SAVE()
    IF tlCierra
      *-- Cierro el documento
      toDoc.CLOSE()
    ENDIF
  ENDPROC
ENDDEFINE
*--------------------------------------------------
* Fin Clase cWord
*--------------------------------------------------