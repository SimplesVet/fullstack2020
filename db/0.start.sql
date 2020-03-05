CREATE DATABASE  IF NOT EXISTS `simplesvetdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `simplesvetdb`;

CREATE USER IF NOT EXISTS 'simplesvetuser'@'%' IDENTIFIED BY 's1mpl3sv3t';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, CREATE, DROP, ALTER, INDEX, TRIGGER, REPLICATION CLIENT, REPLICATION SLAVE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EXECUTE, RELOAD, SHUTDOWN, FILE, PROCESS, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, SHOW DATABASES, CREATE USER, GRANT OPTION, EVENT, CREATE TABLESPACE ON *.* TO 'simplesvetuser'@'%';

GRANT DROP, INSERT, REFERENCES, ALTER ROUTINE, INDEX, ALTER, LOCK TABLES, TRIGGER, SELECT, DELETE, UPDATE, CREATE ROUTINE, CREATE VIEW, EVENT, GRANT OPTION, SHOW VIEW, CREATE TEMPORARY TABLES, EXECUTE, CREATE ON `simplesvetdb`.* TO 'simplesvetuser'@'%';

FLUSH PRIVILEGES;

-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: simplesvetdb
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `inclusao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Salvador','(71) 99999-5555','2020-03-05 18:40:33'),(2,'Thalita','(71) 99999-6666','2020-03-05 18:40:33'),(3,'Mateus','(71) 99999-7777','2020-03-05 19:11:39'),(4,'George','(71) 99999-8888','2020-03-05 19:20:24');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_clientes`
--

DROP TABLE IF EXISTS `vw_clientes`;
/*!50001 DROP VIEW IF EXISTS `vw_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clientes` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `telefone`,
 1 AS `inclusao`,
 1 AS `inclusao_formatada`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'simplesvetdb'
--

--
-- Dumping routines for database 'simplesvetdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_clientes_del` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`simplesvetuser`@`%` PROCEDURE `sp_clientes_del`(IN p_id int, INOUT p_status tinyint(1), INOUT p_msg text)
    COMMENT 'Procedure de Delete'
BEGIN

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_status = FALSE;
  SET p_msg = '';

  -- VALIDAÇÕES
  IF p_id IS NULL THEN
    SET p_msg = concat(p_msg, 'ID não informada.<br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    DELETE FROM clientes
    WHERE id = p_id;

    SET p_status = TRUE;
    SET p_msg = 'O registro foi removido com sucesso';

    COMMIT;

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_clientes_ins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`simplesvetuser`@`%` PROCEDURE `sp_clientes_ins`(IN p_nome varchar(100), IN p_telefone varchar(15), INOUT p_status tinyint(1), INOUT p_msg text)
    COMMENT 'Procedure de Insert'
BEGIN

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_status = FALSE;
  SET p_msg = '';

  -- VALIDAÇÕES
  IF p_nome IS NULL THEN
    SET p_msg = concat(p_msg, 'Nome não informado.<br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    INSERT INTO clientes (nome, telefone)
    VALUES (p_nome, p_telefone);

    SET p_status = TRUE;
    SET p_msg = 'O registro foi inserido com sucesso';

    COMMIT;

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_clientes_upd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`simplesvetuser`@`%` PROCEDURE `sp_clientes_upd`(IN p_id int, IN p_nome varchar(100), IN p_telefone varchar(15), INOUT p_status tinyint(1), INOUT p_msg text)
    COMMENT 'Procedure de Update'
BEGIN

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_status = FALSE;
  SET p_msg = '';

  -- VALIDAÇÕES
  IF p_id IS NULL THEN
    SET p_msg = concat(p_msg, 'ID não informada.<br />');
  END IF;
  IF p_nome IS NULL THEN
    SET p_msg = concat(p_msg, 'Nome não informado.<br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    UPDATE clientes
    SET nome = p_nome,
        telefone = p_telefone
    WHERE id = p_id;

    SET p_status = TRUE;
    SET p_msg = 'O registro foi alterado com sucesso';

    COMMIT;

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vw_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`simplesvetuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clientes` AS select `clientes`.`id` AS `id`,`clientes`.`nome` AS `nome`,`clientes`.`telefone` AS `telefone`,`clientes`.`inclusao` AS `inclusao`,date_format(`clientes`.`inclusao`,'%d/%m/%Y %H:%i:%s') AS `inclusao_formatada` from `clientes` */;
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

-- Dump completed on 2020-03-05 16:21:14
