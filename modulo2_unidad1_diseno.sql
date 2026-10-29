CREATE DATABASE Ejercicio;

USE Ejercicio

CREATE TABLE clientes (
IDclientes int NOT NULL Identity(1,1) PRIMARY KEY, -- INT porque es 1 digito
nombre varchar(100) NOT NULL, -- varchar porque es un texto limitado
perfil_bio text NOT NULL, -- text porque es un texto sin limite
fecha_registro date NOT NULL, -- date porque es fecha
)

CREATE TABLE productos (
IDproductos int NOT NULL Identity(1,1) PRIMARY KEY, -- INT porque es 1 digito
descripcion varchar(255) NOT NULL, -- varchar porque es un texto limitado
precio decimal(10,2) NOT NULL, -- decimal porque es un precio que exige tener 2 decimales
esta_activo int NOT NULL, -- int porque si está activo o no puede ordenarse con 1 y 0
)
