CREATE DATABASE lab_mysql;
USE lab_mysql;
CREATE TABLE salesperson (staff_id VARCHAR(20), name VARCHAR(20), store VARCHAR(20));
CREATE TABLE customers (customer_id VARCHAR(20), name_customer VARCHAR(20), phone_number_customer VARCHAR(20), email_customer VARCHAR(20), address_customer VARCHAR(20), city_customer VARCHAR(20));
CREATE TABLE cars (vin VARCHAR(20), manufacturer VARCHAR(20), model VARCHAR(20), year_model CHAR(4), car_color VARCHAR(20));
CREATE TABLE invoices (invoice_number VARCHAR(20), date DATE, vin VARCHAR(20), customer_id VARCHAR(20), staff_id VARCHAR(20));

