-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema recipes_2_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `recipes_2_db` ;

-- -----------------------------------------------------
-- Schema recipes_2_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `recipes_2_db` DEFAULT CHARACTER SET utf8 ;
USE `recipes_2_db` ;

-- -----------------------------------------------------
-- Table `recipes_2_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recipes_2_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  `updated_at` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipes_2_db`.`recipes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recipes_2_db`.`recipes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `instructions` VARCHAR(255) NOT NULL,
  `under_30` TINYINT NOT NULL,
  `date_made` DATETIME NULL,
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  `updated_at` DATETIME NOT NULL DEFAULT NOW(),
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipes_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `recipes_2_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
