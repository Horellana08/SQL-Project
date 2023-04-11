CREATE DATABASE ventas;

use ventas;

CREATE TABLE bodega (

    id_bodega NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
)

INSERT INTO Bodega VALUES (null,'NombrePrueba', 'DireccionPrueba', 'CiudadPrueba');

CREATE TABLE empleado(
    id_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL
)

CREATE TABLE cliente(
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_cliente VARCHAR(45),
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
)

CREATE TABLE producto(
    id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL (5,2) NOT NULL,
    categoria VARCHAR(100) NOT NULL
)

CREATE TABLE pais_almacen (
    id_pais INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
)

CREATE TABLE almacen (
    id_almacen INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_bodega INT NOT NULL,
    id_pais INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIG KEY (id_bodega) REFERENCES bodega(id_bodega) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIG KEY (id_pais) REFERENCES pais_almacen(id_pais) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIG KEY (id_empleado) REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE,
)

CREATE TABLE ventas (
    id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_almacen INT NOT NULL,
    id_producto INT NOT NULL,
    id_cliente INT NOT NULL,
    tipo_ventas BOOLEAN NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
)
-- Agregamos mas tablas
-- Proveedor
CREATE TABLE proveedor(
    id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150),
    Apellido VARCHAR(150),
    Telefono VARCHAR(150),
    empresa VARCHAR(150)
)
-- categoria
CREATE TABLE  categoria(
    id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150),
    descripcion VARCHAR(150),
    estado BIT
)

-- roles
CREATE TABLE roles(
    id_rol INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150),
    descripcion VARCHAR(150),
    estado BIT
)
-- ingreso
CREATE TABLE ingreso(
    id_ingreso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    id_empleado INT NOT NULL,
    tipo_comprobante VARCHAR(150),
    num_comprobante VARCHAR(150),
    fecha DATETIME,
    impuesto  DECIMAL(10,2),
    total DECIMAL(11,2),
    estado VARCHAR(150),
-- Llaves foraneas
    FOREIGN KEY(id_proveedor) REFERENCES proveedor(id_proveedor)
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
)
-- Detalle ingreso
CREATE TABLE detalle_ingreso(
    id_detalle_ingreso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_ingreso INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY(id_ingreso) REFERENCES ingreso(id_ingreso)

)
-- Detalle venta
CREATE TABLE detalle_venta(
    id_detalle_venta INT NOT NULL,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    descuento DECIMAL(10,2) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,

    -- FORANEAS
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
)
---- CLAUSULAS DE LA BASE DE DATOS
ALTER TABLE 
     ventas ADD  tipo_comprobante
     VARCHAR(150) AFTER  tipo_ventas

ALTER TABLE 
     producto ADD 
     stock INT NOT NULL,ADD
     descripcion VARCHAR(250),ADD
     estado BIT NOT NULL
    AFTER precio
      
ALTER TABLE
    producto DROP
    COLUMN  categoria      
--  agregar una foranea  a una tabla
ALTER TABLE  producto ADD FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) 
