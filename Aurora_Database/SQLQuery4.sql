CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(255),
);

CREATE TABLE Subcollections (
    SubcollectionID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10, 2),
    CategoryID INT ,
	SubcollectionID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
	FOREIGN KEY (SubcollectionID) REFERENCES Subcollections(SubcollectionID)
);


CREATE TABLE CategorySubcollections (
    CategoryID INT,
    SubcollectionID INT,
    PRIMARY KEY (CategoryID, SubcollectionID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SubcollectionID) REFERENCES Subcollections(SubcollectionID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName NCHAR(50),
	LastName NChar(50),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20),
    ShippingAddress TEXT,
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Quantity INT,
    SalePrice DECIMAL(10, 2),
    Date DATE,
	EmployeeID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    ContactInformation TEXT,
	DepartmentID int,
);

ALTER TABLE Sales
ADD FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);

CREATE TABLE Influencers (
    InfluencerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
	LastName VARCHAR (50),
    InstagramAccount VARCHAR(50),
    FollowersCount INT,
	EmployeeID INT,
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
);

CREATE TABLE Countries(
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(255),
    ShippingRates DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ShippingDate DATE,
    TotalAmount DECIMAL(10, 2),
	CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(CountryID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
);

Alter table Employees
DROP COLUMN DepartmentID


INSERT INTO Categories (CategoryID, Name) VALUES
(1, 'Cleansers'),
(2, 'Moisturizers'),
(3, 'Treatments');

INSERT INTO Subcollections (SubcollectionID, Name) VALUES
(1, 'Oily Skin'),
(2, 'Dry Skin'),
(3, 'Combination');

INSERT INTO Products ( Name, Description, Price, CategoryID, SubcollectionID) VALUES
('Foaming Gel Cleanser', 'A deep cleansing gel for oily skin.', 12.99, 1, 1),
('Hydrating Cream', 'Intense hydration cream for dry skin.', 24.99, 2, 2),
('Balancing Lotion', 'A light lotion for combination skin.', 19.99, 3, 3),
('Purifying Face Wash', 'Removes excess oil without drying.', 15.99, 1, 1),
('Soothing Moisturizer', 'Calms and hydrates sensitive skin.', 22.99, 2, 2),
('Rejuvenating Night Cream', 'A rich cream that nourishes the skin overnight.', 32.50, 1, 1),
('Brightening Eye Serum', 'Reduces dark circles and brightens the eye area.', 25.00, 1, 2),
('Clarifying Facial Toner', 'Balances skin’s pH and reduces the appearance of pores.', 15.00, 2, 1),
('Anti-Aging Face Mask', 'A mask that targets signs of aging for a youthful glow.', 20.00, 2, 3),
('Soothing Gel Moisturizer', 'A lightweight gel that calms and hydrates the skin.', 18.50, 3, 2);

INSERT INTO CategorySubcollections (CategoryID, SubcollectionID) VALUES
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 2), (2, 3),
(3, 1), (3, 2), (3, 3);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, ShippingAddress) VALUES
(1001, 'Firelord', 'Zuko', 'fire.lord@gmail.com', '123-456-7890', '123 Main Street, Fire Nation'),
(1002, 'Toph', 'Beifong', 'toph.earth@gmail.com', '098-765-4321', '456 Oak Street, Gaoling'),
(1003, 'Commander', 'Zhao', 'evil.zhao@gmail.com', '555-123-4567', '789 Pine Street, Fire Nation'),
(1004, 'General', 'Iroh', 'iroh.general@hotmail.com', '555-987-6543', '101 Maple Street, Fire Nation'),
(1005, 'Avatar', 'Aang', 'avatar.aang@hotmail.com', '555-678-1234', '202 Souther Air Temple'),
(1006, 'Katara', 'WaterTribe', 'avatar.aang@hotmail.com', '555-678-1234', '202 Souther Air Temple'),
(1007, 'Suki', 'Koshi', 'avatar.aang@hotmail.com', '555-678-1234', '202 Souther Air Temple');

select * from Subcollections

INSERT INTO Sales (SaleID, ProductID, CustomerID, Quantity, SalePrice, Date, EmployeeID) VALUES
(1, 1, 1002, 2, 12.99, '2024-05-10', 1),
(2, 2, 1002, 1, 24.99, '2024-05-11', 2),
(3, 3, 1003, 1, 19.99, '2024-05-12', 3),
(4, 4, 1004, 3, 15.99, '2024-05-13', 4),
(5, 5, 1005, 2, 22.99, '2024-05-14', 5);

INSERT INTO Employees (EmployeeID, FirstName, LastName, ContactInformation) VALUES
(1, 'Naruto', 'Miller', 'naruto.miller@gmail.com'),
(2, 'Deku', 'Wilson', 'deku.wilson@gmail.com'),
(3, 'Sataima', 'Taylor', 'sat.taylor@gmail.com'),
(4, 'Isabel', 'Anderson', 'isabel.anderson@gmail.com'),
(5, 'Jack', 'Thomas', 'jack.thomas@gmail.com');


INSERT INTO Employees (EmployeeID, FirstName, LastName, ContactInformation) VALUES
(6, 'Ella', 'Smith', 'nella.smith@gmail.com');


INSERT INTO Influencers (InfluencerID, FirstName, LastName, InstagramAccount, FollowersCount, EmployeeID) VALUES
(1, 'Katara', 'Lee', 'kathyleebeauty', 4.5, 1),
(2, 'Liam', 'Garcia', 'liamgarciafashion', 3.8, 2),
(3, 'Mia', 'Martinez', 'miamartinezwellness', 4.2, 3),
(4, 'Noah', 'Robinson', 'noahrobinsonstyle', 4.0, 4),
(5, 'Olivia', 'Walker', 'oliviawalkerlife', 3.9, 5);

INSERT INTO Countries (CountryID, CountryName, ShippingRates) VALUES
(1, 'Japan', 5.00),
(2, 'Canada', 7.50),
(3, 'United Kingdom', 6.00),
(4, 'Australia', 8.00),
(5, 'Italy', 7.00);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShippingDate, TotalAmount, CountryID) VALUES
(3482, 1001, '2024-05-10', '2024-05-15', 25.98, 1),
(4893, 1002, '2024-05-11', '2024-05-16', 24.99, 2),
(4832, 1003, '2024-05-12', '2024-05-17', 19.99, 2),
(9238, 1004, '2024-05-13', '2024-05-18', 47.97, 4),
(2842, 1005, '2024-05-14', '2024-05-19', 45.98, 5),
(4802, 1007, '2024-06-01', '2024-06-05', 65.00, 1),
(5748, 1006, '2024-06-02', '2024-06-06', 49.99, 2),
(0492, 1002, '2024-06-03', '2024-06-07', 75.00, 3),
(5637, 1006,'2024-06-04', '2024-06-08', 55.50, 4),
(5753, 1007,'2024-06-05', '2024-06-09', 60.00, 5);

UPDATE Countries
SET ShippingRates = 6.50
WHERE CountryName = 'Japan';

UPDATE Influencers
SET EmployeeID = 6
WHERE InfluencerID = 1;
UPDATE Influencers
SET FollowersCount = 1000000
WHERE InfluencerID = 2;
UPDATE Influencers
SET FollowersCount = 100000
WHERE InfluencerID = 3;
UPDATE Influencers
SET FollowersCount = 40000
WHERE InfluencerID = 4;
UPDATE Influencers
SET FollowersCount = 30000
WHERE InfluencerID = 5;


ALTER TABLE Products
DROP CONSTRAINT FK_Products_CategoryID;

ALTER TABLE Products
ADD CONSTRAINT FK_Products_CategoryID
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
ON DELETE SET NULL
ON UPDATE SET NULL;

ALTER TABLE Products
ALTER COLUMN CategoryID INT NULL;

CREATE VIEW ProductsDetails AS
SELECT p.ProductID, p.Name AS ProductName, p.Description, p.Price, c.Name AS CategoryName, s.Name AS SubcollectionName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN Subcollections s ON p.SubcollectionID = s.SubcollectionID;

SELECT * FROM ProductsDetails;

CREATE VIEW SalesOverview AS
SELECT s.SaleID, c.FirstName AS CustomerFirstName, c.LastName AS CustomerLastName, p.Name AS ProductName, s.Quantity, s.SalePrice, s.Date AS SaleDate
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
JOIN Products p ON s.ProductID = p.ProductID;
SELECT * FROM SalesOverview;
Select * from Influencers

SELECT * FROM SalesOverview;

CREATE TRIGGER CheckFollowerCount
ON Influencers
INSTEAD OF INSERT
AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted WHERE FollowersCount < 10000) > 0
    BEGIN
        RAISERROR ('Cannot add influencer with less than 10,000 followers', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO Influencers (FirstName, LastName, InstagramAccount, FollowersCount, EmployeeID)
        SELECT FirstName, LastName, InstagramAccount, FollowersCount, EmployeeID
        FROM inserted;
    END
END;

select * from Influencers

INSERT INTO Influencers (FirstName, LastName, InstagramAccount, FollowersCount, EmployeeID)
VALUES ('Jane', 'Doe', 'janedoebeauty', 5000, 1);


DROP TRIGGER IF EXISTS DeleteEmployeeAndInfluencer;

DELETE FROM Employees
WHERE EmployeeID = 1;

Select * From Employees

CREATE PROCEDURE GetEmployeeSales
AS
BEGIN
    SELECT
        e.EmployeeID,
        e.FirstName + ' ' + e.LastName AS EmployeeName,
        SUM(s.SalePrice) AS TotalSalesAmount
    FROM
        Employees e
    JOIN
        Sales s ON e.EmployeeID = s.EmployeeID
    GROUP BY
        e.EmployeeID, e.FirstName, e.LastName
    ORDER BY
        TotalSalesAmount DESC;
END;

EXEC GetEmployeeSales;

Select * from Employees

BACKUP DATABASE AuroraSkincare TO DISK='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AuroraSkincare.bak';

USE master;
SELECT name AS 'Logical Name', physical_name AS 'File Location'
FROM sys.master_files;
