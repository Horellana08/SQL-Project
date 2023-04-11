

---SINTAXIS DE ALTER TABLE EN MYSQL ------------

--- ELIMINAR UNA COLUMNA DE LA TABLA--------
 ALTER TABLE nombre de la tabla ADD nombre_columna VARCHAR AFTER nombre_columna_anterior

 ------- ELIMINAR VARIAS COLUMNAS DE LA TABLA ------
ALTER TABLE nombre_tabla DROP COLUMN nombre_columna, DROP COLUMN nombre_columna2;

----Eliminar una clave primaria y clave externa (FOREING KEY y PRIMARY KEY):--
MySQL
#Eliminar clave primaria
ALTER TABLE nombre_tabla DROP PRIMARY KEY;
#Eliminar clave externa
ALTER TABLE nombre_tabla DROP FOREIGN KEY nombre_columna;
#Eliminar clave primaria
ALTER TABLE nombre_tabla DROP PRIMARY KEY;
#Eliminar clave externa
ALTER TABLE nombre_tabla DROP FOREIGN KEY nombre_columna;


------ INSERTAR UNA NUEVA COLUMNA AL FINAL DE LA TABLA ----
ALTER TABLE nombre_tabla ADD fecha_nacimiento date;

------ ANIADIR UNA NUEVA COLUMNA EN LA PRIMERA POSICION DE LA TABLA ----
ALTER TABLE nombre_tabla ADD nombre_columna VARCHAR(5) INT FIRST;

-------- ANIADIR UN INDICE A UNA COLUMNA Y ELIMINAR UN INIDICE ---
ALTER TABLE nombre_tabla ADD INDEX (nombre_columna);
ALTER TABLE nombre_tabla DROP INDEX nombre_indice;

----- ASIGNAR COMO CLAVE PRIMARY A UNA COLUMNA ------
ALTER TABLE nombre_Tabla ADD PRIMARY KEY(nombre_columna);

---- MODIFICAR EL VALOR DE LA COLUMNA CON PROPIEDAD AUTOINCREMENT PARA QUE COMIENCIA POR 
      ---EL VALOR 15000---

ALTER TABLE nombre_tabla AUTO_INCREMENT=15000;

----- CAMBIAR EL NOMBRE Y TIPO DE UNA COLUMNA
ALTER TABLE nombre_tabla CHANGE nombre_viejo_columna nombre_nuevo_columna VARCHAR(20);

----- SOLAMENTE CAMBIAR EL TIPO DE DATO DE UNA COLUMNA ----
ALTER TABLE nombre_tabla MODIFY nombre_columna DATE NOT NULL;