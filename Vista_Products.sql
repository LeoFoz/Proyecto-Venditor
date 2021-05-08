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