-- ______________________________
-- Autor: Leonardo Fariña
-- Fecha: 14/05/2021
-- Descripcion: Generamos una consulta  para ver el volumen de operaciones de uso del sistema por mes. En un rango de 
-- fechas, clasificado entre bajo volumen, volumen medio y volumen alto.
-- ______________________________

WITH STADISTICA AS
 (	SELECT COUNT(BiddingId) AS Operaciones,'Enero' as MES FROM Biddings
	WHERE MONTH(posttime)=1 AND YEAR(posttime)=YEAR(NOW())
    UNION ALL
    SELECT COUNT(BiddingId) AS Operaciones,'Febrero' as MES FROM Biddings
	WHERE MONTH(posttime)=2 AND YEAR(posttime)=YEAR(NOW())
    UNION ALL
    SELECT COUNT(BiddingId) AS Operaciones,'Marzo' as MES FROM Biddings
	WHERE MONTH(posttime)=3 AND YEAR(posttime)=YEAR(NOW())
    UNION ALL
    SELECT COUNT(BiddingId) AS Operaciones,'Abril' as MES FROM Biddings
	WHERE MONTH(posttime)=4 AND YEAR(posttime)=YEAR(NOW())
    UNION ALL
    SELECT COUNT(BiddingId) AS Operaciones,'Mayo' as MES FROM Biddings
	WHERE MONTH(posttime)=5 AND YEAR(posttime)=YEAR(NOW())
    UNION ALL
    SELECT COUNT(BiddingId) AS Operaciones,'Junio' as MES FROM Biddings
	WHERE MONTH(posttime)=6 AND YEAR(posttime)=YEAR(NOW())
    UNION ALL
    SELECT COUNT(BiddingId) AS Operaciones,'Julio' as MES FROM Biddings
	WHERE MONTH(posttime)=7 AND YEAR(posttime)=YEAR(NOW())
    UNION ALL
    SELECT COUNT(BiddingId) AS Operaciones,'Agosto' as MES FROM Biddings
	WHERE MONTH(posttime)=8 AND YEAR(posttime)=YEAR(NOW())
    UNION ALL
    SELECT COUNT(BiddingId) AS Operaciones,'Septiembre' as MES FROM Biddings
	WHERE MONTH(posttime)=9 AND YEAR(posttime)=YEAR(NOW())
    UNION ALL
    SELECT COUNT(BiddingId) AS Operaciones,'Octubre' as MES FROM Biddings
	WHERE MONTH(posttime)=10 AND YEAR(posttime)=YEAR(NOW())
    UNION ALL
    SELECT COUNT(BiddingId) AS Operaciones,'Noviembre' as MES FROM Biddings
	WHERE MONTH(posttime)=11 AND YEAR(posttime)=YEAR(NOW())
    UNION ALL
    SELECT COUNT(BiddingId) AS Operaciones,'Diciembre' as MES FROM Biddings
	WHERE MONTH(posttime)=12 AND YEAR(posttime)=YEAR(NOW())
    )
SELECT Operaciones,Mes,
  CASE 
    WHEN  Operaciones >= 10000 THEN 'Alto'
    WHEN  Operaciones >= 1000 THEN 'Medio'
    ELSE 'Bajo'
  END
  AS Volumen
FROM STADISTICA;


