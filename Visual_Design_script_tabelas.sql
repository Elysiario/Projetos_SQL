-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema dbusers
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dbusers` ;

-- -----------------------------------------------------
-- Schema dbusers
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbusers`;
USE `dbusers` ;

-- -----------------------------------------------------
-- Table `dbusers`.`application_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbusers`.`application_user` (
  `application_user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `application_user_name` VARCHAR(40) NOT NULL,
  `first_name` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NOT NULL,
  `last_name` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NOT NULL,
  `full_name` VARCHAR(40) GENERATED ALWAYS AS (concat(`first_name`,`last_name`)) VIRTUAL,
  `tax_payer_number` INT(10) UNSIGNED ZEROFILL NOT NULL,
  `type` SET('C', 'A', 'E') NOT NULL DEFAULT 'C',
  `created_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`application_user_id`),
  UNIQUE INDEX `application_user_name_UNIQUE` (`application_user_name` ASC) VISIBLE,
  UNIQUE INDEX `tax_payer_number_UNIQUE` (`tax_payer_number` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
COMMENT = 'A tabela guarda dados para controlo de acesso por parte de utilizadores de uma aplicação de acesso a bases de dados';


-- -----------------------------------------------------
-- Table `dbusers`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbusers`.`message` (
  `message_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(45) NOT NULL,
  `message` TEXT NOT NULL,
  `application_user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`message_id`),
  INDEX `fk_message_applicartion_user_idx` (`application_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_message_applicartion_user`
    FOREIGN KEY (`application_user_id`)
    REFERENCES `dbusers`.`application_user` (`application_user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1;
