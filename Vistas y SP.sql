-- Vista 1, SP1 y SP4




-- Vista mejores vendedores
create view mejoresVenditors as select UserSalesxCategory.UserId,ProductCategory.Name Category,UserSalesxCategory.SoldProductsAmountXCategory SoldAmount from UserSalesxCategory
inner Join ProductCategory on UserSalesxCategory.ProductCategoryId = ProductCategory.ProductCategoryId order by 
SoldProductsAmountXCategory desc;




-- 1. Quiero ver los mejores vendedores dado una categoría
delimiter //
create procedure verMejoresVendedores(
	pCategory varchar(60),
    pUserName varchar(60)
)
begin	
	select mejoresVenditors.UserId,mejoresVenditors.Category,mejoresVenditors.SoldAmount
    from mejoresVenditors where mejoresVenditors.Category = pCategory
    and mejoresVenditors.UserId not in (select BloquedUserRef from BlockedSalers
inner join Users on Users.UserId = BlockedSalers.UserId
where Users.Name = pUserName);
end //
call verMejoresVendedores('Muebles','Gabi');


-- 4: El vendedor es bueno vendiendo manzanas entonces quiero buscar quien quiere que venda las manzanas
-- proc2
delimiter //
create procedure verOfertasVenditor(	
    pUserName varchar(60)
)
begin	

select BiddingProd.BiddingId,mejoresVenditors.UserId from  (select Biddings.BiddingId, Products.Productid,
ProductCategory.ProductCategoryId from ProductsByBid 
inner Join Biddings on Biddings.BiddingId = ProductsByBid.BiddingId
inner join Products on Products.Productid = ProductsByBid.Productid
inner join ProductCategory on Products.ProductCategoryId = Products.ProductCategoryId
where Biddings.UserId not in (
select BloquedUserRef from BlockedSalers
inner join Users on Users.UserId = BlockedSalers.UserId
where Users.Name = pUserName
)
order by Biddings.BiddingId asc) BiddingProd inner join mejoresVenditors
on BiddingProd.ProductCategoryId = 
mejoresVenditors.Category;

end //
call verOfertasVenditor('Fabi')





