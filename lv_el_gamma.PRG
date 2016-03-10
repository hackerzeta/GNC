***************** Ver la configuración para LV_EL_GAMMA ***************
set path to dbc

OPEN DATABASE EQUIPOS
OPEN DATABASE VENTAS
OPEN DATABASE PRODUCTOS
SET DATABASE TO EQUIPOS

CREATE SQL VIEW "LV_EL_GAMMA" ; 
   AS SELECT max(mov_elementos.codigo) as cod_mov, Elementos.codigo as codigo_el, Elementos.nombre as nombre_el, Elementos.marca as marca_cod,;
   fabricas.nombre, Elementos.modelo, Elementos.numero_serie, mov_elementos.elemento, mov_elementos.obra,;
   fuentes_radio.prove_fuente as prove_fuente_cod, provedor.nombre as nombre_prove, fuentes_radio.serie,;
   fuentes_radio.fechaini, fuentes_radio.actividad, 000.0 as act_act, fuentes_radio.tipo_fu,;
   obras.nombre as contrato, fuentes_radio.cod_elemen;
   FROM  equipos!elementos;
   LEFT OUTER JOIN equipos!mov_elementos ON  Elementos.codigo = mov_elementos.elemento;
   LEFT OUTER JOIN equipos!eq_fr  ON  Elementos.codigo = Eq_fr.codigo_eq;
   LEFT OUTER JOIN equipos!fuentes_radio  ON  eq_fr.codigo_fr = fuentes_radio.cod_elemen;
   LEFT OUTER JOIN productos!fabricas  ON  elementos.marca = fabricas.codigo;
   LEFT OUTER JOIN compras!provedor  ON  fuentes_radio.prove_fuente = provedor.codigo;
   LEFT OUTER JOIN ventas!obras  ON  mov_elementos.obra = obras.codigo;
   GROUP BY elementos.codigo;
   WHERE val(elementos.nomenclador) in(68,18) .and. Elementos.fecha_baja = {} .and. eq_fr.fecha_baja = {}
