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
-- Table structure for table `spellradius_dbc`
--

DROP TABLE IF EXISTS `spellradius_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spellradius_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `Radius` float NOT NULL DEFAULT '0',
  `RadiusPerLevel` float NOT NULL DEFAULT '0',
  `RadiusMax` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellradius_dbc`
--

LOCK TABLES `spellradius_dbc` WRITE;
/*!40000 ALTER TABLE `spellradius_dbc` DISABLE KEYS */;
INSERT INTO `spellradius_dbc` VALUES (7,2,0,2);
INSERT INTO `spellradius_dbc` VALUES (8,5,0,5);
INSERT INTO `spellradius_dbc` VALUES (9,20,0,20);
INSERT INTO `spellradius_dbc` VALUES (10,30,0,30);
INSERT INTO `spellradius_dbc` VALUES (11,45,0,45);
INSERT INTO `spellradius_dbc` VALUES (12,100,0,100);
INSERT INTO `spellradius_dbc` VALUES (13,10,0,10);
INSERT INTO `spellradius_dbc` VALUES (14,8,0,8);
INSERT INTO `spellradius_dbc` VALUES (15,3,0,3);
INSERT INTO `spellradius_dbc` VALUES (16,1,0,1);
INSERT INTO `spellradius_dbc` VALUES (17,13,0,13);
INSERT INTO `spellradius_dbc` VALUES (18,15,0,15);
INSERT INTO `spellradius_dbc` VALUES (19,18,0,18);
INSERT INTO `spellradius_dbc` VALUES (20,25,0,25);
INSERT INTO `spellradius_dbc` VALUES (21,35,0,35);
INSERT INTO `spellradius_dbc` VALUES (22,200,0,200);
INSERT INTO `spellradius_dbc` VALUES (23,40,0,40);
INSERT INTO `spellradius_dbc` VALUES (24,65,0,65);
INSERT INTO `spellradius_dbc` VALUES (25,70,0,70);
INSERT INTO `spellradius_dbc` VALUES (26,4,0,4);
INSERT INTO `spellradius_dbc` VALUES (27,50,0,50);
INSERT INTO `spellradius_dbc` VALUES (28,50000,0,50000);
INSERT INTO `spellradius_dbc` VALUES (29,6,0,6);
INSERT INTO `spellradius_dbc` VALUES (30,500,0,500);
INSERT INTO `spellradius_dbc` VALUES (31,80,0,80);
INSERT INTO `spellradius_dbc` VALUES (32,12,0,12);
INSERT INTO `spellradius_dbc` VALUES (33,99,0,99);
INSERT INTO `spellradius_dbc` VALUES (35,55,0,55);
INSERT INTO `spellradius_dbc` VALUES (36,0,0,0);
INSERT INTO `spellradius_dbc` VALUES (37,7,0,7);
INSERT INTO `spellradius_dbc` VALUES (38,21,0,21);
INSERT INTO `spellradius_dbc` VALUES (39,34,0,34);
INSERT INTO `spellradius_dbc` VALUES (40,9,0,9);
INSERT INTO `spellradius_dbc` VALUES (41,150,0,150);
INSERT INTO `spellradius_dbc` VALUES (42,11,0,11);
INSERT INTO `spellradius_dbc` VALUES (43,16,0,16);
INSERT INTO `spellradius_dbc` VALUES (44,0.5,0,0.5);
INSERT INTO `spellradius_dbc` VALUES (45,10,0,10);
INSERT INTO `spellradius_dbc` VALUES (46,5,0,10);
INSERT INTO `spellradius_dbc` VALUES (47,15,0,15);
INSERT INTO `spellradius_dbc` VALUES (48,60,0,60);
INSERT INTO `spellradius_dbc` VALUES (49,90,0,90);
INSERT INTO `spellradius_dbc` VALUES (50,15,0,15);
INSERT INTO `spellradius_dbc` VALUES (51,60,0,60);
INSERT INTO `spellradius_dbc` VALUES (52,5,0,5);
INSERT INTO `spellradius_dbc` VALUES (53,60,0,60);
INSERT INTO `spellradius_dbc` VALUES (54,50000,0,50000);
INSERT INTO `spellradius_dbc` VALUES (55,130,0,130);
INSERT INTO `spellradius_dbc` VALUES (56,38,0,38);
INSERT INTO `spellradius_dbc` VALUES (57,45,0,45);
INSERT INTO `spellradius_dbc` VALUES (58,50000,0,50000);
INSERT INTO `spellradius_dbc` VALUES (59,32,0,32);
INSERT INTO `spellradius_dbc` VALUES (60,44,0,44);
INSERT INTO `spellradius_dbc` VALUES (61,14,0,14);
INSERT INTO `spellradius_dbc` VALUES (62,47,0,47);
INSERT INTO `spellradius_dbc` VALUES (63,23,0,23);
INSERT INTO `spellradius_dbc` VALUES (64,3.5,0,3.5);
INSERT INTO `spellradius_dbc` VALUES (65,80,0,80);
/*!40000 ALTER TABLE `spellradius_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 17:54:41
