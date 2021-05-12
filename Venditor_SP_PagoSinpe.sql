
-- Autor: Leonardo Fariña
-- Fecha: 08/05/2021
-- Descripcion: Se hace el pago del vendedor al productor(pero se deposita en una cuenta sinpe de la empresa para retenerlo)
-- @pinterestID es de donde sacaremos el vendedor que va a pagar

DROP PROCEDURE IF EXISTS Venditor_SP_PagoSinpe;
DELIMITER $$

CREATE PROCEDURE Venditor_SP_PagoSinpe
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
		GET DIAGNOSTICS CONDITION 1 @err_no = MYSQL_ERRNO, @message = MESSAGE_TEXT;
        -- si es un exception de sql, ambos campos vienen en el diagnostics
        -- pero si es una excepction forzada por el programador solo viene el ERRNO, el texto no
        
        IF (ISNULL(@message)) THEN -- quiere decir q es una excepcion forzada del programador
			SET @message = 'aqui saco el mensaje de un catalogo de mensajes que fue creado por equipo de desarrollo';            
        ELSE
			-- es un exception de SQL que no queremos que salga hacia la capa de aplicacion
            -- tengo que guardar el error en una bitácora de errores... patron de bitacora
            -- sustituyo el texto del mensaje
            SET @message = CONCAT('Internal error: ', @message);
        END IF;
        
        ROLLBACK;
        
        RESIGNAL SET MESSAGE_TEXT = @message;
	END;

	SET autocommit = 0;
	-- into me permite sacar los valores del select a variables
    -- es muy cómo combinar el into con las variables locales @
    -- cuando se usa into hay que tener cuidado con 3 cosas:
    -- a) el select podría retornar más de una fila, generando error
    -- b) retorne null en los rows, usar IFNULL
    -- c) retorne vacio, entonces no se asigna nada a la variable
	SET  SinpeVenditor = 100;
	SET pDescription = "Pago de usuario a venditor";
	SET pComissionVend = 1;
    
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
					MD5(pAmount + pinterestID + ErrorNumber + 1 + 1 + SinpeVenditor + Vendedor + SinpeVendedor 
                    + pPayStatusId + pComissionVend + pinterestID),
					SinpeVenditor,Vendedor,SinpeVendedor,
					pPayStatusId,pComissionVend,pinterestID);
                    
        UPDATE PaymentStatus SET `name`="Finalizado"
        WHERE PaymentStatusId = pPayStatusId;

    COMMIT;
    
END$$
DELIMITER ;

call Venditor_SP_PagoSinpe(1);

select * from PaymentStatus;
select * from PaymenttAttempts;
