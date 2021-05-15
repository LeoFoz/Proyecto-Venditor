-- ______________________________
-- Autor: Ricardo Soto Araya
-- Fecha: 9/05/2021
-- Descripcion: SP buscar quien quiere que venda las manzanas
-- ______________________________
drop procedure if exists verOfertasVenditor;
delimiter //
create procedure verOfertasVenditor(	
    pUserName varchar(60)

)
begin	
 
select Users.Name 'Venditor looking for bid', Biddings.Description, Biddings.posttime,Biddings.MinimalPrice, UserBid.Name 'User that started the bid' from  (
select BiddingProd.BiddingId,mejoresVenditors.UserId from  (select Biddings.BiddingId, ProductsByBid.Productid, Categ.ProductCategoryId
 from ProductsByBid
inner Join Biddings on Biddings.BiddingId = ProductsByBid.BiddingId
inner join (select ProductCategoryId,ProductId from Products) as Categ on Categ.Productid = ProductsByBid.Productid
where Biddings.UserId not in (
select BloquedUserRef from BlockedSalers
inner join Users on Users.UserId = BlockedSalers.UserId
where trim(Users.Name) = trim(pUserName)
)
order by Biddings.BiddingId asc)
 BiddingProd inner join mejoresVenditors
on BiddingProd.ProductCategoryId = 
mejoresVenditors.ProductCategoryId) idCons
inner join Biddings on idCons.BiddingId= Biddings.BiddingId
inner join Users on Users.UserId = idCons.UserId
inner join (select Users.Name,Users.UserId from Biddings inner join Users on Users.UserId = Biddings.UserId) as UserBid on 
UserBid.UserId = Biddings.UserId where Users.Name = pUserName;
end //
-- call verOfertasVenditor(trim('Leo'));