CREATE DATABASE Ventas_tech_DB

USE Ventas_tech_DB

-- === SECCIÓN 1: DROP ===

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS categoria;

-- === SECCIÓN 2: CREATE TABLES ===

CREATE TABLE categoria(
id_categoria INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
nombre_categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR(200)
);

CREATE TABLE cliente(
id_cliente INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
ciudad VARCHAR(50),
fecha_registro DATE NOT NULL
);

CREATE TABLE producto(
id_producto INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
nombre_producto VARCHAR(100) NOT NULL,
id_categoria INT, 
precio DECIMAL(10,2) NOT NULL,
stock INT DEFAULT 0,
activo BIT DEFAULT 1,

FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE venta(
id_venta INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
id_cliente INT,
id_producto INT,
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL,
fecha_venta DATE NOT NULL,

FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- === SECCIÓN 3: INSERT INTO ===

INSERT INTO categoria(
nombre_categoria, 
descripcion) 

VALUES
  ('Computacion','Laptops, PCs y monitores'),
  ('Accesorios','Periféricos y complementos'),
  ('Audio','Auriculares y parlantes'),
  ('Almacenamiento','Discos y memorias'
  );

INSERT INTO cliente(
nombre, 
email, 
ciudad, 
fecha_registro) 

VALUES
  ('María López','maria@mail.com','Buenos Aires','2024-01-05'),
  ('Carlos Ruiz','carlos@mail.com','Córdoba','2024-01-10'),
  ('Ana Gómez','ana@mail.com','Rosario','2024-02-01'),
  ('Pedro Sanz','pedro@mail.com','Mendoza','2024-02-15'),
  ('Laura Torres','laura@mail.com','Tucumán','2024-03-01'
  );

INSERT INTO producto(
nombre_producto,
id_categoria,
precio,
stock,
activo) 

VALUES
  ('Laptop Pro 15',1, 1200.00,15,1),
  ('Mouse Inalámbrico',2,28.00,80,1),
  ('Monitor 4K 27',1,450.00,12,1),
  ('Auriculares BT Pro',3,120.00,35,1),
  ('SSD Externo 1TB',4,130.00,18,1),
  ('Teclado Mecánico',2,95.00,40,1
  );

 INSERT INTO venta(
 id_cliente, 
 id_producto, 
 cantidad, 
 precio_unitario, 
 fecha_venta) 
 
 VALUES
  (1, 1, 2, 1200.00, '2024-03-05'),
  (2, 2, 5,   28.00, '2024-03-06'),
  (3, 3, 1,  450.00, '2024-03-07'),
  (1, 4, 2,  120.00, '2024-03-08'),
  (4, 5, 3,  130.00, '2024-03-10'),
  (2, 6, 4,   95.00, '2024-03-11'),
  (5, 1, 1, 1200.00, '2024-03-12'),
  (3, 2, 8,   28.00, '2024-03-13'),
  (4, 4, 1,  120.00, '2024-03-14'),
  (5, 3, 2,  450.00, '2024-03-15'
  );

  -- === SECCIÓN 4: SELECT TABLES ===

SELECT * FROM categoria;   -- esperado: 4 filas
SELECT * FROM cliente;     -- esperado: 5 filas
SELECT * FROM producto;    -- esperado: 6 filas
SELECT * FROM venta;       -- esperado: 10 filas
;