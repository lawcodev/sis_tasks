-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_task
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `percentage_plan` decimal(8,2) DEFAULT NULL,
  `state` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id_fk_idx` (`type_id`),
  KEY `user_id_fk_idx` (`user_id`),
  CONSTRAINT `type_id_fk` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'Cuadre de balance sectorial día 15 (Urgente)','2020-10-15 00:00:00','2020-10-15 00:00:00',1,100.00,1,1),(3,'Análisis del proceso de cierre diario contable','2020-10-26 00:00:00','2020-10-28 00:00:00',4,60.00,1,1),(5,'Implementación de un store para el reporte de no domiciliados 8.2.','2020-10-08 00:00:00','2020-10-08 00:00:00',3,69.00,1,1),(6,'Implementación del Anexo 15A','2020-10-01 00:00:00','2020-10-02 00:00:00',1,100.00,1,1),(7,'Análisis de los siguientes puntos para el Anexo 15 A, 15B Y 15 C','2020-10-21 00:00:00','2020-10-21 00:00:00',1,100.00,1,1),(8,'Avanzar modulo de login','2020-09-01 00:00:00','2020-09-01 00:00:00',3,50.00,1,1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `state` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Terminado',1),(2,'Pendiente',1),(3,'Retrazado',1),(4,'Proceso',1);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `names` varchar(100) DEFAULT NULL,
  `last_names` varchar(100) DEFAULT NULL,
  `imagen` varchar(500) DEFAULT NULL,
  `state` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Ederd Jair','Cruzado Sifuentes',NULL,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bd_task'
--
/*!50003 DROP PROCEDURE IF EXISTS `stp_getAllTasks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lawcodev`@`%` PROCEDURE `stp_getAllTasks`()
BEGIN
	SELECT 
		t.id,
        t.name,
        DATE_FORMAT(t.start_date, '%d/%m/%Y') AS start_date,
        DATE_FORMAT(t.finish_date, '%d/%m/%Y') AS finish_date,
        t.percentage_plan,
        t.state,
        ty.id,
        ty.name AS Type,
        CASE 
			WHEN ty.id <> 1 AND ty.id <> 2 AND ty.id <> 4
				THEN DATEDIFF(NOW(), t.finish_date) 
                ELSE 0
		END AS diff_days,

        CASE 
			WHEN ty.id = 2 
				THEN 1
                ELSE 0
		END AS is_pending,
        u.id as user_id,
        u.names,
        u.last_names
    FROM task t 
    JOIN type ty ON ty.id = t.type_id
    JOIN user u ON u.id = t.user_id
    ORDER BY t.finish_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stp_getByFinishDateTask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lawcodev`@`%` PROCEDURE `stp_getByFinishDateTask`(IN month_value VARCHAR(10))
BEGIN
	SELECT 
		t.id,
        t.name,
        DATE_FORMAT(t.start_date, '%d/%m/%Y') AS start_date,
        DATE_FORMAT(t.finish_date, '%d/%m/%Y') AS finish_date,
        t.percentage_plan,
        t.state,
        ty.id,
        ty.name AS Type,
        CASE 
			WHEN ty.id <> 1 AND ty.id <> 2 AND ty.id <> 4
				THEN DATEDIFF(NOW(), t.finish_date) 
                ELSE 0
		END AS diff_days,

        CASE 
			WHEN ty.id = 2 
				THEN 1
                ELSE 0
		END AS is_pending,
        u.id as user_id,
        u.names,
        u.last_names
    FROM task t 
    JOIN type ty ON ty.id = t.type_id
    JOIN user u ON u.id = t.user_id
    WHERE t.finish_date LIKE month_value
    ORDER BY t.finish_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-28  1:59:06
