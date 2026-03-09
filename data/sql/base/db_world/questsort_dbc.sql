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
-- Table structure for table `questsort_dbc`
--

DROP TABLE IF EXISTS `questsort_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questsort_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `SortName_Lang_enUS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_enGB` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_koKR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_frFR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_deDE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_enCN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_zhCN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_enTW` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_zhTW` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_esES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_esMX` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_ruRU` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_ptPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_ptBR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_itIT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_Unk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SortName_Lang_Mask` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questsort_dbc`
--

LOCK TABLES `questsort_dbc` WRITE;
/*!40000 ALTER TABLE `questsort_dbc` DISABLE KEYS */;
INSERT INTO `questsort_dbc` VALUES (1,"Epic","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (21,"REUSE - old wailing caverns","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (22,"Seasonal","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (23,"REUSE - old undercity one","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (24,"Herbalism","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (25,"Battlegrounds","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (41,"Day of the Dead","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (61,"Warlock","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (81,"Warrior","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (82,"Shaman","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (101,"Fishing","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (121,"Blacksmithing","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (141,"Paladin","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (161,"Mage","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (162,"Rogue","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (181,"Alchemy","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (182,"Leatherworking","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (201,"Engineering","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (221,"Treasure Map","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (241,"Tournament","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (261,"Hunter","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (262,"Priest","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (263,"Druid","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (264,"Tailoring","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (284,"Special","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (304,"Cooking","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (324,"First Aid","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (344,"Legendary","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (364,"Darkmoon Faire","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (365,"Ahn\'Qiraj War","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (366,"Lunar Festival","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (367,"Reputation","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (368,"Invasion","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (369,"Midsummer","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (370,"Brewfest","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (371,"Inscription","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (372,"Death Knight","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (373,"Jewelcrafting","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (374,"Noblegarden","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (375,"Pilgrim\'s Bounty","","","","","","","","","","","","","","","",16712190);
INSERT INTO `questsort_dbc` VALUES (376,"Love is in the Air","","","","","","","","","","","","","","","",16712190);
/*!40000 ALTER TABLE `questsort_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:54:29
