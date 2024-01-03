USE inoxpro_silva;

-- Desactivar autocommit
SET autocommit = 0;

-- Primer TCL
-- Comienza la transaccion
START TRANSACTION;

-- Eliminamos un registro de la tabla ventas
DELETE FROM ventas WHERE id_pedido = 220006;

-- Sentencia Rollback comentada
-- ROLLBACK;

-- Sentencia Commit
-- COMMIT;

-- Segundo TCL
-- Comienza la transaccion
START TRANSACTION;

-- Insercion de los primeros 4 registros 
INSERT INTO cliente (id_cliente, nombre, email, direccion) VALUES
(1006, 'Metales cluster', 'cluster@gmail.com', 'AV. Segurola 4000 Villa devoto'),
(1007, 'UNI', 'UNI@gmail.com', 'AV. Bustamante 2200 Hurlingham'),
(1008, 'Fusión', 'Fusión@gmail.com', 'AV. Roca 990 Hurlingham'),
(1009, 'Malvinas', 'Malvinas@gmail.com', 'Baigorria 1500 Villa del parque');

-- Se establece el primer savepoint
SAVEPOINT savepoint_1;

-- Insercion de los ultimos 4 registros 
INSERT INTO cliente (id_cliente, nombre, email, direccion) VALUES
(1010, 'Don Luis', 'donluis@gmail.com', 'AV. Balvin 4000 San Miguel'),
(1011, 'Lita', 'lita@gmail.com', 'AV. Riestra 6100 Villa Lugano'),
(1012, 'La 90', 'la90@gmail.com', 'Villegas 1500 W. C. Morris'),
(1013, '5 esquinas', '5esquinas@gmail.com', 'Cramer 1200 Belgrano');

-- Se establece el segundo savepoint
SAVEPOINT savepoint_2;

-- Comentar Rollback
-- ROLBACK TO savepoint_1;

-- Confirmar la transacción
COMMIT;




