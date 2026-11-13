--CLASE DE JOIN

--CREAR BASE DE DATOS--

CREATE DATABASE CLASE_JOIN

--Clausula USE--

USE CLASE_JOIN

--CREAR TABLA Personas--

CREATE TABLE Personas(
PersonaID int NOT NULL Primary key,
Apellido varchar (50) NOT NULL
)


--Insertar los datos en Tabla Personas--

INSERT INTO Personas
VALUES 
(1, 'Fleming'),
(2, 'Eratóstenes'),
(3, 'Newton'),
(4, 'Fernández')

--Crear Tabla Logros--

CREATE TABLE Logros (
LogroID int NOT NULL PRIMARY KEY,
PersonaID int FOREIGN KEY REFERENCES Personas(PersonaID),
Logro varchar(100) NOT NULL)

--Insertar Datos en Tabla Logros--

INSERT INTO Logros
VALUES
(1,1,'Descubrimiento de la Penicilina'),
(2,2,'Cálculo del perímetro terrestre'),
(3,3,'Ley de gravitación universal'),
(4,3,'Desarrollo del Cálculo'),
(5,NULL,'Cura del cáncer')


--UNION

--CREAR TABLA Logros1--

CREATE TABLE Logros1 (
LogroID int NOT NULL PRIMARY KEY,
PersonaID int ,
Logro varchar(100) NOT NULL)

--Insertar datos en Tabla Logros1--

INSERT INTO Logros1
VALUES
(1,1,'Descubrimiento de la Penicilina'),
(2,2,'Cálculo del perimetro terrestre'),
(3,3,'Ley de gravitación universal'),
(4,3,'Desarrollo del Cálculo'),
(5,NULL, 'Cura del cancer')

--Crear Tabla Logros2--

CREATE TABLE Logros2 (
LogroID int NOT NULL PRIMARY KEY,
PersonaID int,
Logro varchar(100) NOT NULL)

--Insertar Datos en Tabla Logros2--

INSERT INTO Logros2
VALUES
(6,10,'Descubrimiento de la Gravedad'),
(7,11,'Primer nobel de química'),
(8,11,'Creación del datawarehouse'),
(9,3,'Ley de gravitación universal'),
(10,3,'Desarrollo del Cálculo')

SELECT * FROM logros
SELECT * FROM personas

SELECT
*
FROM personas
INNER JOIN logros
ON personas.PersonaID = logros.LogroID

SELECT
Personas.Apellido,
Logros.Logro
FROM personas
INNER JOIN logros
ON personas.PersonaID = logros.LogroID

SELECT c.nombre, p.id_pedido, p.total
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;

