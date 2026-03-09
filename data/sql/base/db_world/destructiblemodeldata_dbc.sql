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
-- Table structure for table `destructiblemodeldata_dbc`
--

DROP TABLE IF EXISTS `destructiblemodeldata_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destructiblemodeldata_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `State0Wmo` int NOT NULL DEFAULT '0',
  `State0DestructionDoodadSet` int NOT NULL DEFAULT '0',
  `State0ImpactEffectDoodadSet` int NOT NULL DEFAULT '0',
  `State0AmbientDoodadSet` int NOT NULL DEFAULT '0',
  `State1Wmo` int NOT NULL DEFAULT '0',
  `State1DestructionDoodadSet` int NOT NULL DEFAULT '0',
  `State1ImpactEffectDoodadSet` int NOT NULL DEFAULT '0',
  `State1AmbientDoodadSet` int NOT NULL DEFAULT '0',
  `State2Wmo` int NOT NULL DEFAULT '0',
  `State2DestructionDoodadSet` int NOT NULL DEFAULT '0',
  `State2ImpactEffectDoodadSet` int NOT NULL DEFAULT '0',
  `State2AmbientDoodadSet` int NOT NULL DEFAULT '0',
  `State3Wmo` int NOT NULL DEFAULT '0',
  `State3DestructionDoodadSet` int NOT NULL DEFAULT '0',
  `State3ImpactEffectDoodadSet` int NOT NULL DEFAULT '0',
  `State3AmbientDoodadSet` int NOT NULL DEFAULT '0',
  `Field17` int NOT NULL DEFAULT '0',
  `Field18` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destructiblemodeldata_dbc`
--

LOCK TABLES `destructiblemodeldata_dbc` WRITE;
/*!40000 ALTER TABLE `destructiblemodeldata_dbc` DISABLE KEYS */;
INSERT INTO `destructiblemodeldata_dbc` VALUES (25,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (26,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,1,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (27,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,1,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (28,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,1,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (29,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,1,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (30,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,1,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (31,0,0,7897,1,0,0,7874,1,0,0,0,0,3,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (32,0,0,7908,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (33,0,0,7908,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (34,0,0,7912,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (35,0,0,7912,1,0,2,0,0,0,0,0,0,6,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (36,0,0,7913,1,3,2,0,0,0,0,0,0,7,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (37,0,0,8166,1,0,0,8167,1,0,0,0,0,8,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (38,0,0,8166,1,0,0,8167,1,0,0,0,0,9,8,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (39,0,0,8169,2,1,0,7898,1,0,0,0,0,10,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (40,0,0,8186,1,0,0,7908,1,0,0,0,0,11,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (41,0,0,8198,1,0,0,0,0,0,0,0,0,12,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (42,0,0,8198,1,0,0,7855,1,0,0,0,0,13,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (43,0,0,8198,1,0,0,7855,1,0,0,0,0,14,8,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (44,0,0,8209,1,2,0,8210,1,2,0,0,0,15,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (45,0,0,8209,1,2,0,8210,1,2,0,0,0,16,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (46,0,0,8246,1,1,1,0,0,0,0,0,0,17,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (47,0,0,8246,1,1,1,0,0,0,0,0,0,18,0,0,1,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (48,0,0,8249,1,1,1,0,0,0,0,0,0,19,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (49,0,0,8249,1,1,1,0,0,0,0,0,0,20,0,0,1,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (50,0,0,8387,0,0,0,8386,1,0,0,0,0,21,8,0,1,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (51,0,0,8593,0,0,0,8591,1,0,0,0,0,0,2,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (52,0,0,8593,0,0,0,8591,1,0,0,0,0,0,4,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (53,0,0,8593,0,0,0,8591,1,0,0,0,0,0,6,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (54,1,0,8169,2,1,0,7898,1,0,0,0,0,22,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (55,1,0,8173,2,1,0,7875,1,0,0,0,0,23,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (56,1,0,8584,2,1,0,8585,1,0,0,0,0,0,4,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (57,1,0,8584,1,0,0,8585,1,0,0,0,0,0,6,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (58,3,0,7540,1,3,2,7541,1,0,0,7809,0,0,5,6331,0,1,25);
INSERT INTO `destructiblemodeldata_dbc` VALUES (59,0,0,9003,1,0,0,9003,1,0,0,0,0,22,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (60,0,0,8997,0,0,0,9000,0,0,0,0,0,22,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (61,0,0,8996,0,0,0,9003,1,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (62,0,0,8997,0,0,0,9000,1,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (63,0,0,9060,1,0,0,0,0,0,0,0,0,0,8,0,1,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (65,0,0,9257,1,0,0,9258,0,0,0,0,0,0,8,0,0,0,0);
INSERT INTO `destructiblemodeldata_dbc` VALUES (67,0,0,9257,1,0,0,9258,1,0,0,9258,1,0,8,0,1,4,0);
/*!40000 ALTER TABLE `destructiblemodeldata_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:53:50
