clear all
clear
close data all
set sysm to defa
clear memo

= adir(lavcx,"/gestion_comercial/vcx/*.vcx")

for i=1 to alen(lavcx,1)
	select 0
	lcarch="vcx/"+lavcx(i,1)
	USE (lcarch)
	SCAN
		lcproperties=alltrim(upper(properties))
		LNPO = at("PICTURE",lcproperties)
		IF( lnpo > 0 )
			lnPo1  = lnPo + 10
			lcAux  = SUBSTR(lcproperties,lnpo1)
			lnPo1  = AT(CHR(13),lcAux)
			lcAux  = SUBSTR(lcAux,1,lnPo1-1)
			lcRem  = lcAux
			
			IF( AT("ICONOS",ALLTRIM(UPPER(lcRem))) > 0 )
				lnPo1  = RAT("\",lcAux)
				lcFile = SUBSTR(lcAux,lnPo1)
				lcFile = "..\ICONOS" + lcFile
				REPLACE properties WITH STRTRAN(ALLTRIM(UPPER(properties)),ALLTRIM(UPPER(lcRem)),ALLTRIM(UPPER(lcFile)))
			ELSE
				lnPo1  = RAT("\",lcAux)
				lcFile = SUBSTR(lcAux,lnPo1)
				lcFile = "..\IMAGENES" + lcFile
				REPLACE properties WITH STRTRAN(ALLTRIM(UPPER(properties)),ALLTRIM(UPPER(lcRem)),ALLTRIM(UPPER(lcFile)))
			ENDIF	
		ENDIF
	ENDSCAN
	use
	wait wind lcarch + " (" + alltrim(str(i)) + "/" + alltrim(str(alen(lavcx,1))) + ")" nowait
endfor