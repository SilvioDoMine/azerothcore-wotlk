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
-- Table structure for table `battlemasterlist_dbc`
--

DROP TABLE IF EXISTS `battlemasterlist_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battlemasterlist_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `MapID_1` int NOT NULL DEFAULT '0',
  `MapID_2` int NOT NULL DEFAULT '0',
  `MapID_3` int NOT NULL DEFAULT '0',
  `MapID_4` int NOT NULL DEFAULT '0',
  `MapID_5` int NOT NULL DEFAULT '0',
  `MapID_6` int NOT NULL DEFAULT '0',
  `MapID_7` int NOT NULL DEFAULT '0',
  `MapID_8` int NOT NULL DEFAULT '0',
  `InstanceType` int NOT NULL DEFAULT '0',
  `GroupsAllowed` int NOT NULL DEFAULT '0',
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
  `MaxGroupSize` int NOT NULL DEFAULT '0',
  `HolidayWorldState` int NOT NULL DEFAULT '0',
  `Minlevel` int NOT NULL DEFAULT '0',
  `Maxlevel` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlemasterlist_dbc`
--

LOCK TABLES `battlemasterlist_dbc` WRITE;
/*!40000 ALTER TABLE `battlemasterlist_dbc` DISABLE KEYS */;
INSERT INTO `battlemasterlist_dbc` VALUES (1,30,-1,-1,-1,-1,-1,-1,-1,3,1,"Alterac Valley","","","","","","","","","","","","","","","",16712190,5,1941,51,80);
INSERT INTO `battlemasterlist_dbc` VALUES (2,489,-1,-1,-1,-1,-1,-1,-1,3,1,"Warsong Gulch","","","","","","","","","","","","","","","",16712190,10,1942,10,80);
INSERT INTO `battlemasterlist_dbc` VALUES (3,529,-1,-1,-1,-1,-1,-1,-1,3,1,"Arathi Basin","","","","","","","","","","","","","","","",16712190,15,1943,20,80);
INSERT INTO `battlemasterlist_dbc` VALUES (4,559,-1,-1,-1,-1,-1,-1,-1,4,1,"Nagrand Arena","","","","","","","","","","","","","","","",16712190,5,0,10,80);
INSERT INTO `battlemasterlist_dbc` VALUES (5,562,-1,-1,-1,-1,-1,-1,-1,4,1,"Blade\'s Edge Arena","","","","","","","","","","","","","","","",16712190,5,0,10,80);
INSERT INTO `battlemasterlist_dbc` VALUES (6,559,562,572,617,618,-1,-1,-1,4,1,"All Arenas","","","","","","","","","","","","","","","",16712190,5,0,10,80);
INSERT INTO `battlemasterlist_dbc` VALUES (7,566,-1,-1,-1,-1,-1,-1,-1,3,1,"Eye of the Storm","","","","","","","","","","","","","","","",16712190,15,2851,61,80);
INSERT INTO `battlemasterlist_dbc` VALUES (8,572,-1,-1,-1,-1,-1,-1,-1,4,1,"Ruins of Lordaeron","","","","","","","","","","","","","","","",16712190,5,0,10,80);
INSERT INTO `battlemasterlist_dbc` VALUES (9,607,-1,-1,-1,-1,-1,-1,-1,3,1,"Strand of the Ancients","","","","","","","","","","","","","","","",16712190,15,3695,71,80);
INSERT INTO `battlemasterlist_dbc` VALUES (10,617,-1,-1,-1,-1,-1,-1,-1,4,1,"Dalaran Sewers","","","","","","","","","","","","","","","",16712190,5,0,10,80);
INSERT INTO `battlemasterlist_dbc` VALUES (11,618,-1,-1,-1,-1,-1,-1,-1,4,1,"The Ring of Valor","","","","","","","","","","","","","","","",16712190,5,0,10,80);
INSERT INTO `battlemasterlist_dbc` VALUES (30,628,-1,-1,-1,-1,-1,-1,-1,3,1,"Isle of Conquest","","","","","","","","","","","","","","","",16712190,5,4273,71,80);
INSERT INTO `battlemasterlist_dbc` VALUES (32,30,489,529,566,607,628,-1,-1,3,1,"Random Battleground","","","","","","","","","","","","","","","",16712190,5,0,0,0);
/*!40000 ALTER TABLE `battlemasterlist_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 20:38:16
