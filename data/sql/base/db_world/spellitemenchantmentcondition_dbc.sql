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
-- Table structure for table `spellitemenchantmentcondition_dbc`
--

DROP TABLE IF EXISTS `spellitemenchantmentcondition_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spellitemenchantmentcondition_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `Lt_OperandType_1` tinyint unsigned NOT NULL DEFAULT '0',
  `Lt_OperandType_2` tinyint unsigned NOT NULL DEFAULT '0',
  `Lt_OperandType_3` tinyint unsigned NOT NULL DEFAULT '0',
  `Lt_OperandType_4` tinyint unsigned NOT NULL DEFAULT '0',
  `Lt_OperandType_5` tinyint unsigned NOT NULL DEFAULT '0',
  `Lt_Operand_1` int NOT NULL DEFAULT '0',
  `Lt_Operand_2` int NOT NULL DEFAULT '0',
  `Lt_Operand_3` int NOT NULL DEFAULT '0',
  `Lt_Operand_4` int NOT NULL DEFAULT '0',
  `Lt_Operand_5` int NOT NULL DEFAULT '0',
  `Operator_1` tinyint unsigned NOT NULL DEFAULT '0',
  `Operator_2` tinyint unsigned NOT NULL DEFAULT '0',
  `Operator_3` tinyint unsigned NOT NULL DEFAULT '0',
  `Operator_4` tinyint unsigned NOT NULL DEFAULT '0',
  `Operator_5` tinyint unsigned NOT NULL DEFAULT '0',
  `Rt_OperandType_1` tinyint unsigned NOT NULL DEFAULT '0',
  `Rt_OperandType_2` tinyint unsigned NOT NULL DEFAULT '0',
  `Rt_OperandType_3` tinyint unsigned NOT NULL DEFAULT '0',
  `Rt_OperandType_4` tinyint unsigned NOT NULL DEFAULT '0',
  `Rt_OperandType_5` tinyint unsigned NOT NULL DEFAULT '0',
  `Rt_Operand_1` int NOT NULL DEFAULT '0',
  `Rt_Operand_2` int NOT NULL DEFAULT '0',
  `Rt_Operand_3` int NOT NULL DEFAULT '0',
  `Rt_Operand_4` int NOT NULL DEFAULT '0',
  `Rt_Operand_5` int NOT NULL DEFAULT '0',
  `Logic_1` tinyint unsigned NOT NULL DEFAULT '0',
  `Logic_2` tinyint unsigned NOT NULL DEFAULT '0',
  `Logic_3` tinyint unsigned NOT NULL DEFAULT '0',
  `Logic_4` tinyint unsigned NOT NULL DEFAULT '0',
  `Logic_5` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellitemenchantmentcondition_dbc`
--

LOCK TABLES `spellitemenchantmentcondition_dbc` WRITE;
/*!40000 ALTER TABLE `spellitemenchantmentcondition_dbc` DISABLE KEYS */;
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (3,4,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (28,1,2,0,0,0,0,0,0,0,0,2,2,0,0,0,2,3,0,0,0,0,0,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (30,4,0,0,0,0,0,0,0,0,0,3,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (32,2,0,0,0,0,0,0,0,0,0,3,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (33,4,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (34,2,0,0,0,0,0,0,0,0,0,3,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (35,4,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (36,2,3,4,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,2,2,2,0,0,1,1,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (42,3,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (43,4,0,0,0,0,0,0,0,0,0,3,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (61,3,2,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (62,3,2,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (63,3,2,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (64,2,4,3,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,2,2,2,0,0,1,1,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (65,2,4,3,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,2,2,2,0,0,1,1,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (66,2,3,4,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,2,2,2,0,0,1,1,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (67,2,3,4,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,2,2,2,0,0,1,1,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (81,4,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (121,4,3,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (122,2,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (141,2,4,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (142,4,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (143,2,3,4,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (144,2,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (145,2,3,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (146,2,4,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (147,2,3,4,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (148,4,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (149,2,3,4,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (150,3,2,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (151,2,3,4,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (152,4,2,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (153,2,3,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (154,4,2,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (155,3,4,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (156,2,4,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (157,4,2,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (158,3,4,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (159,2,3,4,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (161,2,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (181,2,4,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (182,3,4,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (188,4,3,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (189,4,2,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (190,4,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (191,3,2,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (192,2,4,3,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (193,2,4,3,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0);
INSERT INTO `spellitemenchantmentcondition_dbc` VALUES (194,2,3,4,0,0,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0);
/*!40000 ALTER TABLE `spellitemenchantmentcondition_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:54:41
