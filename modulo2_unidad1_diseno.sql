CREATE DATABASE Ejercicio;

USE Ejercicio

CREATE TABLE clientes (
id_clientes INT NOT NULL IDENTITY(1,1) PRIMARY KEY, -- INT porque es 1 digito
nombre VARCHAR(100) NOT NULL, -- varchar porque es un texto limitado
perfil_bio TEXT NOT NULL, -- text porque es un texto sin limite
fecha_registro DATE NOT NULL -- date porque es fecha
);

CREATE TABLE productos (
id_productos INT NOT NULL IDENTITY(1,1) PRIMARY KEY, -- INT porque es 1 digito
descripcion VARCHAR(255) NOT NULL, -- varchar porque es un texto limitado
precio DECIMAL(10,2) NOT NULL, -- decimal porque es un precio que exige tener 2 decimales
esta_activo INT NOT NULL -- int porque si está activo o no puede ordenarse con 1 y 0
);

