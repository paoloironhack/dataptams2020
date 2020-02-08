```mysql
	USE lab_mysql;
SHOW TABLES 
INSERT INTO car (ID, VIN, Manufacturer, Model, Year, Color) 
VALUES ROW (0, 3K096I98581DHSNUP, Volkswagen, Tiguan, 2016, Blue), ROW (1, ZM8G7BEUQZ97IH46V, Peugeot, Rifter, 2019, Red),  ROW (2, RKXVNNIHLVVZOUB4M, Ford, Fusion, 2018, White), ROW ( 3, HKNDGS7CU31E9Z7JW, Toyota, RAV4, 2018, Silver), ROW ( 4, DAM41UDN3CHU2WVF6, Volvo, V60, 2019, Gray), ROW  (5, DAM41UDN3CHU2WVF6, Volvo, V60 Cross Country, 2019, Gray); 
INSERT INTO customers (ID , Customer ID , Name , Phone , Email , Address , City , State/Province, Country , Postal)
VALUES ROW (0 , 10001 , Pablo Picasso , +34 636 17 63 82 , - , Paseo de la Chopera, 14 , Madrid , Madrid , Spain , 28045), ROW (1 , 20001 , Abraham Lincoln , +1 305 907 7086 , - , 120 SW 8th St , Miami , Florida , United States , 33130), ROW (2 , 30001 , Napoléon Bonaparte , +33 1 79 75 40 00 , - , 40 Rue du Colisée , Paris , Île-de-France , France , 75008); 
INSERT INTO salesperson (ID , Staff ID , Name , Store)
VALUES ROW (0 , 00001 , Petey Cruiser , Madrid), ROW (1 , 00002 , Anna Sthesia , Barcelona), ROW (2 , 00003 , Paul Molive , Berlin), ROW (3 , 00004 , Gail Forcewind , Paris), ROW (4 , 00005 , Paige Turner , Mimia), ROW (5 , 00006 , Bob Frapples , Mexico City), ROW (6 , 00007 , Walter Melon , Amsterdam), (7 , 00008 , Shonda Leer , São Paulo);
INSERT INTO invoice (ID , Invoice Number , Date , Car , Customer , Sales Person)
VALUES ROW (0 , 852399038 , 22-08-2018 , 0 , 1 , 3), ROW (1 , 731166526 , 31-12-2018 , 3 , 0 , 5), ROW (2 , 271135104 , 22-01-2019 , 2 , 2 , 7); 
SHOW TABLES 
SELECT * FROM customers
SELECT * FROM car
SELECT * FROM salesperson
SELECT * FROM invoice
```
