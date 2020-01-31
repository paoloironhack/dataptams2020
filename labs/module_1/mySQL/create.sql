USE lab_mysql;
drop database lab_mysql;
create database lab_mysql;
CREATE TABLE `lab_mysql`.`cars` (
  `car_id` VARCHAR(15) NOT NULL,
  `vin` VARCHAR(17) NOT NULL,
  `manufacturer` VARCHAR(20) NOT NULL,
  `model` VARCHAR(20) NOT NULL,
  `year` YEAR(4) NOT NULL,
  `color` VARCHAR(20) NULL,
  PRIMARY KEY (`car_id`))
COMMENT = 'Contains all data about cars in the dealership';



CREATE TABLE `lab_mysql`.`customers` (
  `customer_id` VARCHAR(15) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `phone_number` CHAR(20) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  `address` VARCHAR(40) NOT NULL,
  `city` VARCHAR(20) NULL,
   `state` CHAR(15) NULL,
   `country` VARCHAR(20) NULL,
   `zip` CHAR(5) NULL,
  PRIMARY KEY (`customer_id`))
COMMENT = 'Contains all data about customers';


CREATE TABLE `lab_mysql`.`salespersons` (
`staff_id` VARCHAR(10),
`name` VARCHAR(30),
`store` VARCHAR(25),
`state` CHAR(2),
`zip` CHAR(5),
`country` VARCHAR(20),
PRIMARY KEY (`staff_id`))
COMMENT = 'Contains all the data of the salespersons';


CREATE TABLE `lab_mysql`.`invoices` (
  `invoice_number` VARCHAR(10) NOT NULL,
  `date` DATE NOT NULL,
  `car_id` VARCHAR(15) NOT NULL,
  `staff_id` VARCHAR(10),
  `customer_id` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`invoice_number`),
  CONSTRAINT `car_id`
    FOREIGN KEY (`car_id`)
    REFERENCES `lab_mysql`.`cars` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `lab_mysql`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staff_id`
    FOREIGN KEY (`staff_id`)
    REFERENCES `lab_mysql`.`salespersons` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Invoices';