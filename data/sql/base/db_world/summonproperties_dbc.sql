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
-- Table structure for table `summonproperties_dbc`
--

DROP TABLE IF EXISTS `summonproperties_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summonproperties_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `Control` int NOT NULL DEFAULT '0',
  `Faction` int NOT NULL DEFAULT '0',
  `Title` int NOT NULL DEFAULT '0',
  `Slot` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summonproperties_dbc`
--

LOCK TABLES `summonproperties_dbc` WRITE;
/*!40000 ALTER TABLE `summonproperties_dbc` DISABLE KEYS */;
INSERT INTO `summonproperties_dbc` VALUES (41,1,0,5,5,0);
INSERT INTO `summonproperties_dbc` VALUES (61,1,0,2,0,2);
INSERT INTO `summonproperties_dbc` VALUES (63,1,0,4,1,2);
INSERT INTO `summonproperties_dbc` VALUES (64,0,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (65,3,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (66,0,0,0,0,1);
INSERT INTO `summonproperties_dbc` VALUES (67,2,0,1,0,0);
INSERT INTO `summonproperties_dbc` VALUES (81,1,0,4,2,2);
INSERT INTO `summonproperties_dbc` VALUES (82,1,0,4,3,2);
INSERT INTO `summonproperties_dbc` VALUES (83,1,0,4,4,2);
INSERT INTO `summonproperties_dbc` VALUES (121,1,0,0,0,2);
INSERT INTO `summonproperties_dbc` VALUES (161,4,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (181,1,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (182,0,0,0,5,0);
INSERT INTO `summonproperties_dbc` VALUES (183,1,106,2,0,2);
INSERT INTO `summonproperties_dbc` VALUES (184,1,210,2,0,2);
INSERT INTO `summonproperties_dbc` VALUES (185,0,210,2,0,2);
INSERT INTO `summonproperties_dbc` VALUES (186,0,106,2,0,2);
INSERT INTO `summonproperties_dbc` VALUES (187,0,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (207,2,0,1,0,2);
INSERT INTO `summonproperties_dbc` VALUES (208,1,0,6,0,2);
INSERT INTO `summonproperties_dbc` VALUES (209,1,0,7,0,512);
INSERT INTO `summonproperties_dbc` VALUES (227,0,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (247,5,14,0,0,1);
INSERT INTO `summonproperties_dbc` VALUES (267,0,0,0,5,0);
INSERT INTO `summonproperties_dbc` VALUES (287,0,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (307,1,35,5,5,0);
INSERT INTO `summonproperties_dbc` VALUES (327,4,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (328,0,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (347,1,0,0,0,2);
INSERT INTO `summonproperties_dbc` VALUES (367,4,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (387,1,0,5,6,514);
INSERT INTO `summonproperties_dbc` VALUES (407,1,0,5,0,4);
INSERT INTO `summonproperties_dbc` VALUES (409,1,0,1,5,4);
INSERT INTO `summonproperties_dbc` VALUES (410,1,0,4,1,8);
INSERT INTO `summonproperties_dbc` VALUES (427,3,0,1,0,0);
INSERT INTO `summonproperties_dbc` VALUES (428,3,1616,0,0,4);
INSERT INTO `summonproperties_dbc` VALUES (429,0,0,0,0,2);
INSERT INTO `summonproperties_dbc` VALUES (447,1,0,2,6,2);
INSERT INTO `summonproperties_dbc` VALUES (467,4,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (469,1,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (487,1,0,2,6,770);
INSERT INTO `summonproperties_dbc` VALUES (488,4,0,0,0,8);
INSERT INTO `summonproperties_dbc` VALUES (489,1,35,8,0,0);
INSERT INTO `summonproperties_dbc` VALUES (490,1,0,0,0,16);
INSERT INTO `summonproperties_dbc` VALUES (491,0,0,0,0,8);
INSERT INTO `summonproperties_dbc` VALUES (492,1,0,0,0,16);
INSERT INTO `summonproperties_dbc` VALUES (493,4,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (494,1,0,3,0,10);
INSERT INTO `summonproperties_dbc` VALUES (495,0,0,0,0,9);
INSERT INTO `summonproperties_dbc` VALUES (496,1,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (497,0,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (507,1,0,2,0,2);
INSERT INTO `summonproperties_dbc` VALUES (527,0,2089,0,0,9);
INSERT INTO `summonproperties_dbc` VALUES (547,1,974,0,5,8216);
INSERT INTO `summonproperties_dbc` VALUES (567,1,0,0,6,0);
INSERT INTO `summonproperties_dbc` VALUES (587,0,0,0,0,8);
INSERT INTO `summonproperties_dbc` VALUES (607,4,0,2,6,264);
INSERT INTO `summonproperties_dbc` VALUES (627,1,2064,0,0,10);
INSERT INTO `summonproperties_dbc` VALUES (628,0,0,0,6,8);
INSERT INTO `summonproperties_dbc` VALUES (629,1,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (647,1,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (648,0,0,0,0,64);
INSERT INTO `summonproperties_dbc` VALUES (649,1,0,2,0,66);
INSERT INTO `summonproperties_dbc` VALUES (667,1,0,0,0,64);
INSERT INTO `summonproperties_dbc` VALUES (668,0,0,0,5,0);
INSERT INTO `summonproperties_dbc` VALUES (669,2,0,1,0,0);
INSERT INTO `summonproperties_dbc` VALUES (687,1,0,3,0,512);
INSERT INTO `summonproperties_dbc` VALUES (688,1,35,2,0,2);
INSERT INTO `summonproperties_dbc` VALUES (689,4,0,0,0,256);
INSERT INTO `summonproperties_dbc` VALUES (707,0,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (708,4,0,0,0,256);
INSERT INTO `summonproperties_dbc` VALUES (709,0,0,0,4,1);
INSERT INTO `summonproperties_dbc` VALUES (710,4,0,0,0,264);
INSERT INTO `summonproperties_dbc` VALUES (711,2,0,3,0,0);
INSERT INTO `summonproperties_dbc` VALUES (712,1,0,0,0,4);
INSERT INTO `summonproperties_dbc` VALUES (713,1,0,2,0,514);
INSERT INTO `summonproperties_dbc` VALUES (714,0,0,0,0,2);
INSERT INTO `summonproperties_dbc` VALUES (715,0,0,0,0,320);
INSERT INTO `summonproperties_dbc` VALUES (716,4,0,0,0,256);
INSERT INTO `summonproperties_dbc` VALUES (717,0,0,0,0,1);
INSERT INTO `summonproperties_dbc` VALUES (718,4,0,0,0,256);
INSERT INTO `summonproperties_dbc` VALUES (719,0,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (720,1,0,7,0,0);
INSERT INTO `summonproperties_dbc` VALUES (760,4,0,0,0,264);
INSERT INTO `summonproperties_dbc` VALUES (780,4,0,0,6,8);
INSERT INTO `summonproperties_dbc` VALUES (781,1,0,0,0,80);
INSERT INTO `summonproperties_dbc` VALUES (801,4,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (821,1,0,2,6,10);
INSERT INTO `summonproperties_dbc` VALUES (822,1,0,0,6,2);
INSERT INTO `summonproperties_dbc` VALUES (823,1,0,2,1,2120);
INSERT INTO `summonproperties_dbc` VALUES (824,4,0,0,0,256);
INSERT INTO `summonproperties_dbc` VALUES (825,2,0,1,0,0);
INSERT INTO `summonproperties_dbc` VALUES (826,1,0,0,0,530);
INSERT INTO `summonproperties_dbc` VALUES (827,4,0,0,0,264);
INSERT INTO `summonproperties_dbc` VALUES (828,1,0,0,1,264);
INSERT INTO `summonproperties_dbc` VALUES (829,1,0,2,1,514);
INSERT INTO `summonproperties_dbc` VALUES (830,1,0,2,0,258);
INSERT INTO `summonproperties_dbc` VALUES (831,1,0,2,6,9026);
INSERT INTO `summonproperties_dbc` VALUES (832,1,0,7,0,0);
INSERT INTO `summonproperties_dbc` VALUES (833,2,0,3,0,0);
INSERT INTO `summonproperties_dbc` VALUES (841,1,0,6,6,10);
INSERT INTO `summonproperties_dbc` VALUES (842,1,0,2,0,514);
INSERT INTO `summonproperties_dbc` VALUES (843,4,0,0,0,16);
INSERT INTO `summonproperties_dbc` VALUES (844,0,0,0,0,16);
INSERT INTO `summonproperties_dbc` VALUES (861,4,0,0,0,256);
INSERT INTO `summonproperties_dbc` VALUES (881,1,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (901,1,0,0,0,2304);
INSERT INTO `summonproperties_dbc` VALUES (921,2,0,1,0,256);
INSERT INTO `summonproperties_dbc` VALUES (941,0,0,10,0,0);
INSERT INTO `summonproperties_dbc` VALUES (942,1,0,0,0,272);
INSERT INTO `summonproperties_dbc` VALUES (943,0,0,0,0,2048);
INSERT INTO `summonproperties_dbc` VALUES (944,1,0,6,0,2306);
INSERT INTO `summonproperties_dbc` VALUES (961,1,0,0,0,264);
INSERT INTO `summonproperties_dbc` VALUES (962,1,0,0,6,3336);
INSERT INTO `summonproperties_dbc` VALUES (963,1,0,0,0,2312);
INSERT INTO `summonproperties_dbc` VALUES (964,1,0,0,0,2312);
INSERT INTO `summonproperties_dbc` VALUES (965,1,0,0,0,2312);
INSERT INTO `summonproperties_dbc` VALUES (966,1,0,0,0,2312);
INSERT INTO `summonproperties_dbc` VALUES (967,1,0,0,0,2826);
INSERT INTO `summonproperties_dbc` VALUES (968,1,0,0,0,8);
INSERT INTO `summonproperties_dbc` VALUES (981,1,35,3,0,0);
INSERT INTO `summonproperties_dbc` VALUES (1001,0,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (1021,1,0,0,0,512);
INSERT INTO `summonproperties_dbc` VALUES (1041,0,35,0,0,2048);
INSERT INTO `summonproperties_dbc` VALUES (1061,0,0,0,0,2);
INSERT INTO `summonproperties_dbc` VALUES (1081,4,0,9,0,256);
INSERT INTO `summonproperties_dbc` VALUES (1101,1,0,2,0,6);
INSERT INTO `summonproperties_dbc` VALUES (1121,0,0,0,0,3200);
INSERT INTO `summonproperties_dbc` VALUES (1141,1,0,11,0,4096);
INSERT INTO `summonproperties_dbc` VALUES (1161,2,0,1,0,18432);
INSERT INTO `summonproperties_dbc` VALUES (1162,0,0,9,0,4096);
INSERT INTO `summonproperties_dbc` VALUES (1181,0,0,9,0,2048);
INSERT INTO `summonproperties_dbc` VALUES (1201,4,0,0,0,256);
INSERT INTO `summonproperties_dbc` VALUES (1202,0,0,0,0,256);
INSERT INTO `summonproperties_dbc` VALUES (1221,0,0,0,0,1);
INSERT INTO `summonproperties_dbc` VALUES (1241,0,0,0,0,64);
INSERT INTO `summonproperties_dbc` VALUES (1261,1,0,2,0,2562);
INSERT INTO `summonproperties_dbc` VALUES (1281,4,0,0,0,8);
INSERT INTO `summonproperties_dbc` VALUES (1301,3,0,0,0,2304);
INSERT INTO `summonproperties_dbc` VALUES (1302,1,0,3,6,1032);
INSERT INTO `summonproperties_dbc` VALUES (1321,4,0,0,6,8);
INSERT INTO `summonproperties_dbc` VALUES (1341,1,0,5,5,0);
INSERT INTO `summonproperties_dbc` VALUES (1342,2,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (1343,1,0,2,0,770);
INSERT INTO `summonproperties_dbc` VALUES (1361,0,0,0,0,2048);
INSERT INTO `summonproperties_dbc` VALUES (1362,0,0,0,0,2048);
INSERT INTO `summonproperties_dbc` VALUES (1381,1,0,0,0,258);
INSERT INTO `summonproperties_dbc` VALUES (1401,1,35,2,1,2);
INSERT INTO `summonproperties_dbc` VALUES (1421,1,0,5,0,2056);
INSERT INTO `summonproperties_dbc` VALUES (1442,2,0,5,0,2056);
INSERT INTO `summonproperties_dbc` VALUES (1481,1,0,0,0,264);
INSERT INTO `summonproperties_dbc` VALUES (1501,0,0,0,1,0);
INSERT INTO `summonproperties_dbc` VALUES (1502,0,0,0,2,0);
INSERT INTO `summonproperties_dbc` VALUES (1503,0,0,0,3,0);
INSERT INTO `summonproperties_dbc` VALUES (1504,0,0,0,4,0);
INSERT INTO `summonproperties_dbc` VALUES (1541,4,35,10,0,2048);
INSERT INTO `summonproperties_dbc` VALUES (1561,2,0,1,0,16384);
INSERT INTO `summonproperties_dbc` VALUES (1562,2,0,1,0,16384);
INSERT INTO `summonproperties_dbc` VALUES (1581,1,0,2,0,2050);
INSERT INTO `summonproperties_dbc` VALUES (1641,4,0,0,0,264);
INSERT INTO `summonproperties_dbc` VALUES (1701,1,0,0,6,2120);
INSERT INTO `summonproperties_dbc` VALUES (1721,2,0,1,0,514);
INSERT INTO `summonproperties_dbc` VALUES (1761,1,0,0,0,10);
INSERT INTO `summonproperties_dbc` VALUES (1781,1,0,0,0,2056);
INSERT INTO `summonproperties_dbc` VALUES (1841,1,0,5,5,256);
INSERT INTO `summonproperties_dbc` VALUES (1881,0,0,0,0,32768);
INSERT INTO `summonproperties_dbc` VALUES (1961,0,0,0,0,2048);
INSERT INTO `summonproperties_dbc` VALUES (1981,0,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (2001,0,0,0,0,2048);
INSERT INTO `summonproperties_dbc` VALUES (2002,2,0,7,6,0);
INSERT INTO `summonproperties_dbc` VALUES (2041,1,0,3,0,0);
INSERT INTO `summonproperties_dbc` VALUES (2061,1,0,0,0,8);
INSERT INTO `summonproperties_dbc` VALUES (2062,1,0,7,0,6144);
INSERT INTO `summonproperties_dbc` VALUES (2081,1,0,7,0,2058);
INSERT INTO `summonproperties_dbc` VALUES (2141,1,0,2,0,2);
INSERT INTO `summonproperties_dbc` VALUES (2181,0,0,12,0,4096);
INSERT INTO `summonproperties_dbc` VALUES (2221,1,0,0,0,2);
INSERT INTO `summonproperties_dbc` VALUES (2301,1,0,0,0,514);
INSERT INTO `summonproperties_dbc` VALUES (2381,1,0,2,0,2050);
INSERT INTO `summonproperties_dbc` VALUES (2441,0,14,0,0,1);
INSERT INTO `summonproperties_dbc` VALUES (2481,0,0,0,0,4096);
INSERT INTO `summonproperties_dbc` VALUES (2581,0,0,0,0,2048);
INSERT INTO `summonproperties_dbc` VALUES (2601,4,0,0,0,4096);
INSERT INTO `summonproperties_dbc` VALUES (2621,1,0,0,0,8);
INSERT INTO `summonproperties_dbc` VALUES (2641,1,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (2661,1,0,7,0,2);
INSERT INTO `summonproperties_dbc` VALUES (2742,4,0,0,0,4360);
INSERT INTO `summonproperties_dbc` VALUES (2761,5,14,0,0,1);
INSERT INTO `summonproperties_dbc` VALUES (2821,0,0,0,0,0);
INSERT INTO `summonproperties_dbc` VALUES (2904,1,0,0,0,530);
INSERT INTO `summonproperties_dbc` VALUES (2905,0,0,0,0,2121);
INSERT INTO `summonproperties_dbc` VALUES (2908,5,14,0,0,9);
INSERT INTO `summonproperties_dbc` VALUES (2909,1,0,2,0,2826);
INSERT INTO `summonproperties_dbc` VALUES (2913,0,0,7,0,4096);
INSERT INTO `summonproperties_dbc` VALUES (2915,1,0,0,0,2056);
INSERT INTO `summonproperties_dbc` VALUES (2926,0,14,0,0,5);
INSERT INTO `summonproperties_dbc` VALUES (2932,4,35,0,0,2056);
INSERT INTO `summonproperties_dbc` VALUES (2933,4,0,0,0,256);
INSERT INTO `summonproperties_dbc` VALUES (2935,1,0,0,0,2560);
/*!40000 ALTER TABLE `summonproperties_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:54:42
