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
-- Table structure for table `creaturefamily_dbc`
--

DROP TABLE IF EXISTS `creaturefamily_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creaturefamily_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `MinScale` float NOT NULL DEFAULT '0',
  `MinScaleLevel` int NOT NULL DEFAULT '0',
  `MaxScale` float NOT NULL DEFAULT '0',
  `MaxScaleLevel` int NOT NULL DEFAULT '0',
  `SkillLine_1` int NOT NULL DEFAULT '0',
  `SkillLine_2` int NOT NULL DEFAULT '0',
  `PetFoodMask` int NOT NULL DEFAULT '0',
  `PetTalentType` int NOT NULL DEFAULT '0',
  `CategoryEnumID` int NOT NULL DEFAULT '0',
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
  `IconFile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creaturefamily_dbc`
--

LOCK TABLES `creaturefamily_dbc` WRITE;
/*!40000 ALTER TABLE `creaturefamily_dbc` DISABLE KEYS */;
INSERT INTO `creaturefamily_dbc` VALUES (1,0.7,1,1,60,208,270,1,0,23,"Wolf","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Wolf");
INSERT INTO `creaturefamily_dbc` VALUES (2,0.7,1,1.1,60,209,270,3,0,5,"Cat","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Cat");
INSERT INTO `creaturefamily_dbc` VALUES (3,0.4,1,0.6,60,203,270,1,2,17,"Spider","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Spider");
INSERT INTO `creaturefamily_dbc` VALUES (4,0.6,1,1,60,210,270,63,1,1,"Bear","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Bear");
INSERT INTO `creaturefamily_dbc` VALUES (5,0.6,1,1,60,211,270,63,1,3,"Boar","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Boar");
INSERT INTO `creaturefamily_dbc` VALUES (6,0.4,1,0.6,60,212,270,3,1,7,"Crocolisk","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Crocolisk");
INSERT INTO `creaturefamily_dbc` VALUES (7,0.5,1,0.9,60,213,270,3,0,4,"Carrion Bird","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Vulture");
INSERT INTO `creaturefamily_dbc` VALUES (8,0.7,1,1.4,60,214,270,58,1,6,"Crab","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Crab");
INSERT INTO `creaturefamily_dbc` VALUES (9,0.7,1,1,60,215,270,56,1,9,"Gorilla","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Gorilla");
INSERT INTO `creaturefamily_dbc` VALUES (11,0.5,1,0.8,60,217,270,1,0,13,"Raptor","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Raptor");
INSERT INTO `creaturefamily_dbc` VALUES (12,0.5,1,0.8,60,218,270,60,0,19,"Tallstrider","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_TallStrider");
INSERT INTO `creaturefamily_dbc` VALUES (15,0.7,1,0.7,60,189,0,0,-1,-1,"Felhunter","","","","","","","","","","","","","","","",16712190,"");
INSERT INTO `creaturefamily_dbc` VALUES (16,0.8,1,0.8,60,204,0,0,-1,-1,"Voidwalker","","","","","","","","","","","","","","","",16712190,"");
INSERT INTO `creaturefamily_dbc` VALUES (17,1,1,1,60,205,0,0,-1,-1,"Succubus","","","","","","","","","","","","","","","",16712190,"");
INSERT INTO `creaturefamily_dbc` VALUES (19,1,1,1,60,207,0,0,-1,-1,"Doomguard","","","","","","","","","","","","","","","",16712190,"");
INSERT INTO `creaturefamily_dbc` VALUES (20,0.7,1,1,60,236,270,1,1,15,"Scorpid","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Scorpid");
INSERT INTO `creaturefamily_dbc` VALUES (21,0.5,1,0.72,60,251,270,58,1,21,"Turtle","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Turtle");
INSERT INTO `creaturefamily_dbc` VALUES (23,0.5,1,0.5,60,188,0,0,-1,-1,"Imp","","","","","","","","","","","","","","","",16712190,"");
INSERT INTO `creaturefamily_dbc` VALUES (24,0.4,1,0.63,60,653,270,49,2,0,"Bat","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Bat");
INSERT INTO `creaturefamily_dbc` VALUES (25,0.7,1,0.9,60,654,270,1,0,10,"Hyena","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Hyena");
INSERT INTO `creaturefamily_dbc` VALUES (26,0.5,1,0.8,60,655,270,3,2,2,"Bird of Prey","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Owl");
INSERT INTO `creaturefamily_dbc` VALUES (27,0.5,1,0.7,60,656,270,14,2,22,"Wind Serpent","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_WindSerpent");
INSERT INTO `creaturefamily_dbc` VALUES (28,0,0,0,0,758,0,0,-1,-1,"Remote Control","","","","","","","","","","","","","","","",16712190,"");
INSERT INTO `creaturefamily_dbc` VALUES (29,0.9,1,0.9,60,761,0,0,-1,-1,"Felguard","","","","","","","","","","","","","","","",16712190,"");
INSERT INTO `creaturefamily_dbc` VALUES (30,0.35,1,0.65,60,763,270,35,2,8,"Dragonhawk","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_DragonHawk");
INSERT INTO `creaturefamily_dbc` VALUES (31,0.65,1,0.9,60,767,270,1,2,14,"Ravager","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Ravager");
INSERT INTO `creaturefamily_dbc` VALUES (32,0.45,1,0.6,60,766,270,34,1,21,"Warp Stalker","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_WarpStalker");
INSERT INTO `creaturefamily_dbc` VALUES (33,0.6,1,0.9,60,765,270,60,2,18,"Sporebat","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Sporebat");
INSERT INTO `creaturefamily_dbc` VALUES (34,0.35,1,0.55,60,764,270,17,2,12,"Nether Ray","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_NetherRay");
INSERT INTO `creaturefamily_dbc` VALUES (35,0.6,1,0.8,60,768,270,1,2,16,"Serpent","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Spell_Nature_GuardianWard");
INSERT INTO `creaturefamily_dbc` VALUES (37,0.35,1,0.65,60,775,270,60,0,11,"Moth","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Moth");
INSERT INTO `creaturefamily_dbc` VALUES (38,0.5,1,0.63,60,780,270,1,2,24,"Chimaera","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Chimera");
INSERT INTO `creaturefamily_dbc` VALUES (39,0.3,1,0.5,60,781,270,1,0,25,"Devilsaur","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Devilsaur");
INSERT INTO `creaturefamily_dbc` VALUES (40,1,1,1,80,782,0,0,-1,26,"Ghoul","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Creature_Cursed_05");
INSERT INTO `creaturefamily_dbc` VALUES (41,0.7,1,1,60,783,270,17,2,63,"Silithid","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Silithid");
INSERT INTO `creaturefamily_dbc` VALUES (42,0.7,1,1,60,784,270,28,1,62,"Worm","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Worm");
INSERT INTO `creaturefamily_dbc` VALUES (43,0.35,1,0.56,60,786,270,60,1,61,"Rhino","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Rhino");
INSERT INTO `creaturefamily_dbc` VALUES (44,0.4,1,0.6,60,785,270,60,0,60,"Wasp","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_Wasp");
INSERT INTO `creaturefamily_dbc` VALUES (45,0.3,1,0.5,60,787,270,1,0,59,"Core Hound","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Hunter_Pet_CoreHound");
INSERT INTO `creaturefamily_dbc` VALUES (46,0.7,1,1.1,60,788,270,3,0,58,"Spirit Beast","","","","","","","","","","","","","","","",16712190,"Interface\Icons\Ability_Druid_PrimalPrecision");
/*!40000 ALTER TABLE `creaturefamily_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 20:38:28
