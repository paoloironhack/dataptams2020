USE lab_mysql;
/*
-- Query: SELECT * FROM cars
LIMIT 0, 1000

-- Date: 2020-01-31 23:02
*/
INSERT INTO `cars` (`car_id`,`vin`,`manufacturer`,`model`,`year`,`color`) VALUES ('0','3K096I98581DHSNUP',' Volkswagen ',' Tiguan ',2019,' Blue');
INSERT INTO `cars` (`car_id`,`vin`,`manufacturer`,`model`,`year`,`color`) VALUES ('1','ZM8G7BEUQZ97IH46V',' Peugeot ',' Rifter ',2019,' Red');
INSERT INTO `cars` (`car_id`,`vin`,`manufacturer`,`model`,`year`,`color`) VALUES ('2','RKXVNNIHLVVZOUB4M',' Ford ',' Fusion ',2018,' White ');
INSERT INTO `cars` (`car_id`,`vin`,`manufacturer`,`model`,`year`,`color`) VALUES ('3','HKNDGS7CU31E9Z7JW',' Toyota ',' RAV4 ',2018,' Silver');
INSERT INTO `cars` (`car_id`,`vin`,`manufacturer`,`model`,`year`,`color`) VALUES ('4','DAM41UDN3CHU2WVF6',' Volvo ',' V60 ',2019,' Gray');
INSERT INTO `cars` (`car_id`,`vin`,`manufacturer`,`model`,`year`,`color`) VALUES ('5','DAM41UDN3CHU2WVF6',' Volvo ',' V60 Cross Country ',2019,' Gray');


/*
-- Query: SELECT `customers`.`customer_id`,
    `customers`.`name`,
    `customers`.`phone_number`,
    `customers`.`email`,
    `customers`.`address`,
    `customers`.`city`,
    `customers`.`state`,
    `customers`.`country`,
    `customers`.`zip`
FROM `lab_mysql`.`customers`
LIMIT 0, 1000

-- Date: 2020-01-31 23:36
*/
INSERT INTO `customers` (`customer_id`,`name`,`phone_number`,`email`,`address`,`city`,`state`,`country`,`zip`) VALUES ('10001',' Pablo Picasso ','34636176382',' ','Paseo de la Chopera 14','Madrid','Madrid','Spain','28045');
INSERT INTO `customers` (`customer_id`,`name`,`phone_number`,`email`,`address`,`city`,`state`,`country`,`zip`) VALUES ('20001',' Abraham Lincoln ','13059077086',' ','120 SW 8th St ',' Miami',' Florida','United States','33130');
INSERT INTO `customers` (`customer_id`,`name`,`phone_number`,`email`,`address`,`city`,`state`,`country`,`zip`) VALUES ('30001',' Napoléon Bonaparte ','33179754000',' ','40 Rue du Colisée',' Paris ','Île-de-France',' France ','75008');


/*
-- Query: SELECT `salespersons`.`staff_id`,
    `salespersons`.`name`,
    `salespersons`.`store`,
    `salespersons`.`state`,
    `salespersons`.`zip`,
    `salespersons`.`country`
FROM `lab_mysql`.`salespersons`
LIMIT 0, 1000

-- Date: 2020-01-31 23:13
*/
INSERT INTO `salespersons` (`staff_id`,`name`,`store`,`state`,`zip`,`country`) VALUES ('00001','Petey Cruiser ','Madrid',NULL,NULL,NULL);
INSERT INTO `salespersons` (`staff_id`,`name`,`store`,`state`,`zip`,`country`) VALUES ('00002','Anna Sthesia ','Barcelona',NULL,NULL,NULL);
INSERT INTO `salespersons` (`staff_id`,`name`,`store`,`state`,`zip`,`country`) VALUES ('00003','Paul Molive ','Berlin',NULL,NULL,NULL);
INSERT INTO `salespersons` (`staff_id`,`name`,`store`,`state`,`zip`,`country`) VALUES ('00004','Gail Forcewind ','Paris',NULL,NULL,NULL);
INSERT INTO `salespersons` (`staff_id`,`name`,`store`,`state`,`zip`,`country`) VALUES ('00005','Paige Turner ','Mimia',NULL,NULL,NULL);
INSERT INTO `salespersons` (`staff_id`,`name`,`store`,`state`,`zip`,`country`) VALUES ('00006','Bob Frapples ','Mexico City',NULL,NULL,NULL);
INSERT INTO `salespersons` (`staff_id`,`name`,`store`,`state`,`zip`,`country`) VALUES ('00007','Walter Melon ','Amsterdam',NULL,NULL,NULL);
INSERT INTO `salespersons` (`staff_id`,`name`,`store`,`state`,`zip`,`country`) VALUES ('00008','Shonda Leer ','São Paulo',NULL,NULL,NULL);


/*
-- Query: SELECT * FROM lab_mysql.invoices
LIMIT 0, 1000

-- Date: 2020-01-31 23:59
*/
INSERT INTO `invoices` (`invoice_number`,`date`,`car_id`,`staff_id`,`customer_id`) VALUES ('271135104','2019-01-22','2','00002','30001');
INSERT INTO `invoices` (`invoice_number`,`date`,`car_id`,`staff_id`,`customer_id`) VALUES ('731166526','2018-12-31','3','00005','20001');
INSERT INTO `invoices` (`invoice_number`,`date`,`car_id`,`staff_id`,`customer_id`) VALUES ('852399038','2018-08-22','0','00001','10001');


