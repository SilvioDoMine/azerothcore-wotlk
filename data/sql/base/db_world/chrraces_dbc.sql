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
-- Table structure for table `chrraces_dbc`
--

DROP TABLE IF EXISTS `chrraces_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chrraces_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `FactionID` int NOT NULL DEFAULT '0',
  `ExplorationSoundID` int NOT NULL DEFAULT '0',
  `MaleDisplayId` int NOT NULL DEFAULT '0',
  `FemaleDisplayId` int NOT NULL DEFAULT '0',
  `ClientPrefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BaseLanguage` int NOT NULL DEFAULT '0',
  `CreatureType` int NOT NULL DEFAULT '0',
  `ResSicknessSpellID` int NOT NULL DEFAULT '0',
  `SplashSoundID` int NOT NULL DEFAULT '0',
  `ClientFilestring` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CinematicSequenceID` int NOT NULL DEFAULT '0',
  `Alliance` int NOT NULL DEFAULT '0',
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
  `Name_Female_Lang_enUS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_enGB` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_koKR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_frFR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_deDE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_enCN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_zhCN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_enTW` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_zhTW` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_esES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_esMX` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_ruRU` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_ptPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_ptBR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_itIT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_Unk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Female_Lang_Mask` int unsigned NOT NULL DEFAULT '0',
  `Name_Male_Lang_enUS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_enGB` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_koKR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_frFR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_deDE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_enCN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_zhCN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_enTW` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_zhTW` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_esES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_esMX` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_ruRU` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_ptPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_ptBR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_itIT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_Unk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name_Male_Lang_Mask` int unsigned NOT NULL DEFAULT '0',
  `FacialHairCustomization_1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FacialHairCustomization_2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HairCustomization` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Required_Expansion` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chrraces_dbc`
--

LOCK TABLES `chrraces_dbc` WRITE;
/*!40000 ALTER TABLE `chrraces_dbc` DISABLE KEYS */;
INSERT INTO `chrraces_dbc` VALUES (1,12,1,4140,49,50,"Hu",7,7,15007,1096,"Human",81,0,"Human","","","","","","","","","","","","","","","",16712191,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"NORMAL","PIERCINGS","NORMAL",0);
INSERT INTO `chrraces_dbc` VALUES (2,12,2,4141,51,52,"Or",1,7,15007,1096,"Orc",21,1,"Orc","","","","","","","","","","","","","","","",16712191,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"NORMAL","PIERCINGS","NORMAL",0);
INSERT INTO `chrraces_dbc` VALUES (3,12,3,4147,53,54,"Dw",7,7,15007,1090,"Dwarf",41,0,"Dwarf","","","","","","","","","","","","","","","",16712191,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"NORMAL","PIERCINGS","NORMAL",0);
INSERT INTO `chrraces_dbc` VALUES (4,4,4,4145,55,56,"Ni",7,7,15007,1096,"NightElf",61,0,"Night Elf","","","","","","","","","","","","","","","",16712191,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"NORMAL","MARKINGS","NORMAL",0);
INSERT INTO `chrraces_dbc` VALUES (5,12,5,4142,57,58,"Sc",1,7,15007,1096,"Scourge",2,1,"Undead","","","","","","","","","","","","","","","",16712191,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"FEATURES","FEATURES","NORMAL",0);
INSERT INTO `chrraces_dbc` VALUES (6,14,6,4143,59,60,"Ta",1,7,15007,1096,"Tauren",141,1,"Tauren","","","","","","","","","","","","","","","",16712191,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"NORMAL","HAIR","HORNS",0);
INSERT INTO `chrraces_dbc` VALUES (7,12,115,4146,1563,1564,"Gn",7,7,15007,1096,"Gnome",101,0,"Gnome","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"NORMAL","EARRINGS","NORMAL",0);
INSERT INTO `chrraces_dbc` VALUES (8,14,116,4144,1478,1479,"Tr",1,7,15007,1096,"Troll",121,1,"Troll","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"TUSKS","TUSKS","NORMAL",0);
INSERT INTO `chrraces_dbc` VALUES (9,1,1,0,6894,6895,"Go",7,7,15007,1096,"Goblin",0,2,"Goblin","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"NORMAL","NONE","NORMAL",0);
INSERT INTO `chrraces_dbc` VALUES (10,12,1610,4142,15476,15475,"Be",1,7,15007,1096,"BloodElf",162,1,"Blood Elf","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"NORMAL","EARRINGS","NORMAL",1);
INSERT INTO `chrraces_dbc` VALUES (11,14,1629,4140,16125,16126,"Dr",7,7,15007,1096,"Draenei",163,0,"Draenei","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"NORMAL","HORNS","NORMAL",1);
INSERT INTO `chrraces_dbc` VALUES (12,5,1,0,16981,16980,"Fo",7,7,15007,1096,"FelOrc",0,2,"Fel Orc","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"NORMAL","NORMAL","NORMAL",0);
INSERT INTO `chrraces_dbc` VALUES (13,1,1,0,17402,17403,"Na",7,7,15007,1096,"Naga_",0,2,"Naga","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"Normal","Normal","Normal",0);
INSERT INTO `chrraces_dbc` VALUES (14,5,1,0,17576,17577,"Br",7,7,15007,1096,"Broken",0,2,"Broken","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"Normal","Normal","Normal",0);
INSERT INTO `chrraces_dbc` VALUES (15,1,1,0,17578,17579,"Sk",7,7,15007,1096,"Skeleton",0,2,"Skeleton","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"Normal","Normal","Normal",0);
INSERT INTO `chrraces_dbc` VALUES (16,9,1,0,21685,21686,"Vr",7,7,15007,1096,"Vrykul",0,2,"Vrykul","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"Normal","Normal","Normal",0);
INSERT INTO `chrraces_dbc` VALUES (17,1,1,0,21780,21781,"Tu",7,7,15007,1096,"Tuskarr",0,2,"Tuskarr","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"Normal","Normal","Normal",0);
INSERT INTO `chrraces_dbc` VALUES (18,15,1,0,21963,21964,"Ft",7,7,15007,1096,"ForestTroll",0,2,"Forest Troll","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"TUSKS","TUSKS","Normal",0);
INSERT INTO `chrraces_dbc` VALUES (19,5,1,0,26316,26317,"Wt",7,7,15007,1096,"Taunka",0,2,"Taunka","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"Normal","Normal","Normal",0);
INSERT INTO `chrraces_dbc` VALUES (20,5,1,0,26871,26872,"NS",7,7,15007,1096,"NorthrendSkeleton",0,2,"Northrend Skeleton","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"Normal","Normal","Normal",0);
INSERT INTO `chrraces_dbc` VALUES (21,5,1,0,26873,26874,"It",7,7,15007,1096,"IceTroll",0,2,"Ice Troll","","","","","","","","","","","","","","","",16712190,"","","","","","","","","","","","","","","","",16712172,"","","","","","","","","","","","","","","","",16712172,"Normal","Normal","Normal",0);
/*!40000 ALTER TABLE `chrraces_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:53:40
