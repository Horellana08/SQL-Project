CREATE DATABASE Hospital 
GO
USE Hospital
GO
CREATE TABLE Dept
(
	Dept_No			INT				NOT NULL, 
	DNombre			VARCHAR(50)		NULL,
	Loc				VARCHAR(50)		NULL,
	CONSTRAINT PK_Dept PRIMARY KEY(Dept_No)
)
GO

insert into Dept values ( 'prueba','san miguel')
-- Procedimiento sin parametros creando el procedimiento
CREATE PROCEDURE procedimientoSelectDept
AS
  select *from Dept
GO
-- para ejecutar el procedimiento
execute procedimientoSelectDept

-- Creando procedimiento con parametros
create procedure procedimientoInsertDept
-- parametros
@idDep int,
@nombre varchar(50),
@localizacion varchar(50)
AS
--Query a ejecutarse
insert into Dept values (@idDep,@nombre,@localizacion)
GO
--ejecutar procedimiento con paraemtros
execute procedimientoInsertDept 2,'pueba #2','Morazan'

create procedure procedimientoUpdateDept
--parametros
@ideDep int,
@nombre varchar(50),
@localizacion varchar(50)
AS
--QUERY A EJECUTARSE
UPDATE Dept SET DNombre = @nombre, Loc = @localizacion WHERE Dept_No = @ideDep
GO

--ejecutar procedimiento con parametros
execute procedimientoUpdateDept 2, 'prueba #2','Morazan'