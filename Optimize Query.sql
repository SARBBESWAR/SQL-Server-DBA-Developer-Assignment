CREATE PROCEDURE GetOrderDetails 
    @OrderID INT 
AS 
BEGIN 
SELECT  
OD.ProductID, 
P.ProductName, 
OD.UnitPrice, 
OD.Quantity, 
OD.UnitPrice * OD.Quantity AS LineTotal,
SUM(OD.UnitPrice * OD.Quantity) OVER() AS TotalAmount
FROM OrderDetails OD 
INNER JOIN Products P ON OD.ProductID = P.ProductID 
WHERE OD.OrderID = @OrderID;
END
