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
-- Table structure for table `talenttab_dbc`
--

DROP TABLE IF EXISTS `talenttab_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talenttab_dbc` (
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
  `SpellIconID` int NOT NULL DEFAULT '0',
  `RaceMask` int NOT NULL DEFAULT '0',
  `ClassMask` int NOT NULL DEFAULT '0',
  `PetTalentMask` int NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `BackgroundFile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talenttab_dbc`
--

LOCK TABLES `talenttab_dbc` WRITE;
/*!40000 ALTER TABLE `talenttab_dbc` DISABLE KEYS */;
INSERT INTO `talenttab_dbc` VALUES (81,"Arcane","","","","","","","","","","","","","","","",16712190,125,2047,128,0,0,"MageArcane");
INSERT INTO `talenttab_dbc` VALUES (161,"Arms","","","","","","","","","","","","","","","",16712190,514,2047,1,0,0,"WarriorArms");
INSERT INTO `talenttab_dbc` VALUES (182,"Assassination","","","","","","","","","","","","","","","",16712190,514,2047,8,0,0,"RogueAssassination");
INSERT INTO `talenttab_dbc` VALUES (201,"Discipline","","","","","","","","","","","","","","","",16712190,685,2047,16,0,0,"PriestDiscipline");
INSERT INTO `talenttab_dbc` VALUES (261,"Elemental","","","","","","","","","","","","","","","",16712190,62,2047,64,0,0,"ShamanElementalCombat");
INSERT INTO `talenttab_dbc` VALUES (283,"Balance","","","","","","","","","","","","","","","",16712190,225,2047,1024,0,0,"DruidBalance");
INSERT INTO `talenttab_dbc` VALUES (302,"Affliction","","","","","","","","","","","","","","","",16712190,88,2047,256,0,0,"WarlockCurses");
INSERT INTO `talenttab_dbc` VALUES (361,"Beast Mastery","","","","","","","","","","","","","","","",16712190,255,2047,4,0,0,"HunterBeastMastery");
INSERT INTO `talenttab_dbc` VALUES (382,"Holy","","","","","","","","","","","","","","","",16712190,70,2047,2,0,0,"PaladinHoly");
INSERT INTO `talenttab_dbc` VALUES (398,"Blood","","","","","","","","","","","","","","","",16712190,2636,-260097,32,0,0,"DeathKnightBlood");
INSERT INTO `talenttab_dbc` VALUES (409,"Tenacity","","","","","","","","","","","","","","","",16712190,1559,0,0,2,0,"HunterPetTenacity");
INSERT INTO `talenttab_dbc` VALUES (410,"Ferocity","","","","","","","","","","","","","","","",16712190,496,0,0,1,0,"HunterPetFerocity");
INSERT INTO `talenttab_dbc` VALUES (411,"Cunning","","","","","","","","","","","","","","","",16712190,2223,0,0,4,0,"HunterPetCunning");
INSERT INTO `talenttab_dbc` VALUES (41,"Fire","","","","","","","","","","","","","","","",16712190,183,2047,128,0,1,"MageFire");
INSERT INTO `talenttab_dbc` VALUES (164,"Fury","","","","","","","","","","","","","","","",16712190,561,2047,1,0,1,"WarriorFury");
INSERT INTO `talenttab_dbc` VALUES (181,"Combat","","","","","","","","","","","","","","","",16712190,243,2047,8,0,1,"RogueCombat");
INSERT INTO `talenttab_dbc` VALUES (202,"Holy","","","","","","","","","","","","","","","",16712190,2873,2047,16,0,1,"PriestHoly");
INSERT INTO `talenttab_dbc` VALUES (263,"Enhancement","","","","","","","","","","","","","","","",16712190,19,2047,64,0,1,"ShamanEnhancement");
INSERT INTO `talenttab_dbc` VALUES (281,"Feral Combat","","","","","","","","","","","","","","","",16712190,107,2047,1024,0,1,"DruidFeralCombat");
INSERT INTO `talenttab_dbc` VALUES (303,"Demonology","","","","","","","","","","","","","","","",16712190,90,2047,256,0,1,"WarlockSummoning");
INSERT INTO `talenttab_dbc` VALUES (363,"Marksmanship","","","","","","","","","","","","","","","",16712190,126,2047,4,0,1,"HunterMarksmanship");
INSERT INTO `talenttab_dbc` VALUES (383,"Protection","","","","","","","","","","","","","","","",16712190,291,2047,2,0,1,"PaladinProtection");
INSERT INTO `talenttab_dbc` VALUES (399,"Frost","","","","","","","","","","","","","","","",16712190,2632,2047,32,0,1,"DeathKnightFrost");
INSERT INTO `talenttab_dbc` VALUES (61,"Frost","","","","","","","","","","","","","","","",16712190,188,2047,128,0,2,"MageFrost");
INSERT INTO `talenttab_dbc` VALUES (163,"Protection","","","","","","","","","","","","","","","",16712190,1463,2047,1,0,2,"WarriorProtection");
INSERT INTO `talenttab_dbc` VALUES (183,"Subtlety","","","","","","","","","","","","","","","",16712190,250,2047,8,0,2,"RogueSubtlety");
INSERT INTO `talenttab_dbc` VALUES (203,"Shadow","","","","","","","","","","","","","","","",16712190,234,2047,16,0,2,"PriestShadow");
INSERT INTO `talenttab_dbc` VALUES (262,"Restoration","","","","","","","","","","","","","","","",16712190,13,2047,64,0,2,"ShamanRestoration");
INSERT INTO `talenttab_dbc` VALUES (282,"Restoration","","","","","","","","","","","","","","","",16712190,962,2047,1024,0,2,"DruidRestoration");
INSERT INTO `talenttab_dbc` VALUES (301,"Destruction","","","","","","","","","","","","","","","",16712190,547,2047,256,0,2,"WarlockDestruction");
INSERT INTO `talenttab_dbc` VALUES (362,"Survival","","","","","","","","","","","","","","","",16712190,257,2047,4,0,2,"HunterSurvival");
INSERT INTO `talenttab_dbc` VALUES (381,"Retribution","","","","","","","","","","","","","","","",16712190,555,2047,2,0,2,"PaladinCombat");
INSERT INTO `talenttab_dbc` VALUES (400,"Unholy","","","","","","","","","","","","","","","",16712190,2633,2047,32,0,2,"DeathKnightUnholy");
/*!40000 ALTER TABLE `talenttab_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 20:39:25
