-- MySQL Script generated by MySQL Workbench
-- Tue May  8 14:40:10 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema HCM
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `HCM` ;

-- -----------------------------------------------------
-- Schema HCM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HCM` DEFAULT CHARACTER SET utf8 ;
USE `HCM` ;

-- -----------------------------------------------------
-- Table `HCM`.`Specialisation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Specialisation` (
  `SpecialisationId` INT NOT NULL AUTO_INCREMENT,
  `SpecialisationName` VARCHAR(150) NULL,
  PRIMARY KEY (`SpecialisationId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Department` (
  `Department ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Department ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Doctor` (
  `Doctor ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(145) NULL,
  `Phone` INT NULL,
  `Address` VARCHAR(145) NULL,
  `Specialisation_SpecialisationId` INT NOT NULL,
  `Department_Department ID` INT NOT NULL,
  `Email` VARCHAR(145) NULL,
  PRIMARY KEY (`Doctor ID`),
  INDEX `fk_Doctor_Specialisation1_idx` (`Specialisation_SpecialisationId` ASC),
  INDEX `fk_Doctor_Department1_idx` (`Department_Department ID` ASC),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC),
  UNIQUE INDEX `Phone_UNIQUE` (`Phone` ASC),
  CONSTRAINT `fk_Doctor_Specialisation1`
    FOREIGN KEY (`Specialisation_SpecialisationId`)
    REFERENCES `HCM`.`Specialisation` (`SpecialisationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_Department1`
    FOREIGN KEY (`Department_Department ID`)
    REFERENCES `HCM`.`Department` (`Department ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Patient` (
  `Patient ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(145) NULL,
  `Phone` INT NULL,
  `Address` VARCHAR(145) NULL,
  `Date of birth` DATE NULL,
  `Email` VARCHAR(150) NULL,
  `Gender` VARCHAR(45) NULL,
  `Doctor_Doctor ID` INT NOT NULL,
  `Discharged` DATE NULL,
  PRIMARY KEY (`Patient ID`),
  INDEX `fk_Patient_Doctor_idx` (`Doctor_Doctor ID` ASC),
  UNIQUE INDEX `Phone_UNIQUE` (`Phone` ASC),
  CONSTRAINT `fk_Patient_Doctor`
    FOREIGN KEY (`Doctor_Doctor ID`)
    REFERENCES `HCM`.`Doctor` (`Doctor ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Nursing Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Nursing Staff` (
  `Staff ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Department_Department ID` INT NOT NULL,
  PRIMARY KEY (`Staff ID`),
  INDEX `fk_Nursing Staff_Department1_idx` (`Department_Department ID` ASC),
  CONSTRAINT `fk_Nursing Staff_Department1`
    FOREIGN KEY (`Department_Department ID`)
    REFERENCES `HCM`.`Department` (`Department ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Ray`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Ray` (
  `Ray Name` VARCHAR(45) NOT NULL,
  `Price` FLOAT NULL,
  PRIMARY KEY (`Ray Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Test` (
  `Test Name` VARCHAR(45) NOT NULL,
  `Price` FLOAT NULL,
  PRIMARY KEY (`Test Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Pharmacy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Pharmacy` (
  `Drug Name` VARCHAR(45) NOT NULL,
  `Expired date` DATE NULL,
  PRIMARY KEY (`Drug Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Emergency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Emergency` (
  `Patient No` INT NOT NULL,
  `Patient Name` VARCHAR(45) NULL,
  `Age` INT NULL,
  PRIMARY KEY (`Patient No`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`medicine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`medicine` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Pharmacy_has_medicine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Pharmacy_has_medicine` (
  `Pharmacy_Drug Name` VARCHAR(45) NOT NULL,
  `medicine_ID` INT NOT NULL,
  `EffectiveMaterial` VARCHAR(45) NULL,
  `price` FLOAT NULL,
  PRIMARY KEY (`Pharmacy_Drug Name`, `medicine_ID`),
  INDEX `fk_Pharmacy_has_medicine_medicine1_idx` (`medicine_ID` ASC),
  INDEX `fk_Pharmacy_has_medicine_Pharmacy1_idx` (`Pharmacy_Drug Name` ASC),
  CONSTRAINT `fk_Pharmacy_has_medicine_Pharmacy1`
    FOREIGN KEY (`Pharmacy_Drug Name`)
    REFERENCES `HCM`.`Pharmacy` (`Drug Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pharmacy_has_medicine_medicine1`
    FOREIGN KEY (`medicine_ID`)
    REFERENCES `HCM`.`medicine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Patient_has_medicine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Patient_has_medicine` (
  `Patient_Patient ID` INT NOT NULL,
  `medicine_ID` INT NOT NULL,
  `Date` DATE NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`Patient_Patient ID`, `medicine_ID`),
  INDEX `fk_Patient_has_medicine_medicine1_idx` (`medicine_ID` ASC),
  INDEX `fk_Patient_has_medicine_Patient1_idx` (`Patient_Patient ID` ASC),
  CONSTRAINT `fk_Patient_has_medicine_Patient1`
    FOREIGN KEY (`Patient_Patient ID`)
    REFERENCES `HCM`.`Patient` (`Patient ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_has_medicine_medicine1`
    FOREIGN KEY (`medicine_ID`)
    REFERENCES `HCM`.`medicine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Patient_has_Ray`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Patient_has_Ray` (
  `Patient_Patient ID` INT NOT NULL,
  `Ray_Ray Name` VARCHAR(45) NOT NULL,
  `Date` DATE NOT NULL,
  PRIMARY KEY (`Patient_Patient ID`, `Ray_Ray Name`, `Date`),
  INDEX `fk_Patient_has_Ray_Ray1_idx` (`Ray_Ray Name` ASC),
  INDEX `fk_Patient_has_Ray_Patient1_idx` (`Patient_Patient ID` ASC),
  CONSTRAINT `fk_Patient_has_Ray_Patient1`
    FOREIGN KEY (`Patient_Patient ID`)
    REFERENCES `HCM`.`Patient` (`Patient ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_has_Ray_Ray1`
    FOREIGN KEY (`Ray_Ray Name`)
    REFERENCES `HCM`.`Ray` (`Ray Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Prescription` (
  `ID` INT NOT NULL,
  `Doctor_Doctor ID` INT NOT NULL,
  `medicine_ID` INT NOT NULL,
  `Patient_Patient ID` INT NOT NULL,
  `Date` DATE NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Prescription_Doctor1_idx` (`Doctor_Doctor ID` ASC),
  INDEX `fk_Prescription_medicine1_idx` (`medicine_ID` ASC),
  INDEX `fk_Prescription_Patient1_idx` (`Patient_Patient ID` ASC),
  CONSTRAINT `fk_Prescription_Doctor1`
    FOREIGN KEY (`Doctor_Doctor ID`)
    REFERENCES `HCM`.`Doctor` (`Doctor ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prescription_medicine1`
    FOREIGN KEY (`medicine_ID`)
    REFERENCES `HCM`.`medicine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prescription_Patient1`
    FOREIGN KEY (`Patient_Patient ID`)
    REFERENCES `HCM`.`Patient` (`Patient ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HCM`.`Patient_has_Test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HCM`.`Patient_has_Test` (
  `Patient_Patient ID` INT NOT NULL,
  `Test_Test Name` VARCHAR(45) NOT NULL,
  `Date` DATE NOT NULL,
  PRIMARY KEY (`Patient_Patient ID`, `Test_Test Name`, `Date`),
  INDEX `fk_Patient_has_Test_Test1_idx` (`Test_Test Name` ASC),
  INDEX `fk_Patient_has_Test_Patient1_idx` (`Patient_Patient ID` ASC),
  CONSTRAINT `fk_Patient_has_Test_Patient1`
    FOREIGN KEY (`Patient_Patient ID`)
    REFERENCES `HCM`.`Patient` (`Patient ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_has_Test_Test1`
    FOREIGN KEY (`Test_Test Name`)
    REFERENCES `HCM`.`Test` (`Test Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
