-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: practicheskaya5
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
-- Table structure for table `заявка на ремонт`
--

DROP TABLE IF EXISTS `заявка на ремонт`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заявка на ремонт` (
  `ID заявки` int NOT NULL AUTO_INCREMENT,
  `Дата` date NOT NULL,
  `Стоимость` decimal(45,0) NOT NULL,
  `ID_клиента` int NOT NULL,
  PRIMARY KEY (`ID заявки`),
  KEY `ID клиента_idx` (`ID_клиента`),
  CONSTRAINT `ID клиента` FOREIGN KEY (`ID_клиента`) REFERENCES `клиент` (`ID_клиента`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заявка на ремонт`
--

LOCK TABLES `заявка на ремонт` WRITE;
/*!40000 ALTER TABLE `заявка на ремонт` DISABLE KEYS */;
INSERT INTO `заявка на ремонт` VALUES (1,'2025-03-08',1000,1),(2,'2025-02-04',300,3),(3,'2025-02-16',800,2),(4,'2025-03-08',1000,1),(5,'2025-04-24',800,3),(6,'2025-06-19',1000,4);
/*!40000 ALTER TABLE `заявка на ремонт` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `клиент`
--

DROP TABLE IF EXISTS `клиент`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `клиент` (
  `ID_клиента` int NOT NULL AUTO_INCREMENT,
  `Фамилия` varchar(30) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Имя` varchar(30) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Отчество` varchar(30) CHARACTER SET cp1251 COLLATE cp1251_bin DEFAULT NULL,
  `Телефон` varchar(30) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Почта` varchar(45) CHARACTER SET cp1251 COLLATE cp1251_bin DEFAULT NULL,
  PRIMARY KEY (`ID_клиента`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `клиент`
--

LOCK TABLES `клиент` WRITE;
/*!40000 ALTER TABLE `клиент` DISABLE KEYS */;
INSERT INTO `клиент` VALUES (1,'Артуров','Фёдор','Михайлович','89232754825','Fedor@mail.ru'),(2,'Черепахов','Олег','Максимович','89620305432','Turtle@gmail.com'),(3,'Григорьева','Алиса','Дмитриевна','89588087411','Alis@mail.ru'),(4,'Петров','Василий','Сергеевич','89233556740','Petr@gmail.com');
/*!40000 ALTER TABLE `клиент` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `представление`
--

DROP TABLE IF EXISTS `представление`;
/*!50001 DROP VIEW IF EXISTS `представление`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `представление` AS SELECT 
 1 AS `номер_клиента`,
 1 AS `Фамилия`,
 1 AS `Имя`,
 1 AS `Отчество`,
 1 AS `Телефон`,
 1 AS `Дата`,
 1 AS `Стоимость`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `сервисные операции`
--

DROP TABLE IF EXISTS `сервисные операции`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `сервисные операции` (
  `ID сервисной операции` int NOT NULL AUTO_INCREMENT,
  `Название` varchar(45) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Стоимость` decimal(8,2) NOT NULL,
  `Стоимость со скидкой` decimal(8,2) NOT NULL,
  PRIMARY KEY (`ID сервисной операции`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `сервисные операции`
--

LOCK TABLES `сервисные операции` WRITE;
/*!40000 ALTER TABLE `сервисные операции` DISABLE KEYS */;
INSERT INTO `сервисные операции` VALUES (1,'ех.диагностика ',0.00,450.00),(2,'Переустановка ОС',0.00,400.00),(3,'Консультация по апгрейду ',0.00,270.00);
/*!40000 ALTER TABLE `сервисные операции` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `список заявок`
--

DROP TABLE IF EXISTS `список заявок`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `список заявок` (
  `ID списка заявок` int NOT NULL AUTO_INCREMENT,
  `ID_клиента` int NOT NULL,
  `ID заявки` int NOT NULL,
  `ID сервсиной операции` int NOT NULL,
  `ID устройства` int NOT NULL,
  `ID технического специалиста` int NOT NULL,
  PRIMARY KEY (`ID списка заявок`),
  KEY `ID клиента_idx` (`ID_клиента`),
  KEY `ID заявки_idx` (`ID заявки`),
  KEY `ID сервисной операции_idx` (`ID сервсиной операции`),
  KEY `ID устройства_idx` (`ID устройства`),
  KEY `ID технического специалиста_idx` (`ID технического специалиста`),
  CONSTRAINT `ID заявки1` FOREIGN KEY (`ID заявки`) REFERENCES `заявка на ремонт` (`ID заявки`),
  CONSTRAINT `ID клиента1` FOREIGN KEY (`ID_клиента`) REFERENCES `клиент` (`ID_клиента`),
  CONSTRAINT `ID сервисной операции1` FOREIGN KEY (`ID сервсиной операции`) REFERENCES `сервисные операции` (`ID сервисной операции`),
  CONSTRAINT `ID технического специалиста1` FOREIGN KEY (`ID технического специалиста`) REFERENCES `технический специалист` (`ID технического специалиста`),
  CONSTRAINT `ID устройства1` FOREIGN KEY (`ID устройства`) REFERENCES `устройство` (`ID Устройства`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `список заявок`
--

LOCK TABLES `список заявок` WRITE;
/*!40000 ALTER TABLE `список заявок` DISABLE KEYS */;
INSERT INTO `список заявок` VALUES (1,1,1,1,1,1),(2,1,1,2,1,1),(3,3,2,3,1,2),(4,2,3,2,1,3),(5,2,3,3,1,3),(6,4,6,1,1,1);
/*!40000 ALTER TABLE `список заявок` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `технический специалист`
--

DROP TABLE IF EXISTS `технический специалист`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `технический специалист` (
  `ID технического специалиста` int NOT NULL AUTO_INCREMENT,
  `Фамилия` varchar(30) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Имя` varchar(30) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Отчество` varchar(30) CHARACTER SET cp1251 COLLATE cp1251_bin DEFAULT NULL,
  `Телефон` varchar(30) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Почта` varchar(30) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  PRIMARY KEY (`ID технического специалиста`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `технический специалист`
--

LOCK TABLES `технический специалист` WRITE;
/*!40000 ALTER TABLE `технический специалист` DISABLE KEYS */;
INSERT INTO `технический специалист` VALUES (1,'Иванов','Константин','Сергеевич','89620300333','Ivanov@mail.ru'),(2,'Лесков','Кирилл','Леонидович','89232867845','forest@yandex.ru'),(3,'Сотников','Максим',NULL,'89568312390','Sota@mail.ru');
/*!40000 ALTER TABLE `технический специалист` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `устройство`
--

DROP TABLE IF EXISTS `устройство`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `устройство` (
  `ID Устройства` int NOT NULL AUTO_INCREMENT,
  `Тип устройства` varchar(30) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  PRIMARY KEY (`ID Устройства`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `устройство`
--

LOCK TABLES `устройство` WRITE;
/*!40000 ALTER TABLE `устройство` DISABLE KEYS */;
INSERT INTO `устройство` VALUES (1,'PC'),(2,'Телефон'),(3,'Ноутбук');
/*!40000 ALTER TABLE `устройство` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `представление`
--

/*!50001 DROP VIEW IF EXISTS `представление`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `представление` AS select `клиент`.`ID_клиента` AS `номер_клиента`,`клиент`.`Фамилия` AS `Фамилия`,`клиент`.`Имя` AS `Имя`,`клиент`.`Отчество` AS `Отчество`,`клиент`.`Телефон` AS `Телефон`,`заявка на ремонт`.`Дата` AS `Дата`,`заявка на ремонт`.`Стоимость` AS `Стоимость` from (`клиент` join `заявка на ремонт` on((`клиент`.`ID_клиента` = `заявка на ремонт`.`ID_клиента`))) */;
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

-- Dump completed on 2025-06-19 15:35:42
