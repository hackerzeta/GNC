CLOSE TABLES ALL
set defa to dbc
use mov_elemen2 excl
zap
use mov_elementos excl in 0

select mov_elementos
scan
	scatter memo memvar
	fecha_mov = fecha
	tipo_mov = tipo
	usermodi = usuario
	insert into mov_elemen2 from memvar
endscan

close tables all

set database to equipos
rename table mov_elementos to mov_elementos_ant
rename table mov_elemen2 to mov_elementos