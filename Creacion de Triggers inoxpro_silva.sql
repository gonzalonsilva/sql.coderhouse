USE inoxpro_silva;

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


