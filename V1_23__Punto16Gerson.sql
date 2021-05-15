-- ______________________________
--  Autor Gerson
-- ______________________________
-- Consulta de aquellos dineros que no se han podido cobrar (pto.16)


select PA.Amount,year(PA.Posttime) as año,month(PA.Posttime) as mes,PA.UserId ,User.Name,I.LastPrice
from PaymenttAttempts PA 
join PaymentStatus PS on PA.PaymentAttemptId=PS.PaymentStatusId
join Users User on User.UserId=PA.UserId
join Interests  I on I.InterestId=PA.InterestId 
WHERE PS.name="En proceso"
group by   mes 
order by  año, mes, PA.UserId;
