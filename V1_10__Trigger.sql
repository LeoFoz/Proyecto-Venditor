-- ______________________________
-- Autor: Leonardo Fariña
-- Fecha: 10/05/2021
-- Descripcion: Se crea la tabla 'BlockedSalerInverso', donde guardaramos los usuarios que tendrian que bloquear a los que los bloquearon
-- ______________________________
DROP TABLE IF EXISTS BlockedSalerInverso;
CREATE TABLE IF NOT EXISTS BlockedSalerInverso (
  `BlockedSalerId` BIGINT NOT NULL AUTO_INCREMENT,
  `BloquedUserRef` BIGINT NULL DEFAULT NULL,
  `BlockedTime` DATE NULL DEFAULT NULL,
  `Enabled` BIT(1) NULL DEFAULT NULL,
  `UserId` BIGINT NOT NULL,
  PRIMARY KEY (`BlockedSalerId`)
);

DROP  TRIGGER if exists Venditor_TG_BloqueoDeUsuario;
DELIMITER //
CREATE TRIGGER Venditor_TG_BloqueoDeUsuario BEFORE INSERT ON BlockedSalers
  FOR EACH ROW
BEGIN
      INSERT INTO BlockedSalerInverso SET
    `BloquedUserRef`= NEW.UserId ,
    `BlockedTime`= NOW() , 
    `Enabled`=1 , 
    `UserId`= NEW.BloquedUserRef;
END;
//
DELIMITER ;


-- select * from BlockedSalerInverso;
-- select * from BlockedSalers;