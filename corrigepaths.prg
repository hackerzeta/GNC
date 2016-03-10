clear all
clear
close data all
set sysm to defa
clear memo


=adir(lavcx,"/gestion_comercial/vcx/*.vcx")

for i=1 to alen(lavcx,1)
	select 0
	lcarch="/gestion_comercial/vcx/"+lavcx(i,1)
	USE (lcarch)
	SCAN
		lcclassloc=alltrim(classloc)
		LNPO = rat("\",lcclassloc)
		IF( lnpo > 0 )
			lcqueda=substr(lcclassloc,lnpo+1)
			replace classloc with lcqueda
		ENDIF
	ENDSCAN
	use
	wait wind lcarch + " (" + alltrim(str(i)) + "/" + alltrim(str(alen(lavcx,1))) + ")" nowait
endfor