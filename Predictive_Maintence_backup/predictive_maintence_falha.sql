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
-- Table structure for table `falha`
--

DROP TABLE IF EXISTS `falha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `falha` (
  `date_time` datetime NOT NULL,
  `machineID` smallint unsigned NOT NULL,
  `compID` tinyint unsigned DEFAULT NULL,
  `failure` varchar(10) NOT NULL,
  PRIMARY KEY (`date_time`,`machineID`,`failure`),
  KEY `machineID` (`machineID`),
  KEY `compID` (`compID`),
  CONSTRAINT `falha_ibfk_1` FOREIGN KEY (`machineID`) REFERENCES `maquina` (`machineID`),
  CONSTRAINT `falha_ibfk_2` FOREIGN KEY (`compID`) REFERENCES `comp` (`compID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `falha`
--

LOCK TABLES `falha` WRITE;
/*!40000 ALTER TABLE `falha` DISABLE KEYS */;
INSERT INTO `falha` VALUES ('2023-01-13 08:30:00',1,1,'comp1'),('2023-02-15 09:15:00',2,2,'comp2'),('2023-03-22 10:00:00',3,3,'comp3'),('2023-04-30 11:45:00',4,4,'comp4'),('2023-05-15 12:30:00',5,5,'comp5'),('2023-07-10 13:15:00',6,6,'comp6'),('2023-09-11 14:00:00',7,7,'comp7'),('2023-10-06 14:45:00',8,8,'comp8'),('2023-11-08 15:30:00',9,9,'comp9'),('2023-11-25 16:15:00',10,10,'comp10');
/*!40000 ALTER TABLE `falha` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-09 12:11:58
