CREATE DATABASE lab_mysql;

CREATE TABLE `car` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vin` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `postal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salesperson` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `store` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `invoice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_number` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `car_id` int(11) unsigned DEFAULT NULL,
  `customer_id` int(11) unsigned DEFAULT NULL,
  `salesperson_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `salesperson_id` (`salesperson_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`salesperson_id`) REFERENCES `salesperson` (`id`),
  CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

