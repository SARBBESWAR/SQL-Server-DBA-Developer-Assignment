--select * from Customers
--Top 5 Customers Who Have Made the Most Orders

SELECT TOP 5 
C.CustomerID,
C.FirstName,
C.LastName,
COUNT(O.OrderID) AS TotalOrders
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName,C.LastName
ORDER BY TotalOrders DESC;

--Total Revenue Generated by Each Product Category
--select * from Categories
--select * from Products
SELECT 
Catgo.CategoryName,
SUM(OD.Quantity * OD.UnitPrice) AS TotalRevenue
FROM OrderDetails OD
INNER JOIN Products P ON OD.ProductID = P.ProductID
INNER JOIN Categories Catgo ON P.CategoryID = Catgo.CategoryID
GROUP BY Catgo.CategoryName
ORDER BY TotalRevenue DESC;

--Number of Orders Placed in the Last Month, Broken Down by Day
--select * from Orders
SELECT 
CAST(OrderDate AS DATE) AS OrderDay,
COUNT(*) AS OrdersCount
FROM Orders
WHERE OrderDate >= DATEADD(MONTH, -1, GETDATE())
GROUP BY CAST(OrderDate AS DATE)
ORDER BY OrderDay;

-- Average Order Value for Each Customer

SELECT 
C.CustomerID,
C.FirstName,
C.LastName,
AVG(O.TotalAmount) AS AvgOrderValue
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID,C.FirstName,C.LastName
ORDER BY AvgOrderValue DESC





