USE inoxpor_silva;

-- Creacion de vista Listado de stock de la sucursal 1
CREATE VIEW v_stock_suc_1 AS
SELECT id_stock AS Codigo_de_producto, stock AS Cantidad
FROM stock
WHERE sucursal = 1;

-- Creacion de vista listado de chapas 
CREATE VIEW v_listado_chapas AS
SELECT p.id_producto, p.producto_descripcion, c.categoria_descripcion
FROM producto AS p
JOIN categoria_producto AS c ON p.id_categoria = c.id_categoria
WHERE  p.id_categoria = 2;

-- Creacion de vista listado de precios de productos sucursal 2
CREATE VIEW v_precios_productos_sucursal_2 AS
SELECT p.id_producto, p.producto_descripcion, p.precio 
FROM producto AS p
JOIN stock AS s ON p.id_producto = s.id_stock
WHERE  s.sucursal = 2;

-- Creacion de vista resumen de ventas
CREATE VIEW v_resumen_de_ventas AS
SELECT v.id_pedido, c.nombre AS Cliente, p.producto_descripcion AS Producto, v.producto_cantidad AS Cantidad, p.precio 
FROM ventas AS v
JOIN cliente AS c ON v.id_cliente = c.id_cliente
JOIN producto AS p ON v.id_producto = p.id_producto;

-- Creacion de vista pedidos con envio express
CREATE VIEW v_pedidos_envio_express AS
SELECT v.id_pedido, e.envio_modalidad 
FROM ventas AS v
JOIN envio AS e ON v.id_envio = e.id_envio
WHERE e.id_envio = 2;
