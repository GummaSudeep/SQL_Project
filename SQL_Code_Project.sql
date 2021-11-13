 -- Creating a Database
 CREATE DATABASE InventoryManagementSystem

 -- To Use the Created Database(InventoryManagementSystem)
 USE InventoryManagementSystem

 -- Existing Databases
 SELECT	name FROM master.dbo.sysdatabases

 -- CREATING A CUSTOMER TABLE 
 CREATE TABLE customer(
 customer_id BIGINT PRIMARY KEY NOT NULL,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 address VARCHAR(200) NOT NULL,
 contact_number VARCHAR(100) UNIQUE NOT NULL)

 -- INSERTING SOME DATA INTO THE CUSTOMER TABLE
 INSERT INTO dbo.customer
 VALUES
('19443','Minna','Amigon','2371 Jerrold Ave','215-874-1229')

 -- SELECTING THE DATA FROM THE CUSTOMER TABLE
 SELECT * FROM dbo.customer

 -- CREATING A EMPLOYEE TABLE
 CREATE TABLE employee(
 employee_id BIGINT PRIMARY KEY NOT NULL,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 address TEXT NOT NULL,
 contact_number VARCHAR(100) NOT NULL,
 position VARCHAR(50) NOT NULL)

 -- INSERTING SOME DATA INTO THE EMPLOYEE TABLE
 INSERT INTO dbo.employee
 VALUES
 ('677509','Lois','Walker','6649 N Blue Gum St','303-572-8492','Research Director'),
 ('940761','Brenda','Robinson','4 B Blue Ridge Blvd','225-945-4954','Healthcare Representative'),
 ('428945','Joe','Robinson','8 W Cerritos Ave #54','219-904-2161','Healthcare Representative'),
 ('408351','Diane','Evans','639 Main St','215-793-6791','Developer'),
 ('193819','Benjamin','Russell','34 Center St',	'262-404-2252','Laboratory Technician'),
 ('499687','Patrick','Bailey','3 Mcauley Dr','319-812-6957','Sales Representative'),
 ('539712','Nancy','Baker',	'7 Eads St','229-336-5117',	'Human Resources'),
 ('153989','Jack','Alexander','37275 St  Rt 17m M',	'702-603-3769','Manufacturing Director'),
 ('386158','Melissa','King','25 E 75th St #69',	'216-605-3731',	'Research Scientist'),
 ('441771','Cheryl','Scott','56 E Morehead St',	'215-288-9345',	'Laboratory Technician')

 -- SELECTING THE DATA FROM THE EMPLOYEE TABLE
 SELECT * FROM dbo.employee

  -- CREATING A SUPPLIER TABLE
 CREATE TABLE supplier(
 supplier_id BIGINT PRIMARY KEY NOT NULL,
 supplier_name VARCHAR(50) NOT NULL,
 supplier_address TEXT NOT NULL,
 contact_number VARCHAR(50) NOT NULL,
 brand_id BIGINT NOT NULL)

 -- INSERTING SOME DATA INTO THE EMPLOYEE TABLE

 INSERT INTO dbo.supplier
 VALUES
('363065','Nancy','47565 W Grand Ave','212-825-1930','726'),
('226714','Judy','2853 S Central Expy','316-736-6126','955'),
('491943','Nancy','3305 Nabell Ave #679','236-973-8086','813'),
('758872','Henry','74 W College St','314-731-7135','943'),
('917395','ToddHall','2737 Pistorio Rd #9230','240-513-8668','173'),
('750173','AntonioRoberts','47565 W Grand Ave','205-267-7304','573'),
('515103','AnnePerez','701 S Harrison Rd','423-837-3338','955'),
('940922','MelissaButler','18 Fountain St','308-827-9016','110'),
('883936','DouglasFlores','74989 Brandon St','303-836-4721','459'),
('447813','AnnColeman','701 S Harrison Rd','319-994-4179','65')

 -- SELECTING THE DATA FROM THE EMPLOYEE TABLE
 SELECT * FROM dbo.supplier

   -- CREATING A ORDER TABLE
 CREATE TABLE order_table(
 order_id BIGINT PRIMARY KEY NOT NULL,
 customer_id BIGINT REFERENCES dbo.customer(customer_id),
 employee_id BIGINT REFERENCES dbo.employee(employee_id),
 invoice_number BIGINT UNIQUE NOT NULL,
 office_recepit_number BIGINT UNIQUE NOT NULL,
 total_price DOUBLE PRECISION NOT NULL,
 date_order DATE NOT NULL,
 quantity DOUBLE PRECISION NOT NULL,
 brand_id BIGINT NOT NULL)

-- INSERTING SOME DATA INTO THE ORDER_TABLE
INSERT INTO dbo.order_table
VALUES
('94010','21224','386158','819028031','8400','786.58','2014-10-20','65','435'),
('91776','44805','408351','860673511','4037','250.02','2014-10-21','75','535'),
('76708','45011','428945','795490682','2160','1170.81','2015-10-01','85','735'),
('99501','48116','441771','142278373','5448','700.53','2015-10-02','95','810'),
('95110','57105','499687','740147912','8846','145.12','2015-10-03','105','910'),
('94577','70116','539712','898523128','6612','414.70','2016-07-11','115','1005'),
('46202','95111','677509','347140347','1220','138.4','2016-07-19','125','1115'),
('82901','99501','940761','686048400','1001','79.24','2017-01-13','145','1325')

-- SELECTING THE DATA FROM THE ORDER_TABLE
 SELECT * FROM dbo.order_table

-- CREATING A CASH_ORDER TABLE
 CREATE TABLE cash_order(
 cashorder_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
 invoice_number BIGINT NOT NULL,
 brand_name TEXT NOT NULL,
 model VARCHAR(50) NOT NULL,
 serial_number VARCHAR(100) NOT NULL,
 price DOUBLE PRECISION NOT NULL,
 unit_type TEXT NOT NULL)

 -- INSERTING SOME DATA INTO THE ORDER_TABLE
INSERT INTO dbo.cash_order
VALUES
('223359620','OPPO','A53','A53212','10490.20','Credit'),
('902102267','VIVO','Y20G','Y20267','12891.90','Cash'),
('3314384481','OPPO','Y21S','Y21990','14590.30','NetBanking'),
('617667090','SAMSUNG','M31S','M31123','19990.00','Cash'),
('787399423','SAMSUNG','M325G','M32566','21490.10','Credit'),
('837559306','APPLE','XR','XR3312','52900.40','NetBanking'),
('385383069','APPLE','12MINI','121656','56999.00','Credit'),
('918419539','NOKIA','110 TA-1302 DS','DS3422','1490.20','Cash'),
('844530045','NOKIA','6310','633221','4090.40','Debit')

-- SELECTING THE DATA FROM THE ORDER_TABLE
SELECT * FROM cash_order

-- CREATING A PRODUCT TABLE
 CREATE TABLE product(
 product_id BIGINT NOT Null,
 date_received DATE NOT NULL,
 brand_id BIGINT NOT NULL,
 brand_name TEXT NOT NULL,
 model VARCHAR(50) NOT NULL,
 serial_number VARCHAR(100) NOT NULL,
 avail_ability TEXT NULL,
 date_sold DATE NOT Null,
 customer_id BIGINT NOT NULL,
 unit_type TEXT NOT NULL)

 -- Adding the PRIMARY KEY With Different Syntax
 ALTER TABLE product
 ADD PRIMARY KEY (Product_id)

 -- Adding the FOREIGN KEY With Different Syntax
 ALTER TABLE product
 ADD FOREIGN KEY (customer_id) REFERENCES customer(customer_id)

 -- SELECTING THE DATA FROM THE PRODUCT_TABLE
 SELECT * FROM product

 -- CREATING A CHANGE ORDER TABLE
 CREATE TABLE change_order(
 changeorder_id BIGINT PRIMARY KEY NOT NULL,
 invoice_number BIGINT NOT NULL,
 brand_name TEXT NOT NULL,
 model VARCHAR(50) NOT NULL,
 unit_type TEXT NOT NULL,
 serial_number VARCHAR(100) NOT NULL,
 price DOUBLE PRECISION NOT NULL,
 down_payment MONEY NULL,
 month_term MONEY NULL,
 monthly_payment MONEY NULL,
 rebate TEXT NULL)

 -- Replacing the NULL with different Value
UPDATE change_order
SET down_payment = '0'
WHERE down_payment IS NULL

-- Changing the DATA TYPE for the COLUMN 
ALTER TABLE change_order
ALTER COLUMN brand_name VARCHAR(50)

-- Replacing the NULL with Condition
UPDATE change_order
SET month_term = '1'
WHERE brand_name = 'NOKIA'

-- Replacing the NULL with BETWEEN CLAUSE
UPDATE change_order
SET monthly_payment = '0'
WHERE price BETWEEN 10000 AND 15000

-- SELECTING THE DATA FROM THE CHANGE_ORDER TABLE
 SELECT * FROM change_order