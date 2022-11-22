-- Creación de la base de datos henrito--
--Esta base de datos trata de un reproductor de música --
--Procedemos a crear nuestra base de datos
create database Reproductor;
GO

use Reproductor;
Go

--Procedemos a crear la tabla del genero musical--
create table genero(
  id int primary key,
  nombre varchar(100),
  imagen varchar(100)
);
--Procedemos a crear la tabla para los artistas
create table artista(
  id int primary key ,
  nombre varchar(100),
  imagen varchar(100)
);

-- Procedemos a crear la tabla para las canciones--
  create table canciones(
    id int primary key,
    titulo varchar(100),
    archivo varchar(100),
    imagen varchar(100),
    idGenero int,
    idArtista int,
-- llaves foraneas
    foreign key (idGenero) references genero(id),
    foreign key (idArtista) references artista(id)
  );

-- Ver datos
SELECT * FROM artista
SELECT * FROM canciones
SELECT * FROM genero

--Insertar datos
INSERT INTO artista(nombre, imagen)
VALUES ('Los de adentro')












