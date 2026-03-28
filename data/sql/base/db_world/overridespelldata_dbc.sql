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
-- Table structure for table `overridespelldata_dbc`
--

DROP TABLE IF EXISTS `overridespelldata_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overridespelldata_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `Spells_1` int NOT NULL DEFAULT '0',
  `Spells_2` int NOT NULL DEFAULT '0',
  `Spells_3` int NOT NULL DEFAULT '0',
  `Spells_4` int NOT NULL DEFAULT '0',
  `Spells_5` int NOT NULL DEFAULT '0',
  `Spells_6` int NOT NULL DEFAULT '0',
  `Spells_7` int NOT NULL DEFAULT '0',
  `Spells_8` int NOT NULL DEFAULT '0',
  `Spells_9` int NOT NULL DEFAULT '0',
  `Spells_10` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overridespelldata_dbc`
--

LOCK TABLES `overridespelldata_dbc` WRITE;
/*!40000 ALTER TABLE `overridespelldata_dbc` DISABLE KEYS */;
INSERT INTO `overridespelldata_dbc` VALUES (1,40430,59351,31262,61721,0,0,0,0,0,0,5);
INSERT INTO `overridespelldata_dbc` VALUES (61,62634,62479,62473,62471,0,62428,0,0,0,0,0);
INSERT INTO `overridespelldata_dbc` VALUES (121,66905,0,0,0,0,0,0,0,0,0,1);
INSERT INTO `overridespelldata_dbc` VALUES (141,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `overridespelldata_dbc` VALUES (221,69667,69668,69671,69669,0,0,0,0,0,0,0);
INSERT INTO `overridespelldata_dbc` VALUES (241,70946,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `overridespelldata_dbc` VALUES (266,73491,73492,73499,0,0,0,0,0,0,0,0);
INSERT INTO `overridespelldata_dbc` VALUES (271,33912,31289,24331,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `overridespelldata_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 20:38:56
