-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema MIBD-PROYECTO
-- -----------------------------------------------------
-- Para la conexion con las apis
ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'root';
flush privileges;
-- -----------------------------------------------------
-- Schema MIBD-PROYECTO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MIBD-PROYECTO` DEFAULT CHARACTER SET utf8 ;
USE `MIBD-PROYECTO` ;

-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`Users` (
  `UserId` BIGINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NULL DEFAULT NULL,
  `Password` VARBINARY(300) NULL DEFAULT NULL,
  `PictureUrl` VARCHAR(150) NULL DEFAULT NULL,
  `BirthDay` DATETIME NULL DEFAULT NULL,
  `mail` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`UserId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`Biddings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`Biddings` (
  `BiddingId` BIGINT NOT NULL AUTO_INCREMENT,
  `MinimalPrice` DECIMAL(9,2) NULL DEFAULT NULL,
  `ComissonXSale` DECIMAL(5,2) NULL DEFAULT NULL,
  `posttime` DATETIME NULL DEFAULT NULL,
  `Description` VARCHAR(600) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `State` TINYINT(1) NULL DEFAULT NULL,
  `UserId` BIGINT NOT NULL,
  PRIMARY KEY (`BiddingId`),
  INDEX `fk_Biddings_Users1_idx` (`UserId` ASC) VISIBLE,
  CONSTRAINT `fk_Biddings_Users1`
    FOREIGN KEY (`UserId`)
    REFERENCES `MIBD-PROYECTO`.`Users` (`UserId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`Interests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`Interests` (
  `InterestId` BIGINT NOT NULL AUTO_INCREMENT,
  `Posttime` DATETIME NULL DEFAULT NULL,
  `Agree` TINYINT(1) NULL DEFAULT NULL,
  `ChangeDeal` TINYINT(1) NULL DEFAULT NULL,
  `NewComission` DECIMAL(5,2) NULL DEFAULT NULL,
  `LastPrice` DECIMAL(9,2) NULL DEFAULT NULL,
  `UserId` BIGINT NOT NULL,
  `BiddingId` BIGINT NOT NULL,
  PRIMARY KEY (`InterestId`),
  INDEX `fk_BidsState_Users1_idx` (`UserId` ASC) VISIBLE,
  INDEX `fk_BidsState_Biddings1_idx` (`BiddingId` ASC) VISIBLE,
  CONSTRAINT `fk_BidsState_Biddings1`
    FOREIGN KEY (`BiddingId`)
    REFERENCES `MIBD-PROYECTO`.`Biddings` (`BiddingId`),
  CONSTRAINT `fk_BidsState_Users1`
    FOREIGN KEY (`UserId`)
    REFERENCES `MIBD-PROYECTO`.`Users` (`UserId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`Comissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`Comissions` (
  `ComissionId` BIGINT NOT NULL AUTO_INCREMENT,
  `Amount` DECIMAL(5,2) NULL DEFAULT NULL,
  `Comission` DECIMAL(9,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ComissionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`PaymentStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`PaymentStatus` (
  `PaymentStatusId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentStatusId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`SINPES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`SINPES` (
  `SinpeId` BIGINT NOT NULL AUTO_INCREMENT,
  `CuentaIBAN` VARBINARY(22) NULL DEFAULT NULL,
  `CheckSum` VARBINARY(300) NULL DEFAULT NULL,
  `Token` VARBINARY(70) NULL DEFAULT NULL,
  `Enable` TINYINT(1) NULL DEFAULT NULL,
  `UserId` BIGINT NOT NULL,
  PRIMARY KEY (`SinpeId`),
  INDEX `fk_SINPES_Users1_idx` (`UserId` ASC) VISIBLE,
  CONSTRAINT `fk_SINPES_Users1`
    FOREIGN KEY (`UserId`)
    REFERENCES `MIBD-PROYECTO`.`Users` (`UserId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`PaymenttAttempts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`PaymenttAttempts` (
  `PaymentAttemptId` BIGINT NOT NULL AUTO_INCREMENT,
  `Amount` DECIMAL(20,2) NULL DEFAULT NULL,
  `CurrencySymbol` VARCHAR(6) NULL DEFAULT NULL,
  `Posttime` DATE NULL DEFAULT NULL,
  `ReferenceNumber` BIGINT NULL DEFAULT NULL,
  `ErrorNumber` INT NULL DEFAULT NULL,
  `MerchantTransNumber` INT NULL DEFAULT NULL,
  `Description` VARCHAR(300) NULL DEFAULT NULL,
  `PaymentTimeStamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `IpAdress` VARCHAR(100) NULL DEFAULT NULL,
  `CheckSum` VARBINARY(300) NULL DEFAULT NULL,
  `Sinpeout` BIGINT NULL DEFAULT NULL,
  `UserId` BIGINT NOT NULL,
  `SinpeId` BIGINT NOT NULL,
  `PaymentStatusId` INT NOT NULL,
  `ComissionId` BIGINT NOT NULL,
  `InterestId` BIGINT NOT NULL,
  PRIMARY KEY (`PaymentAttemptId`),
  INDEX `fk_PaymenttAttempts_Users1_idx` (`UserId` ASC) VISIBLE,
  INDEX `fk_PaymenttAttempts_SINPES1_idx` (`SinpeId` ASC) VISIBLE,
  INDEX `fk_PaymenttAttempts_PaymentStatus1_idx` (`PaymentStatusId` ASC) VISIBLE,
  INDEX `fk_PaymenttAttempts_Comissions1_idx` (`ComissionId` ASC) VISIBLE,
  INDEX `fk_PaymenttAttempts_BidsState1_idx` (`InterestId` ASC) VISIBLE,
  CONSTRAINT `fk_PaymenttAttempts_BidsState1`
    FOREIGN KEY (`InterestId`)
    REFERENCES `MIBD-PROYECTO`.`Interests` (`InterestId`),
  CONSTRAINT `fk_PaymenttAttempts_Comissions1`
    FOREIGN KEY (`ComissionId`)
    REFERENCES `MIBD-PROYECTO`.`Comissions` (`ComissionId`),
  CONSTRAINT `fk_PaymenttAttempts_PaymentStatus1`
    FOREIGN KEY (`PaymentStatusId`)
    REFERENCES `MIBD-PROYECTO`.`PaymentStatus` (`PaymentStatusId`),
  CONSTRAINT `fk_PaymenttAttempts_SINPES1`
    FOREIGN KEY (`SinpeId`)
    REFERENCES `MIBD-PROYECTO`.`SINPES` (`SinpeId`),
  CONSTRAINT `fk_PaymenttAttempts_Users1`
    FOREIGN KEY (`UserId`)
    REFERENCES `MIBD-PROYECTO`.`Users` (`UserId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`AdjudicateStates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`AdjudicateStates` (
  `AdjudicateStateId` BIGINT NOT NULL AUTO_INCREMENT,
  `InterestId` BIGINT NOT NULL,
  `PaymentAttemptId` BIGINT NOT NULL,
  PRIMARY KEY (`AdjudicateStateId`),
  INDEX `fk_Adjudicated_BidsState1_idx` (`InterestId` ASC) VISIBLE,
  INDEX `fk_Adjudicated_PaymenttAttempts1_idx` (`PaymentAttemptId` ASC) VISIBLE,
  CONSTRAINT `fk_Adjudicated_BidsState1`
    FOREIGN KEY (`InterestId`)
    REFERENCES `MIBD-PROYECTO`.`Interests` (`InterestId`),
  CONSTRAINT `fk_Adjudicated_PaymenttAttempts1`
    FOREIGN KEY (`PaymentAttemptId`)
    REFERENCES `MIBD-PROYECTO`.`PaymenttAttempts` (`PaymentAttemptId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`AppSources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`AppSources` (
  `AppSourceId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Description` VARBINARY(300) NULL DEFAULT NULL,
  PRIMARY KEY (`AppSourceId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`ProductCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`ProductCategory` (
  `ProductCategoryId` BIGINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`ProductCategoryId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`Products` (
  `Productid` BIGINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Description` VARBINARY(300) NULL DEFAULT NULL,
  `PriceSale` DECIMAL(9,2) NULL DEFAULT NULL,
  `LastUpdate` DECIMAL(9,2) NULL DEFAULT NULL,
  `ProductCategoryId` BIGINT NOT NULL,
  PRIMARY KEY (`Productid`),
  INDEX `fk_Products_ProductCategory1_idx` (`ProductCategoryId` ASC) VISIBLE,
  CONSTRAINT `fk_Products_ProductCategory1`
    FOREIGN KEY (`ProductCategoryId`)
    REFERENCES `MIBD-PROYECTO`.`ProductCategory` (`ProductCategoryId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`BlockedProducts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`BlockedProducts` (
  `BlockedProductsId` BIGINT NOT NULL AUTO_INCREMENT,
  `Enabled` BIT(1) NULL DEFAULT NULL,
  `UserId` BIGINT NOT NULL,
  `Productid` BIGINT NOT NULL,
  PRIMARY KEY (`BlockedProductsId`),
  INDEX `fk_BlockedProducts_Users1_idx` (`UserId` ASC) VISIBLE,
  INDEX `fk_BlockedProducts_Products1_idx` (`Productid` ASC) VISIBLE,
  CONSTRAINT `fk_BlockedProducts_Products1`
    FOREIGN KEY (`Productid`)
    REFERENCES `MIBD-PROYECTO`.`Products` (`Productid`),
  CONSTRAINT `fk_BlockedProducts_Users1`
    FOREIGN KEY (`UserId`)
    REFERENCES `MIBD-PROYECTO`.`Users` (`UserId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`BlockedSalers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`BlockedSalers` (
  `BlockedSalerId` BIGINT NOT NULL AUTO_INCREMENT,
  `BloquedUserRef` BIGINT NULL DEFAULT NULL,
  `BlockedTime` DATE NULL DEFAULT NULL,
  `Enabled` BIT(1) NULL DEFAULT NULL,
  `UserId` BIGINT NOT NULL,
  PRIMARY KEY (`BlockedSalerId`),
  INDEX `fk_BlockedSalers_Users1_idx` (`UserId` ASC) VISIBLE,
  CONSTRAINT `fk_BlockedSalers_Users1`
    FOREIGN KEY (`UserId`)
    REFERENCES `MIBD-PROYECTO`.`Users` (`UserId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`Characteristics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`Characteristics` (
  `CharacteristicId` BIGINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `DescriptionHTML` VARCHAR(128) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `DataType` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`CharacteristicId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`CharacterisXCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`CharacterisXCategory` (
  `CharacteristxCategoryId` BIGINT NOT NULL AUTO_INCREMENT,
  `CharacteristicId` BIGINT NOT NULL,
  `ProductCategoryId` BIGINT NOT NULL,
  `Value` VARCHAR(128) NULL,
  PRIMARY KEY (`CharacteristxCategoryId`),
  INDEX `fk_CharacterisXCategory_Characteristics1_idx` (`CharacteristicId` ASC) VISIBLE,
  INDEX `fk_CharacterisXCategory_ProductCategory1_idx` (`ProductCategoryId` ASC) VISIBLE,
  CONSTRAINT `fk_CharacterisXCategory_Characteristics1`
    FOREIGN KEY (`CharacteristicId`)
    REFERENCES `MIBD-PROYECTO`.`Characteristics` (`CharacteristicId`),
  CONSTRAINT `fk_CharacterisXCategory_ProductCategory1`
    FOREIGN KEY (`ProductCategoryId`)
    REFERENCES `MIBD-PROYECTO`.`ProductCategory` (`ProductCategoryId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`CharacterisXProduct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`CharacterisXProduct` (
  `CharacterisXProductId` BIGINT NOT NULL AUTO_INCREMENT,
  `Value` VARCHAR(128) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Productid` BIGINT NOT NULL,
  `CharacteristicId` BIGINT NOT NULL,
  PRIMARY KEY (`CharacterisXProductId`),
  INDEX `fk_CharacterisXProduct_Products1_idx` (`Productid` ASC) VISIBLE,
  INDEX `fk_CharacterisXProduct_Characteristics1_idx` (`CharacteristicId` ASC) VISIBLE,
  CONSTRAINT `fk_CharacterisXProduct_Characteristics1`
    FOREIGN KEY (`CharacteristicId`)
    REFERENCES `MIBD-PROYECTO`.`Characteristics` (`CharacteristicId`),
  CONSTRAINT `fk_CharacterisXProduct_Products1`
    FOREIGN KEY (`Productid`)
    REFERENCES `MIBD-PROYECTO`.`Products` (`Productid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`EntityTypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`EntityTypes` (
  `EntityTpyeId` BIGINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Description` VARBINARY(300) NULL DEFAULT NULL,
  PRIMARY KEY (`EntityTpyeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`InterestedProducts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`InterestedProducts` (
  `RecommededId` BIGINT NOT NULL AUTO_INCREMENT,
  `UserId` BIGINT NOT NULL,
  `ProductCategoryId` BIGINT NOT NULL,
  `Deleted` BIT NULL,
  PRIMARY KEY (`RecommededId`),
  INDEX `fk_InterestedProducts_Users1_idx` (`UserId` ASC) VISIBLE,
  INDEX `fk_InterestedProducts_ProductCategory1_idx` (`ProductCategoryId` ASC) VISIBLE,
  CONSTRAINT `fk_InterestedProducts_ProductCategory1`
    FOREIGN KEY (`ProductCategoryId`)
    REFERENCES `MIBD-PROYECTO`.`ProductCategory` (`ProductCategoryId`),
  CONSTRAINT `fk_InterestedProducts_Users1`
    FOREIGN KEY (`UserId`)
    REFERENCES `MIBD-PROYECTO`.`Users` (`UserId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`LogTypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`LogTypes` (
  `LogTypeId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Description` VARBINARY(300) NULL DEFAULT NULL,
  PRIMARY KEY (`LogTypeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`Severities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`Severities` (
  `SevirityId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Description` VARBINARY(300) NULL DEFAULT NULL,
  PRIMARY KEY (`SevirityId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`Logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`Logs` (
  `LogId` BIGINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Postime` DATETIME NULL DEFAULT NULL,
  `Description` VARCHAR(300) NULL DEFAULT NULL,
  `ComputerName` VARCHAR(300) NULL DEFAULT NULL,
  `Username` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `IP` VARCHAR(50) NULL DEFAULT NULL,
  `ref1` BIGINT NULL DEFAULT NULL,
  `ref2` BIGINT NULL DEFAULT NULL,
  `Oldvalue` VARCHAR(200) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `NewValue` VARCHAR(200) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Checksum` BIGINT NULL DEFAULT NULL,
  `LogTypeId` INT NOT NULL,
  `SevirityId` INT NOT NULL,
  `EntityTpyeId` BIGINT NOT NULL,
  `AppSourceId` INT NOT NULL,
  PRIMARY KEY (`LogId`),
  INDEX `fk_Logs_LogTypes_idx` (`LogTypeId` ASC) VISIBLE,
  INDEX `fk_Logs_Severities1_idx` (`SevirityId` ASC) VISIBLE,
  INDEX `fk_Logs_EntityTypes1_idx` (`EntityTpyeId` ASC) VISIBLE,
  INDEX `fk_Logs_AppSources1_idx` (`AppSourceId` ASC) VISIBLE,
  CONSTRAINT `fk_Logs_AppSources1`
    FOREIGN KEY (`AppSourceId`)
    REFERENCES `MIBD-PROYECTO`.`AppSources` (`AppSourceId`),
  CONSTRAINT `fk_Logs_EntityTypes1`
    FOREIGN KEY (`EntityTpyeId`)
    REFERENCES `MIBD-PROYECTO`.`EntityTypes` (`EntityTpyeId`),
  CONSTRAINT `fk_Logs_LogTypes`
    FOREIGN KEY (`LogTypeId`)
    REFERENCES `MIBD-PROYECTO`.`LogTypes` (`LogTypeId`),
  CONSTRAINT `fk_Logs_Severities1`
    FOREIGN KEY (`SevirityId`)
    REFERENCES `MIBD-PROYECTO`.`Severities` (`SevirityId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`Pictures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`Pictures` (
  `picutreId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Description` VARBINARY(300) NULL DEFAULT NULL,
  `Productid` BIGINT NOT NULL,
  `Deleted` BIT NULL,
  PRIMARY KEY (`picutreId`),
  INDEX `fk_Pictures_Products1_idx` (`Productid` ASC) VISIBLE,
  CONSTRAINT `fk_Pictures_Products1`
    FOREIGN KEY (`Productid`)
    REFERENCES `MIBD-PROYECTO`.`Products` (`Productid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`ProductsByBid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`ProductsByBid` (
  `ProductsByBidId` BIGINT NOT NULL AUTO_INCREMENT,
  `Quantity` INT NULL DEFAULT NULL,
  `BiddingId` BIGINT NOT NULL,
  `Productid` BIGINT NOT NULL,
  PRIMARY KEY (`ProductsByBidId`),
  INDEX `fk_ProductsByBid_Biddings1_idx` (`BiddingId` ASC) VISIBLE,
  INDEX `fk_ProductsByBid_Products1_idx` (`Productid` ASC) VISIBLE,
  CONSTRAINT `fk_ProductsByBid_Biddings1`
    FOREIGN KEY (`BiddingId`)
    REFERENCES `MIBD-PROYECTO`.`Biddings` (`BiddingId`),
  CONSTRAINT `fk_ProductsByBid_Products1`
    FOREIGN KEY (`Productid`)
    REFERENCES `MIBD-PROYECTO`.`Products` (`Productid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`Transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`Transactions` (
  `TransactionId` BIGINT NOT NULL AUTO_INCREMENT,
  `posttime` DATETIME NULL DEFAULT NULL,
  `PaymentAttemptId` BIGINT NOT NULL,
  PRIMARY KEY (`TransactionId`),
  INDEX `fk_Transactions_PaymenttAttempts1_idx` (`PaymentAttemptId` ASC) VISIBLE,
  CONSTRAINT `fk_Transactions_PaymenttAttempts1`
    FOREIGN KEY (`PaymentAttemptId`)
    REFERENCES `MIBD-PROYECTO`.`PaymenttAttempts` (`PaymentAttemptId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `MIBD-PROYECTO`.`UserSalesxCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MIBD-PROYECTO`.`UserSalesxCategory` (
  `UserSalesxcategoryId` BIGINT NOT NULL AUTO_INCREMENT,
  `SoldProductsAmountXCategory` BIGINT NULL DEFAULT NULL,
  `UserId` BIGINT NOT NULL,
  `ProductCategoryId` BIGINT NOT NULL,
  PRIMARY KEY (`UserSalesxcategoryId`),
  INDEX `fk_UserSalesxCategory_Users_idx` (`UserId` ASC) VISIBLE,
  INDEX `fk_UserSalesxCategory_ProductCategory1_idx` (`ProductCategoryId` ASC) VISIBLE,
  CONSTRAINT `fk_UserSalesxCategory_ProductCategory1`
    FOREIGN KEY (`ProductCategoryId`)
    REFERENCES `MIBD-PROYECTO`.`ProductCategory` (`ProductCategoryId`),
  CONSTRAINT `fk_UserSalesxCategory_Users`
    FOREIGN KEY (`UserId`)
    REFERENCES `MIBD-PROYECTO`.`Users` (`UserId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
