USE inoxpro_silva;

-- SP para ordenar una tabla
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