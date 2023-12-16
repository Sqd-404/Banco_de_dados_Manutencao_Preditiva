-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: predictive_maintence
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
-- Table structure for table `telemetria`
--

DROP TABLE IF EXISTS `telemetria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telemetria` (
  `date_time` datetime NOT NULL,
  `machineID` smallint unsigned NOT NULL,
  `volt` decimal(7,4) DEFAULT NULL,
  `rotate_` decimal(7,4) DEFAULT NULL,
  `pressure` decimal(7,4) DEFAULT NULL,
  `vibration` decimal(7,4) DEFAULT NULL,
  PRIMARY KEY (`date_time`,`machineID`),
  KEY `machineID` (`machineID`),
  CONSTRAINT `telemetria_ibfk_1` FOREIGN KEY (`machineID`) REFERENCES `maquina` (`machineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telemetria`
--

LOCK TABLES `telemetria` WRITE;
/*!40000 ALTER TABLE `telemetria` DISABLE KEYS */;
INSERT INTO `telemetria` VALUES ('2015-01-01 01:00:00',5,174.6789,415.7654,116.0765,43.4567),('2015-01-01 02:00:00',6,176.3210,417.0987,113.1111,45.5678),('2015-01-01 03:00:00',4,177.0098,420.2023,112.4321,45.3456),('2015-01-01 05:00:00',3,175.0876,416.0010,115.0135,44.2345),('2015-01-01 06:00:00',2,178.1123,419.1021,112.0090,46.1234),('2015-01-01 09:00:00',1,176.2179,418.5041,113.0779,45.0877),('2015-01-01 10:00:00',7,178.1234,420.8765,111.0909,47.6789),('2015-01-01 14:00:00',9,177.0000,419.1111,114.0555,45.8901),('2015-01-01 16:00:00',8,174.4444,415.9876,117.0444,42.7890),('2015-01-01 20:00:00',10,179.2222,422.3333,110.0666,48.9012);
/*!40000 ALTER TABLE `telemetria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-15 22:15:48
