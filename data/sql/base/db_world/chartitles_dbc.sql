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
-- Table structure for table `chartitles_dbc`
--

DROP TABLE IF EXISTS `chartitles_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chartitles_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `Condition_ID` int NOT NULL DEFAULT '0',
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
  `Name1_Lang_enUS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_enGB` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_koKR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_frFR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_deDE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_enCN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_zhCN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_enTW` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_zhTW` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_esES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_esMX` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_ruRU` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_ptPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_ptBR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_itIT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_Unk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name1_Lang_Mask` int unsigned NOT NULL DEFAULT '0',
  `Mask_ID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chartitles_dbc`
--

LOCK TABLES `chartitles_dbc` WRITE;
/*!40000 ALTER TABLE `chartitles_dbc` DISABLE KEYS */;
INSERT INTO `chartitles_dbc` VALUES (1,5879,"Private %s","","","","","","","","","","","","","","","",16712190,"Private %s","","","","","","","","","","","","","","","",16712190,1);
INSERT INTO `chartitles_dbc` VALUES (2,5880,"Corporal %s","","","","","","","","","","","","","","","",16712190,"Corporal %s","","","","","","","","","","","","","","","",16712190,2);
INSERT INTO `chartitles_dbc` VALUES (3,5881,"Sergeant %s","","","","","","","","","","","","","","","",16712190,"Sergeant %s","","","","","","","","","","","","","","","",16712190,3);
INSERT INTO `chartitles_dbc` VALUES (4,5882,"Master Sergeant %s","","","","","","","","","","","","","","","",16712190,"Master Sergeant %s","","","","","","","","","","","","","","","",16712190,4);
INSERT INTO `chartitles_dbc` VALUES (5,5883,"Sergeant Major %s","","","","","","","","","","","","","","","",16712190,"Sergeant Major %s","","","","","","","","","","","","","","","",16712190,5);
INSERT INTO `chartitles_dbc` VALUES (6,5884,"Knight %s","","","","","","","","","","","","","","","",16712190,"Knight %s","","","","","","","","","","","","","","","",16712190,6);
INSERT INTO `chartitles_dbc` VALUES (7,5885,"Knight-Lieutenant %s","","","","","","","","","","","","","","","",16712190,"Knight-Lieutenant %s","","","","","","","","","","","","","","","",16712190,7);
INSERT INTO `chartitles_dbc` VALUES (8,5886,"Knight-Captain %s","","","","","","","","","","","","","","","",16712190,"Knight-Captain %s","","","","","","","","","","","","","","","",16712190,8);
INSERT INTO `chartitles_dbc` VALUES (9,5887,"Knight-Champion %s","","","","","","","","","","","","","","","",16712190,"Knight-Champion %s","","","","","","","","","","","","","","","",16712190,9);
INSERT INTO `chartitles_dbc` VALUES (10,5888,"Lieutenant Commander %s","","","","","","","","","","","","","","","",16712190,"Lieutenant Commander %s","","","","","","","","","","","","","","","",16712190,10);
INSERT INTO `chartitles_dbc` VALUES (11,5889,"Commander %s","","","","","","","","","","","","","","","",16712190,"Commander %s","","","","","","","","","","","","","","","",16712190,11);
INSERT INTO `chartitles_dbc` VALUES (12,5890,"Marshal %s","","","","","","","","","","","","","","","",16712190,"Marshal %s","","","","","","","","","","","","","","","",16712190,12);
INSERT INTO `chartitles_dbc` VALUES (13,5891,"Field Marshal %s","","","","","","","","","","","","","","","",16712190,"Field Marshal %s","","","","","","","","","","","","","","","",16712190,13);
INSERT INTO `chartitles_dbc` VALUES (14,5892,"Grand Marshal %s","","","","","","","","","","","","","","","",16712190,"Grand Marshal %s","","","","","","","","","","","","","","","",16712190,14);
INSERT INTO `chartitles_dbc` VALUES (15,5893,"Scout %s","","","","","","","","","","","","","","","",16712190,"Scout %s","","","","","","","","","","","","","","","",16712190,15);
INSERT INTO `chartitles_dbc` VALUES (16,5894,"Grunt %s","","","","","","","","","","","","","","","",16712190,"Grunt %s","","","","","","","","","","","","","","","",16712190,16);
INSERT INTO `chartitles_dbc` VALUES (17,5895,"Sergeant %s","","","","","","","","","","","","","","","",16712190,"Sergeant %s","","","","","","","","","","","","","","","",16712190,17);
INSERT INTO `chartitles_dbc` VALUES (18,5896,"Senior Sergeant %s","","","","","","","","","","","","","","","",16712190,"Senior Sergeant %s","","","","","","","","","","","","","","","",16712190,18);
INSERT INTO `chartitles_dbc` VALUES (19,5897,"First Sergeant %s","","","","","","","","","","","","","","","",16712190,"First Sergeant %s","","","","","","","","","","","","","","","",16712190,19);
INSERT INTO `chartitles_dbc` VALUES (20,5898,"Stone Guard %s","","","","","","","","","","","","","","","",16712190,"Stone Guard %s","","","","","","","","","","","","","","","",16712190,20);
INSERT INTO `chartitles_dbc` VALUES (21,5899,"Blood Guard %s","","","","","","","","","","","","","","","",16712190,"Blood Guard %s","","","","","","","","","","","","","","","",16712190,21);
INSERT INTO `chartitles_dbc` VALUES (22,5900,"Legionnaire %s","","","","","","","","","","","","","","","",16712190,"Legionnaire %s","","","","","","","","","","","","","","","",16712190,22);
INSERT INTO `chartitles_dbc` VALUES (23,5901,"Centurion %s","","","","","","","","","","","","","","","",16712190,"Centurion %s","","","","","","","","","","","","","","","",16712190,23);
INSERT INTO `chartitles_dbc` VALUES (24,5902,"Champion %s","","","","","","","","","","","","","","","",16712190,"Champion %s","","","","","","","","","","","","","","","",16712190,24);
INSERT INTO `chartitles_dbc` VALUES (25,5903,"Lieutenant General %s","","","","","","","","","","","","","","","",16712190,"Lieutenant General %s","","","","","","","","","","","","","","","",16712190,25);
INSERT INTO `chartitles_dbc` VALUES (26,5904,"General %s","","","","","","","","","","","","","","","",16712190,"General %s","","","","","","","","","","","","","","","",16712190,26);
INSERT INTO `chartitles_dbc` VALUES (27,5905,"Warlord %s","","","","","","","","","","","","","","","",16712190,"Warlord %s","","","","","","","","","","","","","","","",16712190,27);
INSERT INTO `chartitles_dbc` VALUES (28,5906,"High Warlord %s","","","","","","","","","","","","","","","",16712190,"High Warlord %s","","","","","","","","","","","","","","","",16712190,28);
INSERT INTO `chartitles_dbc` VALUES (42,0,"Gladiator %s","","","","","","","","","","","","","","","",16712190,"Gladiator %s","","","","","","","","","","","","","","","",16712190,29);
INSERT INTO `chartitles_dbc` VALUES (43,0,"Duelist %s","","","","","","","","","","","","","","","",16712190,"Duelist %s","","","","","","","","","","","","","","","",16712190,30);
INSERT INTO `chartitles_dbc` VALUES (44,0,"Rival %s","","","","","","","","","","","","","","","",16712190,"Rival %s","","","","","","","","","","","","","","","",16712190,31);
INSERT INTO `chartitles_dbc` VALUES (45,0,"Challenger %s","","","","","","","","","","","","","","","",16712190,"Challenger %s","","","","","","","","","","","","","","","",16712190,32);
INSERT INTO `chartitles_dbc` VALUES (46,6341,"Scarab Lord %s","","","","","","","","","","","","","","","",16712190,"Scarab Lord %s","","","","","","","","","","","","","","","",16712190,33);
INSERT INTO `chartitles_dbc` VALUES (47,6407,"Conqueror %s","","","","","","","","","","","","","","","",16712190,"Conqueror %s","","","","","","","","","","","","","","","",16712190,34);
INSERT INTO `chartitles_dbc` VALUES (48,6406,"Justicar %s","","","","","","","","","","","","","","","",16712190,"Justicar %s","","","","","","","","","","","","","","","",16712190,35);
INSERT INTO `chartitles_dbc` VALUES (53,6686,"%s, Champion of the Naaru","","","","","","","","","","","","","","","",16712190,"%s, Champion of the Naaru","","","","","","","","","","","","","","","",16712190,36);
INSERT INTO `chartitles_dbc` VALUES (62,0,"Merciless Gladiator %s","","","","","","","","","","","","","","","",16712190,"Merciless Gladiator %s","","","","","","","","","","","","","","","",16712190,37);
INSERT INTO `chartitles_dbc` VALUES (63,6806,"%s of the Shattered Sun","","","","","","","","","","","","","","","",16712190,"%s of the Shattered Sun","","","","","","","","","","","","","","","",16712190,38);
INSERT INTO `chartitles_dbc` VALUES (64,6944,"%s, Hand of A\'dal","","","","","","","","","","","","","","","",16712190,"%s, Hand of A\'dal","","","","","","","","","","","","","","","",16712190,39);
INSERT INTO `chartitles_dbc` VALUES (71,0,"Vengeful Gladiator %s","","","","","","","","","","","","","","","",16712190,"Vengeful Gladiator %s","","","","","","","","","","","","","","","",16712190,40);
INSERT INTO `chartitles_dbc` VALUES (72,7530,"Battlemaster %s","","","","","","","","","","","","","","","",16712190,"Battlemaster %s","","","","","","","","","","","","","","","",16712190,41);
INSERT INTO `chartitles_dbc` VALUES (74,7533,"Elder %s","","","","","","","","","","","","","","","",16712190,"Elder %s","","","","","","","","","","","","","","","",16712190,43);
INSERT INTO `chartitles_dbc` VALUES (75,7534,"Flame Warden %s","","","","","","","","","","","","","","","",16712190,"Flame Warden %s","","","","","","","","","","","","","","","",16712190,44);
INSERT INTO `chartitles_dbc` VALUES (76,7535,"Flame Keeper %s","","","","","","","","","","","","","","","",16712190,"Flame Keeper %s","","","","","","","","","","","","","","","",16712190,45);
INSERT INTO `chartitles_dbc` VALUES (77,7565,"%s the Exalted","","","","","","","","","","","","","","","",16712190,"%s the Exalted","","","","","","","","","","","","","","","",16712190,46);
INSERT INTO `chartitles_dbc` VALUES (78,7695,"%s the Explorer","","","","","","","","","","","","","","","",16712190,"%s the Explorer","","","","","","","","","","","","","","","",16712190,47);
INSERT INTO `chartitles_dbc` VALUES (79,7748,"%s the Diplomat","","","","","","","","","","","","","","","",16712190,"%s the Diplomat","","","","","","","","","","","","","","","",16712190,48);
INSERT INTO `chartitles_dbc` VALUES (80,0,"Brutal Gladiator %s","","","","","","","","","","","","","","","",16712190,"Brutal Gladiator %s","","","","","","","","","","","","","","","",16712190,49);
INSERT INTO `chartitles_dbc` VALUES (81,7759,"%s the Seeker","","","","","","","","","","","","","","","",16712190,"%s the Seeker","","","","","","","","","","","","","","","",16712190,42);
INSERT INTO `chartitles_dbc` VALUES (82,7749,"Arena Master %s","","","","","","","","","","","","","","","",16712190,"Arena Master %s","","","","","","","","","","","","","","","",16712190,50);
INSERT INTO `chartitles_dbc` VALUES (83,7750,"Salty %s","","","","","","","","","","","","","","","",16712190,"Salty %s","","","","","","","","","","","","","","","",16712190,51);
INSERT INTO `chartitles_dbc` VALUES (84,7754,"Chef %s","","","","","","","","","","","","","","","",16712190,"Chef %s","","","","","","","","","","","","","","","",16712190,52);
INSERT INTO `chartitles_dbc` VALUES (85,7703,"%s the Supreme","","","","","","","","","","","","","","","",16712190,"%s the Supreme","","","","","","","","","","","","","","","",16712190,53);
INSERT INTO `chartitles_dbc` VALUES (86,7703,"%s of the Ten Storms","","","","","","","","","","","","","","","",16712190,"%s of the Ten Storms","","","","","","","","","","","","","","","",16712190,54);
INSERT INTO `chartitles_dbc` VALUES (87,7703,"%s of the Emerald Dream","","","","","","","","","","","","","","","",16712190,"%s of the Emerald Dream","","","","","","","","","","","","","","","",16712190,55);
INSERT INTO `chartitles_dbc` VALUES (89,7703,"Prophet %s","","","","","","","","","","","","","","","",16712190,"Prophet %s","","","","","","","","","","","","","","","",16712190,57);
INSERT INTO `chartitles_dbc` VALUES (90,7703,"%s the Malefic","","","","","","","","","","","","","","","",16712190,"%s the Malefic","","","","","","","","","","","","","","","",16712190,58);
INSERT INTO `chartitles_dbc` VALUES (91,7703,"Stalker %s","","","","","","","","","","","","","","","",16712190,"Stalker %s","","","","","","","","","","","","","","","",16712190,59);
INSERT INTO `chartitles_dbc` VALUES (92,7703,"%s of the Ebon Blade","","","","","","","","","","","","","","","",16712190,"%s of the Ebon Blade","","","","","","","","","","","","","","","",16712190,60);
INSERT INTO `chartitles_dbc` VALUES (93,7703,"Archmage %s","","","","","","","","","","","","","","","",16712190,"Archmage %s","","","","","","","","","","","","","","","",16712190,61);
INSERT INTO `chartitles_dbc` VALUES (94,7703,"Warbringer %s","","","","","","","","","","","","","","","",16712190,"Warbringer %s","","","","","","","","","","","","","","","",16712190,62);
INSERT INTO `chartitles_dbc` VALUES (95,7703,"Assassin %s","","","","","","","","","","","","","","","",16712190,"Assassin %s","","","","","","","","","","","","","","","",16712190,63);
INSERT INTO `chartitles_dbc` VALUES (96,7703,"Grand Master Alchemist %s","","","","","","","","","","","","","","","",16712190,"Grand Master Alchemist %s","","","","","","","","","","","","","","","",16712190,64);
INSERT INTO `chartitles_dbc` VALUES (97,7703,"Grand Master Blacksmith %s","","","","","","","","","","","","","","","",16712190,"Grand Master Blacksmith %s","","","","","","","","","","","","","","","",16712190,65);
INSERT INTO `chartitles_dbc` VALUES (98,7703,"Iron Chef %s","","","","","","","","","","","","","","","",16712190,"Iron Chef %s","","","","","","","","","","","","","","","",16712190,66);
INSERT INTO `chartitles_dbc` VALUES (99,7703,"Grand Master Enchanter %s","","","","","","","","","","","","","","","",16712190,"Grand Master Enchanter %s","","","","","","","","","","","","","","","",16712190,67);
INSERT INTO `chartitles_dbc` VALUES (100,7703,"Grand Master Engineer %s","","","","","","","","","","","","","","","",16712190,"Grand Master Engineer %s","","","","","","","","","","","","","","","",16712190,68);
INSERT INTO `chartitles_dbc` VALUES (101,7703,"Doctor %s","","","","","","","","","","","","","","","",16712190,"Doctor %s","","","","","","","","","","","","","","","",16712190,69);
INSERT INTO `chartitles_dbc` VALUES (102,7703,"Grand Master Angler %s","","","","","","","","","","","","","","","",16712190,"Grand Master Angler %s","","","","","","","","","","","","","","","",16712190,70);
INSERT INTO `chartitles_dbc` VALUES (103,7703,"Grand Master Herbalist %s","","","","","","","","","","","","","","","",16712190,"Grand Master Herbalist %s","","","","","","","","","","","","","","","",16712190,71);
INSERT INTO `chartitles_dbc` VALUES (104,7703,"Grand Master Scribe %s","","","","","","","","","","","","","","","",16712190,"Grand Master Scribe %s","","","","","","","","","","","","","","","",16712190,72);
INSERT INTO `chartitles_dbc` VALUES (105,7703,"Grand Master Jewelcrafter %s","","","","","","","","","","","","","","","",16712190,"Grand Master Jewelcrafter %s","","","","","","","","","","","","","","","",16712190,73);
INSERT INTO `chartitles_dbc` VALUES (106,7703,"Grand Master Leatherworker %s","","","","","","","","","","","","","","","",16712190,"Grand Master Leatherworker %s","","","","","","","","","","","","","","","",16712190,74);
INSERT INTO `chartitles_dbc` VALUES (107,7703,"Grand Master Miner %s","","","","","","","","","","","","","","","",16712190,"Grand Master Miner %s","","","","","","","","","","","","","","","",16712190,75);
INSERT INTO `chartitles_dbc` VALUES (108,7703,"Grand Master Skinner %s","","","","","","","","","","","","","","","",16712190,"Grand Master Skinner %s","","","","","","","","","","","","","","","",16712190,76);
INSERT INTO `chartitles_dbc` VALUES (109,7703,"Grand Master Tailor %s","","","","","","","","","","","","","","","",16712190,"Grand Master Tailor %s","","","","","","","","","","","","","","","",16712190,77);
INSERT INTO `chartitles_dbc` VALUES (110,7703,"%s of Quel\'Thalas","","","","","","","","","","","","","","","",16712190,"%s of Quel\'Thalas","","","","","","","","","","","","","","","",16712190,78);
INSERT INTO `chartitles_dbc` VALUES (111,7703,"%s of Argus","","","","","","","","","","","","","","","",16712190,"%s of Argus","","","","","","","","","","","","","","","",16712190,79);
INSERT INTO `chartitles_dbc` VALUES (112,7703,"%s of Khaz Modan","","","","","","","","","","","","","","","",16712190,"%s of Khaz Modan","","","","","","","","","","","","","","","",16712190,80);
INSERT INTO `chartitles_dbc` VALUES (113,8236,"%s of Gnomeregan","","","","","","","","","","","","","","","",16712190,"%s of Gnomeregan","","","","","","","","","","","","","","","",16712190,81);
INSERT INTO `chartitles_dbc` VALUES (114,7703,"%s the Lion Hearted","","","","","","","","","","","","","","","",16712190,"%s the Lion Hearted","","","","","","","","","","","","","","","",16712190,82);
INSERT INTO `chartitles_dbc` VALUES (115,7703,"%s, Champion of Elune","","","","","","","","","","","","","","","",16712190,"%s, Champion of Elune","","","","","","","","","","","","","","","",16712190,83);
INSERT INTO `chartitles_dbc` VALUES (116,7703,"%s, Hero of Orgrimmar","","","","","","","","","","","","","","","",16712190,"%s, Hero of Orgrimmar","","","","","","","","","","","","","","","",16712190,84);
INSERT INTO `chartitles_dbc` VALUES (117,7703,"Plainsrunner %s","","","","","","","","","","","","","","","",16712190,"Plainsrunner %s","","","","","","","","","","","","","","","",16712190,85);
INSERT INTO `chartitles_dbc` VALUES (118,7703,"%s of the Darkspear","","","","","","","","","","","","","","","",16712190,"%s of the Darkspear","","","","","","","","","","","","","","","",16712190,86);
INSERT INTO `chartitles_dbc` VALUES (119,7703,"%s the Forsaken","","","","","","","","","","","","","","","",16712190,"%s the Forsaken","","","","","","","","","","","","","","","",16712190,87);
INSERT INTO `chartitles_dbc` VALUES (120,7812,"%s the Magic Seeker","","","","","","","","","","","","","","","",16712190,"%s the Magic Seeker","","","","","","","","","","","","","","","",16712190,88);
INSERT INTO `chartitles_dbc` VALUES (121,7813,"Twilight Vanquisher %s","","","","","","","","","","","","","","","",16712190,"Twilight Vanquisher %s","","","","","","","","","","","","","","","",16712190,89);
INSERT INTO `chartitles_dbc` VALUES (122,7814,"%s, Conqueror of Naxxramas","","","","","","","","","","","","","","","",16712190,"%s, Conqueror of Naxxramas","","","","","","","","","","","","","","","",16712190,90);
INSERT INTO `chartitles_dbc` VALUES (123,7815,"%s, Hero of Northrend","","","","","","","","","","","","","","","",16712190,"%s, Hero of Northrend","","","","","","","","","","","","","","","",16712190,91);
INSERT INTO `chartitles_dbc` VALUES (124,7820,"%s the Hallowed","","","","","","","","","","","","","","","",16712190,"%s the Hallowed","","","","","","","","","","","","","","","",16712190,92);
INSERT INTO `chartitles_dbc` VALUES (125,7849,"Loremaster %s","","","","","","","","","","","","","","","",16712190,"Loremaster %s","","","","","","","","","","","","","","","",16712190,93);
INSERT INTO `chartitles_dbc` VALUES (126,7853,"%s of the Alliance","","","","","","","","","","","","","","","",16712190,"%s of the Alliance","","","","","","","","","","","","","","","",16712190,94);
INSERT INTO `chartitles_dbc` VALUES (127,7854,"%s of the Horde","","","","","","","","","","","","","","","",16712190,"%s of the Horde","","","","","","","","","","","","","","","",16712190,95);
INSERT INTO `chartitles_dbc` VALUES (128,7856,"%s the Flawless Victor","","","","","","","","","","","","","","","",16712190,"%s the Flawless Victor","","","","","","","","","","","","","","","",16712190,96);
INSERT INTO `chartitles_dbc` VALUES (129,7857,"%s, Champion of the Frozen Wastes","","","","","","","","","","","","","","","",16712190,"%s, Champion of the Frozen Wastes","","","","","","","","","","","","","","","",16712190,97);
INSERT INTO `chartitles_dbc` VALUES (130,7858,"Ambassador %s","","","","","","","","","","","","","","","",16712190,"Ambassador %s","","","","","","","","","","","","","","","",16712190,98);
INSERT INTO `chartitles_dbc` VALUES (131,7859,"%s the Argent Champion","","","","","","","","","","","","","","","",16712190,"%s the Argent Champion","","","","","","","","","","","","","","","",16712190,99);
INSERT INTO `chartitles_dbc` VALUES (132,7860,"%s, Guardian of Cenarius","","","","","","","","","","","","","","","",16712190,"%s, Guardian of Cenarius","","","","","","","","","","","","","","","",16712190,100);
INSERT INTO `chartitles_dbc` VALUES (133,7861,"Brewmaster %s","","","","","","","","","","","","","","","",16712190,"Brewmaster %s","","","","","","","","","","","","","","","",16712190,101);
INSERT INTO `chartitles_dbc` VALUES (134,7864,"Merrymaker %s","","","","","","","","","","","","","","","",16712190,"Merrymaker %s","","","","","","","","","","","","","","","",16712190,102);
INSERT INTO `chartitles_dbc` VALUES (135,7875,"%s the Love Fool","","","","","","","","","","","","","","","",16712190,"%s the Love Fool","","","","","","","","","","","","","","","",16712190,103);
INSERT INTO `chartitles_dbc` VALUES (137,7893,"Matron %s","","","","","","","","","","","","","","","",16712190,"Matron %s","","","","","","","","","","","","","","","",16712190,104);
INSERT INTO `chartitles_dbc` VALUES (138,7894,"Patron %s","","","","","","","","","","","","","","","",16712190,"Patron %s","","","","","","","","","","","","","","","",16712190,105);
INSERT INTO `chartitles_dbc` VALUES (139,7964,"Obsidian Slayer %s","","","","","","","","","","","","","","","",16712190,"Obsidian Slayer %s","","","","","","","","","","","","","","","",16712190,106);
INSERT INTO `chartitles_dbc` VALUES (140,7965,"%s of the Nightfall","","","","","","","","","","","","","","","",16712190,"%s of the Nightfall","","","","","","","","","","","","","","","",16712190,107);
INSERT INTO `chartitles_dbc` VALUES (141,7990,"%s the Immortal","","","","","","","","","","","","","","","",16712190,"%s the Immortal","","","","","","","","","","","","","","","",16712190,108);
INSERT INTO `chartitles_dbc` VALUES (142,7991,"%s the Undying","","","","","","","","","","","","","","","",16712190,"%s the Undying","","","","","","","","","","","","","","","",16712190,109);
INSERT INTO `chartitles_dbc` VALUES (143,7997,"%s Jenkins","","","","","","","","","","","","","","","",16712190,"%s Jenkins","","","","","","","","","","","","","","","",16712190,110);
INSERT INTO `chartitles_dbc` VALUES (144,8045,"Bloodsail Admiral %s","","","","","","","","","","","","","","","",16712190,"Bloodsail Admiral %s","","","","","","","","","","","","","","","",16712190,111);
INSERT INTO `chartitles_dbc` VALUES (145,8121,"%s the Insane","","","","","","","","","","","","","","","",16712190,"%s the Insane","","","","","","","","","","","","","","","",16712190,112);
INSERT INTO `chartitles_dbc` VALUES (146,8237,"%s of the Exodar","","","","","","","","","","","","","","","",16712190,"%s of the Exodar","","","","","","","","","","","","","","","",16712190,113);
INSERT INTO `chartitles_dbc` VALUES (147,8238,"%s of Darnassus","","","","","","","","","","","","","","","",16712190,"%s of Darnassus","","","","","","","","","","","","","","","",16712190,114);
INSERT INTO `chartitles_dbc` VALUES (148,8239,"%s of Ironforge","","","","","","","","","","","","","","","",16712190,"%s of Ironforge","","","","","","","","","","","","","","","",16712190,115);
INSERT INTO `chartitles_dbc` VALUES (149,8240,"%s of Stormwind","","","","","","","","","","","","","","","",16712190,"%s of Stormwind","","","","","","","","","","","","","","","",16712190,116);
INSERT INTO `chartitles_dbc` VALUES (150,8241,"%s of Orgrimmar","","","","","","","","","","","","","","","",16712190,"%s of Orgrimmar","","","","","","","","","","","","","","","",16712190,117);
INSERT INTO `chartitles_dbc` VALUES (151,8242,"%s of Sen\'jin","","","","","","","","","","","","","","","",16712190,"%s of Sen\'jin","","","","","","","","","","","","","","","",16712190,118);
INSERT INTO `chartitles_dbc` VALUES (152,8243,"%s of Silvermoon","","","","","","","","","","","","","","","",16712190,"%s of Silvermoon","","","","","","","","","","","","","","","",16712190,119);
INSERT INTO `chartitles_dbc` VALUES (153,8244,"%s of Thunder Bluff","","","","","","","","","","","","","","","",16712190,"%s of Thunder Bluff","","","","","","","","","","","","","","","",16712190,120);
INSERT INTO `chartitles_dbc` VALUES (154,8245,"%s of the Undercity","","","","","","","","","","","","","","","",16712190,"%s of the Undercity","","","","","","","","","","","","","","","",16712190,121);
INSERT INTO `chartitles_dbc` VALUES (155,8303,"%s the Noble","","","","","","","","","","","","","","","",16712190,"%s the Noble","","","","","","","","","","","","","","","",16712190,122);
INSERT INTO `chartitles_dbc` VALUES (156,8332,"Crusader %s","","","","","","","","","","","","","","","",16712190,"Crusader %s","","","","","","","","","","","","","","","",16712190,123);
INSERT INTO `chartitles_dbc` VALUES (157,0,"Deadly Gladiator %s","","","","","","","","","","","","","","","",16712190,"Deadly Gladiator %s","","","","","","","","","","","","","","","",16712190,56);
INSERT INTO `chartitles_dbc` VALUES (158,8450,"%s, Death\'s Demise","","","","","","","","","","","","","","","",16712190,"%s, Death\'s Demise","","","","","","","","","","","","","","","",16712190,124);
INSERT INTO `chartitles_dbc` VALUES (159,8451,"%s the Celestial Defender","","","","","","","","","","","","","","","",16712190,"%s the Celestial Defender","","","","","","","","","","","","","","","",16712190,125);
INSERT INTO `chartitles_dbc` VALUES (160,8453,"%s, Conqueror of Ulduar","","","","","","","","","","","","","","","",16712190,"%s, Conqueror of Ulduar","","","","","","","","","","","","","","","",16712190,126);
INSERT INTO `chartitles_dbc` VALUES (161,8452,"%s, Champion of Ulduar","","","","","","","","","","","","","","","",16712190,"%s, Champion of Ulduar","","","","","","","","","","","","","","","",16712190,127);
INSERT INTO `chartitles_dbc` VALUES (163,0,"Vanquisher %s","","","","","","","","","","","","","","","",16712190,"Vanquisher %s","","","","","","","","","","","","","","","",16712190,128);
INSERT INTO `chartitles_dbc` VALUES (164,8467,"Starcaller %s","","","","","","","","","","","","","","","",16712190,"Starcaller %s","","","","","","","","","","","","","","","",16712190,129);
INSERT INTO `chartitles_dbc` VALUES (165,8468,"%s the Astral Walker","","","","","","","","","","","","","","","",16712190,"%s the Astral Walker","","","","","","","","","","","","","","","",16712190,130);
INSERT INTO `chartitles_dbc` VALUES (166,8469,"%s, Herald of the Titans","","","","","","","","","","","","","","","",16712190,"%s, Herald of the Titans","","","","","","","","","","","","","","","",16712190,131);
INSERT INTO `chartitles_dbc` VALUES (167,0,"Furious Gladiator %s","","","","","","","","","","","","","","","",16712190,"Furious Gladiator %s","","","","","","","","","","","","","","","",16712190,132);
INSERT INTO `chartitles_dbc` VALUES (168,8596,"%s the Pilgrim","","","","","","","","","","","","","","","",16712190,"%s the Pilgrim","","","","","","","","","","","","","","","",16712190,133);
INSERT INTO `chartitles_dbc` VALUES (169,0,"Relentless Gladiator %s","","","","","","","","","","","","","","","",16712190,"Relentless Gladiator %s","","","","","","","","","","","","","","","",16712190,134);
INSERT INTO `chartitles_dbc` VALUES (170,8777,"Grand Crusader %s","","","","","","","","","","","","","","","",16712190,"Grand Crusader %s","","","","","","","","","","","","","","","",16712190,135);
INSERT INTO `chartitles_dbc` VALUES (171,8778,"%s the Argent Defender","","","","","","","","","","","","","","","",16712190,"%s the Argent Defender","","","","","","","","","","","","","","","",16712190,136);
INSERT INTO `chartitles_dbc` VALUES (172,8977,"%s the Patient","","","","","","","","","","","","","","","",16712190,"%s the Patient","","","","","","","","","","","","","","","",16712190,137);
INSERT INTO `chartitles_dbc` VALUES (173,9043,"%s the Light of Dawn","","","","","","","","","","","","","","","",16712190,"%s the Light of Dawn","","","","","","","","","","","","","","","",16712190,138);
INSERT INTO `chartitles_dbc` VALUES (174,9045,"%s, Bane of the Fallen King","","","","","","","","","","","","","","","",16712190,"%s, Bane of the Fallen King","","","","","","","","","","","","","","","",16712190,139);
INSERT INTO `chartitles_dbc` VALUES (175,9046,"%s the Kingslayer","","","","","","","","","","","","","","","",16712190,"%s the Kingslayer","","","","","","","","","","","","","","","",16712190,140);
INSERT INTO `chartitles_dbc` VALUES (176,9138,"%s of the Ashen Verdict","","","","","","","","","","","","","","","",16712190,"%s of the Ashen Verdict","","","","","","","","","","","","","","","",16712190,141);
INSERT INTO `chartitles_dbc` VALUES (177,0,"Wrathful Gladiator %s","","","","","","","","","","","","","","","",16712190,"Wrathful Gladiator %s","","","","","","","","","","","","","","","",16712190,142);
/*!40000 ALTER TABLE `chartitles_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 20:38:18
