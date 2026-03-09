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
-- Table structure for table `itemlimitcategory_dbc`
--

DROP TABLE IF EXISTS `itemlimitcategory_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemlimitcategory_dbc` (
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
  `Quantity` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemlimitcategory_dbc`
--

LOCK TABLES `itemlimitcategory_dbc` WRITE;
/*!40000 ALTER TABLE `itemlimitcategory_dbc` DISABLE KEYS */;
INSERT INTO `itemlimitcategory_dbc` VALUES (2,"Jeweler\'s Gems","","","","","","","","","","","","","","","",16712190,3,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (3,"Healthstone","","","","","","","","","","","","","","","",16712190,1,0);
INSERT INTO `itemlimitcategory_dbc` VALUES (4,"Mana Gem","","","","","","","","","","","","","","","",16712190,1,0);
INSERT INTO `itemlimitcategory_dbc` VALUES (6,"Stormjewel","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (7,"Enchanted Pearl","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (8,"Binding Light","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (9,"Binding Stone","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (10,"Death\'s Choice","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (11,"Death\'s Verdict","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (12,"Eitrigg\'s Oath","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (13,"Fervor of the Frostborn","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (14,"Fetish of Volatile Power","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (15,"Juggernaut\'s Vitality","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (16,"Reign of the Dead","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (17,"Reign of the Unliving","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (18,"Satrina\'s Impeding Scarab","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (19,"Solace of the Defeated","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (20,"Solace of the Fallen","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (21,"Talisman of Volatile Power","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (22,"Vengeance of the Forsaken","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (23,"Victor\'s Call","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (24,"Band of Callous Aggression","","","","","","","","","","","","","","","",16712190,1,0);
INSERT INTO `itemlimitcategory_dbc` VALUES (25,"Band of Deplorable Violence","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (26,"Band of the Traitor King","","","","","","","","","","","","","","","",16712190,1,0);
INSERT INTO `itemlimitcategory_dbc` VALUES (27,"Band of the Twin Val\'kyr","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (28,"Band of the Violent Temperment","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (29,"Carnivorous Band","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (30,"Circle of the Darkmender","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (31,"Firestorm Band","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (32,"Firestorm Ring","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (33,"Gormok\'s Band","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (34,"Loop of the Twin Val\'kyr","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (35,"Lurid Manifestation","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (36,"Planestalker Band","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (37,"Planestalker Signet","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (38,"Ring of Callous Aggression","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (39,"Ring of Callous Aggression","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (40,"Ring of the Darkmender","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (41,"Ring of the Violent Temperament","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (42,"Signet of the Traitor King","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (43,"Test Ring Limit","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (44,"Althor\'s Abacus","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (45,"Bauble of True Blood","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (46,"Corpse Tongue Coin","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (47,"Deathbringer\'s Will","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (48,"Dislodged Foreign Object","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (49,"Phylactery of the Nameless Lich","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (50,"Tiny Abomination in a Jar","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (51,"Sindragosa\'s Flawless Fang","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (52,"Abomination\'s Bloody Ring","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (53,"Signet of Putrefaction","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (54,"Cerise Coiled Ring","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (55,"Rotface\'s Rupturing Ring","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (56,"Saurfang\'s Cold-Forged Band","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (57,"Seal of the Twilight Queen","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (58,"Thrice Fanged Signet","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (59,"Band of the Bone Colossus","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (60,"Devium\'s Eternally Cold Ring","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (61,"Seal of Many Mouths","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (62,"Frostbrood Sapphire Ring","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (63,"Juggernaut Band","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (64,"Loop of the Endless Labyrinth","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (65,"Marrowgar\'s Frigid Eye","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (66,"Memory of Malygos","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (67,"Might of Blight","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (68,"Ring of Maddening Whispers","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (69,"Ring of Rapid Ascent","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (70,"Skeleton Lord\'s Circle","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (71,"Valanar\'s Other Signet Ring","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (72,"Incarnadine Band of Mending","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (73,"Muradin\'s Spyglass","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (74,"Sliver of Pure Ice","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (75,"Unidentifiable Organ","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (76,"Whispering Fanged Skull","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (77,"Twilight Scale","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (78,"Ring of Phased Regeneration","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (79,"Saviana\'s Tribute","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (80,"Signet of Twilight","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (81,"Zarithrian\'s Offering","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (82,"Sharpened Twilight Scale","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (83,"Petrified Twilight Scale","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (84,"Glowing Twilight Scale","","","","","","","","","","","","","","","",16712190,1,1);
INSERT INTO `itemlimitcategory_dbc` VALUES (85,"Charred Twilight Scale","","","","","","","","","","","","","","","",16712190,1,1);
/*!40000 ALTER TABLE `itemlimitcategory_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:54:09
