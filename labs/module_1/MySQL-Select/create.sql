CREATE DATABASE lab_mysql;
USE lab_mysql;
CREATE TABLE Salespersons (Staff_ID INT (15), Name VARCHAR(20), Store VARCHAR(20));
CREATE TABLE Customers (Customer_ID INT(15), Name VARCHAR(20), Phone VARCHAR (20), Email VARCHAR(20), Address VARCHAR (200), City VARCHAR(20), State VARCHAR(20), Country VARCHAR(20), Postal INT(10));
CREATE TABLE Cars (VIN VARCHAR(20), Manufacturer VARCHAR (20), Model VARCHAR(20), Year INT(4), Color VARCHAR (20));
CREATE TABLE Invoices (Invoice_no INT(15), Date DATE, Car INT(10), Customer INT(10), Salesperson INT(15))