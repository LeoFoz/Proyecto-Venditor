-- ______________________________
-- Autor: Ricardo Soto Araya
-- Fecha: 14/05/2021
-- Cree un stored procedure que inserte N registros en una tabla, tomando los datos correctamente
-- identificados de una tabla temporal libre de restricciones que fue previamente llenada
-- ______________________________

DROP temporary table if exists temporal;
-- Creación de la tabla temporal
create temporary table temporal (Productid bigint, `Name` varchar(60), `Description` varbinary(300), PriceSale decimal(9,2), LastUpdate decimal(9,2), ProductCategoryId bigint,
groupId varbinary(300));
-- Clave para poder agrupar la inserción
set @iden = uuid();

drop procedure if exists AgrgegarNProductos;

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

    Insert into Products select Productid,`Name`, `Description`,PriceSale,LastUpdate,ProductCategoryId from temporal where groupid = idenparam;    
    drop temporary table temporal;
    if(pInicieTran = 1) then
		commit;    
	end if;
    select pInicieTran;
	-- definir handler
end //

-- N registros a insertar
 -- Insert into temporal values(25,'Tijeras','Tijeras filosas',4343,4343,3,@iden);
  -- Insert into temporal values(35,'Intel i9','Procesador',4343,4343,4,@iden);
  -- Insert into temporal values(31,'Estuche apple','Estuche para iphone 8',4343,4343,5,@iden);
-- call AgrgegarNProductos(false,@iden);
