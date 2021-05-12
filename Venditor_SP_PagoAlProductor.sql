-- ______________________________
-- Autor: Leonardo Fariña
-- Fecha: 10/05/2021
-- Descripcion: Se hace el pago de venditor al productor (acá es donde combramos nuestra comisión)
-- @pinterestID es de donde sacaremos el productor al que le tenemos que pagar
-- ______________________________
DROP PROCEDURE IF EXISTS Venditor_SP_PagoAlProductor;
DELIMITER $$

CREATE PROCEDURE Venditor_SP_PagoAlProductor
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
	DECLARE Productor BIGINT;
	DECLARE SinpeProductor BIGINT;
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
	SET pDescription = "Pago de venditor a usuario";
	SET pComissionVend = 1;
    SELECT Comission INTO pComissionVend FROM Comissions WHERE pComissionVend = ComissionId;
    
     IF (ISNULL(ErrorNumber)) THEN 
			SET ErrorNumber = 0;            
        END IF;

    
	START TRANSACTION;	
		SELECT LastPrice INTO pAmount FROM Interests WHERE pinterestID = InterestId;
        SET pAmount = pAmount - ( pAmount * (pComissionVend/100) );
        
        SELECT BiddingId INTO @Bidding_id FROM Interests WHERE pinterestID = InterestId;
        SELECT UserId INTO Productor FROM Biddings WHERE @Bidding_id = BiddingId;
        SELECT SinpeId INTO SinpeProductor FROM SINPES WHERE UserId = Productor;
        
        
        INSERT INTO PaymentStatus (`name`)
		VALUES ("En proceso");        
        
        SET pPayStatusId = (SELECT MAX(PaymentStatusId) FROM PaymentStatus);
        
		INSERT INTO PaymenttAttempts (`Amount`, `CurrencySymbol`, `Posttime`, `ReferenceNumber`, `ErrorNumber`, `MerchantTransNumber`,
					`Description`,  `IpAdress`,  `CheckSum`,  `Sinpeout`,  `UserId`,  `SinpeId`,  `PaymentStatusId`,  `ComissionId`,  `InterestId`)
		VALUES (pAmount,'$',DATE(now()),pinterestID,ErrorNumber,1,pDescription,1,
					MD5(pAmount + pinterestID +  1 + 1 + SinpeProductor + Productor + SinpeVenditor 
                    + pPayStatusId + pComissionVend + pinterestID),
					SinpeProductor,Productor,SinpeVenditor,
					pPayStatusId,pComissionVend,pinterestID);
                    
        UPDATE PaymentStatus SET `name`="Finalizado"
        WHERE PaymentStatusId = pPayStatusId;
		
        SET @PaymenttAttemptsId = (SELECT MAX(PaymentAttemptId) FROM PaymenttAttempts);
		INSERT INTO Transactions (`posttime`,`PaymentAttemptId`)
		VALUES (now(),@PaymenttAttemptsId);     
  
    COMMIT;
    
END$$
DELIMITER ;

call Venditor_SP_PagoAlProductor(1);

select * from PaymentStatus;
select * from PaymenttAttempts;
select * from Transactions;


