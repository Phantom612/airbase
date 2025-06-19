-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: airbase
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
-- Table structure for table `aircompany`
--

DROP TABLE IF EXISTS `aircompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircompany` (
  `IDA` int NOT NULL AUTO_INCREMENT,
  `NameA` varchar(45) COLLATE cp1251_bin NOT NULL,
  PRIMARY KEY (`IDA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircompany`
--

LOCK TABLES `aircompany` WRITE;
/*!40000 ALTER TABLE `aircompany` DISABLE KEYS */;
INSERT INTO `aircompany` VALUES (1,'Аэрофлот'),(2,'Hainan Airlines'),(3,'Emirates');
/*!40000 ALTER TABLE `aircompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `IDAR` int NOT NULL AUTO_INCREMENT,
  `IDC` int NOT NULL,
  `NameAR` varchar(45) DEFAULT NULL,
  `Address` varchar(45) NOT NULL,
  PRIMARY KEY (`IDAR`),
  UNIQUE KEY `IDAR` (`IDAR`),
  KEY `_idx` (`IDC`),
  CONSTRAINT `IDC` FOREIGN KEY (`IDC`) REFERENCES `city` (`IDC`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,1,'Пекин Дасин','Район Дасин, округ Ланфан'),(2,2,'Домодедово','Домодедовский район'),(3,4,'Пулково','Пулковское Ш., д.41, лит.3А'),(4,3,'Кневичи','Ул. Владимира Сай-беля,41'),(5,5,'Шарль-де-Голль','Руасси-ан-Франс');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baggage`
--

DROP TABLE IF EXISTS `baggage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baggage` (
  `IDB` int NOT NULL AUTO_INCREMENT,
  `WeiB` decimal(5,2) DEFAULT NULL,
  `BCost` decimal(7,2) NOT NULL,
  PRIMARY KEY (`IDB`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baggage`
--

LOCK TABLES `baggage` WRITE;
/*!40000 ALTER TABLE `baggage` DISABLE KEYS */;
INSERT INTO `baggage` VALUES (1,72.00,9850.00),(2,43.00,3900.00),(3,82.00,15000.00);
/*!40000 ALTER TABLE `baggage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `IDC` int NOT NULL AUTO_INCREMENT,
  `IDCO` int NOT NULL,
  `NameC` varchar(45) COLLATE cp1251_bin NOT NULL,
  PRIMARY KEY (`IDC`),
  KEY `IDCO_idx` (`IDCO`),
  CONSTRAINT `IDCO` FOREIGN KEY (`IDCO`) REFERENCES `country` (`IDCO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,1,'Пекин'),(2,2,'Москва'),(3,2,'Владивосток'),(4,2,'Санкт-Петербург'),(5,3,'Париж');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `IDCO` int NOT NULL AUTO_INCREMENT,
  `NameCO` varchar(45) COLLATE cp1251_bin NOT NULL,
  PRIMARY KEY (`IDCO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Китай'),(2,'Россия'),(3,'Франция');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `IDR` int NOT NULL AUTO_INCREMENT,
  `TDVL` datetime NOT NULL,
  `TDPR` datetime NOT NULL,
  `ARVL` int NOT NULL,
  `ARPR` int NOT NULL,
  `IDA` int NOT NULL,
  `IDAP` int NOT NULL,
  PRIMARY KEY (`IDR`),
  UNIQUE KEY `ARVL_UNIQUE` (`ARVL`),
  UNIQUE KEY `ARPR_UNIQUE` (`ARPR`),
  KEY `IDAP_idx` (`IDAP`),
  KEY `IDA_idx` (`IDA`),
  KEY `AR_idx1` (`ARPR`,`ARVL`),
  KEY `IDAR_Unique_idx` (`ARVL`),
  CONSTRAINT `IDA` FOREIGN KEY (`IDA`) REFERENCES `aircompany` (`IDA`),
  CONSTRAINT `IDAP` FOREIGN KEY (`IDAP`) REFERENCES `аirplane` (`IDAP`),
  CONSTRAINT `IDAR_Unique` FOREIGN KEY (`ARVL`) REFERENCES `airport` (`IDAR`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'2025-01-28 18:10:00','2025-01-29 09:45:00',2,3,1,2),(2,'2025-01-30 14:45:00','2025-01-31 00:10:00',1,4,2,1),(3,'2025-04-20 16:50:00','2025-04-21 04:05:00',3,5,3,3);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `IDM` int NOT NULL AUTO_INCREMENT,
  `NameM` varchar(45) NOT NULL,
  `Len` decimal(8,2) NOT NULL,
  PRIMARY KEY (`IDM`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,'Boeing 737-800',5400.00),(2,'Sukhoi Superjet 100-95',2950.00),(3,'Airbus A380-800',15400.00);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `IDP` int NOT NULL AUTO_INCREMENT,
  `Sname` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Mname` varchar(45) NOT NULL,
  `Passdata` varchar(45) NOT NULL,
  `PhoneN` varchar(45) NOT NULL,
  `Mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDP`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Яковлев ','Даниил','Максимович','5236 850663','79232570364','DanMax@yandex.ru'),(2,'Пономарев ','Марк','Александрович','2351 504298','79630321258','Mark-Pon@gmail.com'),(3,'Сидоров','Роман','Дмитриевич','8639 331372','75719860386',' Sid2310@gmail.com'),(4,'Иванов','Иван','Иванович','0401 010101','56598595959',NULL);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `IDSl` int NOT NULL AUTO_INCREMENT,
  `DtS` date NOT NULL,
  `Cost` decimal(9,2) NOT NULL,
  PRIMARY KEY (`IDSl`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'2025-08-24',140537.00),(2,'2025-08-22',20227.00),(3,'2025-04-20',1085000.00),(4,'2025-04-22',100000.00),(5,'2025-04-23',200000.00);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `IDtk` int NOT NULL AUTO_INCREMENT,
  `IDR` int NOT NULL,
  `IDP` int NOT NULL,
  `CTicket` varchar(45) NOT NULL,
  `nLoc` int NOT NULL,
  `Tcost` decimal(10,2) NOT NULL,
  `TcostSK` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IDtk`),
  KEY `IDR_idx` (`IDR`),
  KEY `IDP_idx` (`IDP`),
  CONSTRAINT `IDP` FOREIGN KEY (`IDP`) REFERENCES `passenger` (`IDP`),
  CONSTRAINT `IDR` FOREIGN KEY (`IDR`) REFERENCES `flight` (`IDR`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,2,1,'Бизнес',10,165690.98,110684.00),(2,1,2,'Комфорт',36,20738.63,12000.00),(3,3,3,'Первый класс',44,1356626.25,1000000.00),(4,2,3,'Комфорт',22,12678.75,9000.00),(5,2,1,'Первый класс',43,1635558.75,1200000.00);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket list`
--

DROP TABLE IF EXISTS `ticket list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket list` (
  `IDtkN` int NOT NULL AUTO_INCREMENT,
  `IDtk` int NOT NULL,
  `IDB` int NOT NULL,
  `IDSL` int NOT NULL,
  PRIMARY KEY (`IDtkN`),
  KEY `IDB_idx` (`IDB`),
  KEY `IDSL_idx` (`IDSL`),
  KEY `IDTK_idx` (`IDtk`),
  CONSTRAINT `IDB` FOREIGN KEY (`IDB`) REFERENCES `baggage` (`IDB`),
  CONSTRAINT `IDSL` FOREIGN KEY (`IDSL`) REFERENCES `sale` (`IDSl`),
  CONSTRAINT `IDTK` FOREIGN KEY (`IDtk`) REFERENCES `ticket` (`IDtk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket list`
--

LOCK TABLES `ticket list` WRITE;
/*!40000 ALTER TABLE `ticket list` DISABLE KEYS */;
INSERT INTO `ticket list` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3);
/*!40000 ALTER TABLE `ticket list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `аirplane`
--

DROP TABLE IF EXISTS `аirplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `аirplane` (
  `IDAP` int NOT NULL AUTO_INCREMENT,
  `IDM` int NOT NULL,
  `PlaceN` int NOT NULL,
  PRIMARY KEY (`IDAP`),
  KEY `IDM_idx` (`IDM`),
  CONSTRAINT `IDM` FOREIGN KEY (`IDM`) REFERENCES `model` (`IDM`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `аirplane`
--

LOCK TABLES `аirplane` WRITE;
/*!40000 ALTER TABLE `аirplane` DISABLE KEYS */;
INSERT INTO `аirplane` VALUES (1,1,186),(2,2,87),(3,3,555);
/*!40000 ALTER TABLE `аirplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `информация о рейсе`
--

DROP TABLE IF EXISTS `информация о рейсе`;
/*!50001 DROP VIEW IF EXISTS `информация о рейсе`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `информация о рейсе` AS SELECT 
 1 AS `Номер_билета`,
 1 AS `Фамилия`,
 1 AS `Имя`,
 1 AS `Отчество`,
 1 AS `Паспорт`,
 1 AS `Класс`,
 1 AS `Место`,
 1 AS `Вылет`,
 1 AS `Прилет`,
 1 AS `Стоимость`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `информация о самолете`
--

DROP TABLE IF EXISTS `информация о самолете`;
/*!50001 DROP VIEW IF EXISTS `информация о самолете`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `информация о самолете` AS SELECT 
 1 AS `Номер`,
 1 AS `Модель`,
 1 AS `Дальность`,
 1 AS `количество_мест`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `информация о рейсе`
--

/*!50001 DROP VIEW IF EXISTS `информация о рейсе`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `информация о рейсе` AS select `ticket`.`IDtk` AS `Номер_билета`,`passenger`.`Sname` AS `Фамилия`,`passenger`.`Name` AS `Имя`,`passenger`.`Mname` AS `Отчество`,`passenger`.`Passdata` AS `Паспорт`,`ticket`.`CTicket` AS `Класс`,`ticket`.`nLoc` AS `Место`,`flight`.`TDVL` AS `Вылет`,`flight`.`TDPR` AS `Прилет`,`ticket`.`Tcost` AS `Стоимость` from ((`ticket` join `passenger` on((`ticket`.`IDP` = `passenger`.`IDP`))) join `flight` on((`ticket`.`IDR` = `flight`.`IDR`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `информация о самолете`
--

/*!50001 DROP VIEW IF EXISTS `информация о самолете`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `информация о самолете` AS select `model`.`IDM` AS `Номер`,`model`.`NameM` AS `Модель`,`model`.`Len` AS `Дальность`,`аirplane`.`PlaceN` AS `количество_мест` from (`model` join `аirplane` on((`model`.`IDM` = `аirplane`.`IDM`))) */;
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

-- Dump completed on 2025-06-19  9:30:13
