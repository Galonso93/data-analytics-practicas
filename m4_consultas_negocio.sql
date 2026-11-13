--Consulta 1 — Resumen ejecutivo mensual

SELECT 
	MONTH(fecha_venta) AS Mes,
	SUM(cantidad * precio_unitario) AS Total_facturado,
	COUNT(*) AS Cantidad_pedidos,
	AVG(cantidad * precio_unitario) AS Ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY Mes
;

--Consulta 2 — Ranking de productos

SELECT TOP 5 id_producto,
	SUM(cantidad) AS Unidades_vendidas,
	SUM(cantidad * precio_unitario) AS Total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY Total_facturado DESC
;

--Consulta 3 — Clientes recurrentes

SELECT id_cliente,
	COUNT(*) AS cantidad_pedidos,
	SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT (*) > 1
;

-- Consulta 4 — Productos por encima/por debajo del promedio

WITH Facturacion_productos AS (
	SELECT id_producto,
		SUM(cantidad * precio_unitario) AS Total_facturado
	FROM ventas
	GROUP BY id_producto
)

SELECT 
	id_producto,
	Total_facturado,
	CASE
		WHEN Total_facturado > (SELECT AVG(Total_facturado) FROM Facturacion_productos)	THEN 'Por encima'
		ELSE 'Por debajo'
	END AS Comparacion_promedio
FROM Facturacion_productos
;

-- Hallazgos
-- Primero: En marzo se facturaron 6.444 y se realizaron 10 pedidos con un ticke promedio de 644,40. 
-- Segundo: El producto 1 es el de mayor facturación y el 2 es el más vendido en unidades.
-- Tercero: Solo los productos 1 y 3 se encuentran por encima del promedio de facturación.



