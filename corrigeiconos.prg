clear all
clear
close data all
set sysm to defa
clear memo

=adir(lavcx,"/GESTION_COMERCIAL/vcx/*.vcx")

for i=1 to alen(lavcx,1)
	select 0
	lcarch="/GESTION_COMERCIAL/vcx/"+lavcx(i,1)
	USE (lcarch)
	SCAN
		lcproperties=alltrim(upper(properties))
		LNPO = at("ICON",lcproperties)
		IF( lnpo > 0 )
			LNPO1      = at(".ICO",lcproperties)
			lcoriginal = SUBSTR(lcproperties,lnpo,lnpo1+4-lnpo)
			lcaux      = lcoriginal
			lnpo2      = RAT('\',lcaux)
			lcqueda    = "ICON = ..\imagenes\"+substr(lcaux ,lnpo2+1)
			replace properties with strtran(alltrim(upper(properties)),alltrim(upper(lcoriginal)),lcqueda)
		ENDIF
	ENDSCAN
	use
	wait wind lcarch + " (" + alltrim(str(i)) + "/" + alltrim(str(alen(lavcx,1))) + ")" nowait
endfor