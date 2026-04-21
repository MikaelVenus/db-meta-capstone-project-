-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema littlelemon-db-capstone-project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemon-db-capstone-project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemon-db-capstone-project` DEFAULT CHARACTER SET utf8 ;
USE `littlelemon-db-capstone-project` ;

-- -----------------------------------------------------
-- Table `littlelemon-db-capstone-project`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon-db-capstone-project`.`Customer` (
  `customerId` INT NOT NULL,
  `customerName` VARCHAR(45) NOT NULL,
  `contactDetail` VARCHAR(225) NULL,
  PRIMARY KEY (`customerId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemon-db-capstone-project`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon-db-capstone-project`.`Menu` (
  `menuId` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `foodType` VARCHAR(45) NULL,
  `cost` VARCHAR(45) NULL,
  PRIMARY KEY (`menuId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemon-db-capstone-project`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon-db-capstone-project`.`Bookings` (
  `bookingId` INT NOT NULL,
  `bookingDate` DATETIME NOT NULL,
  `tableNumber` VARCHAR(45) NOT NULL,
  `customerId` INT NOT NULL,
  `menuId` INT NULL,
  PRIMARY KEY (`bookingId`),
  INDEX `customer_id_fk_idx` (`customerId` ASC) VISIBLE,
  INDEX `menu_id_fk_idx` (`menuId` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`customerId`)
    REFERENCES `littlelemon-db-capstone-project`.`Customer` (`customerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`menuId`)
    REFERENCES `littlelemon-db-capstone-project`.`Menu` (`menuId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemon-db-capstone-project`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon-db-capstone-project`.`Staff` (
  `staffId` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NULL,
  `salary` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`staffId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemon-db-capstone-project`.`DeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon-db-capstone-project`.`DeliveryStatus` (
  `deliveryId` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `orderId` INT NOT NULL,
  `deliveryDate` DATE NOT NULL,
  PRIMARY KEY (`deliveryId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemon-db-capstone-project`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon-db-capstone-project`.`Orders` (
  `orderId` INT NOT NULL,
  `orderDate` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` DECIMAL NOT NULL,
  `staffId` INT NOT NULL,
  `deliveryId` INT NULL,
  `bookingId` INT NULL,
  PRIMARY KEY (`orderId`),
  INDEX `staff_id_fk_idx` (`staffId` ASC) VISIBLE,
  INDEX `delivery_id_fk_idx` (`deliveryId` ASC) VISIBLE,
  INDEX `booking_id_fk_idx` (`bookingId` ASC) VISIBLE,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`staffId`)
    REFERENCES `littlelemon-db-capstone-project`.`Staff` (`staffId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `delivery_id_fk`
    FOREIGN KEY (`deliveryId`)
    REFERENCES `littlelemon-db-capstone-project`.`DeliveryStatus` (`deliveryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `booking_id_fk`
    FOREIGN KEY (`bookingId`)
    REFERENCES `littlelemon-db-capstone-project`.`Bookings` (`bookingId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
