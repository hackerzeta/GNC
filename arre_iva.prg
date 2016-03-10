close all
set cent on
set date ital

begin transaction
set step on

create cursor no_esta(codigo n(10),ptoven n(4),factura N(10),tabla n(1))
selec 0
use dbc\ivacomp
selec 0
use dbc\ivac
selec 0
use caefe
scan
	m.factura = f8
	m.ptoven = f7
	m.codigo = f6
	m.fecha  = fecha
	selec ivacomp
	go top
	locate for ptoven=m.ptoven and factura=m.factura and val(codigo)=m.codigo
	if found()
		replace fechaimp with m.fecha
	else
		selec no_esta
		append blank
		replace codigo  with m.codigo
		replace ptoven  with m.ptoven
		replace factura with m.factura
		replace tabla   with 1
	endif

	selec ivac
	go top
	locate for ptoven=m.ptoven and factura=m.factura and val(codigo)=m.codigo
	if found()
		replace fechaimp with m.fecha
	else
		selec no_esta
		append blank
		replace codigo  with m.codigo
		replace ptoven  with m.ptoven
		replace factura with m.factura
		replace tabla   with 2
	endif

endscan