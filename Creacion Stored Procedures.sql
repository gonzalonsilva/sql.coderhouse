USE inoxpro_silva;

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


