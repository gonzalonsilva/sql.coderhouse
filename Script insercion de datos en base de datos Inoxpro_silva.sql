USE inoxpro_silva;

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

INSERT INTO producto (id_producto, producto_descripcion, id_categoria) VALUES 
(3000, 'Curva p/soldar', 1),
(3001, 'Tee p/soldar', 1),
(3002, 'Chapa 1 mm', 2),
(3003, 'Chapa 2 mm', 2),
(3004, 'Tubo 1"', 3),
(3005, 'Tubo 2"', 3),
(3006, 'Barra 10 mm redonda', 4),
(3007, 'Barra 10 mm cuadrada', 4);

INSERT INTO ventas (id_pedido, fecha_pedido, id_envio, id_cliente, id_destino, id_producto, producto_cantidad) VALUES 
(220001, 20230808, 3, 1005, 2002, 3004, 3),
(220002, 20230605, 3, 1001, 2003, 3002, 2),
(220003, 20230818, 1, 1001, 2002, 3004, 3),
(220004, 20230701, 2, 1002, 2005, 3006, 4),
(220005, 20230508, 1, 1001, 2001, 3007, 4),
(220006, 20230403, 1, 1004, 2005, 3000, 1);




