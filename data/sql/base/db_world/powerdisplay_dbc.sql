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
-- Table structure for table `powerdisplay_dbc`
--

DROP TABLE IF EXISTS `powerdisplay_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `powerdisplay_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `ActualType` int NOT NULL DEFAULT '0',
  `GlobalstringBaseTag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Red` tinyint unsigned NOT NULL DEFAULT '0',
  `Green` tinyint unsigned NOT NULL DEFAULT '0',
  `Blue` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powerdisplay_dbc`
--

LOCK TABLES `powerdisplay_dbc` WRITE;
/*!40000 ALTER TABLE `powerdisplay_dbc` DISABLE KEYS */;
INSERT INTO `powerdisplay_dbc` VALUES (1,0,"AMMOSLOT",255,128,0);
INSERT INTO `powerdisplay_dbc` VALUES (41,3,"POWER_TYPE_PYRITE",0,202,255);
INSERT INTO `powerdisplay_dbc` VALUES (61,3,"POWER_TYPE_STEAM",242,242,242);
INSERT INTO `powerdisplay_dbc` VALUES (101,3,"POWER_TYPE_HEAT",255,125,0);
INSERT INTO `powerdisplay_dbc` VALUES (121,3,"POWER_TYPE_OOZE",193,255,0);
INSERT INTO `powerdisplay_dbc` VALUES (141,3,"POWER_TYPE_BLOOD_POWER",188,0,255);
INSERT INTO `powerdisplay_dbc` VALUES (142,3,"POWER_TYPE_WRATH",255,176,0);
/*!40000 ALTER TABLE `powerdisplay_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:54:24
