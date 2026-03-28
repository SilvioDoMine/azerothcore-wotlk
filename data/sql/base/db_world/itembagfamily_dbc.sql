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
-- Table structure for table `itembagfamily_dbc`
--

DROP TABLE IF EXISTS `itembagfamily_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itembagfamily_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `Name_Lang_enUS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_enGB` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_koKR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_frFR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_deDE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_enCN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_zhCN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_enTW` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_zhTW` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_esES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_esMX` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_ruRU` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_ptPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_ptBR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_itIT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_Unk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Lang_Mask` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itembagfamily_dbc`
--

LOCK TABLES `itembagfamily_dbc` WRITE;
/*!40000 ALTER TABLE `itembagfamily_dbc` DISABLE KEYS */;
INSERT INTO `itembagfamily_dbc` VALUES (0,"NONE","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (1,"Arrows","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (2,"Bullets","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (3,"Soul Shards","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (4,"Leatherworking Supplies","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (5,"Inscription Supplies","","","","","","","","","","","","","","","",16712191);
INSERT INTO `itembagfamily_dbc` VALUES (6,"Herbs","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (7,"Enchanting Supplies","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (8,"Engineering Supplies","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (9,"Keys","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (10,"Gems","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (11,"Mining Supplies","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (12,"Soulbound Equipment","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (13,"Vanity Pets","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (14,"Currency Tokens","","","","","","","","","","","","","","","",16712190);
INSERT INTO `itembagfamily_dbc` VALUES (15,"Quest Items","","","","","","","","","","","","","","","",16712190);
/*!40000 ALTER TABLE `itembagfamily_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 20:38:48
