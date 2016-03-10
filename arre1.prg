close table all
use admin!ventas alias ventas
selec 0
use productos!artic alias artic
go top
selec ventas
set filter to substr(alltrim(str(cuenta)),1,3)='114'
go top
scan 
	lnimpu = cuenta
	selec artic
	locate for ctacompra=lnimpu
	if found()
		selec ventas
		replace cuenta with artic.ctaventa
	endif
	selec ventas
endscan
