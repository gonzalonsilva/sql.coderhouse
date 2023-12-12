USE inoxpro_silva;

-- Calculo de precio con descuento
DELIMITER //
CREATE FUNCTION f_precio_con_descuento (precio DECIMAL(10,2), descuento INT)
 RETURNS DECIMAL (10,2)
 NO SQL
 BEGIN
 DECLARE resultado DECIMAL (10,2);
 SET resultado = precio *((100-descuento)/100);
 RETURN resultado; 
 END
//
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
 END 
//
DELIMITER ;

