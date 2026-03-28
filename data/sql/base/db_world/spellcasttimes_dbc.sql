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
-- Table structure for table `spellcasttimes_dbc`
--

DROP TABLE IF EXISTS `spellcasttimes_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spellcasttimes_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `Base` int NOT NULL DEFAULT '0',
  `PerLevel` int NOT NULL DEFAULT '0',
  `Minimum` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellcasttimes_dbc`
--

LOCK TABLES `spellcasttimes_dbc` WRITE;
/*!40000 ALTER TABLE `spellcasttimes_dbc` DISABLE KEYS */;
INSERT INTO `spellcasttimes_dbc` VALUES (1,0,0,0);
INSERT INTO `spellcasttimes_dbc` VALUES (2,250,0,250);
INSERT INTO `spellcasttimes_dbc` VALUES (3,500,0,500);
INSERT INTO `spellcasttimes_dbc` VALUES (4,1000,0,1000);
INSERT INTO `spellcasttimes_dbc` VALUES (5,2000,0,2000);
INSERT INTO `spellcasttimes_dbc` VALUES (6,5000,0,5000);
INSERT INTO `spellcasttimes_dbc` VALUES (7,10000,0,10000);
INSERT INTO `spellcasttimes_dbc` VALUES (8,20000,0,20000);
INSERT INTO `spellcasttimes_dbc` VALUES (9,30000,0,30000);
INSERT INTO `spellcasttimes_dbc` VALUES (10,1000,-100,500);
INSERT INTO `spellcasttimes_dbc` VALUES (11,2000,-100,1000);
INSERT INTO `spellcasttimes_dbc` VALUES (12,5000,-100,2500);
INSERT INTO `spellcasttimes_dbc` VALUES (13,30000,-1000,10000);
INSERT INTO `spellcasttimes_dbc` VALUES (14,3000,0,3000);
INSERT INTO `spellcasttimes_dbc` VALUES (15,4000,0,4000);
INSERT INTO `spellcasttimes_dbc` VALUES (16,1500,0,1500);
INSERT INTO `spellcasttimes_dbc` VALUES (18,-1000000,0,-1000000);
INSERT INTO `spellcasttimes_dbc` VALUES (19,2500,0,2500);
INSERT INTO `spellcasttimes_dbc` VALUES (20,2500,0,2500);
INSERT INTO `spellcasttimes_dbc` VALUES (21,2600,0,2600);
INSERT INTO `spellcasttimes_dbc` VALUES (22,3500,0,3500);
INSERT INTO `spellcasttimes_dbc` VALUES (23,1800,0,1800);
INSERT INTO `spellcasttimes_dbc` VALUES (24,2200,0,2200);
INSERT INTO `spellcasttimes_dbc` VALUES (25,2900,0,2900);
INSERT INTO `spellcasttimes_dbc` VALUES (26,3700,0,3700);
INSERT INTO `spellcasttimes_dbc` VALUES (27,4100,0,4100);
INSERT INTO `spellcasttimes_dbc` VALUES (28,3200,0,3200);
INSERT INTO `spellcasttimes_dbc` VALUES (29,4700,0,4700);
INSERT INTO `spellcasttimes_dbc` VALUES (30,4500,0,4500);
INSERT INTO `spellcasttimes_dbc` VALUES (31,2300,0,2300);
INSERT INTO `spellcasttimes_dbc` VALUES (32,7000,0,7000);
INSERT INTO `spellcasttimes_dbc` VALUES (33,2000,0,2000);
INSERT INTO `spellcasttimes_dbc` VALUES (34,3000,0,3000);
INSERT INTO `spellcasttimes_dbc` VALUES (35,12500,-250,5000);
INSERT INTO `spellcasttimes_dbc` VALUES (36,600,0,600);
INSERT INTO `spellcasttimes_dbc` VALUES (37,25000,-400,8000);
INSERT INTO `spellcasttimes_dbc` VALUES (38,45000,-500,15000);
INSERT INTO `spellcasttimes_dbc` VALUES (39,50000,-500,25000);
INSERT INTO `spellcasttimes_dbc` VALUES (50,1300,0,1300);
INSERT INTO `spellcasttimes_dbc` VALUES (70,300000,0,300000);
INSERT INTO `spellcasttimes_dbc` VALUES (90,1700,0,1700);
INSERT INTO `spellcasttimes_dbc` VALUES (91,2800,0,2800);
INSERT INTO `spellcasttimes_dbc` VALUES (110,750,0,750);
INSERT INTO `spellcasttimes_dbc` VALUES (130,1600,0,1600);
INSERT INTO `spellcasttimes_dbc` VALUES (150,3800,0,3800);
INSERT INTO `spellcasttimes_dbc` VALUES (151,2700,0,2700);
INSERT INTO `spellcasttimes_dbc` VALUES (152,3100,0,3100);
INSERT INTO `spellcasttimes_dbc` VALUES (153,3400,0,3400);
INSERT INTO `spellcasttimes_dbc` VALUES (170,8000,0,8000);
INSERT INTO `spellcasttimes_dbc` VALUES (171,6000,0,6000);
INSERT INTO `spellcasttimes_dbc` VALUES (190,100,0,100);
INSERT INTO `spellcasttimes_dbc` VALUES (191,0,0,0);
INSERT INTO `spellcasttimes_dbc` VALUES (192,15000,0,15000);
INSERT INTO `spellcasttimes_dbc` VALUES (193,12000,0,12000);
INSERT INTO `spellcasttimes_dbc` VALUES (194,-1000000,0,1500);
INSERT INTO `spellcasttimes_dbc` VALUES (195,1100,0,0);
INSERT INTO `spellcasttimes_dbc` VALUES (196,750,0,0);
INSERT INTO `spellcasttimes_dbc` VALUES (197,850,0,0);
INSERT INTO `spellcasttimes_dbc` VALUES (198,900,0,0);
INSERT INTO `spellcasttimes_dbc` VALUES (199,333,0,333);
INSERT INTO `spellcasttimes_dbc` VALUES (200,0,0,0);
INSERT INTO `spellcasttimes_dbc` VALUES (201,19000,0,19000);
INSERT INTO `spellcasttimes_dbc` VALUES (202,1400,0,1400);
INSERT INTO `spellcasttimes_dbc` VALUES (203,14000,0,14000);
INSERT INTO `spellcasttimes_dbc` VALUES (204,9000,0,9000);
INSERT INTO `spellcasttimes_dbc` VALUES (205,0,0,0);
INSERT INTO `spellcasttimes_dbc` VALUES (206,1250,0,1250);
INSERT INTO `spellcasttimes_dbc` VALUES (207,40000,0,40000);
INSERT INTO `spellcasttimes_dbc` VALUES (208,60000,0,60000);
INSERT INTO `spellcasttimes_dbc` VALUES (209,200,0,0);
/*!40000 ALTER TABLE `spellcasttimes_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 20:39:21
