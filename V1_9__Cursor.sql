-- ______________________________
-- Autor: Leonardo Fariña
-- Fecha: 10/05/2021
-- Descripcion: Se crea la tabla 'CumpleUsers', donde guardaramos los usuarios que cumplen años hoy
-- Esta tabla se utilizara para mandar un mensaje a cada usuario que cumpla años
-- ______________________________
DROP PROCEDURE IF EXISTS Venditor_Cur_Usuarios;
DELIMITER $$
CREATE PROCEDURE Venditor_Cur_Usuarios()
BEGIN
  DECLARE salida  VARCHAR(200);
  DECLARE nombre  VARCHAR(50);
  DECLARE cumple  DATETIME;
  DECLARE email   VARCHAR(255);
  DECLARE done BOOL;
  DECLARE venditorCursor CURSOR FOR SELECT `Name`,BirthDay,mail FROM Users WHERE MONTH(BirthDay) = MONTH(NOW()) AND DAY(BirthDay) = DAY(NOW())-1;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
	DROP TABLE IF EXISTS `CumpleUsers`;
	CREATE TABLE IF NOT exists `CumpleUsers` (
	  `UserId` BIGINT NOT NULL AUTO_INCREMENT,
	  `Name` VARCHAR(50) NULL DEFAULT NULL,
	  `BirthDay` DATETIME NULL DEFAULT NULL,
	  `mail` VARCHAR(255) NULL DEFAULT NULL,
	   PRIMARY KEY (`UserId`)
	   );   
   
  OPEN venditorCursor;
		myloop: LOOP
			FETCH NEXT FROM venditorCursor INTO nombre,cumple,email; 
			IF done THEN
				LEAVE myloop;
			END IF;            
			INSERT INTO CumpleUsers (  `Name`, `BirthDay`, `mail`)
			VALUES(nombre,cumple,email);	
		END LOOP;    
  CLOSE venditorCursor;  
  COMMIT;
END$$
DELIMITER ;

-- call Venditor_Cur_Usuarios();
