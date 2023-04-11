SELECT SUM(UnitPrice*Quantity) AS Total_Ventas
FROM [Order Details]

SELECT * FROM [Order Details]

SELECT OrderID, AVG(UnitPrice) AS Precio_Promedio
FROM [Order Details]
GROUP BY OrderID;

SELECT CustomerID ,COUNT(*) AS Num_Ordenes
FROM Orders
GROUP BY CustomerID;

SELECT OrderID,MAX(UnitPrice) AS Precio_Maximo
FROM [Order Details]
GROUP BY OrderID;

SELECT OrderID,MIN(UnitPrice) AS Precio_Minimo
FROM [Order Details]
GROUP BY OrderID;

SELECT * FROM Employees

SELECT City, COUNT(City) AS Empleado_Ciudad
FROM Employees
GROUP BY City;

SELECT * FROM Orders

SELECT OrderDate, COUNT(OrderDate) AS Fecha_Orden
FROM Orders
GROUP BY OrderDate;

SELECT * FROM [Order Details]

SELECT  MAX(Quantity) AS Producto_Mas_Vendido
FROM [Order Details]

SELECT * FROM [Order Details] WHERE Quantity = 130

SELECT  OrderID,AVG(UnitPrice) AS  Precio_Promedio
FROM [Order Details]
GROUP BY OrderID;

SELECT MIN(Discount) AS DESCUENTO_MENOR
FROM [Order Details]  WHERE  Discount <>0;

SELECT OrderID, SUM(Quantity) AS Total_Vendido
FROM [Order Details]
GROUP BY OrderID;

SELECT * FROM Products
SELECT * FROM [Order Details]
SELECT * FROM Orders

SELECT OrderID,ProductName,UnitPrice
FROM  Orders,Products
INNER JOIN [Order Details]
ON Products.

SELECT ProductName,UnitPrice
FROM Products WHERE UnitPrice>50


SELECT   OrderID,ProductName,UnitPrice
FROM Orders,Products WHERE UnitPrice >30 


SELECT OrderID,COUNT(OrderID) AS Productos_Vendidos
FROM Orders
