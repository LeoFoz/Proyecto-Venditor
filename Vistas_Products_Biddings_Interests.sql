alter view vista_products as
select 
pr.`Productid`, 
pr.`Name` as Nombre_Producto, 
pr.`Description` as Descripcion, 
pr.`PriceSale`as Precio , 
pc.`ProductCategoryId` as Categoria,
bp.`Productid` as Bloqueados,
pi.`Productid` as Imagenes,
cp.`Productid` as Caracteristicas_ID,
pb.`Productid` as Product_X_Bid,
c.`CharacteristicId` as CaracteristicasID,
cname.`Name` as Carcateristicas

from `Products` as pr 
left join `productcategory` as pc on (pr.`ProductCategoryId`=pc.`ProductCategoryId`)
left join (select Productid from Pictures ) as pi on (pi.`Productid` = pr.`Productid`)
left join (select Productid from CharacterisXProduct) as cp on  (cp.`Productid`= pr.Productid)
left join (select Productid from BlockedProducts) as bp on (bp.Productid = pr.Productid)
left join (select Productid from ProductsByBid) as pb on (pb.Productid = pr.Productid)
left join (select CharacteristicId from Characteristics) as c on ( c.`CharacteristicId`=pr.Productid)
left join (select `Name` from Characteristics) as cname on (pr.Productid = c.`CharacteristicId`);

select * from vista_products;



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
comission.`NewComission`,
ChDeal.`ChangeDeal`,
lprice.`LastPrice`,
a.`Agree`

from `Biddings` as bid
left join (select BiddingId from Interests) as  interest on (interest.`BiddingId`= bid.`BiddingId`)
left join (select `ChangeDeal` from Interests) as  ChDeal on (interest.`BiddingId`= bid.`BiddingId`)
left join (select `NewComission` from Interests) as  comission on (interest.`BiddingId`= bid.`BiddingId`)
left join (select `LastPrice` from Interests) as  lprice on (interest.`BiddingId`= bid.`BiddingId`)
left join (select `Agree` from Interests) as  a on (interest.`BiddingId`= bid.`BiddingId`);

select * from vista_bidings;