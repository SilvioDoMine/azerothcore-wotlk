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
-- Table structure for table `scalingstatdistribution_dbc`
--

DROP TABLE IF EXISTS `scalingstatdistribution_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scalingstatdistribution_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `StatID_1` int NOT NULL DEFAULT '0',
  `StatID_2` int NOT NULL DEFAULT '0',
  `StatID_3` int NOT NULL DEFAULT '0',
  `StatID_4` int NOT NULL DEFAULT '0',
  `StatID_5` int NOT NULL DEFAULT '0',
  `StatID_6` int NOT NULL DEFAULT '0',
  `StatID_7` int NOT NULL DEFAULT '0',
  `StatID_8` int NOT NULL DEFAULT '0',
  `StatID_9` int NOT NULL DEFAULT '0',
  `StatID_10` int NOT NULL DEFAULT '0',
  `Bonus_1` int NOT NULL DEFAULT '0',
  `Bonus_2` int NOT NULL DEFAULT '0',
  `Bonus_3` int NOT NULL DEFAULT '0',
  `Bonus_4` int NOT NULL DEFAULT '0',
  `Bonus_5` int NOT NULL DEFAULT '0',
  `Bonus_6` int NOT NULL DEFAULT '0',
  `Bonus_7` int NOT NULL DEFAULT '0',
  `Bonus_8` int NOT NULL DEFAULT '0',
  `Bonus_9` int NOT NULL DEFAULT '0',
  `Bonus_10` int NOT NULL DEFAULT '0',
  `Maxlevel` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scalingstatdistribution_dbc`
--

LOCK TABLES `scalingstatdistribution_dbc` WRITE;
/*!40000 ALTER TABLE `scalingstatdistribution_dbc` DISABLE KEYS */;
INSERT INTO `scalingstatdistribution_dbc` VALUES (1,4,7,32,-1,-1,-1,-1,-1,-1,-1,5259,7888,5259,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (2,38,3,31,-1,-1,-1,-1,-1,-1,-1,14532,4106,3193,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (3,38,7,32,-1,-1,-1,-1,-1,-1,-1,10518,7888,5259,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (4,38,32,31,-1,-1,-1,-1,-1,-1,-1,13332,4767,3900,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (5,7,5,32,-1,-1,-1,-1,-1,-1,-1,7150,5850,4766,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (6,7,5,43,-1,-1,-1,-1,-1,-1,-1,5067,7601,1350,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (7,4,7,32,-1,-1,-1,-1,-1,-1,-1,6666,6666,4445,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (8,38,3,7,5,-1,-1,-1,-1,-1,-1,10518,5258,5641,3076,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (9,45,7,5,43,-1,-1,-1,-1,-1,-1,5201,6666,4444,1778,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (10,38,31,7,-1,-1,-1,-1,-1,-1,-1,14532,4106,4789,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (11,45,7,5,6,-1,-1,-1,-1,-1,-1,6153,3996,3997,5258,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (12,0,5,0,0,0,0,0,0,0,0,5000,5000,0,0,0,0,0,0,0,0,10);
INSERT INTO `scalingstatdistribution_dbc` VALUES (13,42,0,0,0,0,0,0,0,0,0,10000,0,0,0,0,0,0,0,0,0,10);
INSERT INTO `scalingstatdistribution_dbc` VALUES (14,38,39,40,41,42,43,0,0,0,0,6500,6500,10000,10000,10000,10000,0,0,0,0,15);
INSERT INTO `scalingstatdistribution_dbc` VALUES (15,40,41,42,0,0,0,0,0,0,0,4200,5200,6200,0,0,0,0,0,0,0,10);
INSERT INTO `scalingstatdistribution_dbc` VALUES (16,45,7,5,6,-1,-1,-1,-1,-1,-1,6153,3996,3997,5258,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (21,12,13,14,15,16,0,0,0,0,0,5000,6000,7000,8000,9000,0,0,0,0,0,10);
INSERT INTO `scalingstatdistribution_dbc` VALUES (41,3,4,5,6,7,12,13,14,15,16,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10);
INSERT INTO `scalingstatdistribution_dbc` VALUES (42,17,18,19,20,21,22,23,24,25,26,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10);
INSERT INTO `scalingstatdistribution_dbc` VALUES (43,27,28,29,30,31,32,33,34,35,36,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10);
INSERT INTO `scalingstatdistribution_dbc` VALUES (102,44,0,0,0,0,0,0,0,0,0,10000,0,0,0,0,0,0,0,0,0,15);
INSERT INTO `scalingstatdistribution_dbc` VALUES (103,3,-1,-1,-1,-1,-1,-1,-1,-1,-1,10000,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `scalingstatdistribution_dbc` VALUES (104,32,-1,-1,-1,-1,-1,-1,-1,-1,-1,10000,0,0,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (105,13,-1,-1,-1,-1,-1,-1,-1,-1,-1,10000,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `scalingstatdistribution_dbc` VALUES (221,4,7,32,36,-1,-1,-1,-1,-1,-1,4844,7266,4106,3193,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (222,3,44,7,-1,-1,-1,-1,-1,-1,-1,5259,3506,5259,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (223,7,5,32,-1,-1,-1,-1,-1,-1,-1,4859,5732,2519,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (224,38,3,31,7,-1,-1,-1,-1,-1,-1,9688,4844,3193,6159,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (241,45,0,0,0,0,0,0,0,0,0,10000,0,0,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (251,36,-1,-1,-1,-1,-1,-1,-1,-1,-1,6666,0,0,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (271,45,-1,-1,-1,-1,-1,-1,-1,-1,-1,7800,0,0,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (291,38,-1,-1,-1,-1,-1,-1,-1,-1,-1,23252,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `scalingstatdistribution_dbc` VALUES (292,38,7,35,-1,-1,-1,-1,-1,-1,-1,10518,7888,5258,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (293,4,7,35,-1,-1,-1,-1,-1,-1,-1,7266,4789,4106,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (294,38,32,35,-1,-1,-1,-1,-1,-1,-1,8212,7266,3193,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (295,7,35,43,-1,-1,-1,-1,-1,-1,-1,6666,6666,1777,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (296,7,31,35,-1,-1,-1,-1,-1,-1,-1,7888,5259,5258,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (297,35,-1,-1,-1,-1,-1,-1,-1,-1,-1,5259,0,0,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (298,35,-1,-1,-1,-1,-1,-1,-1,-1,-1,6667,0,0,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (299,35,-1,-1,-1,-1,-1,-1,-1,-1,-1,6667,0,0,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (300,4,7,35,-1,-1,-1,-1,-1,-1,-1,5259,7888,5258,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (301,45,7,43,35,-1,-1,-1,-1,-1,-1,5200,6666,1776,4444,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (302,38,3,7,35,-1,-1,-1,-1,-1,-1,8888,4444,6668,4444,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (303,45,7,5,35,-1,-1,-1,-1,-1,-1,6153,5259,3506,5258,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (304,38,3,7,35,-1,-1,-1,-1,-1,-1,8888,3899,6666,4767,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (305,45,7,6,35,-1,-1,-1,-1,-1,-1,6153,5259,3506,5258,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (306,45,7,32,35,-1,-1,-1,-1,-1,-1,6153,5259,3506,5258,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (311,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `scalingstatdistribution_dbc` VALUES (331,38,3,7,5,-1,-1,-1,-1,-1,-1,10518,5258,5259,3506,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (332,45,7,5,43,-1,-1,-1,-1,-1,-1,6153,3997,3997,2629,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (333,4,7,32,-1,-1,-1,-1,-1,-1,-1,5996,5996,5258,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (334,45,7,5,6,-1,-1,-1,-1,-1,-1,6153,3997,3997,5259,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (335,38,7,31,-1,-1,-1,-1,-1,-1,-1,10518,7888,5259,0,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (336,45,7,5,6,-1,-1,-1,-1,-1,-1,6153,3997,3997,5259,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (351,3,38,7,32,-1,-1,-1,-1,-1,-1,5259,7012,7889,3506,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (352,3,44,7,38,-1,-1,-1,-1,-1,-1,5259,3506,7889,7012,0,0,0,0,0,0,80);
INSERT INTO `scalingstatdistribution_dbc` VALUES (371,32,31,7,-1,-1,-1,-1,-1,-1,-1,7266,4106,4789,0,0,0,0,0,0,0,80);
/*!40000 ALTER TABLE `scalingstatdistribution_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:54:31
