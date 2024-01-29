-- Creación de la base de datos
CREATE DATABASE inoxpro_silva;
USE inoxpro_silva;

-- Tables
-- Tabla: ENVIO
CREATE TABLE ENVIO (
    id_envio INT NOT NULL,
    envio_modalidad VARCHAR (30) NOT NULL,
    CONSTRAINT PK_ENVIO PRIMARY KEY (id_envio)
);

-- Tabla: CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT NOT NULL,
    nombre VARCHAR (180) NOT NULL,
    email VARCHAR (240),
    direccion VARCHAR (180) NOT NULL,
    CONSTRAINT PK_CLIENTE PRIMARY KEY (id_cliente)
);

-- Tabla: DESTINO
CREATE TABLE DESTINO (
    id_destino INT NOT NULL,
    nombre VARCHAR (180) NOT NULL,
    email VARCHAR (240),
    direccion VARCHAR (180) NOT NULL,
    CONSTRAINT PK_DESTINO PRIMARY KEY (id_destino)
);

-- Tabla: PRODUCTO
CREATE TABLE PRODUCTO (
    id_producto INT NOT NULL,
    producto_descripcion VARCHAR (40) NOT NULL,
    id_categoria INT NOT NULL,
    precio DECIMAL (10,2),
    CONSTRAINT PK_PRODUCTO PRIMARY KEY (id_producto)
);

-- Tabla: CATEGORIA_PRODUCTO
CREATE TABLE CATEGORIA_PRODUCTO (
    id_categoria INT NOT NULL,
    categoria_descripcion VARCHAR (40) NOT NULL,
    CONSTRAINT PK_CATEGORIA_PRODUCTO PRIMARY KEY (id_categoria)
);

-- Tabla: STOCK
CREATE TABLE STOCK (
    id_stock INT NOT NULL,
    stock INT NOT NULL,
    sucursal INT,
    CONSTRAINT PK_STOCK PRIMARY KEY (id_stock)
);

-- Tabla: VENTAS
CREATE TABLE VENTAS (
    id_pedido INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    id_envio INT NOT NULL,
    id_cliente INT NOT NULL,
    id_destino INT NOT NULL,
    id_producto INT NOT NULL,
    producto_cantidad INT NOT NULL,
    CONSTRAINT PK_VENTAS PRIMARY KEY (id_pedido)
);

-- FOREIIGN KEYS
-- Referencia: FK_PRODUCTO_CATEGORIA_PRODUCTO (Tabla: PRODUCTO)
ALTER TABLE PRODUCTO 
ADD CONSTRAINT FK_PRODUCTO_CATEGORIA_PRODUCTO 
FOREIGN KEY (id_categoria)
REFERENCES CATEGORIA_PRODUCTO (id_categoria);

-- Referencia: FK_VENTAS (Tabla: VENTAS)
ALTER TABLE VENTAS 
ADD CONSTRAINT FK_VENTAS_ENVIO
FOREIGN KEY (id_envio)
REFERENCES ENVIO (id_envio),
ADD CONSTRAINT FK_VENTAS_CLIENTE 
FOREIGN KEY (id_cliente)
REFERENCES CLIENTE (id_cliente),
ADD CONSTRAINT FK_VENTAS_DESTINO 
FOREIGN KEY (id_destino)
REFERENCES DESTINO (id_destino),
ADD CONSTRAINT FK_VENTAS_PRODUCTO 
FOREIGN KEY (id_producto)
REFERENCES PRODUCTO (id_producto);

-- Referencia: FK_STOCK (Tabla: STOCK)    
ALTER TABLE STOCK
ADD CONSTRAINT FK_STOCK_PRODUCTO
FOREIGN KEY (id_stock)
REFERENCES PRODUCTO (id_producto);    

-- Script de insercion de datos
INSERT INTO envio (id_envio, envio_modalidad) VALUES
(1, 'Normal'),
(2, 'Express'),
(3, 'Express especial');

INSERT INTO cliente (id_cliente, nombre, email, direccion) VALUES
(1001, 'Metales la avenida', 'metalesavenida@gmail.com', 'AV. Beiro 4000 Villa devoto'),
(1002, 'Acerox', 'metalesavenida@gmail.com', 'AV. Vergara Hurlingham'),
(1003, 'Metalpro', 'metalpro@gmail.com', 'Nogoya 2000 Villa del Parque'),
(1004, 'Hierros la nueva', 'lanueva@gmail.com', 'Balvin 3500 San Miguel'),
(1005, 'Union Hnos', 'union@gmail.com', 'AV. de Mayo 350 Ramos Mejia');	

INSERT INTO destino (id_destino, nombre, email, direccion) VALUES 
(2001, 'Deposito', 'deposito1@gmail.com', 'AV. Beiro 4000 Villa devoto'),
(2002, 'Centro Rosario', 'centrorosario@gmail.com', 'Gascon 150 Rosario'),
(2003, 'CTA', 'cta@gmail.com', 'C. Lopez 2000 Villa Ballester'),
(2004, 'Parque industrial Pilar', 'pipilar@gmail.com', 'Balvin 3500 Pilar'),
(2005, 'Planta Cordoba', 'plantacordoba@gmail.com', 'AV. San Martin 350 Cordoba');

INSERT INTO categoria_producto (id_categoria, categoria_descripcion) VALUES 
(1,'Accesorios'),
(2,'Chapas'),
(3,'Tubos'),
(4,'Barras');

INSERT INTO producto (id_producto, producto_descripcion, id_categoria, precio) VALUES 
(3000, 'Curva p/soldar', 1, 100.23),
(3001, 'Tee p/soldar', 1, 560.55),
(3002, 'Chapa 1 mm', 2, 53.56),
(3003, 'Chapa 2 mm', 2, 157.56),
(3004, 'Tubo 1"', 3, 198.00),
(3005, 'Tubo 2"', 3, 345.00),
(3006, 'Barra 10 mm redonda', 4, 435.00),
(3007, 'Barra 10 mm cuadrada', 4, 435.00);

INSERT INTO stock (id_stock, stock, sucursal) VALUES 
(3000, '10', 1),
(3001, '15', 2),
(3002, '25', 1),
(3003, '10', 2),
(3004, '12', 1),
(3005, '50', 1),
(3006, '23', 2),
(3007, '67', 2);

INSERT INTO ventas (id_pedido, fecha_pedido, id_envio, id_cliente, id_destino, id_producto, producto_cantidad) VALUES 
(220001, 20230808, 3, 1005, 2002, 3004, 31),
(220002, 20230605, 3, 1001, 2003, 3002, 12),
(220003, 20230818, 1, 1001, 2002, 3004, 36),
(220004, 20230701, 2, 1002, 2005, 3006, 50),
(220005, 20230508, 1, 1001, 2001, 3007, 26),
(220006, 20230403, 1, 1004, 2005, 3000, 26),
(220010, 20230108, 3, 1005, 2002, 3004, 75),
(220011, 20230105, 3, 1001, 2003, 3002, 15),
(220012, 20230218, 1, 1001, 2002, 3004, 33),
(220013, 20230201, 2, 1002, 2005, 3006, 20),
(220014, 20230308, 1, 1001, 2001, 3007, 34),
(220015, 20230303, 1, 1004, 2005, 3000, 15),
(220016, 20230408, 3, 1005, 2002, 3004, 53),
(220017, 20230405, 3, 1001, 2003, 3002, 100),
(220018, 20230518, 1, 1001, 2002, 3004, 26),
(220019, 20230501, 2, 1002, 2005, 3006, 5),
(220020, 20230608, 1, 1001, 2001, 3007, 35),
(220021, 20230603, 1, 1004, 2005, 3000, 35),
(220022, 20230908, 3, 1005, 2002, 3004, 100),
(220023, 20230905, 3, 1001, 2003, 3002, 90),
(220024, 20231018, 1, 1001, 2002, 3004, 66),
(220025, 20231001, 2, 1002, 2005, 3006, 40),
(220026, 20231108, 1, 1001, 2001, 3007, 50),
(220027, 20231103, 1, 1004, 2005, 3000, 13),
(220028, 20231108, 3, 1005, 2002, 3004, 50),
(220029, 20231205, 3, 1001, 2003, 3002, 24),
(220030, 20231218, 1, 1001, 2002, 3004, 13),
(220031, 20231201, 2, 1002, 2005, 3006, 35),
(220032, 20231208, 1, 1001, 2001, 3007, 37),
(220033, 20231203, 1, 1004, 2005, 3000, 34);

-- Creacion de vistas
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

-- Creacion de funciones
-- Calculo de precio con descuento
DELIMITER //
CREATE FUNCTION f_precio_con_descuento (precio DECIMAL(10,2), descuento INT)
 RETURNS DECIMAL (10,2)
 NO SQL
 BEGIN
 DECLARE resultado DECIMAL (10,2);
 SET resultado = precio *((100-descuento)/100);
 RETURN resultado; 
 END//
DELIMITER ;

-- Calculo monto de pedido
DELIMITER //
CREATE FUNCTION f_calculo_monto_pedido (p_id_pedido INT)
 RETURNS DECIMAL (10,2)
 DETERMINISTIC
 BEGIN
 DECLARE resultado DECIMAL (10,2);
   SELECT SUM(v.producto_cantidad * p.precio)
    INTO resultado
    FROM ventas AS v
    JOIN producto AS p ON v.id_producto=p.id_producto
    WHERE v.id_pedido = p_id_pedido;
 RETURN resultado; 
 END //
DELIMITER ;


-- Creacion de Stored Procedures
-- Creacion SP para ordenar una tabla
DELIMITER //
CREATE PROCEDURE sp_ordenar_tabla(IN tabla_orden VARCHAR(255), IN campo_ordenamiento VARCHAR(255), IN orden VARCHAR(10))
BEGIN
    SET @query = CONCAT('SELECT * FROM ', tabla_orden, ' ORDER BY ', campo_ordenamiento, ' ', orden);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

-- Ejemplo de uso del SP para ordenar la tabla VENTAS de forma descendente por fecha_pedido
CALL sp_ordenar_tabla('VENTAS', 'fecha_pedido', 'DESC');

-- Creacion SP para eliminar un registro especifico
DELIMITER //
CREATE PROCEDURE EliminarVenta(IN p_id_pedido INT)
BEGIN
    DELETE FROM VENTAS WHERE id_pedido = p_id_pedido;
END //
DELIMITER ;

-- Ejemplo de uso del SP para eliminar un id_pedido
CALL EliminarVenta(220009);

-- Creacion de Triggers y tablas de auditoria
-- Creamos la tabla de auditoria de ventas
CREATE TABLE auditoria_ventas (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_cliente INT NOT NULL,
	fecha DATE,
    hora TIME,  
	usuario VARCHAR (255),
    accion VARCHAR (255)
);

-- Creacion de trigger log de creacion de pedidos
CREATE TRIGGER auditoria_ventas
AFTER INSERT ON ventas
FOR EACH ROW
INSERT INTO auditoria_ventas VALUES 
(DEFAULT, new.id_pedido, new.id_cliente, curdate(), curtime(), system_user(),'se creo un nuevo pedido');

-- Creamos la tabla auditoria de productos
CREATE TABLE auditoria_productos (
id_log INT PRIMARY KEY AUTO_INCREMENT,
id_producto INT NOT NULL,
anterior_descripcion VARCHAR (40),
nueva_descripcion VARCHAR (40),
anterior_categoria INT,
nueva_categoria INT,
fecha DATE,
hora TIME, 	
usuario VARCHAR (255),
accion VARCHAR (255)
);

-- Creacion de trigger actualizacion de productos
CREATE TRIGGER auditoria_prductos 
BEFORE UPDATE ON producto
FOR EACH ROW
INSERT INTO auditoria_productos VALUES
(DEFAULT, id_producto, old.producto_descripcion, new.producto_descripcion, 
old.id_categoria, new.id_categoria, curdate(), curtime(), system_user(),'se modifico el producto');
