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
-- Table structure for table `currencytypes_dbc`
--

DROP TABLE IF EXISTS `currencytypes_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencytypes_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `ItemID` int NOT NULL DEFAULT '0',
  `CategoryID` int NOT NULL DEFAULT '0',
  `BitIndex` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencytypes_dbc`
--

LOCK TABLES `currencytypes_dbc` WRITE;
/*!40000 ALTER TABLE `currencytypes_dbc` DISABLE KEYS */;
INSERT INTO `currencytypes_dbc` VALUES (1,37711,1,1);
INSERT INTO `currencytypes_dbc` VALUES (2,37742,1,2);
INSERT INTO `currencytypes_dbc` VALUES (42,29434,1,7);
INSERT INTO `currencytypes_dbc` VALUES (61,41596,1,8);
INSERT INTO `currencytypes_dbc` VALUES (81,43016,1,9);
INSERT INTO `currencytypes_dbc` VALUES (241,44990,1,25);
INSERT INTO `currencytypes_dbc` VALUES (103,43307,2,12);
INSERT INTO `currencytypes_dbc` VALUES (104,43308,2,13);
INSERT INTO `currencytypes_dbc` VALUES (121,20560,2,14);
INSERT INTO `currencytypes_dbc` VALUES (122,20559,2,15);
INSERT INTO `currencytypes_dbc` VALUES (123,29024,2,16);
INSERT INTO `currencytypes_dbc` VALUES (124,42425,2,17);
INSERT INTO `currencytypes_dbc` VALUES (125,20558,2,18);
INSERT INTO `currencytypes_dbc` VALUES (126,43589,2,19);
INSERT INTO `currencytypes_dbc` VALUES (161,43228,2,21);
INSERT INTO `currencytypes_dbc` VALUES (181,44209,2,22);
INSERT INTO `currencytypes_dbc` VALUES (201,37836,2,23);
INSERT INTO `currencytypes_dbc` VALUES (321,47395,2,28);
INSERT INTO `currencytypes_dbc` VALUES (4,38644,3,3);
INSERT INTO `currencytypes_dbc` VALUES (101,40752,22,10);
INSERT INTO `currencytypes_dbc` VALUES (102,40753,22,11);
INSERT INTO `currencytypes_dbc` VALUES (221,45624,22,24);
INSERT INTO `currencytypes_dbc` VALUES (301,47241,22,27);
INSERT INTO `currencytypes_dbc` VALUES (341,49426,22,29);
INSERT INTO `currencytypes_dbc` VALUES (22,41749,24,5);
INSERT INTO `currencytypes_dbc` VALUES (141,43949,2089878896,20);
/*!40000 ALTER TABLE `currencytypes_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 20:38:29
