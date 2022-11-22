-- PARTICIPANTES
--1) Jefi Essaú Mendoza Hernandez -----u20200667
--2)Moises Abraham Viera Viera  -------U20191384
--3)Henry Geovani Orellana Vasquez  --- U20210307
-------------------- DOCENTE: ING .Nestor Rivas
--------------------------------------------------------------------------------------------------------------------
/*
1.Crear todos los Procedimientos Almacenados de Create, Read, Update, Delete para las tablas Cursos y Matrículas
2.Crear un procedimiento almacenado para listar los registros según nombre de la materia
3.Crear un procedimiento almacenado para listar los registros según unidades valorativas de la materia
4.Eliminar totalmente (DROP) las tablas con los registros que se hicieron en los videos anteriores
5.Insertar 6 nuevos registros en todas las tablas
*/
--------------------------------------------------------------------------------------------------------------------
--Creación de la base de datos
CREATE DATABASE dbInstituto
GO

--Usando la Base de datos
USE dbInstituto
GO

--Creación de las tablas
--Tabla Alumnnos
CREATE TABLE tblAlumnos
(
 idAlumno INT NOT NULL PRIMARY KEY IDENTITY (1,1),
 NombreAlumno VARCHAR(50) NOT NULL,
 ApellidoAlumno  VARCHAR(50) NOT NULL,
 FechaNacimiento DATE NOT NULL,
 Telefono VARCHAR(50) NOT NULL,
 Direccion VARCHAR(50) NOT NULL
)
GO
--Tabla Cursos
CREATE TABLE tblCursos
(
 idCurso INT NOT NULL PRIMARY KEY IDENTITY (1,1),
 NombreCurso VARCHAR(50) NOT NULL,
 Descripcion VARCHAR(50) NOT NULL,
 UV INT NOT NULL
)
GO
--Tabla Matricula
CREATE TABLE tblMatricula
(
 idMatricula INT NOT NULL PRIMARY KEY IDENTITY (1,1),
 FechaMatricula DATE NOT NULL,
 Pago FLOAT NOT NULL,
 idAlumno INT FOREIGN KEY REFERENCES tblAlumnos(idAlumno),
 idCurso INT FOREIGN KEY REFERENCES  tblCursos(idCurso)
)
GO

--Inserción de datos
--DD/MM/AAAA

-----------------------------ALUMNOS-----------------------------------------------
INSERT INTO tblAlumnos(NombreAlumno,ApellidoAlumno,FechaNacimiento,Telefono,Direccion)
VALUES('Jose','Cañas','19-03-1988','75757575','San Miguel')
INSERT INTO tblAlumnos(NombreAlumno,ApellidoAlumno,FechaNacimiento,Telefono,Direccion)
VALUES('Maria','Gutierrez','12-05-1975','78787878','La Union')
INSERT INTO tblAlumnos 
VALUES ('Moises','Viera','12-07-1995','74757355','San Miguel')
INSERT INTO tblAlumnos 
VALUES ('Henry','Orellana','08-02-2003','72528375','San Salvador,Merliot')
-----------------------------ALUMNOS-----------------------------------------------
-----------------------------CURSOS-----------------------------------------------
INSERT INTO tblCursos
(
 NombreCurso,
 Descripcion,
 UV
)
VALUES
(
 'Ingles',
 'Ingles Tecnico',
  6
)
INSERT INTO tblCursos
(
 NombreCurso,
 Descripcion,
 UV
)
VALUES
(
 'ASO',
 'Administración de Sistemas Operativos',
  4
)
INSERT INTO tblCursos
(
 NombreCurso,
 Descripcion,
 UV
)
VALUES
(
 'ANALISIS NUMERICO',
 'MATEMATICA PARA INGENIEROS',
  6
)
INSERT INTO tblCursos
(
 NombreCurso,
 Descripcion,
 UV
)
VALUES
(
 'METODOS EXPERIMENTALES',
 'FISICA I',
  4
)
-----------------------------CURSOS-----------------------------------------------
-----------------------------MATRICULA-----------------------------------------------
INSERT INTO tblMatricula(FechaMatricula,Pago,idAlumno,idCurso)
VALUES('25/01/2021',50.75,3,1)
INSERT INTO tblMatricula(FechaMatricula,Pago,idAlumno,idCurso)
VALUES('25/01/2021',89.75,4,1)
INSERT INTO tblMatricula(FechaMatricula,Pago,idAlumno,idCurso)
VALUES('25/01/2021',100.0,5,1)

-----------------------------MATRICULA-----------------------------------------------
--Ver Datos
SELECT * FROM tblAlumnos
SELECT * FROM tblCursos
SELECT* FROM tblMatricula

--ACTUALIZAR
UPDATE tblAlumnos 
SET NombreAlumno='Stan', ApellidoAlumno='Herondale',FechaNacimiento='03-09-1998',
Telefono='75757575',Direccion='Usulutan'
WHERE idAlumno= 2

--DELETE
DELETE tblMatricula WHERE idMatricula=2
DELETE tblAlumnos WHERE idAlumno=4

---------------------------------------------------------------------------------
---------------------PROCESOS ALMACENADOS TABLA ALUMNOS--------------------------
--------------------------------------------------------------------------------
---------------------PROCESO CREATE---------------------------------------------
CREATE PROC SP_Insert
@NombreAlumno AS VARCHAR(50),
@ApellidoAlumno AS VARCHAR(50),
@FechaNacimiento AS DATE,
@Telefono AS VARCHAR(50),
@Direccion AS VARCHAR(50)
AS
BEGIN
INSERT INTO tblAlumnos(NombreAlumno,ApellidoAlumno,FechaNacimiento,Telefono,Direccion)
VALUES (@NombreAlumno,@ApellidoAlumno,@FechaNacimiento,@Telefono,@Direccion)
END

EXEC SP_Insert 'stan', 'Rivas','03/09/1995','70707070','San Miguel'
SELECT * FROM tblAlumnos
--------------------------------------------------------------------------
--------------------PROCESO READ---------------------------------------
CREATE PROC SP_Read
@idAlumno AS INT
AS
BEGIN
SELECT * FROM tblAlumnos WHERE idAlumno=@idAlumno
END

EXEC SP_Read 4
--Variacion leyendo direccion
CREATE PROC SP_Read_dir
@Direccion AS VARCHAR(50)
AS
BEGIN
SELECT * FROM tblAlumnos WHERE Direccion=@Direccion
END

EXEC SP_Read_dir 'San Miguel'
--------------------------------------------------------------------------
--------------------PROCESO UPDATE---------------------------------------
CREATE PROC SP_Actualizar
@idAlumno AS INT,
@NombreAlumno AS VARCHAR(50),
@ApellidoAlumno AS VARCHAR(50),
@FechaNaciemiento AS DATE,
@Telefono AS VARCHAR(50),
@Direccion AS VARCHAR(50)
AS
BEGIN
 UPDATE tblAlumnos SET
NombreAlumno=@NombreAlumno ,
ApellidoAlumno=@ApellidoAlumno,
FechaNacimiento=@FechaNaciemiento,
Telefono=@Telefono,
Direccion=@Direccion
WHERE idAlumno=@idAlumno
SELECT* FROM tblAlumnos
END

EXEC SP_Actualizar 4,'Maria','Gutierrez','03/09/1995','21211780','San Salvador'
--------------------------------------------------------------------------
--------------------PROCESO DELETE---------------------------------------
CREATE PROC SP_DELETE_ALUMNO
@idAlumno AS INT
AS
BEGIN
DELETE FROM tblAlumnos WHERE idAlumno= @idAlumno
END

EXEC SP_DELETE_ALUMNO 4



--------------------------------------------------------------------------
SELECT  * FROM  tblAlumnos
SELECT * FROM tblMatricula
SELECT * FROM tblCursos



---------------------------------------------------------------------------------
---------------------PROCESOS ALMACENADOS TABLA CURSOS--------------------------
--------------------------------------------------------------------------------
--------------------PROCESO CREATE---------------------------------------------
CREATE PROC SP_Insert_Curso
@NombreCurso AS VARCHAR(50),
@Descripcion AS VARCHAR(50),
@UV AS INT
AS
BEGIN
INSERT INTO tblCursos(NombreCurso,Descripcion,UV)
VALUES (@NombreCurso,@Descripcion,@UV)
END

EXEC SP_Insert_Curso'ASO', 'Sistemas Operativos','4'
EXEC SP_Insert_Curso'MED', 'Manejo de Estructura de Datos','6'
SELECT * FROM tblCursos
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------PROCESO READ---------------------------------------
CREATE PROC SP_Read_Curso
@idCurso AS INT
AS
BEGIN
SELECT * FROM tblCursos WHERE idCurso=@idCurso
END

EXEC SP_Read_Curso 2

--------------------------------------------------------------------------
--------------------PROCESO UPDATE---------------------------------------
CREATE PROC SP_Actualizar_Curso
@idCurso AS INT,
@NombreCurso AS VARCHAR(50),
@Descripcion AS VARCHAR(50),
@UV AS INT
AS
BEGIN
UPDATE tblCursos SET
NombreCurso=@NombreCurso ,
Descripcion=@Descripcion,
UV=@UV
WHERE idCurso=@idCurso
SELECT* FROM tblCursos
END

EXEC SP_Actualizar_Curso '2','POE','programacion Orientada a Objetos','4'

--------------------------------------------------------------------------
--------------------PROCESO DELETE---------------------------------------
CREATE PROC  SP_DELETE_Curso
@idCurso AS INT
AS
BEGIN
DELETE FROM tblCursos WHERE idCurso=@idCurso
END

EXEC SP_DELETE_Curso 2
SELECT* FROM tblCursos
---------------------------------------------------------------------------------
---------------------PROCESOS ALMACENADOS TABLA MATRICULA--------------------------
--------------------------------------------------------------------------------
--------------------PROCESO CREATE---------------------------------------------
CREATE PROC SP_Insert_Matricula
@FechaMatricula AS DATE,
@Pago AS FLOAT,
@idAlumno AS INT,
@idCurso AS INT 
AS
BEGIN
INSERT INTO tblMatricula(FechaMatricula,Pago,idAlumno,idCurso)
VALUES(@FechaMatricula,@Pago,@idAlumno,@idCurso)
END

EXEC SP_Insert_Matricula '08-02-2003', 102.50, 1,1
SELECT * FROM tblMatricula
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------PROCESO READ---------------------------------------
CREATE PROC SP_Read_Matricula
@idMatricula AS INT
AS
BEGIN
SELECT * FROM tblMatricula WHERE idMatricula=@idMatricula
END

EXEC SP_Read_Matricula 1
--------------------------------------------------------------------------
--------------------PROCESO UPDATE---------------------------------------
CREATE PROC SP_Actualizar_Matricula
@idMatricula AS INT,
@FechaMatricula AS DATE,
@DPago AS VARCHAR(50),
@idAlumno AS INT,
@idCurso AS INT
AS
BEGIN
 UPDATE tblMatricula SET
FechaMatricula=@FechaMatricula ,
Pago=@DPago,
idAlumno= @idAlumno,
idCurso=@idCurso
WHERE idMatricula=@idMatricula

SELECT* FROM tblMatricula
END

EXEC SP_Actualizar_Matricula 1,'02-03-2015',105.5,1,2
--------------------------------------------------------------------------
--------------------PROCESO DELETE---------------------------------------
CREATE PROC  SP_DELETE_MATRICULA
@idMatricula AS INT
AS
BEGIN
DELETE FROM tblMatricula WHERE idMatricula=@idMatricula
END

EXEC SP_DELETE_MATRICULA 3
--------------------------------------------------------------------------------------------
---2.Crear un procedimiento almacenado para listar los registros según nombre de la materia
CREATE PROCEDURE SP_listaMaterias
@NombreCurso NVARCHAR(50) ='%' 
AS
Select idCurso, NombreCurso, Descripcion,UV FROM tblCursos where NombreCurso Like @NombreCurso
GO

EXEC SP_listaMaterias @NombreCurso = 'Matemática';  
GO
--3.Crear un procedimiento almacenado para listar los registros según unidades valorativas de la materia

 ALTER PROC SP_ListaUnida
@UnidaValorativa INT = '%' 
AS
 SELECT idCurso,NombreCurso,Descripcion,UV FROM tblCursos WHERE UV LIKE @UnidaValorativa
GO
EXECUTE SP_ListaUnida  @UnidaValorativa = 6

--------------------------------------------------------------------------------------------------
--4.Eliminar totalmente (DROP) las tablas con los registros que se hicieron en los videos anteriores
--Un detalle de henrito XD
--Eliminar base de datos
DROP DATABASE dbInstituto

--Eliminar registros
DROP TABLE tblMatricula
DROP TABLE tblAlumnos
DROP TABLE  tblCursos

--TRUNCATE
TRUNCATE TABLE tblAlumnos
TRUNCATE TABLE tblCursos
TRUNCATE TABLE tblMatricula



