-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: [Gastón Alonso]
-- Fecha: [11/11/2026]
-- ══════════════════════════════════════════

USE Ministore_ventas

-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?
-- Mostrá todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecerán con NULL en las columnas de ventas.

SELECT p.producto_id,
       p.nombre,
       v.venta_id,
       v.cantidad
FROM productos p
LEFT JOIN ventas v ON p.producto_id = v.producto_id
;

-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos
-- que no figuran en nuestro catálogo? (posible error de carga de datos)
-- Los registros huérfanos aparecerán con NULL en las columnas de productos.

SELECT v.venta_id,
       v.producto_id,
       v.cantidad,
       p.nombre,
       p.categoria
FROM productos p
RIGHT JOIN ventas v ON p.producto_id = v.producto_id
;

-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre
-- todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.

-- [Tu consulta aquí]
