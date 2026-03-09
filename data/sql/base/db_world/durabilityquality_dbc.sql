-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: acore_world
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `durabilityquality_dbc`
--

DROP TABLE IF EXISTS `durabilityquality_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `durabilityquality_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `Data` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `durabilityquality_dbc`
--

LOCK TABLES `durabilityquality_dbc` WRITE;
/*!40000 ALTER TABLE `durabilityquality_dbc` DISABLE KEYS */;
INSERT INTO `durabilityquality_dbc` VALUES (1,1);
INSERT INTO `durabilityquality_dbc` VALUES (2,0.6);
INSERT INTO `durabilityquality_dbc` VALUES (3,1);
INSERT INTO `durabilityquality_dbc` VALUES (4,0.8);
INSERT INTO `durabilityquality_dbc` VALUES (5,1);
INSERT INTO `durabilityquality_dbc` VALUES (6,1);
INSERT INTO `durabilityquality_dbc` VALUES (7,1.2);
INSERT INTO `durabilityquality_dbc` VALUES (8,1.25);
INSERT INTO `durabilityquality_dbc` VALUES (9,1.44);
INSERT INTO `durabilityquality_dbc` VALUES (10,2.5);
INSERT INTO `durabilityquality_dbc` VALUES (11,1.728);
INSERT INTO `durabilityquality_dbc` VALUES (12,3);
INSERT INTO `durabilityquality_dbc` VALUES (13,0);
INSERT INTO `durabilityquality_dbc` VALUES (14,0);
INSERT INTO `durabilityquality_dbc` VALUES (15,1.2);
INSERT INTO `durabilityquality_dbc` VALUES (16,1.25);
/*!40000 ALTER TABLE `durabilityquality_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:53:52
