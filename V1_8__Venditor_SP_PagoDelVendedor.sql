-- ______________________________
-- Autor: Leonardo Fariña
-- Fecha: 08/05/2021
-- Descripcion: Se hace el pago del vendedor al productor(pero se deposita en una cuenta sinpe de la empresa para retenerlo)
-- @pinterestID es de donde sacaremos el vendedor que va a pagar
-- ______________________________
DROP PROCEDURE IF EXISTS Venditor_SP_PagoDelVendedor;
DELIMITER $$

CREATE PROCEDURE Venditor_SP_PagoDelVendedor
(
	pinterestID BIGINT
)
BEGIN	
	-- crear un sistema de código errores 
	DECLARE INVALID_FUND INT DEFAULT(53000);
	DECLARE ErrorNumber INT;
	DECLARE ErrorSeverity INT;
	DECLARE ErrorState INT;
	DECLARE CustomError INT;
	DECLARE Message VARCHAR(200);
	DECLARE InicieTransaccion BIT  ;
	
	-- declaracion de otras variables
	DECLARE Vendedor BIGINT;
	DECLARE SinpeVendedor BIGINT;
	DECLARE pAmount DECIMAL (9,2);
	DECLARE SinpeVenditor BIGINT;
    DECLARE PaymentStatus BIGINT;
    DECLARE pDescription VARCHAR(60);
    DECLARE pComissionVend INT;
	DECLARE pPayStatusId BIGINT;
            
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 ErrorNumber = MYSQL_ERRNO, Message = MESSAGE_TEXT;
        
        IF (ISNULL(Message)) THEN 
			SET Message = 'aqui saco el mensaje de un catalogo de mensajes que fue creado por equipo de desarrollo';            
        ELSE
            SET Message = CONCAT('Internal error: ', Message);
        END IF;
        
        ROLLBACK;
        
        RESIGNAL SET MESSAGE_TEXT = Message;
	END;

	SET autocommit = 0;
	SET  SinpeVenditor = 100;
	SET pDescription = "Pago de usuario a venditor";
	SET pComissionVend = 1;
     IF (ISNULL(ErrorNumber)) THEN 
			SET ErrorNumber = 0;            
        END IF;

    
	START TRANSACTION;	
                
        SELECT InterestId INTO Vendedor FROM Interests WHERE pinterestID = InterestId;
        SELECT LastPrice INTO pAmount FROM Interests WHERE pinterestID = InterestId;
        SELECT SinpeId INTO SinpeVendedor FROM SINPES WHERE UserId = Vendedor;
        
        INSERT INTO PaymentStatus (`name`)
		VALUES ("En proceso");        
        
        SET pPayStatusId = (SELECT MAX(PaymentStatusId) FROM PaymentStatus);
        
		INSERT INTO PaymenttAttempts (`Amount`, `CurrencySymbol`, `Posttime`, `ReferenceNumber`, `ErrorNumber`, `MerchantTransNumber`,
					`Description`,  `IpAdress`,  `CheckSum`,  `Sinpeout`,  `UserId`,  `SinpeId`,  `PaymentStatusId`,  `ComissionId`,  `InterestId`)
		VALUES (pAmount,'$',DATE(now()),pinterestID,ErrorNumber,1,pDescription,1,
					MD5(pAmount + pinterestID +  1 + 1 + SinpeVenditor + Vendedor + SinpeVendedor 
                    + pPayStatusId + pComissionVend + pinterestID),
					SinpeVenditor,Vendedor,SinpeVendedor,
					pPayStatusId,pComissionVend,pinterestID);
                    
        UPDATE PaymentStatus SET `name`="Finalizado"
        WHERE PaymentStatusId = pPayStatusId;

		SET @PaymenttAttemptsId = (SELECT MAX(PaymentAttemptId) FROM PaymenttAttempts);
		INSERT INTO Transactions (`posttime`,`PaymentAttemptId`)
		VALUES (now(),@PaymenttAttemptsId);    
        
    COMMIT;
    
END$$
DELIMITER ;

call Venditor_SP_PagoDelVendedor(1);

select * from PaymentStatus;
select * from PaymenttAttempts;
select * from Transactions;