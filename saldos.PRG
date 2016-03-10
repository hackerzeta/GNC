SET ENGINEBEHAVIOR = 70

SET DEFAULT TO \\servidor\sistemas\gestion_comercial

USE dbc/cta_cte_pro

SELECT cta_cte_pro.codigo ,provedor.nombre, sum(cta_cte_pro.debepeso-cta_cte_pro.haberpeso) as saldope ;
	   FROM compras!cta_cte_pro ;
	   INNER JOIN compras!provedor ON cta_cte_pro.codigo = provedor.codigo ;
	   INNER JOIN admin!ivacomp ON cta_cte_pro.codigo = ivacomp.codigo ;
	   WHERE VAL(cta_cte_pro.codigo) = 989 .AND. cta_cte_pro.fecha <= {^2012-06-30} ;
	   .AND. Debepeso!=haberpeso AND empty(ivacomp.adelanto) GROUP BY provedor.codigo ORDER BY &orden;
	   INTO CURSOR resu