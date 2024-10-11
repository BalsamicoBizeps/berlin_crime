-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema BerlinStats
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BerlinStats
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BerlinStats` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `BerlinStats` ;

-- -----------------------------------------------------
-- Table `BerlinStats`.`Year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BerlinStats`.`Year` (
  `Year_id` INT NOT NULL AUTO_INCREMENT,
  `Year` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Year_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `BerlinStats`.`District`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BerlinStats`.`District` (
  `District_id` FLOAT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`District_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `BerlinStats`.`Crime_stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BerlinStats`.`Crime_stats` (
  `index` INT NOT NULL,
  `location` VARCHAR(50) NULL DEFAULT NULL,
  `robbery` INT NULL DEFAULT NULL,
  `street_robbery` INT NULL DEFAULT NULL,
  `injury` INT NULL DEFAULT NULL,
  `Agg_assault` INT NULL DEFAULT NULL,
  `threat` INT NULL DEFAULT NULL,
  `theft` INT NULL DEFAULT NULL,
  `car` INT NULL DEFAULT NULL,
  `from_car` INT NULL DEFAULT NULL,
  `bike` INT NULL DEFAULT NULL,
  `bulgary` INT NULL DEFAULT NULL,
  `fire` INT NULL DEFAULT NULL,
  `arson` INT NULL DEFAULT NULL,
  `damage` INT NULL DEFAULT NULL,
  `grafitti` INT NULL DEFAULT NULL,
  `drugs` INT NULL DEFAULT NULL,
  `local` INT NULL DEFAULT NULL,
  `Year_Year_id` INT NOT NULL,
  `District_District_id` FLOAT NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE INDEX `crime_id_UNIQUE` (`index` ASC) VISIBLE,
  INDEX `fk_Crime_stats_Year_idx` (`Year_Year_id` ASC) VISIBLE,
  INDEX `fk_Crime_stats_District1_idx` (`District_District_id` ASC) VISIBLE,
  CONSTRAINT `fk_Crime_stats_Year`
    FOREIGN KEY (`Year_Year_id`)
    REFERENCES `BerlinStats`.`Year` (`Year_id`),
  CONSTRAINT `fk_Crime_stats_District1`
    FOREIGN KEY (`District_District_id`)
    REFERENCES `BerlinStats`.`District` (`District_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
