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
-- Table structure for table `liquidtype_dbc`
--

DROP TABLE IF EXISTS `liquidtype_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liquidtype_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Flags` int NOT NULL DEFAULT '0',
  `Type` int NOT NULL DEFAULT '0',
  `SoundID` int NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `MaxDarkenDepth` float NOT NULL DEFAULT '0',
  `FogDarkenintensity` float NOT NULL DEFAULT '0',
  `AmbDarkenintensity` float NOT NULL DEFAULT '0',
  `DirDarkenintensity` float NOT NULL DEFAULT '0',
  `LightID` int NOT NULL DEFAULT '0',
  `ParticleScale` float NOT NULL DEFAULT '0',
  `ParticleMovement` int NOT NULL DEFAULT '0',
  `ParticleTexSlots` int NOT NULL DEFAULT '0',
  `MaterialID` int NOT NULL DEFAULT '0',
  `Texture_1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Texture_2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Texture_3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Texture_4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Texture_5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Texture_6` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Color_1` int NOT NULL DEFAULT '0',
  `Color_2` int NOT NULL DEFAULT '0',
  `Float_1` float NOT NULL DEFAULT '0',
  `Float_2` float NOT NULL DEFAULT '0',
  `Float_3` float NOT NULL DEFAULT '0',
  `Float_4` float NOT NULL DEFAULT '0',
  `Float_5` float NOT NULL DEFAULT '0',
  `Float_6` float NOT NULL DEFAULT '0',
  `Float_7` float NOT NULL DEFAULT '0',
  `Float_8` float NOT NULL DEFAULT '0',
  `Float_9` float NOT NULL DEFAULT '0',
  `Float_10` float NOT NULL DEFAULT '0',
  `Float_11` float NOT NULL DEFAULT '0',
  `Float_12` float NOT NULL DEFAULT '0',
  `Float_13` float NOT NULL DEFAULT '0',
  `Float_14` float NOT NULL DEFAULT '0',
  `Float_15` float NOT NULL DEFAULT '0',
  `Float_16` float NOT NULL DEFAULT '0',
  `Float_17` float NOT NULL DEFAULT '0',
  `Float_18` float NOT NULL DEFAULT '0',
  `Int_1` int NOT NULL DEFAULT '0',
  `Int_2` int NOT NULL DEFAULT '0',
  `Int_3` int NOT NULL DEFAULT '0',
  `Int_4` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquidtype_dbc`
--

LOCK TABLES `liquidtype_dbc` WRITE;
/*!40000 ALTER TABLE `liquidtype_dbc` DISABLE KEYS */;
INSERT INTO `liquidtype_dbc` VALUES (1,"Water",15,0,1111,0,0,0,0,0,0,1,0,0,1,"XTextures\river\lake_a.%d.blp","proceduralRiverDepthTex","","","","",0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1250,0,0);
INSERT INTO `liquidtype_dbc` VALUES (2,"Ocean",15,1,1114,0,30,0.5,0.5,0.25,0,1,0,0,1,"XTextures\ocean\ocean_h.%d.blp","proceduralOceanDepthTex","","","","",0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1250,0,0);
INSERT INTO `liquidtype_dbc` VALUES (3,"Magma",120,2,3072,0,0,0,0,0,7,4,1,1,2,"XTextures\lava\lava.%d.blp","","","","","",0,0,0.025,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `liquidtype_dbc` VALUES (4,"Slime",322,3,3880,0,0,0,0,0,6,0,0,0,2,"XTextures\slime\slime.%d.blp","","","","","",0,0,0.025,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `liquidtype_dbc` VALUES (5,"Slow Water",15,0,1112,0,0,0,0,0,0,1,0,0,1,"XTextures\river\lake_a.%d.blp","proceduralRiverDepthTex","","","","",0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1250,0,0);
INSERT INTO `liquidtype_dbc` VALUES (6,"Slow Ocean",15,1,1114,0,30,0.5,0.5,0.25,0,1,0,0,1,"XTextures\ocean\ocean_h.%d.blp","proceduralOceanDepthTex","","","","",0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1250,0,0);
INSERT INTO `liquidtype_dbc` VALUES (7,"Slow Magma",120,2,3052,0,0,0,0,0,7,4,1,1,2,"XTextures\lava\lava.%d.blp","","","","","",0,0,0.025,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `liquidtype_dbc` VALUES (8,"Slow Slime",322,3,3880,0,0,0,0,0,6,0,0,0,2,"XTextures\slime\slime.%d.blp","","","","","",0,0,0.025,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `liquidtype_dbc` VALUES (9,"Fast Water",15,0,1113,0,0,0,0,0,0,1,0,0,1,"XTextures\river\fast_a.%d.blp","proceduralRiverDepthTex","","","","",0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1250,0,0);
INSERT INTO `liquidtype_dbc` VALUES (10,"Fast Ocean",15,1,1114,0,30,0.5,0.5,0.25,0,1,0,0,1,"XTextures\ocean\ocean_h.%d.blp","proceduralOceanDepthTex","","","","",0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1250,0,0);
INSERT INTO `liquidtype_dbc` VALUES (11,"Fast Magma",120,2,3052,0,0,0,0,0,7,4,1,1,2,"XTextures\lava\lava.%d.blp","","","","","",0,0,0.025,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `liquidtype_dbc` VALUES (12,"Fast Slime",322,3,3880,0,0,0,0,0,6,0,0,0,2,"XTextures\slime\slime.%d.blp","","","","","",0,0,0.025,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `liquidtype_dbc` VALUES (13,"WMO Water",15,0,1111,0,0,0,0,0,0,1,0,0,1,"XTextures\river\lake_a.%d.blp","proceduralWmoWaterTex","","","","",0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1250,0,0);
INSERT INTO `liquidtype_dbc` VALUES (14,"WMO Ocean",527,1,1114,0,30,0.5,0.5,0.25,0,1,0,0,1,"XTextures\ocean\ocean_h.%d.blp","proceduralOceanDepthTex","","","","",0,0,0.25,180,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1250,0,0);
INSERT INTO `liquidtype_dbc` VALUES (15,"Green Lava",120,2,3072,0,0,0,0,0,6,4,1,1,2,"XTextures\LavaGreen\lavagreen.%d.blp","","","","","",0,0,0.025,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `liquidtype_dbc` VALUES (17,"WMO Water - Interior",15,0,1111,0,0,0,0,0,0,1,0,0,1,"XTextures\river\lake_a.%d.blp","proceduralWmoWaterTex","","","","",0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1250,0,0);
INSERT INTO `liquidtype_dbc` VALUES (19,"WMO Magma",120,2,3072,0,0,0,0,0,7,4,1,1,2,"XTextures\lava\lava.%d.blp","","","","","",0,0,0,0.1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `liquidtype_dbc` VALUES (20,"WMO Slime",322,3,3880,0,0,0,0,0,6,0,0,0,2,"XTextures\slime\slime.%d.blp","","","","","",0,0,0,0.1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `liquidtype_dbc` VALUES (21,"Naxxramas - Slime",322,3,3880,28801,0,0,0,0,6,0,0,0,2,"XTextures\slime\slime.%d.blp","","","","","",0,0,0.025,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `liquidtype_dbc` VALUES (41,"Coilfang Raid - Water",15,0,1111,37025,0,0,0,0,0,1,0,0,1,"XTextures\river\lake_a.%d.blp","proceduralRiverDepthTex","","","","",0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1250,0,0);
INSERT INTO `liquidtype_dbc` VALUES (61,"Hyjal Past - Water",15,0,1111,42201,0,0,0,0,0,1,0,0,1,"XTextures\river\lake_a.%d.blp","proceduralRiverDepthTex","","","","",0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1250,0,0);
INSERT INTO `liquidtype_dbc` VALUES (81,"Lake Wintergrasp - Water",15,0,1112,36444,0,0,0,0,0,1,0,0,1,"XTextures\river\lake_a.%d.blp","proceduralRiverDepthTex","","","","",0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1250,0,0);
INSERT INTO `liquidtype_dbc` VALUES (100,"Basic Procedural Water",15,1,1114,0,30,0.5,0.5,0,0,1,0,0,3,"XTextures\procWater\basicReflectionMap.blp","XTextures\procWater\basicReflectionMap.blp","XTextures\procWater\basicWaterHeightTex_%d.blp","XTextures\procWater\basicWaterHeightTex_%d.blp","proceduralOceanDepthTex","XTextures\ocean\ocean_h.%d.blp",0,0,0.1,0.5,1.5,2,0,0,0,0,1,1,0,300,0.333,0.2,0.1,0.2,0.8,0.2,1,1250,1250,1250);
INSERT INTO `liquidtype_dbc` VALUES (121,"CoA Black - Magma",120,2,3052,57634,0,0,0,0,7,4,1,1,2,"XTextures\lava\lava.%d.blp","","","","","",0,0,0,0.1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `liquidtype_dbc` VALUES (141,"Chamber Magma",120,2,3072,57634,0,0,0,0,7,4,1,1,2,"XTextures\lava\lava.%d.blp","","","","","",0,0,0,0.1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `liquidtype_dbc` VALUES (181,"Orange Slime",15,0,1111,0,0,0,0,0,0,1,0,0,1,"XTEXTURES\LavaOrange\LavaOrange.%d.blp","proceduralRiverDepthTex","","","","",0,0,2,0,8.5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1250,0,0);
/*!40000 ALTER TABLE `liquidtype_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 20:38:51
