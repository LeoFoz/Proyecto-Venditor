-- Vista 1 Vista_Products

alter view vista_products as
select 
pr.`Productid`, 
pr.`Name` as Nombre_Producto, 
pr.`Description` as Descripcion, 
pr.`PriceSale`as Precio , 
pc.`Name` as Categoria,
bp.`Productid` as Bloqueados ,
pi.`picutreId` as Imagenes,
cp.`Value` as Caracteristicas,
pb.`Quantity` as Product_X_Bid,
c.`CharacteristicId` as CaracteristicasID,
c.`Name` as Carcateristicas,
c.`DescriptionHTML` as DescripcionHTML 

from `Products` as pr 

inner join `productcategory` as pc on (pr.`ProductCategoryId`=pc.`ProductCategoryId`)
inner join  Pictures as pi on (pi.`Productid` = pr.`Productid`)
inner join CharacterisXProduct as cp on  (cp.`Productid`= pr.Productid)
left join BlockedProducts as bp on (bp.Productid = pr.Productid) 
left join ProductsByBid as pb on (pb.Productid = pr.Productid)
inner join Characteristics as c on ( c.`CharacteristicId`=pr.Productid);


select * from vista_products;

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

select * from vista_bidings;

-- Vista para Adjudicatedstate // PaymenttAttempts

alter view Adjudicatedstate as
select
AdjState.AdjudicateStateId as Adjudicated_ID,
PayAtt.Amount as Cantidad,
PayAtt.Posttime as Fecha,
PayAtt.PaymentTimeStamp as Time_Stamp,
PayAtt.UserId as Usuario_ID,
PayAtt.Description as Descripcion,
usuario.Name as Nombre,
comision.Comission as Comision

from `AdjudicateStates` as AdjState
inner join PaymenttAttempts as  PayAtt on (AdjState.`PaymentAttemptId`= PayAtt.`PaymentAttemptId`)
inner join Users as usuario on (usuario.UserId = PayAtt.UserId)
inner join Comissions as comision on (comision.ComissionId = PayAtt.ComissionId);

select * from Adjudicatedstate;