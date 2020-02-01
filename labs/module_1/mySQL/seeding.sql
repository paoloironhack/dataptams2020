USE lab_mysql;


INSERT INTO Cars (Car_id,VIN,Manufacturer,Year,Color,Model,Price)
    -> VALUES
    -> (0001,'HKNDGS7CU31E9Z7JW','Toyota','2019','Red','Yaris',14000),
    -> (0002,'HKNDGS7CU31E9Z7JW','Volvo','2015','Black','X50',25000),
    -> (0003,'DAM41UDN3CHU2WVF6','Ferrari','2001','Red','Testarossa',85000),
    -> (0015, 'LAF33JSO6POP3ILLC7','Nissan','2018','Black','Micra',11000);




INSERT INTO Customers (Customer_id,Name,Family_Name,Phone,Email,Address,City,Province,ZIP_Code)
    -> VALUES
    -> (10001,'Pablo','Picasso','+3456439899','pablo.picasso@gmail.com','Avenida de Arte','Valencia','VA','VA20340'),
    -> (10231,'Antonio','Rodrigues','+3457924739','antonio.rodrigues@icloud.com','Plaza Major','Madrid','MA','MA32459'),
    -> (24981,'Carme','Corazzon','+3409348710','cacorazzon@yahoo.es','Plaja Roja','Barcelona','BA','BA45669'),
 -> (24981,'Alba','Fierro','+3483098765','a.fierro@google.com','Avenida Masticada','Alicante','AL','AL983200'),
-> (99811,'Antonio','Stingo','+3421094573','a.stingo@google.com','Caminada del Mar','Malaga','MA','MA983900'); 


insert into lab_mysql.invoices (Inv_number,Date,Staff_id, Customer_id)
    -> VALUES
    -> (0001,852399038,'2018-08-22',00001,10001),
    -> (0002,731166526,'2017-07-11',00002,99811),
    -> (0015,271135104,'2019-11-11',00003,10231);


INSERT INTO lab_mysql.Sales_person (Staff_id,Name,Family_Name,Store_id)
    -> VALUES
    -> (00001,'Peter','Grossman',35100),
    -> (00002,'Frank','Genus',35100),
    -> (00003,'Albert','Magnus',45100),
    -> (00004,'Franco','Rossi',66100),
    -> (00005,'Leo','Nerino',88100);