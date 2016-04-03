
-- -----------------------------------------------------
-- Schema userstore
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `userstore` ;

-- -----------------------------------------------------
-- Schema userstore
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `userstore` DEFAULT CHARACTER SET utf8 ;
USE `userstore` ;

-- -----------------------------------------------------
-- Table `userstore`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `userstore`.`users` ;

CREATE TABLE IF NOT EXISTS `userstore`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(30) not NULL,
  `user_pass` VARCHAR(100) not NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `userstore`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `userstore`.`roles` ;

CREATE TABLE IF NOT EXISTS `userstore`.`roles` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(30) not NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE INDEX `role_name_UNIQUE` (`role_name` ASC))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `userstore`.`user_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `userstore`.`user_roles` ;

CREATE TABLE IF NOT EXISTS `userstore`.`user_roles` (
  `user_id` INT NOT NULL,
  `role_id` INT not NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  CONSTRAINT `fk_role_id_exists`
    FOREIGN KEY (`role_id`)
    REFERENCES `userstore`.`roles` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

