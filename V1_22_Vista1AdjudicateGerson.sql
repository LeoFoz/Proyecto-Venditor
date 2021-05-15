-- ______________________________
--  Autor Gerson
-- ______________________________

-- Vista para Adjudicatedstate // PaymenttAttempts

alter view Adjudicatedstate as
select
AdjState.AdjudicateStateId as Adjudicated_ID,
PayAtt.Amount as Cantidad,
PayAtt.Posttime as Fecha,
PayAtt.PaymentTimeStamp as Time_Stamp,
PayAtt.UserId as Usuario_ID,
PayAtt.Description as Descripcion
-- usuario.Name as Nombre,
-- comision.Comission as Comision

from `AdjudicateStates` as AdjState
inner join PaymenttAttempts as  PayAtt on (AdjState.`PaymentAttemptId`= PayAtt.`PaymentAttemptId`);
-- inner join Users as usuario on (usuario.UserId = PayAtt.UserId)
-- inner join Comissions as comision on (comision.ComissionId = PayAtt.ComissionId);

-- select * from Adjudicatedstate;