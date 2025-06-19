-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Temporary view structure for view `12.1`
--

DROP TABLE IF EXISTS `12.1`;
/*!50001 DROP VIEW IF EXISTS `12.1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `12.1` AS SELECT 
 1 AS `Фамилия_клиента`,
 1 AS `Имя_клиента`,
 1 AS `Имя_курьера`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `12.2`
--

DROP TABLE IF EXISTS `12.2`;
/*!50001 DROP VIEW IF EXISTS `12.2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `12.2` AS SELECT 
 1 AS `номер`,
 1 AS `продукт`,
 1 AS `категория`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adress` (
  `id_Ad` int NOT NULL AUTO_INCREMENT,
  `id_town` int NOT NULL,
  `street` varchar(45) NOT NULL,
  `house` varchar(45) NOT NULL,
  `float` int DEFAULT NULL,
  PRIMARY KEY (`id_Ad`),
  KEY `Id_town_idx` (`id_town`),
  CONSTRAINT `Id_town` FOREIGN KEY (`id_town`) REFERENCES `town` (`id_town`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` VALUES (1,1,'Ленина','27',14),(2,1,'Матросова','34',2),(3,2,'Сибирская','14',NULL);
/*!40000 ALTER TABLE `adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer` (
  `id_Buyer` int NOT NULL AUTO_INCREMENT,
  `Bsurname` varchar(45) NOT NULL,
  `Bname` varchar(45) NOT NULL,
  `Bmiddle_name` varchar(45) DEFAULT NULL,
  `Bphone_number` varchar(45) NOT NULL,
  `Be_mail` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Buyer`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (1,'Иванов','Никита','Сергеевич','82221231111','Ivan@mail.ru'),(2,'Костиков','Константин','','89647411122','Lord@gmail.com'),(3,'Арбуз','Алина','Степановна','89245246699','Water@yandex.ru');
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier`
--

DROP TABLE IF EXISTS `courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier` (
  `id_Courier` int NOT NULL AUTO_INCREMENT,
  `Csurname` varchar(45) NOT NULL,
  `Cname` varchar(45) NOT NULL,
  `Cmiddle_name` varchar(45) DEFAULT NULL,
  `Cphone_number` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Courier`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier`
--

LOCK TABLES `courier` WRITE;
/*!40000 ALTER TABLE `courier` DISABLE KEYS */;
INSERT INTO `courier` VALUES (1,'Абрамов','Артём','Артёмович','89968611232'),(2,'Артёмов','Фёдор',NULL,'87551200223'),(3,'Иванко','Алиса','Матвеевна','89241002333');
/*!40000 ALTER TABLE `courier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_Product` int NOT NULL AUTO_INCREMENT,
  `Pname` varchar(45) NOT NULL,
  `Id_product_categories` int NOT NULL,
  `Pprice` decimal(8,2) NOT NULL,
  `unit_of_measurement` varchar(45) NOT NULL,
  `Pprice_1` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_Product`),
  KEY `Id_категория_idx` (`Id_product_categories`),
  CONSTRAINT `Id_категория` FOREIGN KEY (`Id_product_categories`) REFERENCES `product_categories` (`id_Product_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Помидоры тепличные',2,277.75,'кг',220.00),(2,'сосиска в тесте',3,55.55,'шт',45.00),(3,'булочка с повидлом ',3,38.89,'шт',30.00),(4,'морковь немытая',2,44.44,'кг',30.00),(5,'хлеб',3,33.89,'шт',27.00),(6,'колбаса',4,38.89,'кг',30.00),(7,'булочка с сахаром',3,33.33,'шт',25.00);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id_Product_categories` int NOT NULL AUTO_INCREMENT,
  `PCname` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Product_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'фрукты'),(2,'овощи'),(3,'выпечка'),(4,'колбасное изделие');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_list`
--

DROP TABLE IF EXISTS `product_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_list` (
  `id_product_list` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `PLquanity` int NOT NULL,
  PRIMARY KEY (`id_product_list`),
  KEY `ID заказа_idx` (`id_order`),
  KEY `продукт_idx` (`id_product`),
  CONSTRAINT `ID заказа` FOREIGN KEY (`id_order`) REFERENCES `заказ` (`id_order`),
  CONSTRAINT `продукт` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_Product`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_list`
--

LOCK TABLES `product_list` WRITE;
/*!40000 ALTER TABLE `product_list` DISABLE KEYS */;
INSERT INTO `product_list` VALUES (1,1,1,1),(2,1,3,2),(3,2,2,2),(4,2,4,1),(5,3,1,1),(6,3,2,1);
/*!40000 ALTER TABLE `product_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `town`
--

DROP TABLE IF EXISTS `town`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `town` (
  `id_town` int NOT NULL AUTO_INCREMENT,
  `Tname` varchar(45) NOT NULL,
  PRIMARY KEY (`id_town`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `town`
--

LOCK TABLES `town` WRITE;
/*!40000 ALTER TABLE `town` DISABLE KEYS */;
INSERT INTO `town` VALUES (1,'Красноярск'),(2,'Абакан'),(3,'Тайшет');
/*!40000 ALTER TABLE `town` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `заказ`
--

DROP TABLE IF EXISTS `заказ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заказ` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `id_Buyer` int NOT NULL,
  `id_Courier` int NOT NULL,
  `Odate` datetime NOT NULL,
  `Ototal` int NOT NULL,
  `id_Ad` int NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `покупатель_idx` (`id_Buyer`),
  KEY `курьер_idx` (`id_Courier`),
  KEY `адрес_idx` (`id_Ad`),
  CONSTRAINT `курьер` FOREIGN KEY (`id_Courier`) REFERENCES `courier` (`id_Courier`),
  CONSTRAINT `покупатель` FOREIGN KEY (`id_Buyer`) REFERENCES `buyer` (`id_Buyer`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=cp866;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заказ`
--

LOCK TABLES `заказ` WRITE;
/*!40000 ALTER TABLE `заказ` DISABLE KEYS */;
INSERT INTO `заказ` VALUES (1,1,3,'2014-03-25 00:00:00',320,0),(2,1,2,'2010-03-25 00:00:00',140,0),(3,2,3,'2001-03-25 00:00:00',300,0),(4,1,1,'2025-04-22 00:00:00',900,0);
/*!40000 ALTER TABLE `заказ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `12.1`
--

/*!50001 DROP VIEW IF EXISTS `12.1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `12.1` AS select `buyer`.`Bsurname` AS `Фамилия_клиента`,`buyer`.`Bname` AS `Имя_клиента`,`courier`.`Cname` AS `Имя_курьера` from ((`заказ` join `buyer` on((`заказ`.`id_Buyer` = `buyer`.`id_Buyer`))) join `courier` on((`заказ`.`id_Courier` = `courier`.`id_Courier`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `12.2`
--

/*!50001 DROP VIEW IF EXISTS `12.2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `12.2` AS select `product`.`id_Product` AS `номер`,`product`.`Pname` AS `продукт`,`product_categories`.`PCname` AS `категория` from (`product` join `product_categories` on((`product`.`Id_product_categories` = `product_categories`.`id_Product_categories`))) */;
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

-- Dump completed on 2025-06-19 14:13:53
