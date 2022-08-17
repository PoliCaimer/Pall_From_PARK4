--ID: PALL_FROM_PARK4
--FREQUENCY: DAILY
--PURPOSE: 
--FROM: SU
--FOR: 004 CDC
--AUTHOR: AADDE
--REPORT: NO
--ORIGINAL FROM : AADDE

SELECT
logguser, 
COUNT(carrno) as ILE

FROM 
ASTRO_VIEW_CNT_SVL16001

WHERE 
l16lcode = '3'
and mha in ('24F1', '24F2', '24F3', '24F4', 'AUDI4', 'PACK1', 'PACK2')
and datreg between @('OD', #DATETIME) and @('DO', #DATETIME)
and carrno in
(
  SELECT
  carrno

  FROM 
  ASTRO_VIEW_CNT_SVL16001

  WHERE 
  l16lcode = '17'
  and mha = 'PARK4'
)

GROUP BY
logguser

ORDER BY
logguser