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
-- Table structure for table `mapdifficulty_dbc`
--

DROP TABLE IF EXISTS `mapdifficulty_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mapdifficulty_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `MapID` int NOT NULL DEFAULT '0',
  `Difficulty` int NOT NULL DEFAULT '0',
  `Message_Lang_enUS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_enGB` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_koKR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_frFR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_deDE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_enCN` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_zhCN` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_enTW` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_zhTW` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_esES` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_esMX` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_ruRU` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_ptPT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_ptBR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_itIT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_Unk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Message_Lang_Mask` int unsigned NOT NULL DEFAULT '0',
  `RaidDuration` int NOT NULL DEFAULT '0',
  `MaxPlayers` int NOT NULL DEFAULT '0',
  `Difficultystring` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapdifficulty_dbc`
--

LOCK TABLES `mapdifficulty_dbc` WRITE;
/*!40000 ALTER TABLE `mapdifficulty_dbc` DISABLE KEYS */;
INSERT INTO `mapdifficulty_dbc` VALUES (1,0,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (2,1,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (3,13,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (4,25,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (5,29,0,"","","","","","","","","","","","","","","","",16712188,0,10,"");
INSERT INTO `mapdifficulty_dbc` VALUES (6,30,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (126,30,1,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (163,30,2,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (522,30,3,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (7,33,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (8,34,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (9,35,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (10,36,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (11,37,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (12,42,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (13,43,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (14,44,0,"","","","","","","","","","","","","","","","",16712188,0,10,"");
INSERT INTO `mapdifficulty_dbc` VALUES (15,47,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (16,48,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (17,70,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (18,90,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (19,109,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (20,129,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (21,169,0,"","","","","","","","","","","","","","","","",16712188,0,40,"RAID_DIFFICULTY_40PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (22,189,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (23,209,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (24,229,0,"","","","","","","","","","","","","","","","",16712188,0,15,"");
INSERT INTO `mapdifficulty_dbc` VALUES (25,230,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (26,249,0,"You must be level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (323,249,1,"You must be level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (27,269,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (127,269,1,"Heroic Difficulty requires the Key of Time.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (28,289,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (29,309,0,"","","","","","","","","","","","","","","","",16712188,259200,20,"RAID_DIFFICULTY_20PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (30,329,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (31,349,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (32,369,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (33,389,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (34,409,0,"","","","","","","","","","","","","","","","",16712188,604800,40,"RAID_DIFFICULTY_40PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (35,429,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (36,449,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (37,450,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (38,451,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (39,469,0,"","","","","","","","","","","","","","","","",16712188,604800,40,"RAID_DIFFICULTY_40PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (40,489,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (41,509,0,"","","","","","","","","","","","","","","","",16712188,259200,20,"RAID_DIFFICULTY_20PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (42,529,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (43,530,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (44,531,0,"","","","","","","","","","","","","","","","",16712188,604800,40,"RAID_DIFFICULTY_40PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (45,532,0,"","","","","","","","","","","","","","","","",16712188,604800,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (46,533,0,"You must be level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (128,533,1,"You must be level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (47,534,0,"","","","","","","","","","","","","","","","",16712188,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (48,540,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (129,540,1,"Heroic Difficulty requires the Flamewrought Key.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (49,542,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (130,542,1,"Heroic Difficulty requires the Flamewrought Key.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (50,543,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (131,543,1,"Heroic Difficulty requires the Flamewrought Key.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (51,544,0,"","","","","","","","","","","","","","","","",16712188,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (52,545,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (132,545,1,"Heroic Difficulty requires the Reservoir Key.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (53,546,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (133,546,1,"Heroic Difficulty requires the Reservoir Key.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (54,547,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (134,547,1,"Heroic Difficulty requires the Reservoir Key.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (55,548,0,"","","","","","","","","","","","","","","","",16712188,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (56,550,0,"","","","","","","","","","","","","","","","",16712188,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (57,552,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (135,552,1,"Heroic Difficulty requires the Warpforged Key.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (58,553,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (136,553,1,"Heroic Difficulty requires the Warpforged Key.","","","","","","","","","","","","","","","",16712190,86400,0,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (59,554,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (137,554,1,"Heroic Difficulty requires the Warpforged Key.","","","","","","","","","","","","","","","",16712190,86400,0,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (60,555,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (138,555,1,"Heroic Difficulty requires the Auchenai Key.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (61,556,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (139,556,1,"Heroic Difficulty requires the Auchenai Key.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (62,557,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (140,557,1,"Heroic Difficulty requires the Auchenai Key.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (63,558,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (141,558,1,"Heroic Difficulty requires the Auchenai Key.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (64,559,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (65,560,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (142,560,1,"Heroic Difficulty requires the Key of Time.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (66,562,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (67,564,0,"","","","","","","","","","","","","","","","",16712188,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (68,565,0,"","","","","","","","","","","","","","","","",16712188,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (69,566,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (70,568,0,"","","","","","","","","","","","","","","","",16712188,259200,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (71,571,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (72,572,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (73,573,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (74,574,0,"You must be at least level 65 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (143,574,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (75,575,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (144,575,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (76,576,0,"You must be at least level 66 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (145,576,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (77,578,0,"You must be at least level 75 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (146,578,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (78,580,0,"","","","","","","","","","","","","","","","",16712188,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (79,582,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (80,584,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (81,585,0,"","","","","","","","","","","","","","","","",16712188,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (147,585,1,"Heroic Difficulty requires completion of the \"Hard to Kill\" quest.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (82,586,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (83,587,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (84,588,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (85,589,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (86,590,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (87,591,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (88,592,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (89,593,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (90,594,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (91,595,0,"You must be at least level 75 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (148,595,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (92,596,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (93,597,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (94,598,0,"","","","","","","","","","","","","","","","",16712188,0,5,"");
INSERT INTO `mapdifficulty_dbc` VALUES (149,598,1,"Heroic Difficulty requires the Sunforged Key[PH].","","","","","","","","","","","","","","","",16712190,86400,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (95,599,0,"You must be at least level 72 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (150,599,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (96,600,0,"You must be at least level 69 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (151,600,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (97,601,0,"You must be at least level 67 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (152,601,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (98,602,0,"You must be at least level 75 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (153,602,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (99,603,0,"You must be level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (154,603,1,"You must be level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (100,604,0,"You must be at least level 71 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (155,604,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (101,605,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (102,606,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (103,607,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (301,607,1,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (104,608,0,"You must be at least level 70 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (156,608,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (105,609,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (106,610,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (107,612,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (108,613,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (109,614,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (110,615,0,"You must be level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (157,615,1,"You must be level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (111,616,0,"You must be at least level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (158,616,1,"You must be at least level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (112,617,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (113,618,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (114,619,0,"You must be at least level 68 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (159,619,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (115,620,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (116,621,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (117,622,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (118,623,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (119,624,0,"You must be at least level 80, in control of Wintergrasp and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (160,624,1,"You must be at least level 80, in control of Wintergrasp and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (120,628,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (281,628,1,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (485,631,0,"You must be at least level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (486,631,1,"You must be at least level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (487,631,2,"You must have defeated The Lich King in the 10 Player raid before attempting 10 Player Heroic difficulty.","","","","","","","","","","","","","","","",16712190,604800,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (488,631,3,"You must have defeated The Lich King in the 25 Player raid before attempting 25 Player Heroic difficulty.","","","","","","","","","","","","","","","",16712190,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (481,632,0,"You must be at least level 75 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (482,632,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (121,641,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (122,642,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (123,647,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (124,649,0,"You must be at least level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (161,649,1,"You must be at least level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (221,649,2,"You must be at least level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,10,"RAID_DIFFICULTY_10PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (222,649,3,"You must be at least level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,25,"RAID_DIFFICULTY_25PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (125,650,0,"You must be at least level 75 to enter.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (162,650,1,"Heroic Difficulty requires you to be level 80.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (483,658,0,"You must complete the quest \"Echoes of Tortured Souls\" before entering the Pit of Saron.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (484,658,1,"You must complete the quest \"Echoes of Tortured Souls\" and be level 80 before entering the Heroic difficulty of the Pit of Saron.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (341,668,0,"You must complete the quest \"Deliverance from the Pit\" before entering the Halls of Reflection.","","","","","","","","","","","","","","","",16712190,0,5,"DUNGEON_DIFFICULTY_5PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (342,668,1,"You must complete the quest \"Deliverance from the Pit\" and be level 80 before entering the Heroic difficulty of the Halls of Reflection.","","","","","","","","","","","","","","","",16712190,86400,5,"DUNGEON_DIFFICULTY_5PLAYER_HEROIC");
INSERT INTO `mapdifficulty_dbc` VALUES (642,712,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (641,713,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (701,718,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (744,723,0,"","","","","","","","","","","","","","","","",16712188,0,0,"");
INSERT INTO `mapdifficulty_dbc` VALUES (750,724,0,"You must be level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (751,724,1,"You must be level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,25,"RAID_DIFFICULTY_25PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (752,724,2,"You must be level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,10,"RAID_DIFFICULTY_10PLAYER");
INSERT INTO `mapdifficulty_dbc` VALUES (753,724,3,"You must be level 80 and in a raid group to enter.","","","","","","","","","","","","","","","",16712190,604800,25,"RAID_DIFFICULTY_25PLAYER");
/*!40000 ALTER TABLE `mapdifficulty_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:54:13
