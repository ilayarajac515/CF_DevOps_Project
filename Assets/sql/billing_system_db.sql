create database BillingSystem;

use BillingSystem;

CREATE TABLE invoice (
    id INT PRIMARY KEY IDENTITY(1,1),
    customerName VARCHAR(255) NOT NULL,
    invoiceDateTime DATETIME NOT NULL,
    totalAmount FLOAT NOT NULL
);


CREATE TABLE invoice_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    customer_name VARCHAR(255),
    invoice_dateTime DATETIME,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount FLOAT,
    tax FLOAT,
    actual_amount FLOAT,
    discount_amount FLOAT,
    tax_amount FLOAT,
    total_amount FLOAT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);


select *from invoice;
select *from invoice_items;

delete from invoice_items where id=4012;
delete from invoice where id=4010;

insert invoice_items  values  ('ssss','2024-08-02 10:16:20.000',1005,2,250.00,5,6.9,600,34,22,777.99,2);

update invoice set Admin_ID = 1 where id=14;

ALTER TABLE invoice_items
ADD invoice_id INT NULL;

update invoice_items set invoice_id = 5015 where id=5016;
  SELECT customer_name, invoice_dateTime, product_id, quantity, unit_price, discount, tax, actual_amount, discount_amount, tax_amount, total_amount from invoice_items
            where invoice_id=5015



5015
5010
5011
 CREATE VIEW vw_MaxinvoiceID
AS
SELECT MAX(ID) AS invoice_id
FROM invoice;

SELECT * FROM vw_MaxinvoiceID;
truncate table invoice;
truncate table invoice_items;

drop table invoice_items;
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE taxes (
    id INT PRIMARY KEY IDENTITY(1,1),
    tax_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Active'
);
truncate table taxes;

ALTER TABLE taxes
ALTER COLUMN tax_amount DECIMAL(10, 2);

ALTER TABLE taxes
ALTER COLUMN tax_amount float;
select *from taxes;
select id,tax_amount from taxes order by tax_amount asc 
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE category (
    id INT PRIMARY KEY IDENTITY(1,1),
    category_name varchar(50) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Active'
);

select *from category;

select id,category_name from category order by category_name asc 
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE unit (
    id INT PRIMARY KEY IDENTITY(1,1),
    unit_name varchar(50) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Active'
);

select *from unit;
select id,unit_name from unit order by unit_name asc ;
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE suppliers (
    id INT PRIMARY KEY IDENTITY(1,1),
    supplier_name VARCHAR(255) NOT NULL,
    contact VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    details VARCHAR(255) NOT NULL,
    credit_balance FLOAT default .00,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

select id,supplier_name from suppliers order by supplier_name asc ;
select *from suppliers;

-----------------------------------------------------------------------------------------------------------------------------


CREATE TABLE sub_category (
    id INT PRIMARY KEY IDENTITY(1,1),
    category_id INT NOT NULL,
    category_name varchar(50) NOT NULL,
    sub_category_name varchar(50) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Active',
    FOREIGN KEY (category_id) REFERENCES category(id)
);

select *from sub_category;
 SELECT id, category_id,category_name,sub_category_name,status FROM sub_category
------------------------------------------------------------------------------------------------------------------------------




CREATE TABLE products (
    id INT PRIMARY KEY IDENTITY(1,1),
    product_name VARCHAR(255),
    serial_number VARCHAR(255),
    product_model VARCHAR(255),
    category_id INT,
	catgeory_name VARCHAR(255),
    selling_price DECIMAL(10, 2),
    unit_id INT,
	unit_name VARCHAR(255),
    tax_id INT,
	tax_amount float,
    product_image VARCHAR(255),
    supplier_id INT,
	supplier_name VARCHAR(255),
    total_stock INT,
    purchase_price DECIMAL(10, 2),
    sub_category_id INT,
	sub_Catgeory_name VARCHAR(255),
    CONSTRAINT FK_Category FOREIGN KEY (category_id) REFERENCES category(id),
    CONSTRAINT FK_Unit FOREIGN KEY (unit_id) REFERENCES unit(id),
    CONSTRAINT FK_Tax FOREIGN KEY (tax_id) REFERENCES taxes(id),
    CONSTRAINT FK_Supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
    CONSTRAINT FK_SubCategory FOREIGN KEY (sub_category_id) REFERENCES sub_category(id)
);

select *from products
select  id,product_name,total_stock from products where Admin_ID=1
select *from invoice  where Admin_ID=1;
select *from invoice_items  where Admin_ID=1;


truncate table products

delete from products where id=1;


SELECT SUM(totalAmount) AS yesterdaySales
FROM invoice
WHERE CAST(invoiceDateTime AS DATE) = CAST(DATEADD(day, -1, GETDATE()) AS DATE)

 SELECT SUM(totalAmount) AS todaySales
FROM invoice
WHERE CAST(invoiceDateTime AS DATE) = CAST(GETDATE() AS DATE)

SELECT SUM(totalAmount) AS thisWeekSales
FROM invoice
WHERE DATEPART(week, invoiceDateTime) = DATEPART(week, GETDATE())
AND DATEPART(year, invoiceDateTime) = DATEPART(year, GETDATE())

SELECT SUM(totalAmount) AS lastWeekSales
FROM invoice
WHERE DATEPART(week, invoiceDateTime) = DATEPART(week, DATEADD(week, -1, GETDATE()))
AND DATEPART(year, invoiceDateTime) = DATEPART(year, DATEADD(week, -1, GETDATE()))


SELECT 
DATENAME(month, invoiceDateTime) AS month,
SUM(totalAmount) AS totalSales
FROM 
invoice
GROUP BY 
DATENAME(month, invoiceDateTime),
MONTH(invoiceDateTime)
ORDER BY 
MONTH(invoiceDateTime)


create table login_BS(
ID int primary key identity(1,1),
EMAIL_ID VARCHAR(200),
PASSWORDS VARCHAR(200)
);

ALTER TABLE login_BS ADD TYPE_OF_USER VARCHAR(200);

insert into login_BS values(
'sejaselvam0304@gmail.com',
'7503',
'admin');

select * from login_BS;

drop table login_BS

-- Create the Shops table
CREATE TABLE Shops (
    ShopID INT IDENTITY(1,1) PRIMARY KEY,
    ShopName NVARCHAR(100) NOT NULL,
    ShopLogo NVARCHAR(255) NULL
);

 CREATE VIEW vw_MaxShopID
AS
SELECT MAX(ShopID) AS Shop_id
FROM Shops;

select * from vw_MaxShopID;
 SELECT Shop_id FROM vw_MaxShopID;
truncate table Shops;
drop table Shops;


-- Create the Users table
CREATE TABLE Users_BS (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
    Role NVARCHAR(10) NOT NULL CHECK (Role IN ('admin', 'user')),
    ShopID INT NULL,
    FOREIGN KEY (ShopID) REFERENCES Shops(ShopID)
);

drop table Users_BS;

select * from Shops;
select * from Users_BS;



ALTER TABLE Users_BS
ADD ProfileImageName NVARCHAR(255) NULL, -- Column for storing profile image name
    MobileNumber NVARCHAR(20) NULL; -- Column for storing mobile number (can be null)


SELECT ProfileImageName FROM Users_BS WHERE UserID = 1;

select Password from  Users_BS WHERE UserID = 1;

-- Add Admin_ID to invoice table
ALTER TABLE invoice
ADD Admin_ID INT NULL,
FOREIGN KEY (Admin_ID) REFERENCES Users_BS(UserID);

-- Add Admin_ID to invoice_items table
ALTER TABLE invoice_items
ADD Admin_ID INT NULL,
FOREIGN KEY (Admin_ID) REFERENCES Users_BS(UserID);

-- Add Admin_ID to taxes table
ALTER TABLE taxes
ADD Admin_ID INT NULL,
FOREIGN KEY (Admin_ID) REFERENCES Users_BS(UserID);

-- Add Admin_ID to category table
ALTER TABLE category
ADD Admin_ID INT NULL,
FOREIGN KEY (Admin_ID) REFERENCES Users_BS(UserID);

-- Add Admin_ID to unit table
ALTER TABLE unit
ADD Admin_ID INT NULL,
FOREIGN KEY (Admin_ID) REFERENCES Users_BS(UserID);

-- Add Admin_ID to suppliers table
ALTER TABLE suppliers
ADD Admin_ID INT NULL,
FOREIGN KEY (Admin_ID) REFERENCES Users_BS(UserID);

-- Add Admin_ID to sub_category table
ALTER TABLE sub_category
ADD Admin_ID INT NULL,
FOREIGN KEY (Admin_ID) REFERENCES Users_BS(UserID);

-- Add Admin_ID to products table
ALTER TABLE products
ADD Admin_ID INT NULL,
FOREIGN KEY (Admin_ID) REFERENCES Users_BS(UserID);


-- Update Admin_ID to 1 in invoice table
UPDATE invoice
SET Admin_ID = 1;

-- Update Admin_ID to 1 in invoice_items table
UPDATE invoice_items
SET Admin_ID = 1;

-- Update Admin_ID to 1 in taxes table
UPDATE taxes
SET Admin_ID = 1;

-- Update Admin_ID to 1 in category table
UPDATE category
SET Admin_ID = 1;

-- Update Admin_ID to 1 in unit table
UPDATE unit
SET Admin_ID = 1;

-- Update Admin_ID to 1 in suppliers table
UPDATE suppliers
SET Admin_ID = 1;

-- Update Admin_ID to 1 in sub_category table
UPDATE sub_category
SET Admin_ID = 1;

-- Update Admin_ID to 1 in products table
UPDATE products
SET Admin_ID = 1;

ALTER TABLE invoice
DROP CONSTRAINT FK__invoice__Admin_I__503BEA1C;  -- Replace XXXXXXXXX with the actual constraint name for Admin_ID in the invoice table

ALTER TABLE invoice_items
DROP CONSTRAINT FK__invoice_i__Admin__51300E55;  -- Replace with the actual constraint name for Admin_ID in the invoice_items table

ALTER TABLE category
DROP CONSTRAINT FK__category__Admin___531856C7;  -- Replace XXXXXXXXX with the actual constraint name for Admin_ID in the category table

ALTER TABLE unit
DROP CONSTRAINT FK__unit__Admin_ID__540C7B00;    -- Replace XXXXXXXXX with the actual constraint name for Admin_ID in the unit table

ALTER TABLE suppliers
DROP CONSTRAINT FK__suppliers__Admin__55009F39;  -- Replace XXXXXXXXX with the actual constraint name for Admin_ID in the suppliers table

ALTER TABLE sub_category
DROP CONSTRAINT FK__sub_categ__Admin__55F4C372;  -- Replace XXXXXXXXX with the actual constraint name for Admin_ID in the sub_category table

ALTER TABLE products
DROP CONSTRAINT FK__products__Admin___56E8E7AB;  -- Replace XXXXXXXXX with the actual constraint name for Admin_ID in the products table



SELECT ProfileImageName
FROM Users_BS
WHERE UserID =2003


CREATE TABLE SubscriptionPlans (
    PlanID INT PRIMARY KEY IDENTITY(1,1),
    PlanName NVARCHAR(50) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL,
    DurationDays INT NOT NULL
);

INSERT INTO SubscriptionPlans (PlanName, Cost, DurationDays)
VALUES
    ('Free Trial', 0.00, 1),
    ('One Month', 30.00, 30),
    ('Six Months', 150.00, 180);


CREATE TABLE UserSubscriptions (
    UserID INT,
    PlanID INT,
    StartDate DATETIME,
    ExpirationDate DATETIME,
    PaymentID VARCHAR(255), -- Or appropriate length for Payment ID
    TransactionID VARCHAR(255) -- Or appropriate length for Transaction ID
   
);


ALTER TABLE UserSubscriptions
ADD PaymentID NVARCHAR(50),
    TransactionID NVARCHAR(50);

ALTER TABLE UserSubscriptions
ADD PayerID VARCHAR(255);


select * from UserSubscriptions;



drop table UserSubscriptions

drop table SubscriptionPlans

select * from Shops;
select * from Users_BS;
select * from UserSubscriptions;

delete from Shops where ShopID=4026;
delete from Users_BS where UserID=7044;
delete from UserSubscriptions where UserID=1;
delete from UserSubscriptions where StartDate='2024-09-19 13:43:28.540';
delete from Users_BS where UserID=6047;
delete from Shops where ShopID=3026;

 SELECT UserID, Email, Password, ShopID, Role, ROW_NUMBER() OVER(ORDER BY UserID) AS COUNT
            FROM Users_BS
            WHERE UserID =4037



 CREATE VIEW vw_MaxUserID
AS
SELECT MAX(UserID) AS user_id
FROM Users_BS;

drop view vw_MaxUserID

 SELECT user_id FROM vw_MaxUserID;

