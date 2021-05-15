-- ______________________________
-- Autor: Ricardo Soto Araya
-- Fecha: 14/05/2021
-- Descripcion: Consulta con columna dinámica utilizando el case 
-- ______________________________
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

