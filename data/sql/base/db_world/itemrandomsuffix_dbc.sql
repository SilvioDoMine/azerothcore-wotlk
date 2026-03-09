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
-- Table structure for table `itemrandomsuffix_dbc`
--

DROP TABLE IF EXISTS `itemrandomsuffix_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemrandomsuffix_dbc` (
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
  `InternalName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Enchantment_1` int NOT NULL DEFAULT '0',
  `Enchantment_2` int NOT NULL DEFAULT '0',
  `Enchantment_3` int NOT NULL DEFAULT '0',
  `Enchantment_4` int NOT NULL DEFAULT '0',
  `Enchantment_5` int NOT NULL DEFAULT '0',
  `AllocationPct_1` int NOT NULL DEFAULT '0',
  `AllocationPct_2` int NOT NULL DEFAULT '0',
  `AllocationPct_3` int NOT NULL DEFAULT '0',
  `AllocationPct_4` int NOT NULL DEFAULT '0',
  `AllocationPct_5` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemrandomsuffix_dbc`
--

LOCK TABLES `itemrandomsuffix_dbc` WRITE;
/*!40000 ALTER TABLE `itemrandomsuffix_dbc` DISABLE KEYS */;
INSERT INTO `itemrandomsuffix_dbc` VALUES (5,"of the Monkey","","","","","","","","","","","","","","","",16712190,"Monkey",2802,2803,0,0,0,6666,10000,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (6,"of the Eagle","","","","","","","","","","","","","","","",16712190,"Eagle",2804,2803,0,0,0,6666,10000,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (7,"of the Bear","","","","","","","","","","","","","","","",16712190,"Bear",2803,2805,0,0,0,10000,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (8,"of the Whale","","","","","","","","","","","","","","","",16712190,"Whale",2806,2803,0,0,0,6666,10000,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (9,"of the Owl","","","","","","","","","","","","","","","",16712190,"Owl",2804,2806,0,0,0,6666,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (10,"of the Gorilla","","","","","","","","","","","","","","","",16712190,"Gorilla",2804,2805,0,0,0,6666,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (11,"of the Falcon","","","","","","","","","","","","","","","",16712190,"Falcon",2802,2804,0,0,0,6666,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (12,"of the Boar","","","","","","","","","","","","","","","",16712190,"Boar",2806,2805,0,0,0,6666,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (13,"of the Wolf","","","","","","","","","","","","","","","",16712190,"Wolf",2802,2806,0,0,0,6666,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (14,"of the Tiger","","","","","","","","","","","","","","","",16712190,"Tiger",2802,2805,0,0,0,6666,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (15,"of Spirit","","","","","","","","","","","","","","","",16712190,"Spirit",2806,0,0,0,0,10000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (16,"of Stamina","","","","","","","","","","","","","","","",16712190,"Stamina",2803,0,0,0,0,15000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (17,"of Strength","","","","","","","","","","","","","","","",16712190,"Strength",2805,0,0,0,0,10000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (18,"of Agility","","","","","","","","","","","","","","","",16712190,"Agility",2802,0,0,0,0,10000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (19,"of Intellect","","","","","","","","","","","","","","","",16712190,"Intellect",2804,0,0,0,0,10000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (20,"of Power","","","","","","","","","","","","","","","",16712190,"Power",2825,0,0,0,0,20000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (21,"of Spell Power","","","","","","","","","","","","","","","",16712190,"Spell Power : Used to Be Arcane Wrath",2824,0,0,0,0,11700,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (22,"of Spell Power","","","","","","","","","","","","","","","",16712190,"Spell Power: Used to Be Fiery Wrath",2824,0,0,0,0,11700,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (23,"of Spell Power","","","","","","","","","","","","","","","",16712190,"Spell Power: Used to Be Frozen Wrath",2824,0,0,0,0,11700,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (24,"of Spell Power","","","","","","","","","","","","","","","",16712190,"Spell Power (used to be Nature\'s Wrath)",2824,0,0,0,0,11700,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (25,"of Spell Power","","","","","","","","","","","","","","","",16712190,"Spell Power: Used to Be Shadow Wrath",2824,0,0,0,0,11700,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (26,"of Spell Power","","","","","","","","","","","","","","","",16712190,"Spell Power",2824,0,0,0,0,11700,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (27,"of Defense","","","","","","","","","","","","","","","",16712190,"Defense",2813,0,0,0,0,10000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (28,"of Regeneration","","","","","","","","","","","","","","","",16712190,"Regeneration",2814,0,0,0,0,4000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (29,"of Eluding","","","","","","","","","","","","","","","",16712190,"Eluding",2815,2802,0,0,0,6666,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (30,"of Concentration","","","","","","","","","","","","","","","",16712190,"Concentration",2816,0,0,0,0,4000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (31,"of Arcane Protection","","","","","","","","","","","","","","","",16712190,"Arcane Protection",2803,2817,0,0,0,10000,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (32,"of Fire Protection","","","","","","","","","","","","","","","",16712190,"Fire Protection",2803,2818,0,0,0,10000,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (33,"of Frost Protection","","","","","","","","","","","","","","","",16712190,"Frost Protection",2803,2819,0,0,0,10000,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (34,"of Nature Protection","","","","","","","","","","","","","","","",16712190,"Nature Protection",2803,2820,0,0,0,10000,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (35,"of Shadow Protection","","","","","","","","","","","","","","","",16712190,"Shadow Protection",2803,2821,0,0,0,10000,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (36,"of the Sorcerer","","","","","","","","","","","","","","","",16712190,"Sorcerer",2803,2804,2824,0,0,7889,5259,6153,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (37,"of the Physician","","","","","","","","","","","","","","","",16712190,"Physician",2803,2804,2824,0,0,7889,5259,6153,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (38,"of the Prophet","","","","","","","","","","","","","","","",16712190,"Prophet",2804,2806,2824,0,0,5259,5259,6153,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (39,"of the Invoker","","","","","","","","","","","","","","","",16712190,"Invoker",2804,2824,2822,0,0,5259,6153,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (40,"of the Bandit","","","","","","","","","","","","","","","",16712190,"Bandit",2802,2803,2825,0,0,5259,7889,10518,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (41,"of the Beast","","","","","","","","","","","","","","","",16712190,"Beast",2805,2802,2803,0,0,5259,5259,7889,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (42,"of the Hierophant","","","","","","","","","","","","","","","",16712190,"Hierophant",2803,2806,2824,0,0,7889,5259,6153,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (43,"of the Soldier","","","","","","","","","","","","","","","",16712190,"Soldier",2805,2803,2823,0,0,5259,7889,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (44,"of the Elder","","","","","","","","","","","","","","","",16712190,"Elder",2803,2804,2816,0,0,7889,5259,2104,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (45,"of the Champion","","","","","","","","","","","","","","","",16712190,"Champion",2805,2803,2813,0,0,5259,7889,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (46,"of the Test","","","","","","","","","","","","","","","",16712190,"Test",2798,2799,2800,2802,2806,20,20,20,5,5);
INSERT INTO `itemrandomsuffix_dbc` VALUES (47,"of Blocking","","","","","","","","","","","","","","","",16712190,"Blocking",2826,2805,0,0,0,6666,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (48,"of Paladin Testing","","","","","","","","","","","","","","","",16712190,"Paladin Testing",2805,2906,2824,0,0,3506,5234,4102,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (49,"of the Grove","","","","","","","","","","","","","","","",16712190,"Grove",2805,2802,2803,0,0,7266,4106,4790,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (50,"of the Hunt","","","","","","","","","","","","","","","",16712190,"Hunt",2825,2802,2804,0,0,14532,4106,3193,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (51,"of the Mind","","","","","","","","","","","","","","","",16712190,"Mind",2824,2822,2804,0,0,8501,4106,3193,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (52,"of the Crusade","","","","","","","","","","","","","","","",16712190,"Crusade",2824,2804,2813,0,0,8501,4106,3193,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (53,"of the Vision","","","","","","","","","","","","","","","",16712190,"Vision",2824,2804,2803,0,0,8501,4106,3193,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (54,"of the Ancestor","","","","","","","","","","","","","","","",16712190,"Ancestor",2805,2823,2803,0,0,7266,4106,4790,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (55,"of the Nightmare","","","","","","","","","","","","","","","",16712190,"Nightmare",2811,2803,2804,0,0,8501,6159,3193,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (56,"of the Battle","","","","","","","","","","","","","","","",16712190,"Battle",2805,2803,2823,0,0,7266,6159,3193,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (57,"of the Shadow","","","","","","","","","","","","","","","",16712190,"Shadow",2825,2802,2803,0,0,14532,4106,4790,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (58,"of the Sun","","","","","","","","","","","","","","","",16712190,"Sun",2824,2803,2804,0,0,6153,5259,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (59,"of the Moon","","","","","","","","","","","","","","","",16712190,"Moon",2804,2803,2806,0,0,5259,5259,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (60,"of the Wild","","","","","","","","","","","","","","","",16712190,"Wild",2825,2803,2802,0,0,10518,5259,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (61,"of Spell Power","","","","","","","","","","","","","","","",16712190,"Spell Power (Resistance)",2824,0,0,0,0,2659,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (62,"of Strength","","","","","","","","","","","","","","","",16712190,"Strength (resistance)",2805,0,0,0,0,5000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (63,"of Agility","","","","","","","","","","","","","","","",16712190,"Agility (resistance)",2802,0,0,0,0,5000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (64,"of Power","","","","","","","","","","","","","","","",16712190,"Power (resistance)",2825,0,0,0,0,10000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (65,"of Magic","","","","","","","","","","","","","","","",16712190,"Magic (resistance)",2824,0,0,0,0,5850,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (66,"of the Knight","","","","","","","","","","","","","","","",16712190,"Knight",2803,2813,2824,0,0,7889,5259,6153,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (67,"of the Seer","","","","","","","","","","","","","","","",16712190,"Seer",2803,2822,2824,0,0,7889,5259,6153,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (68,"of the Bear","","","","","","","","","","","","","","","",16712190,"Bear (<60)",2805,2803,0,0,0,6666,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (69,"of the Eagle","","","","","","","","","","","","","","","",16712190,"Eagle (<60)",2803,2804,0,0,0,6666,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (70,"of the Ancestor","","","","","","","","","","","","","","","",16712190,"Ancestor (<60)",2805,2822,2803,0,0,7266,4106,3193,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (71,"of the Bandit","","","","","","","","","","","","","","","",16712190,"Bandit (<60)",2802,2803,2825,0,0,5259,5259,10518,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (72,"of the Battle","","","","","","","","","","","","","","","",16712190,"Battle (<60)",2805,2803,2822,0,0,7266,4106,3193,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (73,"of the Elder","","","","","","","","","","","","","","","",16712190,"Elder (<60)",2803,2804,2816,0,0,5259,5259,2104,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (74,"of the Beast","","","","","","","","","","","","","","","",16712190,"Beast (<60)",2805,2802,2803,0,0,5259,5259,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (75,"of the Champion","","","","","","","","","","","","","","","",16712190,"Champion (<60)",2805,2803,2813,0,0,5259,5259,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (76,"of the Grove","","","","","","","","","","","","","","","",16712190,"Grove (<60)",2805,2802,2803,0,0,7266,4106,3193,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (77,"of the Knight","","","","","","","","","","","","","","","",16712190,"Knight (<60)",2803,2813,2824,0,0,5259,5259,6153,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (78,"of the Monkey","","","","","","","","","","","","","","","",16712190,"Monkey (<60)",2802,2803,0,0,0,6666,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (79,"of the Moon","","","","","","","","","","","","","","","",16712190,"Moon (<60)",2804,2803,2806,0,0,5259,3506,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (80,"of the Wild","","","","","","","","","","","","","","","",16712190,"Wild (<60)",2825,2803,2802,0,0,10518,3506,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (81,"of the Whale","","","","","","","","","","","","","","","",16712190,"Whale (<60)",2803,2806,0,0,0,6666,6666,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (82,"of the Vision","","","","","","","","","","","","","","","",16712190,"Vision (<60)",2824,2804,2803,0,0,8501,4106,2129,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (83,"of the Sun","","","","","","","","","","","","","","","",16712190,"Sun (<60)",2824,2803,2804,0,0,6153,3506,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (84,"of Stamina","","","","","","","","","","","","","","","",16712190,"Stamina (<60)",2803,0,0,0,0,10000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (85,"of the Sorcerer","","","","","","","","","","","","","","","",16712190,"Sorcerer (<60)",2803,2804,2824,0,0,5259,5259,6153,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (86,"of the Soldier","","","","","","","","","","","","","","","",16712190,"Soldier (<60)",2805,2803,2822,0,0,5259,5259,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (87,"of the Shadow","","","","","","","","","","","","","","","",16712190,"Shadow (<60)",2825,2802,2803,0,0,14532,4106,3193,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (88,"of the Foreseer","","","","","","","","","","","","","","","",16712190,"Foreseer",2804,3726,2824,0,0,5259,5259,6153,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (89,"of the Thief","","","","","","","","","","","","","","","",16712190,"Thief",2803,2825,3726,0,0,7889,10518,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (90,"of the Necromancer","","","","","","","","","","","","","","","",16712190,"Necromancer",2803,3727,2824,0,0,7889,5259,6153,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (91,"of the Marksman","","","","","","","","","","","","","","","",16712190,"Marksman",2803,2802,3727,0,0,7889,5259,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (92,"of the Squire","","","","","","","","","","","","","","","",16712190,"Squire",2803,3727,2805,0,0,7889,5259,5259,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (93,"of Restoration","","","","","","","","","","","","","","","",16712190,"Restoration",2803,2824,2816,0,0,7889,6153,2103,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (94,"","","","","","","","","","","","","","","","",16712174,"Agility (Darkmoon Card)",2802,0,0,0,0,9000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (95,"","","","","","","","","","","","","","","","",16712174,"Strength (Darkmoon Card)",2805,0,0,0,0,9000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (96,"","","","","","","","","","","","","","","","",16712174,"Stamina (Darkmoon Card)",2803,0,0,0,0,13500,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (97,"","","","","","","","","","","","","","","","",16712174,"Intellect (Darkmoon Card)",2804,0,0,0,0,9000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (98,"","","","","","","","","","","","","","","","",16712174,"Spirit (Darkmoon Card)",2806,0,0,0,0,9000,0,0,0,0);
INSERT INTO `itemrandomsuffix_dbc` VALUES (99,"of Speed","","","","","","","","","","","","","","","",16712190,"Haste",3726,0,0,0,0,10000,0,0,0,0);
/*!40000 ALTER TABLE `itemrandomsuffix_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:54:10
