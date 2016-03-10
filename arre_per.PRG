close data all
selec 0
use libres\seguridad
set filt to fecha=date()
go top
set step on
scan
	n = 1
	do while n <= 60
		usuario = 'usuario'+alltrim(str(n))
		replace &usuario with 1
		n = n +1
	enddo
endscan	