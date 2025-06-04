USE OnlineShopDB;
select * from Categories

-- Insert Categories
INSERT INTO Categories (CategoryName) VALUES
('Electronics'), ('Clothing'), ('Books'), ('Food');


-- Insert Products
INSERT INTO Products (ProductName, CategoryID, Price, StockQuantity) VALUES
('Smartphone', 1, 8299.99, 500),
('Laptop', 1, 40999.99, 200),
('T-shirt', 2, 199.99, 100),
('Novel', 3, 114.99, 200),
('Biscuit', 4, 99.00, 100),
('Noodles', 4, 9.00, 100)

select * from Products

-- Insert Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone) VALUES
('sandip', 'Pal', 'sandip@gmail.com', '9531767083'),
('sudip', 'Karmakar', 'sudip@gmail.com', '7908771762'),
('Sourav', 'Ghosh', 'Sourav@gmail.com', '9531767084'),
('Sanchita', 'Mandal', 'Sanchita@gmail.com', '7908771763'),
('Sumit', 'Ghosh', 'Sumit@gmail.com', '9531767085'),
('sandip', 'Mondal', 'sandip1@gmail.com', '9531767088'),
('sudip', 'Pal', 'sudip1@gmail.com', '7908771767'),
('Sourav', 'Dey', 'Sourav1@gmail.com', '9531767086'),
('Sanchita', 'Dey', 'Sanchita1@gmail.com', '7908771765'),
('Sumit', 'Karmakar', 'Sumit1@gmail.com', '9531767081')
select * from Customers

-- Insert Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status) VALUES
(1, GETDATE() - 5, 8299.99, 'Completed'),
(1, GETDATE() - 1, 199.99, 'Pending'),
(2, GETDATE() - 10, 8299.99, 'Completed'),
(2, GETDATE() - 2, 199.99, 'Pending'),
(3, GETDATE() - 15, 114.99, 'Completed'),
(4, GETDATE() - 20, 40999.99, 'Completed'),
(5, GETDATE() - 2, 199.99, 'Pending'),
(6, GETDATE() - 15, 114.99, 'Completed'),
(7, GETDATE() - 20, 40999.99, 'Completed'),
(8, GETDATE() - 5, 8299.99, 'Completed'),
(8, GETDATE() - 1, 199.99, 'Pending'),
(9, GETDATE() - 10, 8299.99, 'Completed'),
(9, GETDATE() - 2, 99.00, 'Pending'),
(1, GETDATE() - 15, 114.99, 'Completed'),
(10, GETDATE() - 20, 40999.99, 'Completed'),
(6, GETDATE() - 2, 9.00, 'Pending'),
(6, GETDATE() - 15, 114.99, 'Completed'),
(7, GETDATE() - 20, 40999.99, 'Completed')


select * from Orders



-- Insert OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 8299.99),
(2, 3, 1, 199.99),
(3, 1, 1, 8299.99),
(4, 3, 1, 199.99),
(5, 4, 1, 114.99),
(6, 2, 1, 40999.99),
(7, 3, 1, 199.99),
(8, 4, 1, 114.99),
(9, 2, 1, 40999.99),
(10, 1, 1, 8299.99),
(11, 3, 1, 199.99),
(12, 1, 1, 8299.99),
(13, 5, 1, 99.00),
(14, 4, 1, 114.99),
(15, 2, 1, 40999.99),
(16, 6, 10, 9.00),
(17, 4, 1, 114.99),
(18, 2, 1, 40999.99);


select * from OrderDetails

-- Insert Shipments

INSERT INTO Shipments (OrderID, ShippedDate, DeliveryDate, Carrier, TrackingNumber)
VALUES
(1,  GETDATE() - 4, GETDATE(), 'BlueDart','TRK001'),
(3,  GETDATE() - 9, GETDATE() - 5, 'Delhivery','TRK002'),
(5,  GETDATE() - 14, GETDATE() - 10, 'EcomExpress','TRK003'),
(6,  GETDATE() - 19, GETDATE() - 14, 'XpressBees', 'TRK004'),
(8,  GETDATE() - 4, GETDATE(), 'BlueDart','TRK005'),
(10, GETDATE() - 9, GETDATE() - 5, 'Delhivery','TRK006'),
(12, GETDATE() - 1, GETDATE() + 3, 'EcomExpress','TRK007'),
(14, GETDATE() - 14, GETDATE() - 9, 'XpressBees','TRK008'),
(15, GETDATE() - 19, GETDATE() - 13, 'Delhivery','TRK009'),
(17, GETDATE() - 14, GETDATE() - 10, 'BlueDart','TRK010'),
(18, GETDATE() - 19, GETDATE() - 15, 'XpressBees','TRK011');

select * from Shipments

