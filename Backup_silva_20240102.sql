CREATE DATABASE  IF NOT EXISTS `inoxpro_silva` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inoxpro_silva`;

/* Backup tablas:
auditoria_productos
auditoria_ventas
categoria_producto
cliente
destino
envio
producto
stock
ventas */

-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inoxpro_silva
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria_productos`
--

DROP TABLE IF EXISTS `auditoria_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_productos` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `anterior_descripcion` varchar(40) DEFAULT NULL,
  `nueva_descripcion` varchar(40) DEFAULT NULL,
  `anterior_categoria` int DEFAULT NULL,
  `nueva_categoria` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `accion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_productos`
--

LOCK TABLES `auditoria_productos` WRITE;
/*!40000 ALTER TABLE `auditoria_productos` DISABLE KEYS */;
INSERT INTO `auditoria_productos` VALUES (1,0,'Curva p/soldar','Curva p/soldar',1,2,'2023-12-13','22:31:04','root@localhost','se modifico el producto'),(2,0,'Tee p/soldar','Tee p/soldar',1,2,'2023-12-13','22:31:04','root@localhost','se modifico el producto'),(3,0,'Chapa 1 mm','Chapa 1 mm',2,1,'2023-12-13','22:38:16','root@localhost','se modifico el producto'),(4,0,'Chapa 2 mm','Chapa 2 mm',2,1,'2023-12-13','22:38:45','root@localhost','se modifico el producto'),(5,3003,'Chapa 2 mm','Chapa 2 mm',1,2,'2023-12-14','08:45:31','root@localhost','se modifico el producto'),(6,3003,'Chapa 2 mm','Chapa 2 mm',2,1,'2023-12-14','08:45:50','root@localhost','se modifico el producto');
/*!40000 ALTER TABLE `auditoria_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_ventas`
--

DROP TABLE IF EXISTS `auditoria_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_ventas` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_cliente` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `accion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_ventas`
--

LOCK TABLES `auditoria_ventas` WRITE;
/*!40000 ALTER TABLE `auditoria_ventas` DISABLE KEYS */;
INSERT INTO `auditoria_ventas` VALUES (1,220008,1005,'2023-12-13','22:08:41','root@localhost','se creo un nuevo pedido'),(2,220009,1001,'2023-12-13','22:08:41','root@localhost','se creo un nuevo pedido'),(3,220010,1001,'2023-12-13','22:08:41','root@localhost','se creo un nuevo pedido');
/*!40000 ALTER TABLE `auditoria_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_producto` (
  `id_categoria` int NOT NULL,
  `categoria_descripcion` varchar(40) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto`
--

LOCK TABLES `categoria_producto` WRITE;
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
INSERT INTO `categoria_producto` VALUES (1,'Accesorios'),(2,'Chapas'),(3,'Tubos'),(4,'Barras');
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(180) NOT NULL,
  `email` varchar(240) DEFAULT NULL,
  `direccion` varchar(180) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1001,'Metales la avenida','metalesavenida@gmail.com','AV. Beiro 4000 Villa devoto'),(1002,'Acerox','metalesavenida@gmail.com','AV. Vergara Hurlingham'),(1003,'Metalpro','metalpro@gmail.com','Nogoya 2000 Villa del Parque'),(1004,'Hierros la nueva','lanueva@gmail.com','Balvin 3500 San Miguel'),(1005,'Union Hnos','union@gmail.com','AV. de Mayo 350 Ramos Mejia');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destino`
--

DROP TABLE IF EXISTS `destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destino` (
  `id_destino` int NOT NULL,
  `nombre` varchar(180) NOT NULL,
  `email` varchar(240) DEFAULT NULL,
  `direccion` varchar(180) NOT NULL,
  PRIMARY KEY (`id_destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destino`
--

LOCK TABLES `destino` WRITE;
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
INSERT INTO `destino` VALUES (2001,'Deposito','deposito1@gmail.com','AV. Beiro 4000 Villa devoto'),(2002,'Centro Rosario','centrorosario@gmail.com','Gascon 150 Rosario'),(2003,'CTA','cta@gmail.com','C. Lopez 2000 Villa Ballester'),(2004,'Parque industrial Pilar','pipilar@gmail.com','Balvin 3500 Pilar'),(2005,'Planta Cordoba','plantacordoba@gmail.com','AV. San Martin 350 Cordoba');
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `id_envio` int NOT NULL,
  `envio_modalidad` varchar(30) NOT NULL,
  PRIMARY KEY (`id_envio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
INSERT INTO `envio` VALUES (1,'Normal'),(2,'Express'),(3,'Express especial');
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `producto_descripcion` varchar(40) NOT NULL,
  `id_categoria` int NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `FK_PRODUCTO_CATEGORIA_PRODUCTO` (`id_categoria`),
  CONSTRAINT `FK_PRODUCTO_CATEGORIA_PRODUCTO` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_producto` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (3000,'Curva p/soldar',2,100.23),(3001,'Tee p/soldar',2,560.55),(3002,'Chapa 1 mm',1,53.56),(3003,'Chapa 2 mm',1,157.56),(3004,'Tubo 1\"',3,198.00),(3005,'Tubo 2\"',3,345.00),(3006,'Barra 10 mm redonda',4,7885.00),(3007,'Barra 10 mm cuadrada',4,435.00);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auditoria_prductos` BEFORE UPDATE ON `producto` FOR EACH ROW INSERT INTO auditoria_productos VALUES
(DEFAULT, old.id_producto, old.producto_descripcion, new.producto_descripcion, 
old.id_categoria, new.id_categoria, curdate(), curtime(), system_user(),'se modifico el producto') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_stock` int NOT NULL,
  `stock` int DEFAULT NULL,
  `sucursal` int DEFAULT NULL,
  PRIMARY KEY (`id_stock`),
  CONSTRAINT `fk_id_producto_stock` FOREIGN KEY (`id_stock`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (3000,10,1),(3001,22,2),(3002,1,1),(3003,122,2),(3004,30,1),(3005,19,1),(3006,12,2),(3007,123,2);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_listado_chapas`
--

DROP TABLE IF EXISTS `v_listado_chapas`;
/*!50001 DROP VIEW IF EXISTS `v_listado_chapas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_listado_chapas` AS SELECT 
 1 AS `id_producto`,
 1 AS `producto_descripcion`,
 1 AS `categoria_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_pedidos_envio_express`
--

DROP TABLE IF EXISTS `v_pedidos_envio_express`;
/*!50001 DROP VIEW IF EXISTS `v_pedidos_envio_express`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_pedidos_envio_express` AS SELECT 
 1 AS `id_pedido`,
 1 AS `envio_modalidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_precios_productos_sucursal_2`
--

DROP TABLE IF EXISTS `v_precios_productos_sucursal_2`;
/*!50001 DROP VIEW IF EXISTS `v_precios_productos_sucursal_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_precios_productos_sucursal_2` AS SELECT 
 1 AS `id_producto`,
 1 AS `producto_descripcion`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_resumen_de_ventas`
--

DROP TABLE IF EXISTS `v_resumen_de_ventas`;
/*!50001 DROP VIEW IF EXISTS `v_resumen_de_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_resumen_de_ventas` AS SELECT 
 1 AS `id_pedido`,
 1 AS `Cliente`,
 1 AS `Producto`,
 1 AS `Cantidad`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_stock_suc_1`
--

DROP TABLE IF EXISTS `v_stock_suc_1`;
/*!50001 DROP VIEW IF EXISTS `v_stock_suc_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_stock_suc_1` AS SELECT 
 1 AS `Codigo_de_producto`,
 1 AS `Cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_pedido` int NOT NULL,
  `fecha_pedido` date NOT NULL,
  `id_envio` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_destino` int NOT NULL,
  `id_producto` int NOT NULL,
  `producto_cantidad` int NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FK_VENTAS_ENVIO` (`id_envio`),
  KEY `FK_VENTAS_CLIENTE` (`id_cliente`),
  KEY `FK_VENTAS_DESTINO` (`id_destino`),
  KEY `FK_VENTAS_PRODUCTO` (`id_producto`),
  CONSTRAINT `FK_VENTAS_CLIENTE` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `FK_VENTAS_DESTINO` FOREIGN KEY (`id_destino`) REFERENCES `destino` (`id_destino`),
  CONSTRAINT `FK_VENTAS_ENVIO` FOREIGN KEY (`id_envio`) REFERENCES `envio` (`id_envio`),
  CONSTRAINT `FK_VENTAS_PRODUCTO` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (220001,'2023-08-08',3,1005,2002,3004,3),(220002,'2023-06-05',3,1001,2003,3002,2),(220003,'2023-08-18',1,1001,2002,3004,3),(220004,'2023-07-01',2,1002,2005,3006,4),(220005,'2023-05-08',1,1001,2001,3007,4),(220006,'2023-04-03',1,1004,2005,3000,1),(220008,'2023-08-08',3,1005,2002,3004,3),(220009,'2023-06-05',3,1001,2003,3002,2);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auditoria_ventas` AFTER INSERT ON `ventas` FOR EACH ROW INSERT INTO auditoria_ventas VALUES 
(DEFAULT, new.id_pedido, new.id_cliente, curdate(), curtime(), system_user(),'se creo un nuevo pedido') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'inoxpro_silva'
--
/*!50003 DROP FUNCTION IF EXISTS `f_calculo_monto_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_calculo_monto_pedido`(p_id_pedido INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
 DECLARE resultado DECIMAL (10,2);
   SELECT SUM(v.producto_cantidad * p.precio)
    INTO resultado
    FROM ventas AS v
    JOIN producto AS p ON v.id_producto=p.id_producto
    WHERE v.id_pedido = p_id_pedido;
 RETURN resultado; 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_precio_con_descuento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_precio_con_descuento`(precio DECIMAL(10,2), descuento INT) RETURNS decimal(10,2)
    NO SQL
BEGIN
 DECLARE resultado DECIMAL (10,2);
 SET resultado = precio *((100-descuento)/100);
 RETURN resultado; 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarVenta`(IN p_id_pedido INT)
BEGIN
    DELETE FROM VENTAS WHERE id_pedido = p_id_pedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ordenar_tabla` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ordenar_tabla`(IN tabla_orden VARCHAR(255), IN campo_ordenamiento VARCHAR(255), IN orden VARCHAR(10))
BEGIN
    SET @query = CONCAT('SELECT * FROM ', tabla_orden, ' ORDER BY ', campo_ordenamiento, ' ', orden);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_listado_chapas`
--

/*!50001 DROP VIEW IF EXISTS `v_listado_chapas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_listado_chapas` AS select `p`.`id_producto` AS `id_producto`,`p`.`producto_descripcion` AS `producto_descripcion`,`c`.`categoria_descripcion` AS `categoria_descripcion` from (`producto` `p` join `categoria_producto` `c` on((`p`.`id_categoria` = `c`.`id_categoria`))) where (`p`.`id_categoria` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pedidos_envio_express`
--

/*!50001 DROP VIEW IF EXISTS `v_pedidos_envio_express`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pedidos_envio_express` AS select `v`.`id_pedido` AS `id_pedido`,`e`.`envio_modalidad` AS `envio_modalidad` from (`ventas` `v` join `envio` `e` on((`v`.`id_envio` = `e`.`id_envio`))) where (`e`.`id_envio` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_precios_productos_sucursal_2`
--

/*!50001 DROP VIEW IF EXISTS `v_precios_productos_sucursal_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_precios_productos_sucursal_2` AS select `p`.`id_producto` AS `id_producto`,`p`.`producto_descripcion` AS `producto_descripcion`,`p`.`precio` AS `precio` from (`producto` `p` join `stock` `s` on((`p`.`id_producto` = `s`.`id_stock`))) where (`s`.`sucursal` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_resumen_de_ventas`
--

/*!50001 DROP VIEW IF EXISTS `v_resumen_de_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_resumen_de_ventas` AS select `v`.`id_pedido` AS `id_pedido`,`c`.`nombre` AS `Cliente`,`p`.`producto_descripcion` AS `Producto`,`v`.`producto_cantidad` AS `Cantidad`,`p`.`precio` AS `precio` from ((`ventas` `v` join `cliente` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) join `producto` `p` on((`v`.`id_producto` = `p`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_stock_suc_1`
--

/*!50001 DROP VIEW IF EXISTS `v_stock_suc_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_stock_suc_1` AS select `stock`.`id_stock` AS `Codigo_de_producto`,`stock`.`stock` AS `Cantidad` from `stock` where (`stock`.`sucursal` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-02 22:31:20
