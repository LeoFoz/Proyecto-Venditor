-- ______________________________
--  Autor Gerson
-- ______________________________

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


-- select * from vista_products;