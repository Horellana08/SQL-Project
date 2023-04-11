create database U20210307
GO

use U20210307
go

create table especies(
--nombre clave primary tipo de dato identify
id_especie int primary key identity,
nombre varchar(50)
)

create table razas(
id_raza int primary key identity,
nombre varchar(50),
id_especie int,
--esta es una llave foranea
foreign key(id_especie) references
especies (id_especie)
)
--Creamos procedimientos almacenados
CREATE PROCEDURE selectDatosEspecie
AS
	select * from especies
GO
--Creamos procedimientos almacenados
CREATE PROCEDURE selectDatosRaza
AS
select *from razas
GO
execute selectDatosEspecie
execute selectDatosRaza

create procedure insertDatosEspecie
@nombre varchar(50)
AS
	insert into especies values(@nombre)
GO

execute insertDatosEspecie 'Canino'

create procedure insertDatosRaza
@nombre varchar(50),
@idEspecie int
AS
	insert into razas values(@nombre,@idEspecie)
GO


-- procedimiento de almacenamiento  UPDATE /DELETE
create procedure updateDatosEspecie
@nombre varchar(50),
@idEspecie int
AS
update especies set nombre = @nombre
where id_especie =1
GO

delete from especies where id_especie =1
-- procedimiento de almacenamiento  UPDATE /DELETE
create procedure updateDatosRaza
@nombre varchar(50),
@idEspecie int,
@idRaza int
AS
update razas set nombre =@nombre, id_especie = @idEspecie
where id_raza = @idRaza
GO


