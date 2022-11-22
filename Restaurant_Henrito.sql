--Programado por: Henrito U20210307 --- Todos los derechos Reservados©  2022-2023
--Creacion de una base de datos
--A tomar en cuenta: -  Crear tres tablas con sus respectivas llaves foraneas, - 5 campos  donde ingresar datos, - 3 registros,-procedimientos almacenados
CREATE DATABASE Restaurant
GO

USE Restaurant
GO 

---CREACION DE TABLAS
--Tabla Cliente
CREATE TABLE tblClientes
(
idCliente INT NOT NULL PRIMARY KEY IDENTITY(1,1),
NombreCliente VARCHAR(50) NOT NULL,
ApellidoCliente VARCHAR(50) NOT NULL,
Telefono VARCHAR(50) NOT NULL,
Direccion VARCHAR(50) NOT NULL
)
GO
--Tabla Mesero
CREATE TABLE tblMeseros
(
 idMesero INT PRIMARY KEY IDENTITY (1,1),
 NombreMesero VARCHAR(50),
 ApellidoMesero VARCHAR(50),
 idPlato INT NOT NULL
)
GO
--Tabla Mesa
CREATE TABLE tblMesa
(
idMesa INT PRIMARY KEY  IDENTITY(1,1),
NumeroPerson INT  NOT NULL,
idCliente INT FOREIGN KEY  REFERENCES tblClientes(idCliente)
)
GO
--Tabla Plato
CREATE TABLE tblPlato
(
 idPlato INT PRIMARY KEY IDENTITY (1,1),
 NombrePlato VARCHAR(50),
 Precio MONEY,
 Descripcion VARCHAR(50)
)
GO
--Tabla Factura
CREATE TABLE tblFactura
(
idFactura INT PRIMARY KEY IDENTITY(1,1),
Pago MONEY,
Fecha  DATE,
Hora DATE,
idPlato INT FOREIGN KEY REFERENCES tblPedido(idPedido)
)
GO
---SELECT-----
--Inserción de datos
-------------------CLIENTES------------------------------
INSERT INTO tblClientes(NombreCliente,ApellidoCliente,Telefono,Direccion)
VALUES('Carlos','Orellana','60237580','col. pradera,san miguel')
INSERT INTO tblClientes(NombreCliente,ApellidoCliente,Telefono,Direccion)
VALUES('Fernando', 'Campos','72648012','col Monte Carlo,san miguel')
SELECT*FROM tblClientes
-----------------------------------------------------------------
SELECT* FROM tblMesa
--------------------MESEROS------------------------------
INSERT INTO tblMeseros(NombreMesero,ApellidoMesero,idPlato)
VALUES('Alfredo','Canales','3')
SELECT* FROM tblMeseros
----------------------------------------------------------------
INSERT INTO tblPlato(NombrePlato,Precio,Descripcion)
VALUES('Combo Pollo','2.60','Arroz blanco con pollo')
SELECT* FROM tblPlato
-------------------------------------------------------------------
INSERT INTO tblFactura(Pago,Fecha,Hora,idPlato)
VALUES('12.50','08/11/2021','16:00',1)
SELECT* FROM tblFactura
-------------------------------------------------------------------





--PROCESOS ALMACENADOS
------------------------------------
-----------CLIENTE----------------
-----------CREATE------------------
CREATE PROC SP_Cliente
@NombreCliente AS VARCHAR(50),
@ApelidoCliente AS VARCHAR(50),
@Telefono AS VARCHAR (50),
@Direccion AS VARCHAR(50)
AS
BEGIN
INSERT INTO tblClientes(NombreCliente,ApellidoCliente,Telefono,Direccion)
VALUES(@NombreCliente,@ApelidoCliente,@Telefono,@Direccion)
END

EXEC SP_Cliente 'Geovani','Orellana','70250247','Col. Buenos Aires,San Miguel'
SELECT *FROM tblClientes
------------------------------------
CREATE PROC SP_READ_CLIENTE
@idCliente AS INT
AS
BEGIN
SELECT*FROM tblClientes WHERE idCliente=@idCliente
END

EXEC SP_READ_CLIENTE 3
--Variante procesando la direccion
CREATE PROC SP_READ_dc
@Direccion AS VARCHAR (50)
AS
BEGIN
SELECT * FROM tblClientes WHERE Direccion=@Direccion
END

EXEC SP_READ_dc ',San Miguel'
------------------------------------
-----------------UPDATE-------------
CREATE PROC SP_Actualizar
@idCliente AS INT,
@NombreCliente AS VARCHAR(50),
@ApellidoCliente AS VARCHAR(50),
@Telefono AS VARCHAR(50),
@Direccion AS VARCHAR (50)
AS
BEGIN
UPDATE tblClientes SET
NombreCliente=@NombreCliente,
ApellidoCliente=@ApellidoCliente,
Telefono=@Telefono,
Direccion=@Direccion
WHERE idCliente=@idCliente
SELECT* FROM tblClientes
END

EXEC SP_Actualizar 2,'Jose','Fuentes','72108017','cdad. Pacifica, San Miguel'
SELECT* FROM tblClientes
------------------------------------
-----------------DELETE--------
CREATE PROC SP_DELETE_CLIENTE
@idCliente AS INT
AS
BEGIN
DELETE FROM tblClientes WHERE idCliente=@idCliente
END

EXEC SP_DELETE_CLIENTE 3
SELECT* FROM tblClientes
------------------------------------
-----------MESERO-----------
-----------CREATE------------------
CREATE PROC SP_Meseros
@NombreMesero AS VARCHAR (50),
@ApelidoMesero AS VARCHAR(50),
@idPlato AS INT 
AS
BEGIN
INSERT INTO tblMeseros(NombreMesero,ApellidoMesero,idPlato)
VALUES (@NombreMesero,@ApelidoMesero,@idPlato)
END

EXEC SP_Meseros 'Henry','Orellana',2
SELECT *FROM tblMeseros
-----UPDATE-------
CREATE PROC SP_Actualizar_Mesero
@idMesero AS INT,
@NombreMesero AS VARCHAR(50),
@ApellidoMesero AS VARCHAR(50)
AS
BEGIN
UPDATE tblMeseros SET
NombreMesero=@NombreMesero,
ApellidoMesero=@ApellidoMesero
WHERE idMesero=@idMesero
SELECT* FROM tblMeseros
END

EXEC SP_Actualizar 2,'Stanley','Cisneros','64121830','barrio concepcion, San Miguel'
SELECT* FROM tblMeseros
------------------------------------
-----------------DELETE--------
CREATE PROC SP_DELETE_Mesero
@idMesero AS INT
AS
BEGIN
DELETE FROM tblMeseros WHERE idMesero=@idMesero
END

EXEC SP_DELETE_Mesero 3
SELECT* FROM tblMeseros


-----------------DROP----------
--Eliminar base de datos
DROP DATABASE Restaurant

--Eliminar registros
DROP TABLE tblClientes
DROP TABLE tblMesa
DROP TABLE tblMeseros


--TRUNCATE
 TRUNCATE TABLE tblClientes
 TRUNCATE TABLE tblMesa
 TRUNCATE TABLE tblMeseros