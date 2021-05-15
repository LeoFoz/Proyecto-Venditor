-- ______________________________
-- Autor: Leonardo Fariña
-- Fecha: 11/05/2021
-- Descripcion: Generamos un SP que retorna un Json con todos los datos de un usuario
-- pUserId sera el id que usemos para encontrar al usuario
-- ______________________________
DROP PROCEDURE IF EXISTS Venditor_SP_Json;
DELIMITER $$
CREATE PROCEDURE Venditor_SP_Json(
	pUserId BIGINT
)
BEGIN
  DECLARE salidaMensaje  VARCHAR(1000);
  DECLARE usuBloqueados  VARCHAR(255);
  DECLARE usuBloqueados2  VARCHAR(255);
  DECLARE productosBloqueados  VARCHAR(255);
  DECLARE productosBloqueados2  VARCHAR(255);
  DECLARE JSONSalida  JSON;
  DECLARE aux  INT;
  DECLARE nombre  VARCHAR(50);
  DECLARE nombreBlo  VARCHAR(50);
  DECLARE IDnombreBlo  BIGINT;  
  DECLARE productoBlo  VARCHAR(50);
  DECLARE IDproductoBlo  BIGINT;  
  DECLARE pPictureUrl VARCHAR(150);
  DECLARE cumple  DATETIME;
  DECLARE email   VARCHAR(255);
  DECLARE comi VARCHAR(1);
  DECLARE done BOOL;  
  DECLARE CursorUsuBloqueados CURSOR FOR SELECT `BloquedUserRef` FROM BlockedSalers WHERE pUserId=UserId;  
  DECLARE CursorProBloqueados CURSOR FOR SELECT `Productid` FROM BlockedProducts WHERE pUserId=UserId;  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
  DROP TABLE IF EXISTS `SalidaJson`;
	CREATE TABLE IF NOT exists `SalidaJson` (
	  `miJson` JSON
	   );   
       
  SELECT `Name` INTO nombre FROM Users WHERE pUserId = UserId;
  SELECT `mail` INTO email FROM Users WHERE pUserId = UserId;
  SELECT `BirthDay` INTO cumple FROM Users WHERE pUserId = UserId;
  SELECT `PictureUrl` INTO pPictureUrl FROM Users WHERE pUserId = UserId;
  SET comi ="'";
  SET aux = 1;
  SET usuBloqueados = "";
  SET productosBloqueados = "";
  OPEN CursorUsuBloqueados;
		myloop: LOOP
			FETCH NEXT FROM CursorUsuBloqueados INTO IDnombreBlo; 
			IF done THEN
				LEAVE myloop;
			END IF;  
            
            IF aux = 0 THEN
				SET usuBloqueados2 = CONCAT(usuBloqueados,',');
                SET usuBloqueados = usuBloqueados2;
			END IF;  
            SELECT `Name` INTO nombreBlo FROM Users WHERE IDnombreBlo = UserId;
            SET usuBloqueados2 = CONCAT(usuBloqueados,'"',nombreBlo,'"');
            SET usuBloqueados = usuBloqueados2;
            SET aux = 0;            
		END LOOP;    
  CLOSE CursorUsuBloqueados;  

  
  SET done = FALSE;
  SET aux = 1;
  OPEN CursorProBloqueados;
		myloop: LOOP
			FETCH NEXT FROM CursorProBloqueados INTO IDproductoBlo; 
			IF done THEN
				LEAVE myloop;
			END IF;  
            
            IF aux = 0 THEN
				SET productosBloqueados2 = CONCAT(productosBloqueados,',');
                SET productosBloqueados =  productosBloqueados2;               
			END IF;  
            SELECT `Name` INTO productoBlo FROM Products WHERE IDproductoBlo = Productid;
            SET productosBloqueados2 = CONCAT(productosBloqueados,'"',productoBlo,'"');
            SET productosBloqueados =  productosBloqueados2;
            SET aux = 0;            
		END LOOP;    
  CLOSE CursorProBloqueados; 
    
  SET salidaMensaje =  CONCAT('{"Usuario":{"Nombre De Usuario":"',nombre,'","Email":"',email,'","Cumpleaños":"',cumple,'","Url Imagen":"',pPictureUrl,'"},"Usuarios Bloqueados":{ "Nombres":[',usuBloqueados,']},"Productos Bloqueados":{"Nombre De Producto":[',productosBloqueados,']}}');
  SELECT SUBSTRING(salidaMensaje,1,1000);
  SET JSONSalida = CAST(salidaMensaje AS JSON);
  INSERT INTO SalidaJson(miJson)VALUES(JSONSalida);

  COMMIT;
END$$
DELIMITER ;

-- call Venditor_SP_Json(1);
-- select * from SalidaJson;
