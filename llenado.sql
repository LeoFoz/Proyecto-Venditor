-- Llenado de la DB

-- Llenamos Users
INSERT INTO Users (UserId, `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES (1, "Leo", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Leomail@gmail.com");
INSERT INTO Users (UserId, `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES (2, "Mati", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Matimail@gmail.com");
INSERT INTO Users (UserId, `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES (3, "Gabi", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Gabimail@gmail.com");
INSERT INTO Users (UserId, `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES (4, "Fabi", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Fabimail@gmail.com");
INSERT INTO Users (UserId, `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES (5, "Leonel", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Leonelmail@gmail.com");
INSERT INTO Users (UserId, `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES (6, "Eduardo", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Eduardomail@gmail.com");
INSERT INTO Users (UserId, `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES (7, "Seba", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Sebamail@gmail.com");
INSERT INTO Users (UserId, `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES (8, "Florencia", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Florenciamail@gmail.com");
INSERT INTO Users (UserId, `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES (9, "Laura", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Lauramail@gmail.com");
INSERT INTO Users (UserId, `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES (10, "Viviana", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Vivianamail@gmail.com");
SELECT * FROM Users;

-- Llenamos SINPES
INSERT INTO SINPES (SinpeId, CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES (1, "CR12S11111111111111111",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111111",1,1);
INSERT INTO SINPES (SinpeId, CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES (2, "CR12S11111111111111112",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111112",1,2);
INSERT INTO SINPES (SinpeId, CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES (3, "CR12S11111111111111113",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111113",1,3);
INSERT INTO SINPES (SinpeId, CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES (4, "CR12S11111111111111114",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111114",1,4);
INSERT INTO SINPES (SinpeId, CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES (5, "CR12S11111111111111115",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111115",1,5);
INSERT INTO SINPES (SinpeId, CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES (6, "CR12S11111111111111116",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111116",1,6);
INSERT INTO SINPES (SinpeId, CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES (7, "CR12S11111111111111117",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111117",1,7);
INSERT INTO SINPES (SinpeId, CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES (8, "CR12S11111111111111118",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111118",1,8);
INSERT INTO SINPES (SinpeId, CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES (9, "CR12S11111111111111119",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111119",1,9);
INSERT INTO SINPES (SinpeId, CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES (10, "CR12S11111111111111110",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111110",1,10);
SELECT * FROM SINPES;

-- llenado de product category
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (1, "Frutas");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (2, "Carnes");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (3, "Herramientas");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (4, "Componentes PC");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (5, "Celulares");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (6, "Computadoras");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (7, "Parlantes");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (8, "Muebles");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (9, "Cocinas");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (10, "Arte");
SELECT * FROM ProductCategory;

-- llenado de product category
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (1, "Frutas");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (2, "Carnes");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (3, "Herramientas");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (4, "Componentes PC");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (5, "Celulares");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (6, "Computadoras");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (7, "Parlantes");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (8, "Muebles");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (9, "Cocinas");
INSERT INTO ProductCategory (ProductCategoryId, `Name`)VALUES (10, "Arte");
SELECT * FROM ProductCategory;

-- llenado de Products 
INSERT INTO Products (Productid, `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES (1, "Manzana","Manzana roja de Argentina",2,2,1);
INSERT INTO Products (Productid, `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES (2, "Pollo","Pollo tierno de Panama",15,15,2);
INSERT INTO Products (Productid, `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES (3, "Martillo","Martillo Negro 20cm, acero",12,12,3);
INSERT INTO Products (Productid, `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES (4, "Disco Duro","1 Tera",13,13,4);
INSERT INTO Products (Productid, `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES (5, "Iphone 7 Plus","Alto: 15,82 cm,Ancho: 7,79 cm,Grosor: 0,73 cm,Peso: 188g",1000,1000,5);
INSERT INTO Products (Productid, `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES (6, "NoteBook","Todo Incluido",599,599,6);
INSERT INTO Products (Productid, `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES (7, "JBL XTREME 2","Portatil, 200g",100,100,7);
INSERT INTO Products (Productid, `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES (8, "Escritorio","Escritorio blanco cala",150,150,8);
INSERT INTO Products (Productid, `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES (9, "Cocina eléctrica","Versión 2.0, Negro mate, 220v, 4 discos",2100,2100,9);
INSERT INTO Products (Productid, `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES (10, "Cuadro Suspiro","Cuadro que refleja la melancolia",250,250,10);
SELECT * FROM Products;

-- llenado de Pictures
INSERT INTO Pictures (picutreId, `Name`,`Description`,Productid,Deleted)VALUES (1,"Manzana","Manzana",1,0);
INSERT INTO Pictures (picutreId, `Name`,`Description`,Productid,Deleted)VALUES (2,"Pollo","Pollo",2,0);
INSERT INTO Pictures (picutreId, `Name`,`Description`,Productid,Deleted)VALUES (3,"Martillo","Martillo",3,0);
INSERT INTO Pictures (picutreId, `Name`,`Description`,Productid,Deleted)VALUES (4,"DiscoDuro","DiscoDuro",4,0);
INSERT INTO Pictures (picutreId, `Name`,`Description`,Productid,Deleted)VALUES (5,"Iphone","Iphone",5,0);
INSERT INTO Pictures (picutreId, `Name`,`Description`,Productid,Deleted)VALUES (6,"Notebook","Notebook",6,0);
INSERT INTO Pictures (picutreId, `Name`,`Description`,Productid,Deleted)VALUES (7,"JBL","JBL",7,0);
INSERT INTO Pictures (picutreId, `Name`,`Description`,Productid,Deleted)VALUES (8,"Escritorio","Escritorio",8,0);
INSERT INTO Pictures (picutreId, `Name`,`Description`,Productid,Deleted)VALUES (9,"CocinaEléctrica","CocinaEléctrica",9,0);
INSERT INTO Pictures (picutreId, `Name`,`Description`,Productid,Deleted)VALUES (10,"Cuadro","Cuadro",10,0);
SELECT * FROM Pictures;

-- llenado de Characteristics
INSERT INTO Characteristics (CharacteristicId, `Name`,`DescriptionHTML`,DataType)
VALUES (1,"Computadoras Escritorio","Procesador:
Memoria RAM:
Almacenamiento:
Pantalla:
Entradas:
","12345");
INSERT INTO Characteristics (CharacteristicId, `Name`,`DescriptionHTML`,DataType)
VALUES (2,"Computadoras Portatiles","Procesador:
Memoria RAM:
Almacenamiento:
Pantalla:
Batería:
Entradas:
","12345");
INSERT INTO Characteristics (CharacteristicId, `Name`,`DescriptionHTML`,DataType)
VALUES (3,"Celulares","Características principales
Pantalla: 
Procesador: 
RAM: 
Almacenamiento: 
Expansión: 
Cámara: 
Batería: 
OS:
Perfil: 
Peso:                                                             
","12345");
INSERT INTO Characteristics (CharacteristicId, `Name`,`DescriptionHTML`,DataType)
VALUES (4,"Frutas","Fechas de recolección:
Cantidad:
Procedencia:
","12345");
INSERT INTO Characteristics (CharacteristicId, `Name`,`DescriptionHTML`,DataType)
VALUES (5,"Carnes","Peso:
Origen:
Animal:
Parte:
","12345");
INSERT INTO Characteristics (CharacteristicId, `Name`,`DescriptionHTML`,DataType)
VALUES (6,"Cocinas","Discos:
Potencia:
Tipo:
Consumo:
Alto:
Ancho:
Color:
Marca:
","12345");
INSERT INTO Characteristics (CharacteristicId, `Name`,`DescriptionHTML`,DataType)
VALUES (7,"Discos Duros","Capacidad:
Velocidad:
Alto:
Ancho:
Marca:
","12345");
INSERT INTO Characteristics (CharacteristicId, `Name`,`DescriptionHTML`,DataType)
VALUES (8,"Herramientas","Tipo:
Material:
Marca:
Dimensiones:
Nombre:
","12345");
INSERT INTO Characteristics (CharacteristicId, `Name`,`DescriptionHTML`,DataType)
VALUES (9,"Muebles","Alto:
Ancho:
Marca:
Color:
Material:
","12345");
INSERT INTO Characteristics (CharacteristicId, `Name`,`DescriptionHTML`,DataType)
VALUES (10,"Cuadros","Dimensiones:
Técnica usada:
Marco:
Color Marco:
Autor:
Origen:
Año:
","12345");
SELECT * FROM Characteristics;














SET SQL_SAFE_UPDATES = 0;
DELETE FROM Users;
