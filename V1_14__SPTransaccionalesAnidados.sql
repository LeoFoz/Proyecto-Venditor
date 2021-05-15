-- Ricardo Soto Araya
-- Stored procedures anidados
-- 11. Cree un stored procedure transaccional que llame dentro de la transacción a otro SP transaccional y
-- este a otro SP que también sea transaccional. (De dos niveles). Cada stored procedure debe afectar al
-- menos a dos tablas. Demuestre en este SP el funcionamiento del commit y el rollback, para probarlo
-- tan solo se invoca con valores correctos y con valores incorrectos
drop procedure if exists InsertIntoAdjudicated;
drop procedure if exists setStates;
drop procedure if exists setAdjudicated;

delimiter //
create procedure InsertIntoAdjudicated(
    pInicieTran bool,
    pInterestId bigint,     
    pCurrency varchar(6)
    
)
BEGIN	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION    
    begin
     GET DIAGNOSTICS CONDITION 1 @err_no = MYSQL_ERRNO, @message = MESSAGE_TEXT;
     SET @message = CONCAT('Internal error: ',@message);  
    -- select @message;
    if(@InicieYo  = 1) then
		rollback;
	end if;   
    end;
    set @InicieYo = false;
	set @id =1 ;
	select ifnull(MAX(PaymentAttemptId),@id) into @id from PaymenttAttempts;
	set @id = @id +1;
    select Userid into @User1 from Interests where InterestId = pInterestId;
    select BiddingId into @bid from Interests where InterestId = pInterestId;        
    select SinpeId into @sinpein from SINPES where UserId= @User1 and Enable = 1 limit 1;
    select LastPrice into @amount From Interests where InterestId = pInterestId;   
    set @amount = 1000;
    select ComissionId into @com from Comissions where @amount < Comissions.Amount limit 1;       
    if(@amount >= 100) then 
		set @com = 0.5;
	end if;
   SELECT  PaymentStatusId into @pid from PaymentStatus where PaymentStatus.name = 'Pending';   
   select State into @stt from Biddings where BiddingId = @bid;
   -- Esto por si el estado de el bid ya fue aceptado
   if( @stt != 0 )then 
	SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 12;
    end if;
   
    if(pInicieTran = 0) then
		set @InicieYo = 1;
		start transaction;
	end if;        
    Insert into PaymenttAttempts values (@id,@amount,pCurrency,Date(Now()),100, rand(),rand(),'Deposito de pago a la plataforma',now(),'localhost',md5(2+@User1+ @amount+312),100,@User1,@sinpein,
    @pid,@com,pInterestId);
    
    -- llamada al otro SP   
    -- call setStates(pInicieTran,pInterestid,pCurrency,@id,@bid,@com);
    if(@InicieYo = 1) then
		commit;    
	end if;    
	-- definir handler
end //




delimiter //
create procedure  setStates(
    pInicieTran bool,
    pInterestid bigint,
    pCurrency varchar(6),
   paymentAttid bigint,
   biddingid bigint,
   pCom decimal(9,2)
   
    


)
BEGIN	
	 DECLARE EXIT HANDLER FOR SQLEXCEPTION    
    begin
     GET DIAGNOSTICS CONDITION 1 @err_no = MYSQL_ERRNO, @message = MESSAGE_TEXT;
      SET @message = CONCAT('Internal error: ',@message);  
    -- select @message;
     if(@InicieYo = 1) then
	 	rollback;
	end if;   
    end;
    set @InicieYo = false;
    Select BiddingId into @bid from Interests where InterestId = pInterestid;
    if(pInicieTran = 0 )then
		set @InicieYo = 1;
		start transaction;
	end if;          	    
    UPDATE Biddings SET State= 1
        WHERE BiddingId = @bid;
	
	UPDATE Interests SET Agree = 1  
        WHERE InterestId = pInterestid;
        
    
    -- llamada al otro SP
	call setAdjudicated(pInicieTran,pInterestId,pCom,pCurrency,@id);	
    if(@InicieYo = 1) then
		commit;    
	end if;    
	-- definir handler
end //






delimiter //
create procedure  setAdjudicated(
    pInicieTran bool,
    pInterestid bigint,
    pCom double(9,2),
    pCurrency varchar(6),
   paymentAttid bigint   
   
    
)
BEGIN	
	 DECLARE EXIT HANDLER FOR SQLEXCEPTION    
    begin
     GET DIAGNOSTICS CONDITION 1 @err_no = MYSQL_ERRNO, @message = MESSAGE_TEXT;
     SET @message = CONCAT('Internal error: ',@message);    
    -- select @message;
    if(@InicieYo = 1) then
		rollback;
	end if;   
    end;
    set @idA = 1 ;
    select ifnull(MAX(AdjudicateStateId),@idA) into @idA from AdjudicateStates;
    set @idA = 1 + @idA; 
    set @InicieYo = false;
    set @id =1 ;
	select ifnull(MAX(PaymentAttemptId),@id) into @id from PaymenttAttempts;
	set @id = @id +1;
	Select BiddingId into @bid from Interests where InterestId = pInterestid;
    select UserId into @User1 from Interests where InterestId = pInterestid;
    select UserId into @User2 from Biddings where BiddingId= @bid;
    select SinpeId into @sinpe1 from SINPES where SINPES.UserId = @User1 and Enable limit 1;    
    select SinpeId into @sinpe2 from SINPES where SINPES.UserId = @User2 and Enable limit 1;    
    select PaymentStatusId into @pid from PaymentStatus where PaymentStatus.name = 'Finalizado';
    if(pInicieTran = 0 )then		
		set @InicieYo = true;
		start transaction;
	end if;        
         
     Insert into PaymenttAttempts values (@id,@amount,pCurrency,DATE(Now()),@User2,rand(), rand(),'Deposito de pago a venditor',now(),'localhost',md5(2+@User1+ @amount+@sinpe2),@sinpe2,@User1,@sinpe1,
    @pid,pCom,pInterestId);    
    Insert into AdjudicateStates Values(@idA, pInterestid,@id);
    if(@InicieYo= 1) then
		commit;    
	end if;
    
	-- definir handler

end //
-- call InsertIntoAdjudicated(false,1,'$$');
-- call InsertIntoAdjudicated(false,1,'$$');
