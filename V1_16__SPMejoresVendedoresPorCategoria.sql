-- ______________________________
-- Autor: Ricardo Soto Araya
-- Fecha: 9/05/2021
-- Descripcion: SP los mejores vendedores dado una categoría
-- ______________________________
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
-- call verMejoresVendedores('Muebles','Gabi');