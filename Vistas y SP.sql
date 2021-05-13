-- Vista 1, SP1 y SP4



-- Vista mejores vendedores
create view mejoresVenditors as select UserSalesxCategory.UserId , Users.Name Name,ProductCategory.ProductCategoryId,ProductCategory.Name Category,UserSalesxCategory.SoldProductsAmountXCategory SoldAmount from UserSalesxCategory
inner Join ProductCategory on UserSalesxCategory.ProductCategoryId = ProductCategory.ProductCategoryId 
inner join Users on Users.UserId =  UserSalesxCategory.UserId order by 
SoldProductsAmountXCategory desc;





-- 1. Quiero ver los mejores vendedores dado una categoría
delimiter //
create procedure verMejoresVendedores(
	pCategory varchar(60),
    pUserName varchar(60)
)
begin	
	select mejoresVenditors.Name,mejoresVenditors.Category,mejoresVenditors.SoldAmount
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
call verOfertasVenditor(trim('Leo'));







-- Cree un stored procedure que inserte N registros en una tabla, tomando los datos correctamente
-- identificados de una tabla temporal libre de restricciones que fue previamente llenada
delimiter //
create procedure  AgrgegarNProductos(
    pInicieTran bool,
    idenparam varbinary(300)
)
BEGIN	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION    
    begin
    GET DIAGNOSTICS CONDITION 1 @err_no = MYSQL_ERRNO, @message = MESSAGE_TEXT;
    SET @message = CONCAT('Internal error: ', @message);
    select @message;
    if(pInicieTran = 1) then
		rollback;
	end if;   
    end;
    select count(*) into @quantity from temporal;
    if(pInicieTran = 0) then
		set pInicieTran = 1;
		start transaction;
	end if;    

    Insert into Products select Productid,Name, Description,PriceSale,LastUpdate,ProductCategoryId from temporal where groupid = idenparam;    
    drop temporary table temporal;
    if(pInicieTran = 1) then
		commit;    
	end if;
    select pInicieTran;
	-- definir handler
end //

-- Creación de la tabla temporal
create temporary table temporal (Productid bigint, Name varchar(60), Description varbinary(300), PriceSale decimal(9,2), LastUpdate decimal(9,2), ProductCategoryId bigint,
groupId varbinary(300));
-- Clave para poder agrupar la inserción
set @iden = uuid();
-- N registros a insertar
  Insert into temporal values(24,'Tijeras','Tijeras filosas',4343,4343,3,@iden);
  Insert into temporal values(34,'Intel i9','Procesador',4343,4343,4,@iden);
  Insert into temporal values(30,'Estuche apple','Estuche para iphone 8',4343,4343,5,@iden);
call AgrgegarNProductos(false,@iden);








-- Consulta con columna dinámica utilizando el case 
select Products.Name, Products.Description, Products.PriceSale, ProductCategoryId, (case 
when ProductCategoryId =1 then 'Frutas' 
when ProductCategoryId =2 then 'Carnes'
when ProductCategoryId = 3 then 'Herramientas'
when ProductCategoryId = 4 then 'Componenetes PC' 
when ProductCategoryId =5 then 'Celulares'
when ProductCategoryId =6 then 'Computadores' 
when ProductCategoryId =7 then 'Parlantes'
when ProductCategoryId =8 then 'Muebles'  
when ProductCategoryId =9 then 'Cocinas'
when ProductCategoryId =10 then 'Arte'  
end) as Category from Products;


