-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: online
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idadd` int NOT NULL AUTO_INCREMENT,
  `street` varchar(45) NOT NULL,
  `house` int NOT NULL,
  `apartment` int NOT NULL,
  `City` varchar(45) NOT NULL,
  PRIMARY KEY (`idadd`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Лесной пер.',12,195,'г. Коломна'),(2,'Кирова ул.',5,7,'г. Тамбов'),(3,'Юбилейная ул.',19,63,'г. Ульяновск'),(4,'Интернациональная ул.',1,30,'г. Чебоксары'),(5,'роарп',4,21,'фыа');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_of_equipment`
--

DROP TABLE IF EXISTS `category_of_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_of_equipment` (
  `idce` int NOT NULL AUTO_INCREMENT,
  `NameCE` varchar(45) NOT NULL,
  `InfoCE` varchar(100) NOT NULL,
  PRIMARY KEY (`idce`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_of_equipment`
--

LOCK TABLES `category_of_equipment` WRITE;
/*!40000 ALTER TABLE `category_of_equipment` DISABLE KEYS */;
INSERT INTO `category_of_equipment` VALUES (1,'Кухня','Дя приготовления, хранения пищи, и для мытья посуды'),(2,'Уборка','Для уборки/чистки дома'),(3,'Измерительная','Для измерения времени/веса и т.д.'),(4,'Для ухода за собой','Для ухода за собой'),(5,'Для развлечения','Развлекательная техника для хорошего провождения времени');
/*!40000 ALTER TABLE `category_of_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idc` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Sname` varchar(45) NOT NULL,
  `Mname` varchar(45) DEFAULT NULL,
  `PhoneN` varchar(45) NOT NULL,
  `Mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Егор','Горбунов','Артемович','8(960) 643 83 92','komanugrage-4017@yopmail.com'),(2,'Милана','Николаева','Петровна','8(953) 435 23 52','xouboppubena-3545@yopmail.com'),(3,'Арина','Анисимова','Даниилова','8(901) 142 59 23','quoutrebrounnadda-9970@yopmail.com'),(4,'Данил','Яковлев','Максимович','8(993) 543 56 70','nubrettommeusau-6436@yopmail.com'),(5,'Марк','Котов','Владимирович','8(950) 666 43 45','xeuleuffuxefra-9107@yopmail.com');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dasd`
--

DROP TABLE IF EXISTS `dasd`;
/*!50001 DROP VIEW IF EXISTS `dasd`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dasd` AS SELECT 
 1 AS `номер`,
 1 AS `клиент`,
 1 AS `продавец`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dsadasd`
--

DROP TABLE IF EXISTS `dsadasd`;
/*!50001 DROP VIEW IF EXISTS `dsadasd`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dsadasd` AS SELECT 
 1 AS `номер`,
 1 AS `категория`,
 1 AS `модель`,
 1 AS `цена`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `Idm` int NOT NULL AUTO_INCREMENT,
  `idce` int NOT NULL,
  `Name_model` varchar(100) NOT NULL,
  `Cost` decimal(10,2) NOT NULL,
  `Costn` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Idm`),
  KEY `idce_idx` (`idce`),
  CONSTRAINT `idce` FOREIGN KEY (`idce`) REFERENCES `category_of_equipment` (`idce`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,1,'Samsung RT22HAR4DSA/WT',44400.00,33333.33),(2,1,'Gorenje NRS9181MX',100000.00,90000.00),(3,1,'Samsung RB37A52N0SA/WT',999009.00,800000.00),(4,1,'Electrolux CPE6420KX',66999.99,50000.00),(5,2,'Пылесос  NT 30/1 Tact Te L',214444.58,190000.43),(6,2,'Сушилка для ковров AB 20 Ec',21100.99,15963.00),(7,2,'Аккумуляторный стеклоочиститель WVP 10 Adv',14999.99,12423.52),(8,3,'Фитнес-браслет Xiaomi Mi Band 6 black',5999.00,4545.43),(9,3,'Весы RGOLUX ELX-SB02-C03',2000.00,1443.43),(10,4,'Игровая приставка Xbox Series S 1Tb',50000.00,43532.45),(11,4,'Игровая приставка Nintendo Switch Oled (neon)',28999.00,24525.90),(12,4,'Шлем виртуальной реальности Oculus Quest 3s 128Gb',35000.00,30411.33);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idor` int NOT NULL AUTO_INCREMENT,
  `idadd` int NOT NULL,
  `idc` int NOT NULL,
  `deldate` date NOT NULL,
  `ORprice` decimal(10,2) NOT NULL,
  `IdSeller` int NOT NULL,
  `idorl` int NOT NULL,
  PRIMARY KEY (`idor`),
  KEY `idadd_idx` (`idadd`),
  KEY `idc_idx` (`idc`),
  KEY `IdSeller_idx` (`IdSeller`),
  KEY `idorl_idx` (`idorl`),
  CONSTRAINT `idadd` FOREIGN KEY (`idadd`) REFERENCES `address` (`idadd`),
  CONSTRAINT `idc` FOREIGN KEY (`idc`) REFERENCES `client` (`idc`),
  CONSTRAINT `idorl` FOREIGN KEY (`idorl`) REFERENCES `order_list` (`idorl`),
  CONSTRAINT `IdSeller` FOREIGN KEY (`IdSeller`) REFERENCES `seller` (`IdSeller`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,1,'2025-04-25',280112.58,1,1),(2,2,2,'2025-05-01',99999.99,3,2),(3,3,3,'2025-05-11',124512.23,2,3);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_list` (
  `idorl` int NOT NULL AUTO_INCREMENT,
  `Idt` int NOT NULL,
  `Quanity` int DEFAULT NULL,
  PRIMARY KEY (`idorl`),
  KEY `idt_idx` (`Idt`),
  CONSTRAINT `idt` FOREIGN KEY (`Idt`) REFERENCES `technique` (`Idt`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` VALUES (1,1,3),(2,4,1),(3,3,1),(4,2,6),(5,5,2);
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `idPM` int NOT NULL AUTO_INCREMENT,
  `NamePM` varchar(45) NOT NULL,
  PRIMARY KEY (`idPM`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `IdSeller` int NOT NULL AUTO_INCREMENT,
  `Sname` varchar(45) NOT NULL,
  `NameP` varchar(45) NOT NULL,
  `Mname` varchar(45) DEFAULT NULL,
  `PhoneN` varchar(45) NOT NULL,
  `Mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdSeller`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Белов','Андрей','Денисович','8(923) 456 54 56','brausivunouddeu-9951@yopmail.com'),(2,'Климов','Максим','Львович','8(903) 421 57 87','zoutuddeiyeitru-6421@yopmail.com'),(3,'Гусева','Анастасия','Романова','8(845) 657 85 86','kebrafregragi-3062@yopmail.com');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technique`
--

DROP TABLE IF EXISTS `technique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technique` (
  `Idt` int NOT NULL AUTO_INCREMENT,
  `Idm` int NOT NULL,
  PRIMARY KEY (`Idt`),
  KEY `Idm_idx` (`Idm`),
  CONSTRAINT `Idm` FOREIGN KEY (`Idm`) REFERENCES `model` (`Idm`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technique`
--

LOCK TABLES `technique` WRITE;
/*!40000 ALTER TABLE `technique` DISABLE KEYS */;
INSERT INTO `technique` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12);
/*!40000 ALTER TABLE `technique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `idw` int NOT NULL AUTO_INCREMENT,
  `Nwarehouse` int NOT NULL,
  `warehouse address` varchar(45) NOT NULL,
  PRIMARY KEY (`idw`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `dasd`
--

/*!50001 DROP VIEW IF EXISTS `dasd`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dasd` AS select `order`.`idor` AS `номер`,`client`.`Name` AS `клиент`,`seller`.`NameP` AS `продавец` from ((`order` join `seller` on((`seller`.`IdSeller` = `order`.`IdSeller`))) join `client` on((`client`.`idc` = `order`.`idc`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dsadasd`
--

/*!50001 DROP VIEW IF EXISTS `dsadasd`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dsadasd` AS select `model`.`Idm` AS `номер`,`category_of_equipment`.`NameCE` AS `категория`,`model`.`Name_model` AS `модель`,`model`.`Cost` AS `цена` from (`model` join `category_of_equipment` on((`model`.`idce` = `category_of_equipment`.`idce`))) */;
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

-- Dump completed on 2025-06-26 14:17:04
