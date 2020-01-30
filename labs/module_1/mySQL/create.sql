USE lab_mysql;


CREATE TABLE Cars (
    -> ID INT (100) AUTO_INCREMENT PRIMARY KEY,
    -> VIN VARCHAR(20) NOT NULL,
    -> Manufacturer VARCHAR(20),
    -> Year VARCHAR(4),
    -> Color Char(20),
    -> Model Char(20),
    -> Price Decimal(19,4));


CREATE TABLE Invoices (
    -> ID INT (100) AUTO_INCREMENT PRIMARY KEY,
    -> Inv_number INT(20) NOT NULL,
    -> Date DATE,
    -> VIN VARCHAR(20),
    -> Staff_id INT(20),
    -> Customer_id INT(20));


create table Customers (
    -> ID INT(100) AUTO_INCREMENT PRIMARY KEY,
    -> Customer_id INT(20),
    -> Name Char(20),
    -> Family_Name Char(20),
    -> Phone VARCHAR(20),
    -> Email CHAR(40),
    -> Address CHAR(40),
    -> City Char(20),
    -> Province Char(20),
    -> City Char(20),
    -> ZIP_Code VARCHAR(20),
    -> VIN Varchar(20));


create table Sales_person (
    -> ID INT(100) AUTO_INCREMENT PRIMARY KEY,
    -> Staff_id INT(20),
    -> Name Char(20),
    -> Family_Name Char(20),
    -> Phone VARCHAR(20),
    -> Email Char(50),
    -> Store_id INT(20),
    -> Customer_id INT(20));