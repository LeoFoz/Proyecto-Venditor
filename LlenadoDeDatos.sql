-- ______________________________
--  Autor Leonardo Fariña
--  Fecha 05/05/2021
--  Descripcion Llenado de datos 
-- ______________________________

--  Llenamos Users
INSERT INTO Users ( `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES ( "Leo", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Leomail@gmail.com");
INSERT INTO Users ( `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES ( "Mati", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Matimail@gmail.com");
INSERT INTO Users ( `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES ( "Gabi", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Gabimail@gmail.com");
INSERT INTO Users ( `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES ( "Fabi", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Fabimail@gmail.com");
INSERT INTO Users ( `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES ( "Leonel", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Leonelmail@gmail.com");
INSERT INTO Users ( `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES ( "Eduardo", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Eduardomail@gmail.com");
INSERT INTO Users ( `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES ( "Seba", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Sebamail@gmail.com");
INSERT INTO Users ( `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES ( "Florencia", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Florenciamail@gmail.com");
INSERT INTO Users ( `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES ( "Laura", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Lauramail@gmail.com");
INSERT INTO Users ( `Name`, `Password`, PictureUrl, BirthDay, mail)
VALUES ( "Viviana", "123", "https://redfibra.mx/wp-content/uploads/DOMINIO-1.jpg", 
NOW(), "Vivianamail@gmail.com");

-- Llenamos SINPES
INSERT INTO SINPES ( CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES ( "CR12S11111111111111111",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111111",1,1);
INSERT INTO SINPES ( CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES ( "CR12S11111111111111112",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111112",1,2);
INSERT INTO SINPES ( CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES ( "CR12S11111111111111113",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111113",1,3);
INSERT INTO SINPES ( CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES ( "CR12S11111111111111114",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111114",1,4);
INSERT INTO SINPES ( CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES ( "CR12S11111111111111115",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111115",1,5);
INSERT INTO SINPES ( CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES ( "CR12S11111111111111116",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111116",1,6);
INSERT INTO SINPES ( CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES ( "CR12S11111111111111117",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111117",1,7);
INSERT INTO SINPES ( CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES ( "CR12S11111111111111118",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111118",1,8);
INSERT INTO SINPES ( CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES ( "CR12S11111111111111119",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111119",1,9);
INSERT INTO SINPES ( CuentaIBAN, `CheckSum`,Token,`Enable`,UserId)
VALUES ( "CR12S11111111111111110",md5(CuentaIBAN),
"1111111111111111111111111111111111111111111111111111111111111111111110",1,10);

-- llenado de product category
INSERT INTO ProductCategory ( `Name`)VALUES ( "Frutas");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Carnes");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Herramientas");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Componentes PC");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Celulares");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Computadoras");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Parlantes");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Muebles");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Cocinas");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Arte");

-- llenado de product category
INSERT INTO ProductCategory ( `Name`)VALUES ( "Frutas");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Carnes");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Herramientas");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Componentes PC");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Celulares");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Computadoras");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Parlantes");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Muebles");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Cocinas");
INSERT INTO ProductCategory ( `Name`)VALUES ( "Arte");

-- llenado de Products 
INSERT INTO Products ( `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES ( "Manzana","Manzana roja de Argentina",2,2,1);
INSERT INTO Products ( `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES ( "Pollo","Pollo tierno de Panama",15,15,2);
INSERT INTO Products ( `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES ( "Martillo","Martillo Negro 20cm, acero",12,12,3);
INSERT INTO Products ( `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES ( "Disco Duro","1 Tera",13,13,4);
INSERT INTO Products ( `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES ( "Iphone 7 Plus","Alto: 15,82 cm,Ancho: 7,79 cm,Grosor: 0,73 cm,Peso: 188g",1000,1000,5);
INSERT INTO Products ( `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES ( "NoteBook","Todo Incluido",599,599,6);
INSERT INTO Products ( `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES ( "JBL XTREME 2","Portatil, 200g",100,100,7);
INSERT INTO Products ( `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES ( "Escritorio","Escritorio blanco cala",150,150,8);
INSERT INTO Products ( `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES ( "Cocina eléctrica","Versión 2.0, Negro mate, 220v, 4 discos",2100,2100,9);
INSERT INTO Products ( `Name`,`Description`,PriceSale,LastUpdate,ProductCategoryId)
VALUES ( "Cuadro Suspiro","Cuadro que refleja la melancolia",250,250,10);

-- llenado de Pictures
INSERT INTO Pictures ( `Name`,`Description`,Productid,Deleted)VALUES ("Manzana","Manzana",1,0);
INSERT INTO Pictures ( `Name`,`Description`,Productid,Deleted)VALUES ("Pollo","Pollo",2,0);
INSERT INTO Pictures ( `Name`,`Description`,Productid,Deleted)VALUES ("Martillo","Martillo",3,0);
INSERT INTO Pictures ( `Name`,`Description`,Productid,Deleted)VALUES ("DiscoDuro","DiscoDuro",4,0);
INSERT INTO Pictures ( `Name`,`Description`,Productid,Deleted)VALUES ("Iphone","Iphone",5,0);
INSERT INTO Pictures ( `Name`,`Description`,Productid,Deleted)VALUES ("Notebook","Notebook",6,0);
INSERT INTO Pictures ( `Name`,`Description`,Productid,Deleted)VALUES ("JBL","JBL",7,0);
INSERT INTO Pictures ( `Name`,`Description`,Productid,Deleted)VALUES ("Escritorio","Escritorio",8,0);
INSERT INTO Pictures ( `Name`,`Description`,Productid,Deleted)VALUES ("CocinaEléctrica","CocinaEléctrica",9,0);
INSERT INTO Pictures ( `Name`,`Description`,Productid,Deleted)VALUES ("Cuadro","Cuadro",10,0);

-- llenado de Characteristics
INSERT INTO Characteristics (`Name`,`DescriptionHTML`,DataType)
VALUES ("Computadoras Escritorio","Procesador:
Memoria RAM:
Almacenamiento:
Pantalla:
Entradas:
","12345");
INSERT INTO Characteristics (`Name`,`DescriptionHTML`,DataType)
VALUES ("Computadoras Portatiles","Procesador:
Memoria RAM:
Almacenamiento:
Pantalla:
Batería:
Entradas:
","12345");
INSERT INTO Characteristics (`Name`,`DescriptionHTML`,DataType)
VALUES ("Celulares","Características principales
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
INSERT INTO Characteristics (`Name`,`DescriptionHTML`,DataType)
VALUES ("Frutas","Fechas de recolección:
Cantidad:
Procedencia:
","12345");
INSERT INTO Characteristics (`Name`,`DescriptionHTML`,DataType)
VALUES ("Carnes","Peso:
Origen:
Animal:
Parte:
","12345");
INSERT INTO Characteristics (`Name`,`DescriptionHTML`,DataType)
VALUES ("Cocinas","Discos:
Potencia:
Tipo:
Consumo:
Alto:
Ancho:
Color:
Marca:
","12345");
INSERT INTO Characteristics (`Name`,`DescriptionHTML`,DataType)
VALUES ("Discos Duros","Capacidad:
Velocidad:
Alto:
Ancho:
Marca:
","12345");
INSERT INTO Characteristics (`Name`,`DescriptionHTML`,DataType)
VALUES ("Herramientas","Tipo:
Material:
Marca:
Dimensiones:
Nombre:
","12345");
INSERT INTO Characteristics (`Name`,`DescriptionHTML`,DataType)
VALUES ("Muebles","Alto:
Ancho:
Marca:
Color:
Material:
","12345");
INSERT INTO Characteristics (`Name`,`DescriptionHTML`,DataType)
VALUES ("Cuadros","Dimensiones:
Técnica usada:
Marco:
Color Marco:
Autor:
Origen:
Año:
","12345");

-- llenado comission
INSERT INTO Comissions (Amount,Comission)
VALUES (1,1);


