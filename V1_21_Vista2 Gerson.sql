-- ______________________________
--  Autor Gerson
-- ______________________________

-- Vista 2 vista_bidings/interests 

alter view vista_bidings as 
select
bid.`BiddingId`,
bid.`MinimalPrice` as Precio_Minimo,
bid.`ComissonXSale` as Comision,
bid.`posttime` as Fecha,
bid.`Description` as Descripcion,
bid.`State` as Estado,
bid.`UserId`,
interest.`BiddingId` as InterestBiddingID,
interest.`NewComission`,
interest.`ChangeDeal`,
interest.`LastPrice`,
interest.`Agree`

from `Biddings` as bid
inner join Interests as  interest on (interest.`BiddingId`= bid.`BiddingId`);

-- select * from vista_bidings;