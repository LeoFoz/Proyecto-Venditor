-- ______________________________
-- Autor: Ricardo Soto Araya
-- Fecha: 9/05/2021
-- Descripcion: Vista mejores vendedores
-- ______________________________
create view mejoresVenditors as select UserSalesxCategory.UserId , Users.Name Name,ProductCategory.ProductCategoryId,ProductCategory.Name Category,UserSalesxCategory.SoldProductsAmountXCategory SoldAmount from UserSalesxCategory
inner Join ProductCategory on UserSalesxCategory.ProductCategoryId = ProductCategory.ProductCategoryId 
inner join Users on Users.UserId =  UserSalesxCategory.UserId order by 
SoldProductsAmountXCategory desc;
