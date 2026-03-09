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
-- Table structure for table `totemcategory_dbc`
--

DROP TABLE IF EXISTS `totemcategory_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `totemcategory_dbc` (
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
  `TotemCategoryType` int NOT NULL DEFAULT '0',
  `TotemCategoryMask` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totemcategory_dbc`
--

LOCK TABLES `totemcategory_dbc` WRITE;
/*!40000 ALTER TABLE `totemcategory_dbc` DISABLE KEYS */;
INSERT INTO `totemcategory_dbc` VALUES (1,"Skinning Knife (OLD)","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `totemcategory_dbc` VALUES (2,"Earth Totem","","","","","","","","","","","","","","","",16712190,2,1);
INSERT INTO `totemcategory_dbc` VALUES (3,"Air Totem","","","","","","","","","","","","","","","",16712190,2,2);
INSERT INTO `totemcategory_dbc` VALUES (4,"Fire Totem","","","","","","","","","","","","","","","",16712190,2,4);
INSERT INTO `totemcategory_dbc` VALUES (5,"Water Totem","","","","","","","","","","","","","","","",16712190,2,8);
INSERT INTO `totemcategory_dbc` VALUES (6,"Runed Copper Rod","","","","","","","","","","","","","","","",16712190,3,1);
INSERT INTO `totemcategory_dbc` VALUES (7,"Runed Silver Rod","","","","","","","","","","","","","","","",16712190,3,3);
INSERT INTO `totemcategory_dbc` VALUES (8,"Runed Golden Rod","","","","","","","","","","","","","","","",16712190,3,7);
INSERT INTO `totemcategory_dbc` VALUES (9,"Runed Truesilver Rod","","","","","","","","","","","","","","","",16712190,3,15);
INSERT INTO `totemcategory_dbc` VALUES (10,"Runed Arcanite Rod","","","","","","","","","","","","","","","",16712190,3,31);
INSERT INTO `totemcategory_dbc` VALUES (11,"Mining Pick (OLD)","","","","","","","","","","","","","","","",16712190,21,1);
INSERT INTO `totemcategory_dbc` VALUES (12,"Philosopher\'s Stone","","","","","","","","","","","","","","","",16712190,22,1);
INSERT INTO `totemcategory_dbc` VALUES (13,"Blacksmith Hammer (OLD)","","","","","","","","","","","","","","","",16712190,23,1);
INSERT INTO `totemcategory_dbc` VALUES (14,"Arclight Spanner","","","","","","","","","","","","","","","",16712190,24,1);
INSERT INTO `totemcategory_dbc` VALUES (15,"Gyromatic Micro-Adjustor","","","","","","","","","","","","","","","",16712190,24,2);
INSERT INTO `totemcategory_dbc` VALUES (21,"Master Totem","","","","","","","","","","","","","","","",16712190,2,15);
INSERT INTO `totemcategory_dbc` VALUES (41,"Runed Fel Iron Rod","","","","","","","","","","","","","","","",16712190,3,63);
INSERT INTO `totemcategory_dbc` VALUES (62,"Runed Adamantite Rod","","","","","","","","","","","","","","","",16712190,3,127);
INSERT INTO `totemcategory_dbc` VALUES (63,"Runed Eternium Rod","","","","","","","","","","","","","","","",16712190,3,255);
INSERT INTO `totemcategory_dbc` VALUES (81,"Hollow Quill","","","","","","","","","","","","","","","",16712190,22,4);
INSERT INTO `totemcategory_dbc` VALUES (101,"Runed Azurite Rod","","","","","","","","","","","","","","","",16712190,3,511);
INSERT INTO `totemcategory_dbc` VALUES (121,"Virtuoso Inking Set","","","","","","","","","","","","","","","",16712190,24,-2147483648);
INSERT INTO `totemcategory_dbc` VALUES (141,"Drums","","","","","","","","","","","","","","","",16712190,24,1073741824);
INSERT INTO `totemcategory_dbc` VALUES (161,"Gnomish Army Knife","","","","","","","","","","","","","","","",16712190,24,63);
INSERT INTO `totemcategory_dbc` VALUES (162,"Blacksmith Hammer","","","","","","","","","","","","","","","",16712190,24,4);
INSERT INTO `totemcategory_dbc` VALUES (165,"Mining Pick","","","","","","","","","","","","","","","",16712190,24,8);
INSERT INTO `totemcategory_dbc` VALUES (166,"Skinning Knife","","","","","","","","","","","","","","","",16712190,24,16);
INSERT INTO `totemcategory_dbc` VALUES (167,"Hammer Pick","","","","","","","","","","","","","","","",16712190,24,12);
INSERT INTO `totemcategory_dbc` VALUES (168,"Bladed Pickaxe","","","","","","","","","","","","","","","",16712190,24,24);
INSERT INTO `totemcategory_dbc` VALUES (169,"Flint and Tinder","","","","","","","","","","","","","","","",16712190,24,32);
INSERT INTO `totemcategory_dbc` VALUES (189,"Runed Cobalt Rod (DO NOT USE)","","","","","","","","","","","","","","","",16712190,3,511);
INSERT INTO `totemcategory_dbc` VALUES (190,"Runed Titanium Rod","","","","","","","","","","","","","","","",16712190,3,1023);
/*!40000 ALTER TABLE `totemcategory_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:54:44
