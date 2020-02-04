# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.19)
# Database: lab_mysql
# Generation Time: 2020-02-04 20:07:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Cars
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Cars`;

CREATE TABLE `Cars` (
  `ID` int DEFAULT NULL,
  `VIN` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Manufacturer` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Model` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `Colour` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `Cars` WRITE;
/*!40000 ALTER TABLE `Cars` DISABLE KEYS */;

INSERT INTO `Cars` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Colour`)
VALUES
	(0,'3K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue'),
	(1,'ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
	(2,'RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),
	(3,'HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver'),
	(4,'DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray'),
	(5,'DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country',2019,'Gray');

/*!40000 ALTER TABLE `Cars` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Customers`;

CREATE TABLE `Customers` (
  `ID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `Name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `StateProvince` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Postal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;

INSERT INTO `Customers` (`ID`, `CustomerID`, `Name`, `Phone`, `Email`, `Address`, `City`, `StateProvince`, `Country`, `Postal`)
VALUES
	(0,10001,'Pablo Picasso','+34 636 17 63 82','-','Paseo de la Chopera, 14','Madrid','Madrid','Spain',28045),
	(1,20001,'Abraham Lincoln','+1 305 907 7086','-','120 SW 8th St','Miami','Florida','United States',33130),
	(2,30001,'Napoléon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée','Paris','Île-de-France','France',75008);

/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Invoices`;

CREATE TABLE `Invoices` (
  `ID` int DEFAULT NULL,
  `InvoiceNumber` int DEFAULT NULL,
  `Date` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Car` int DEFAULT NULL,
  `Customer` int DEFAULT NULL,
  `SalesPerson` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `Invoices` WRITE;
/*!40000 ALTER TABLE `Invoices` DISABLE KEYS */;

INSERT INTO `Invoices` (`ID`, `InvoiceNumber`, `Date`, `Car`, `Customer`, `SalesPerson`)
VALUES
	(0,852399038,'2018-08-22',0,1,3),
	(1,731166526,'20189-12-31',3,0,5),
	(2,271135104,'2019-01-22',2,2,7);

/*!40000 ALTER TABLE `Invoices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Salespersons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Salespersons`;

CREATE TABLE `Salespersons` (
  `ID` int DEFAULT NULL,
  `StaffID` int DEFAULT NULL,
  `Name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Store` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `Salespersons` WRITE;
/*!40000 ALTER TABLE `Salespersons` DISABLE KEYS */;

INSERT INTO `Salespersons` (`ID`, `StaffID`, `Name`, `Store`)
VALUES
	(0,1,'Petey Cruiser','Madrid'),
	(1,2,'Anna Sthesia','Barcelona'),
	(2,3,'Paul Molive','Berlin'),
	(3,4,'Gail Forcewind','Paris'),
	(4,5,'Paige Turner','Mimia'),
	(5,6,'Bob Frapples','Mexico City'),
	(6,7,'Walter Melon','Amsterdam'),
	(7,8,'Shonda Leer','São Paulo');

/*!40000 ALTER TABLE `Salespersons` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
