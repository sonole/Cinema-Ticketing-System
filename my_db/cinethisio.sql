-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: cinethisio
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `bID` int unsigned NOT NULL AUTO_INCREMENT,
  `uID` int DEFAULT NULL,
  `sID` int DEFAULT NULL,
  `spots` int DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,2,1,2),(2,4,2,4),(3,4,2,4);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatrooms`
--

DROP TABLE IF EXISTS `chatrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatrooms` (
  `chatID` int unsigned DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `sysadmin` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatrooms`
--

LOCK TABLES `chatrooms` WRITE;
/*!40000 ALTER TABLE `chatrooms` DISABLE KEYS */;
INSERT INTO `chatrooms` VALUES (1,'U','nick','xristos','kalispera sas','2021-08-22 01:47:24'),(1,'U','nick','xristos','exw mia aporia','2021-08-22 02:26:55'),(3,'U','nick','alex','hello alex!','2021-08-22 02:32:09'),(3,'A','nick','alex','pes mou nick','2021-08-22 02:32:41'),(3,'U','nick','alex','ola kala','2021-08-23 13:06:18'),(3,'A','nick','alex','kali sinexeia','2021-08-23 13:06:42'),(7,'U','mixalis','alex','Hello mr Alexandros','2021-08-25 20:53:39'),(7,'U','mixalis','alex','eiste edw','2021-08-25 20:55:49'),(7,'A','mixalis','alex','Pos mporo na sas voithiso','2021-08-25 20:58:47'),(10,'U','mixalis','xristos','kalispera xristo','2021-08-29 11:47:36');
/*!40000 ALTER TABLE `chatrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `username` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES ('alex','2021-08-18 23:05:57'),('alex','2021-08-18 23:39:18'),('alex','2021-08-19 00:12:06'),('alex','2021-08-19 00:16:26'),('nick','2021-08-20 12:02:51'),('alex','2021-08-20 12:03:10'),('nick','2021-08-20 14:29:51'),('nick','2021-08-20 14:36:44'),('nick','2021-08-20 15:05:13'),('nick','2021-08-20 17:34:55'),('nick','2021-08-20 17:41:05'),('nick','2021-08-20 18:42:03'),('nick','2021-08-21 18:10:34'),('alex','2021-08-21 21:56:34'),('alex','2021-08-21 21:59:10'),('alex','2021-08-21 22:00:48'),('alex','2021-08-21 23:40:37'),('alex','2021-08-22 00:23:45'),('alex','2021-08-22 01:33:30'),('nick','2021-08-22 01:36:53'),('alex','2021-08-22 02:29:30'),('alex','2021-08-23 12:43:19'),('alex','2021-08-23 12:50:42'),('nick','2021-08-23 13:05:59'),('nick','2021-08-23 14:09:21'),('nick','2021-08-23 14:14:02'),('nick','2021-08-23 14:15:04'),('alex','2021-08-23 14:19:03'),('alex','2021-08-23 15:53:05'),('alex','2021-08-23 17:15:34'),('alex','2021-08-24 10:45:48'),('alex','2021-08-24 13:17:55'),('alex','2021-08-24 15:17:49'),('nick','2021-08-24 16:22:25'),('alex','2021-08-24 17:23:50'),('alex','2021-08-24 17:43:40'),('alex','2021-08-24 18:42:13'),('alex','2021-08-24 18:48:11'),('alex','2021-08-24 18:49:17'),('alex','2021-08-24 18:49:46'),('alex','2021-08-24 18:50:23'),('alex','2021-08-24 18:55:57'),('alex','2021-08-24 18:56:37'),('nick','2021-08-24 18:57:03'),('alex','2021-08-24 19:21:37'),('alex','2021-08-24 21:18:59'),('xristos','2021-08-24 21:26:39'),('alex','2021-08-25 00:03:18'),('xristos','2021-08-25 20:23:17'),('mixalis','2021-08-25 20:42:30'),('mixalis','2021-08-25 20:44:07'),('mixalis','2021-08-25 20:44:14'),('alex','2021-08-25 20:56:49'),('alex','2021-08-26 18:36:49'),('xristos','2021-08-26 18:51:15'),('xristos','2021-08-26 19:29:45'),('nick','2021-08-26 19:37:27'),('nick','2021-08-26 19:38:45'),('nick','2021-08-26 19:39:02'),('alex','2021-08-26 19:44:16'),('xristos','2021-08-26 21:21:56'),('alex','2021-08-27 12:04:21'),('alex','2021-08-27 12:15:18'),('alex','2021-08-27 19:09:53'),('alex','2021-08-27 19:10:05'),('alex','2021-08-27 19:10:41'),('alex','2021-08-27 19:12:43'),('alex','2021-08-27 19:14:00'),('alex','2021-08-27 19:14:25'),('alex','2021-08-27 19:15:02'),('alex','2021-08-27 19:19:54'),('alex','2021-08-27 19:20:33'),('alex','2021-08-27 19:32:53'),('alex','2021-08-27 19:33:38'),('alex','2021-08-27 19:34:13'),('alex','2021-08-27 19:35:54'),('alex','2021-08-27 19:37:36'),('mixalis','2021-08-27 19:40:33'),('mixalis','2021-08-28 14:33:15'),('alex','2021-08-28 14:51:41'),('alex','2021-08-28 15:31:06'),('mixalis','2021-08-28 19:01:14'),('mixalis','2021-08-28 19:34:06'),('mixalis','2021-08-28 20:10:49'),('nick','2021-08-28 20:11:31'),('alex','2021-08-28 20:26:19'),('alex','2021-08-28 20:26:35'),('alex','2021-08-29 11:30:06'),('mixalis','2021-08-29 11:47:06');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `mID` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `stars` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`mID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'La La Land',2016,'Ryan Gosling and Emma Stone','La La Land is a 2016 American musical romantic comedy-drama film written and directed by Damien Chazelle.',130,13),(2,'Il Postino',1994,'Massim Troisi','A simple Italian postman learns to love poetry while delivering mail to a famous poet.',110,10),(3,'La vita e bella',1997,'Roberto Benini','When an open-minded Jewish librarian and his son become victims of the Holocaust, he uses a perfect mixture of will, humor, and imagination to protect his son from the dangers around their camp.',116,13),(4,'Schindlers List',1993,'Thomas Keneally','In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.',190,18);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `sID` int unsigned NOT NULL AUTO_INCREMENT,
  `theaterID` int DEFAULT NULL,
  `movieID` int DEFAULT NULL,
  `dateOfAir` datetime DEFAULT NULL,
  `availbleSpots` int DEFAULT NULL,
  `totalSpots` int DEFAULT NULL,
  `movieUP` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`sID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,1,'2021-08-24 21:45:00',198,200,1),(2,1,2,'2021-08-24 23:45:00',192,200,1),(3,2,3,'2021-08-28 22:30:00',150,150,0),(4,1,1,'2021-08-28 22:00:00',200,200,1),(5,1,1,'2021-09-04 12:30:00',200,200,1),(6,1,2,'2021-09-04 22:15:00',200,200,1),(7,2,3,'2021-08-29 09:45:00',150,150,0),(8,2,4,'2021-08-29 00:45:00',150,150,0),(9,2,3,'2021-09-04 09:45:00',150,150,1),(10,2,4,'2021-09-04 12:45:00',150,150,0);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `tID` int unsigned NOT NULL AUTO_INCREMENT,
  `totalSpots` int DEFAULT NULL,
  PRIMARY KEY (`tID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (1,200),(2,150),(3,120);
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sysadmin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'alex','b75bd008d5fecb1f50cf026532e8ae67','Alexandros','Paliampelos','alexpap18@gmail.com',1),(2,'nick','4156b5c0fdc96160b1da20d1d54175b9','Nikolas','Papadopoulos','nick@gmail.com',0),(3,'xristos','fef96d637ccc8977e9c9ff894cf43e1d','Xristos','Zaxos','chris@gmail.com',1),(4,'mixalis','854904d67069867fc672105e3415572f','Mike','Papazoglou','alex-otypas@hotmail.com',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-29 11:53:27
