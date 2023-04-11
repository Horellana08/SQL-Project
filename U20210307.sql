--Crear una base de datos
Create database U20210307
Go

--Usar la base de datos para la futura creacion de tablas y registros
use U20210307
go

--crear una tabla
create table especies(
id_especie int primary key identity,
nombre varchar(50)
)
GO

--Crear una tabla
Create table razas(
id_raza int primary key identity,
nombre varchar(255) not null,
id_especie int not null,
foreign key (id_especie) references especies(id_especie)
)
GO

--Procedimiento almacenado de select --
create PROCEDURE selectDatosRaza
AS   
    select r.id_raza, r.nombre, e.nombre as nombre_especie from razas as r, especies as e

GO  

create PROCEDURE selectDatosEspecie
AS   
    select * from especies
GO  


--Procedimiento almacenado de insert --
create PROCEDURE insertDatosEspecie 
    @nombre varchar(50)  
AS   
    insert into especies values (@nombre)
GO  

create PROCEDURE insertDatosRaza
    @nombre varchar(50),
	@idEspecie int
AS   
    insert into razas values (@nombre, @idEspecie)
GO  



--Procedimiento almacenado de update --
create procedure updateDatosEspecie
	@idEspecie int,
	@nombre varchar(50)  
AS
	update especies set nombre = @nombre where id_especie = @idEspecie
GO

create procedure updateDatosRaza
	@idEspecie int,
	@idRaza int,
	@nombre varchar(50)  
AS
	update razas set nombre = @nombre, id_especie= @idEspecie where id_raza = @idRaza
GO

--Procedimiento almacenado de delete --
create procedure deleteDatosEspecie
@idEspecie int
AS
	delete from especies where id_especie = @idEspecie
GO

create procedure deleteDatosRaza
@idRaza int
AS
	delete from razas where id_raza = @idRaza
GO