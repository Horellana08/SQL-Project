--Creando la base de datos
create database biblioteca2022

--Usando la base de datos
use biblioteca2022

--Creando la tabla Autores
create table Autores(
	id_autor int primary key identity not null,
	nombre_autor varchar(30) not null,
	apellidos varchar(30) not null,
	nacionalidad varchar(30) not null,
	telefono varchar(30)
);

--Creando la tabla Categorias
create table Categorias(
	id_categoria int primary key identity not null,
	nombre_categoria varchar(30)
);

--Creando la tabla Libros
create table Libros(
	id_libro int primary key identity not null,
	titulo varchar(40) not null,
	id_autor int  not null,
	id_categoria int not null,
	FOREIGN KEY (id_autor) REFERENCES Autores(id_autor),
	FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

--Insertando datos en la tabla Autores
insert into Autores values ('Juan', 'Perez', 'Salvadoreño', '73240985')

--Ver los datos insertados en la tabla Autores
select * from Autores

--Modificar datos de la tabla Autores
update Autores set telefono ='71717171' where id_autor='5'

--Eliminando datos de la tabla Autores
delete Autores where id_autor=5



--Insertando datos en la tabla Categorias
insert into Categorias values ('Teatral')

--Ver los datos insertados en la tabla Categorias
select * from Categorias

--Modificar datos de la tabla Categorias
update Categorias set nombre_categoria ='Romance' where id_categoria='5'

--Eliminando datos de la tabla Categorias
delete Categorias where id_categoria=5



--Insertando datos en la tabla Libros
insert into Libros values ('Jicara triste', '5', '5')

--Ver los datos insertados en la tabla Libros
select * from Libros

---Modificar datos de la tabla Libros
update Libros set titulo ='Jupiter' where id_libro='5'

---Eliminando datos de la tabla Libros
delete Libros where id_libro=5