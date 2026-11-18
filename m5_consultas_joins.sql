-- Consulta 1 — Vista base del proyecto (INNER JOIN)
-- Propósito: Busca tener una vista general de las ventas del negocio

SELECT v.id_venta,
       v.fecha_venta,
       v.id_cliente,
       c.nombre,
       v.id_producto,
       p.nombre_producto,
       cat.nombre_categoria,
       v.cantidad,
       v.precio_unitario,
       v.cantidad * v.precio_unitario AS total_venta
FROM ventas v
INNER JOIN productos p ON p.id_producto = v.id_producto
INNER JOIN clientes c ON c.id_cliente = v.id_cliente
INNER JOIN categorias cat ON cat.id_categoria = p.id_categoria
;

-- Hallazgos: Se ve que se realizaron 10 ventas en lo que va del negocio. Que María López realizó 2 compras por 2640. Además, ella realizó la compra más grande.

-- Consulta 2 — Clientes sin ventas (LEFT JOIN)
-- Propósito: Identificar clientes que aún no hayan tenido ninguna venta.

SELECT c.nombre,
       c.email,
       c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON v.id_cliente = c.id_cliente
WHERE v.id_venta IS NULL
;

-- Hallazgos: Al realizar la búsqueda se ve que no hay ningún valor. Eso significa que todos los clientes realizaron al menos 1 venta.

-- Consulta 3 — Productos sin ventas (LEFT JOIN) 
-- Propósito: Identificar productos que aún no hayan tenido ninguna venta.

SELECT p.nombre_producto,
       cat.nombre_categoria,
       p.precio
FROM productos p
LEFT JOIN ventas v ON v.id_producto = p.id_producto
INNER JOIN categorias cat ON cat.id_categoria = p.id_categoria
WHERE v.id_venta IS NULL
;

-- Hallazgos: Al realizar la búsqueda se ve que no hay ningún valor. Eso significa que todos los productos fueron vendidos al menos 1 vez.

-- Consulta 4 — Consolidado por canal (UNION ALL)
-- Propósito: Consolidar las ventas mediante UNION ALL, creando una columna de canal con valores simulados (Online y Presencial) y calculando la facturación total de cada grupo.

SELECT canal,
       SUM(total) AS total_canal
FROM (
    SELECT fecha_venta,
           cantidad * precio_unitario AS total,
           'Online' AS canal
    FROM ventas
    WHERE fecha_venta >= '2024-03-01'
      AND fecha_venta < '2024-03-08'

    UNION ALL

    SELECT fecha_venta,
           cantidad * precio_unitario AS total,
           'Presencial' AS canal
    FROM ventas
    WHERE fecha_venta >= '2024-03-08'
      AND fecha_venta < '2024-03-16'
) AS consolidado
GROUP BY canal;

-- Hallazgos: Al realizar la búsqueda se ve que el canal Online presenta ventas por 2990 y el canal presencial por 3454. Es decir, este último genera más ventas.
