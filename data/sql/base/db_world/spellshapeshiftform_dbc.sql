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
-- Table structure for table `spellshapeshiftform_dbc`
--

DROP TABLE IF EXISTS `spellshapeshiftform_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spellshapeshiftform_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `BonusActionBar` int NOT NULL DEFAULT '0',
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
  `Flags` int NOT NULL DEFAULT '0',
  `CreatureType` int NOT NULL DEFAULT '0',
  `AttackIconID` int NOT NULL DEFAULT '0',
  `CombatRoundTime` int NOT NULL DEFAULT '0',
  `CreatureDisplayID_1` int NOT NULL DEFAULT '0',
  `CreatureDisplayID_2` int NOT NULL DEFAULT '0',
  `CreatureDisplayID_3` int NOT NULL DEFAULT '0',
  `CreatureDisplayID_4` int NOT NULL DEFAULT '0',
  `PresetSpellID_1` int NOT NULL DEFAULT '0',
  `PresetSpellID_2` int NOT NULL DEFAULT '0',
  `PresetSpellID_3` int NOT NULL DEFAULT '0',
  `PresetSpellID_4` int NOT NULL DEFAULT '0',
  `PresetSpellID_5` int NOT NULL DEFAULT '0',
  `PresetSpellID_6` int NOT NULL DEFAULT '0',
  `PresetSpellID_7` int NOT NULL DEFAULT '0',
  `PresetSpellID_8` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellshapeshiftform_dbc`
--

LOCK TABLES `spellshapeshiftform_dbc` WRITE;
/*!40000 ALTER TABLE `spellshapeshiftform_dbc` DISABLE KEYS */;
INSERT INTO `spellshapeshiftform_dbc` VALUES (1,1,"Cat Form","","","","","","","","","","","","","","","",16712190,760,1,1534,1000,892,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (2,2,"Tree of Life Form","","","","","","","","","","","","","","","",16712190,2257,4,0,0,864,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (3,0,"Travel Form","","","","","","","","","","","","","","","",16712190,216,1,0,0,918,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (4,0,"Aquatic Form","","","","","","","","","","","","","","","",16712190,216,1,0,0,2428,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (5,3,"Bear Form","","","","","","","","","","","","","","","",16712190,728,1,496,2500,2281,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (6,0,"Ambient","","","","","","","","","","","","","","","",16712190,0,0,0,0,328,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (7,0,"Ghoul","","","","","","","","","","","","","","","",16712190,9689,6,0,0,25527,0,0,0,6603,47468,47481,47482,47480,0,47484,47496);
INSERT INTO `spellshapeshiftform_dbc` VALUES (8,3,"Dire Bear Form","","","","","","","","","","","","","","","",16712190,728,1,496,2500,2281,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (9,0,"Steve\'s Ghoul","","","","","","","","","","","","","","","",16712190,128,-1,0,0,24994,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (10,0,"Tharon\'ja Skeleton","","","","","","","","","","","","","","","",16712190,1034,6,0,0,9784,0,0,0,50799,49613,49609,49617,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (11,0,"Darkmoon - Test of Strength","","","","","","","","","","","","","","","",16712190,1226,-1,0,0,0,0,0,0,62022,62023,62024,62025,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (12,0,"BLB Player","","","","","","","","","","","","","","","",16712190,0,-1,0,0,0,0,0,0,44029,44752,44083,44010,44012,44817,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (13,2,"Shadow Dance","","","","","","","","","","","","","","","",16712190,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (14,0,"Creature - Bear","","","","","","","","","","","","","","","",16712190,0,1,0,0,2281,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (15,0,"Creature - Cat","","","","","","","","","","","","","","","",16712190,0,1,0,0,892,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (16,0,"Ghost Wolf","","","","","","","","","","","","","","","",16712190,216,1,0,0,4613,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (17,1,"Battle Stance","","","","","","","","","","","","","","","",16712190,7,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (18,2,"Defensive Stance","","","","","","","","","","","","","","","",16712190,7,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (19,3,"Berserker Stance","","","","","","","","","","","","","","","",16712190,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (20,0,"Test","","","","","","","","","","","","","","","",16712190,0,-1,0,0,0,0,0,0,6603,20577,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (21,0,"Zombie","","","","","","","","","","","","","","","",16712190,5150,6,0,0,26942,0,0,0,57596,51230,56560,43949,56528,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (22,0,"Metamorphosis","","","","","","","","","","","","","","","",16712190,216,3,0,0,25277,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (23,0,"","","","","","","","","","","","","","","","",16712188,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (24,0,"","","","","","","","","","","","","","","","",16712188,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (25,0,"Undead","","","","","","","","","","","","","","","",16712190,205,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (26,0,"Frenzy","","","","","","","","","","","","","","","",16712190,216,1,0,0,17170,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (27,0,"Flight Form, Epic","","","","","","","","","","","","","","","",16712190,8,1,0,0,21243,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (28,1,"Shadowform","","","","","","","","","","","","","","","",16712190,9,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (29,0,"Flight Form","","","","","","","","","","","","","","","",16712190,8,1,0,0,20857,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (30,1,"Stealth","","","","","","","","","","","","","","","",16712190,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (31,4,"Moonkin Form","","","","","","","","","","","","","","","",16712190,2753,-1,0,0,15374,15375,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellshapeshiftform_dbc` VALUES (32,0,"Spirit of Redemption","","","","","","","","","","","","","","","",16712190,16640,-1,0,0,16031,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `spellshapeshiftform_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 20:39:23
