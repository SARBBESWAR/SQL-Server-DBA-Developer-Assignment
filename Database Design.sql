CREATE DATABASE OnlineShopDB;

USE OnlineShopDB;

-- Customers table
CREATE TABLE Customers (
CustomerID INT IDENTITY PRIMARY KEY,
FirstName NVARCHAR(50),
LastName NVARCHAR(50),
Email NVARCHAR(100) UNIQUE,
Phone NVARCHAR(10),
CreateDate DATETIME DEFAULT GETDATE()
)


-- Categories table
CREATE TABLE Categories (
CategoryID INT IDENTITY PRIMARY KEY,
CategoryName NVARCHAR(50) NOT NULL
)

-- Products table
CREATE TABLE Products (
ProductID INT IDENTITY PRIMARY KEY,
ProductName NVARCHAR(100) NOT NULL,
CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
Price DECIMAL(10, 2) NOT NULL,
StockQuantity INT NOT NULL,
CreatedDate DATETIME DEFAULT GETDATE()
)

--Orders table
CREATE TABLE Orders (
OrderID INT IDENTITY PRIMARY KEY,
CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
OrderDate DATETIME DEFAULT GETDATE(),
TotalAmount DECIMAL(12, 2),
Status NVARCHAR(50) DEFAULT 'Pending'
)

--OrderDetails table
CREATE TABLE OrderDetails (
OrderDetailID INT IDENTITY PRIMARY KEY,
OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
Quantity INT NOT NULL,
UnitPrice DECIMAL(10, 2) NOT NULL,
LineTotal AS (Quantity * UnitPrice) PERSISTED
)

--Shipments table
CREATE TABLE Shipments (
ShipmentID INT IDENTITY PRIMARY KEY,
OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
ShippedDate DATETIME,
DeliveryDate DATETIME,
Carrier NVARCHAR(100),
TrackingNumber NVARCHAR(100)
)
