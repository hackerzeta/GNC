SELECT tnrointopr,vccodval,vcnroserie,vcfecgest,vcdominio,cod_taller,liquida,fecha_li;
FROM GNC!valcil WHERE VAL(vcnroserie) >= 500 .and. VAL(vcnroserie) <= 600 .and. vcfecgest = {^2012/07/20}
union ;
SELECT tnrointopr, cod_hom as vccodval, ALLTRIM(STR(numero_serie)) as vcnroserie, {} as vcfecgest, '' as vcdominio, '' as cod_taller, 0 as liquida, {} as fecha_li;
FROM GNC!valvulas_ingresadas ;
WHERE numero_serie >= 500 .and. numero_serie <= 600 AND numero_serie ;
NOT in(SELECT VAL(vcnroserie);
FROM GNC!valcil WHERE VAL(vcnroserie) >= 500 .and. VAL(vcnroserie) <= 600 .and. vcfecgest = {^2012/07/20})
