/*Ejercicio #1*/
SELECT * FROM Categories;
/*Proceso almacenado*/
CREATE PROCEDURE SP_Categorias
AS
BEGIN
    SELECT * FROM Categories;
END
/*Ejecutamos*/
EXEC SP_Categorias;


/*Ejercicio #2*/
SELECT CustomerID 
AS IdCliente, 
CompanyName 
AS NombreEmpresa,
City AS 
Ciudad, Phone AS Teléfono 
FROM Customers;
/*Proceso almacenado*/
CREATE PROCEDURE SP_Cliente
AS
BEGIN
    SELECT CustomerID AS IdCliente, CompanyName AS NombreEmpresa, City AS Ciudad, Phone AS Teléfono FROM Customers;
END
/*Ejecutamos*/
EXEC  SP_Cliente;


/*Ejercicio #3*/
SELECT * FROM Customers;
/*Proceso almacenado*/
CREATE PROCEDURE SP_Ciudad_Clientes
    @City nvarchar(50) = NULL
AS
BEGIN
SELECT CustomerID AS IDCliente,
CompanyName AS NombreEmpresa,
City AS Ciudad,
Phone AS Teléfono
FROM Customers;
SELECT CustomerID AS IDCliente,
CompanyName AS NombreEmpresa,
City AS Ciudad,
Phone AS Teléfono
FROM Customers
WHERE City = @City;
END
/*Ejecutamos*/
EXEC SP_Ciudad_Clientes @City = 'LONDON';

/*Ejercicio #4*/
SELECT * FROM Customers;
/*Proceso almacenado*/
CREATE PROCEDURE SP_Buscar_Region
    @Region nvarchar(50),
    @Pais nvarchar(50)
AS
BEGIN
    SELECT 
        CustomerID, 
        CompanyName, 
        ContactName, 
        ContactTitle, 
        Address, 
        City, 
        Region, 
        PostalCode, 
        Country, 
        Phone, 
        Fax
    FROM Customers
    WHERE Region IS NOT NULL AND Country = @Pais
END
/*Ejecutamos*/
EXEC  SP_Buscar_Region @Region = 'OR', @Pais = 'USA'

/*Ejercicio #5*/
SELECT * FROM Employees
/*Proceso  almacenado*/

CREATE PROCEDURE SP_Cumpleaños
    @FechaInicial nvarchar(10),
    @FechaFinal nvarchar(10)
AS
BEGIN
    SELECT 
        EmployeeID, 
        FirstName, 
        LastName, 
        BirthDate
    FROM Employees
    WHERE MONTH(BirthDate) BETWEEN MONTH(@FechaInicial) AND MONTH(@FechaFinal)
        AND DAY(BirthDate) BETWEEN DAY(@FechaInicial) AND DAY(@FechaFinal)
END
/*Ejecutamos*/
EXEC SP_Cumpleaños @FechaInicial = '1948-01-01', @FechaFinal = '1990-12-31'








/*Ejercicio #6*/
SELECT * FROM Orders
/*Proceso almacenado*/
CREATE PROCEDURE SP_Ordenes
AS
BEGIN
SELECT OrderID AS IdOrden, CustomerID AS IdCliente, EmployeeID AS IdEmpleado, OrderDate AS FechaOrden, 
RequiredDate AS FechaRequerida, ShippedDate AS FechaEnvio, ShipVia AS IdTransporte, 
Freight AS Carga, ShipName AS NombreTransporte, ShipAddress AS DireccionTransporte, 
ShipCity AS CiudadTransporte, ShipRegion AS RegionTransporte, ShipPostalCode AS CodigoPostalTransporte,
ShipCountry AS PaisTransporte
FROM Orders;
END
/*Ejecutamos*/
EXEC SP_Ordenes;
/*Ejercicio #7*/
SELECT *FROM Orders
/*Proceso almacenado*/
CREATE PROCEDURE SP_Buscar_Ordenes
@FechaOrden nvarchar(10)
AS
BEGIN
SELECT 
OrderID, 
CustomerID, 
OrderDate, 
ShippedDate
FROM Orders
WHERE OrderDate = @FechaOrden
END
/*Ejecutamos*/
EXEC SP_Buscar_Ordenes @FechaOrden = '1996-07-10'

/*Ejercicio #8*/
SELECT * FROM Customers
/*Prcedimientos almacenado*/
CREATE PROCEDURE SP_Buscar_PorCliente
    @CustomerID nvarchar(5)
AS
BEGIN
SELECT 
OrderID, 
ShipCity, 
ShipRegion, 
ShipCountry
FROM Orders
WHERE CustomerID = @CustomerID
END

/*Ejecutamos*/
EXEC  SP_Buscar_PorCliente @CustomerID = 'BLAUS'






/*Ejercicio #9*/
SELECT* FROM Products
/*Proceso almacenado*/
CREATE PROCEDURE  SP_Buscar_Detalle_Producto
    @NombreProducto nvarchar(40)
AS
BEGIN
    SELECT 
        [Order Details].OrderID, 
        P.ProductName, 
        [Order Details].Quantity, 
        [Order Details].UnitPrice, 
        [Order Details].Discount
    FROM [Order Details]
    INNER JOIN Products P ON [Order Details].ProductID = P.ProductID
    WHERE P.ProductName = @NombreProducto
END

/*Ejecutamos*/
EXEC SP_Buscar_Detalle_Producto @NombreProducto = 'Queso Cabrales'

/*Ejercicio #10*/

/*Proceso almacenado*/
CREATE PROCEDURE SP_Mostrar_Venta
    @OrderID int
AS
BEGIN
    SELECT 
        p.ProductName as NombreProducto, 
        [Order Details].UnitPrice, 
        [Order Details].Quantity, 
        ( [Order Details].UnitPrice *  [Order Details].Quantity) AS TotalVenta
    FROM 
        [Order Details]
        JOIN Products p ON  [Order Details].ProductID = p.ProductID
    WHERE 
        [Order Details].OrderID = @OrderID
END
/*Ejecutamos*/
EXEC SP_Mostrar_Venta @OrderID = 10248


