-- ______________________________
-- Autor: Leonardo Fariña
-- Fecha: 10/05/2021
-- Descripcion: Generamos saludos para todas las personas que cumplan este día y lo metemos en una tabla con su email para mandarselo
-- CumpleUsers es de donde sacaremos a los usuarios que cumplen hoy
-- ______________________________
DROP PROCEDURE IF EXISTS Venditor_SP_FelizCumple;
DELIMITER $$
CREATE PROCEDURE Venditor_SP_FelizCumple()
BEGIN
  DECLARE mensajeSalida  VARCHAR(255);
  DECLARE nombre  VARCHAR(50);
  DECLARE cumple  DATETIME;
  DECLARE email   VARCHAR(255);
  DECLARE done BOOL;
  DECLARE CursorCumple CURSOR FOR SELECT `Name`,BirthDay,mail FROM Users;  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
	DROP TABLE IF EXISTS `MensajesCumples`;
	CREATE TABLE IF NOT exists `MensajesCumples` (
	  `MensajesCumpleId` BIGINT NOT NULL AUTO_INCREMENT,
	  `mensajeSalida` VARCHAR(255) NULL DEFAULT NULL,
	  `mail` VARCHAR(255) NULL DEFAULT NULL,
	   PRIMARY KEY (`MensajesCumpleId`)
	   );   
       
   call Venditor_Cur_Usuarios(); 

  OPEN CursorCumple;
		myloop: LOOP
			FETCH NEXT FROM CursorCumple INTO nombre,cumple,email; 
			IF done THEN
				LEAVE myloop;
			END IF;        
            SET mensajeSalida = CONCAT(" Buen día ",nombre,", desde Venditor te deseamos un día estupendo y que lo pasas super bien.");
			INSERT INTO MensajesCumples ( `mensajeSalida`, `mail`)
			VALUES(mensajeSalida,email);	
            SELECT SUBSTR(mensajeSalida,1,255);
		END LOOP;    
  CLOSE CursorCumple;  

  COMMIT;
END$$
DELIMITER ;

-- call Venditor_SP_FelizCumple();
