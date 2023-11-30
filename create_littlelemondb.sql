-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8mb3 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Customers` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Bookings` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `FK_bookings_customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Roles` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Roles` (
  `RoleID` INT NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RoleID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Staff` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Salary` INT NOT NULL,
  `RoleID` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `RoleID_idx` (`RoleID` ASC) VISIBLE,
  CONSTRAINT `FK_staff_roles`
    FOREIGN KEY (`RoleID`)
    REFERENCES `LittleLemonDB`.`Roles` (`RoleID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`ContactDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`ContactDetails` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`ContactDetails` (
  `ContactID` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `CustomerID` INT NOT NULL,
  `StaffID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ContactID`),
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  INDEX `Customer_ID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `FK_contactdetails_customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_contacdetails_staff`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`MenuItems` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `MenuItemsID` INT NOT NULL AUTO_INCREMENT,
  `CourseName` VARCHAR(45) NOT NULL,
  `StarterName` VARCHAR(45) NOT NULL,
  `DesertName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Menus` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `MenuID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuContent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`MenuContent` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuContent` (
  `MenuID` INT NOT NULL,
  `MenuItemsID` INT NOT NULL,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `MenuItemID_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `FK_menucontent_menuitems`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemsID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_menucontent_menus`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Orders` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderId` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,0) NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderId`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `FK_order_customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_order_menu`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDeliveryStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`OrderDeliveryStatus` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDeliveryStatus` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `OrderID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `FK_orderdeliverystatus_orders`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderId`),
  CONSTRAINT `FK_orderdeliverystatus_staff`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Placeholder table for view `LittleLemonDB`.`OrdersView`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrdersView` (`OrderId` INT, `Quantity` INT, `TotalCost` INT);

-- -----------------------------------------------------
-- View `LittleLemonDB`.`OrdersView`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`OrdersView`;
DROP VIEW IF EXISTS `LittleLemonDB`.`OrdersView` ;
USE `LittleLemonDB`;
CREATE  OR REPLACE VIEW `OrdersView` AS
select o.OrderId, o.Quantity, o.TotalCost from Orders o;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
