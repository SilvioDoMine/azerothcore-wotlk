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
-- Table structure for table `spellduration_dbc`
--

DROP TABLE IF EXISTS `spellduration_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spellduration_dbc` (
  `ID` int NOT NULL DEFAULT '0',
  `Duration` int NOT NULL DEFAULT '0',
  `DurationPerLevel` int NOT NULL DEFAULT '0',
  `MaxDuration` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellduration_dbc`
--

LOCK TABLES `spellduration_dbc` WRITE;
/*!40000 ALTER TABLE `spellduration_dbc` DISABLE KEYS */;
INSERT INTO `spellduration_dbc` VALUES (1,10000,0,10000);
INSERT INTO `spellduration_dbc` VALUES (2,300000010,0,30000);
INSERT INTO `spellduration_dbc` VALUES (3,60000,0,60000);
INSERT INTO `spellduration_dbc` VALUES (4,120000,0,120000);
INSERT INTO `spellduration_dbc` VALUES (5,300000,0,300000);
INSERT INTO `spellduration_dbc` VALUES (6,600000,0,600000);
INSERT INTO `spellduration_dbc` VALUES (7,5000000,0,5000);
INSERT INTO `spellduration_dbc` VALUES (8,15000,0,15000);
INSERT INTO `spellduration_dbc` VALUES (9,30000,0,30000);
INSERT INTO `spellduration_dbc` VALUES (10,60000000,0,60000);
INSERT INTO `spellduration_dbc` VALUES (11,100000000,200,15000);
INSERT INTO `spellduration_dbc` VALUES (12,30000000,200,40000);
INSERT INTO `spellduration_dbc` VALUES (13,6000000,200,80000);
INSERT INTO `spellduration_dbc` VALUES (14,12000000,10000,180000);
INSERT INTO `spellduration_dbc` VALUES (15,30000000,10000,420000);
INSERT INTO `spellduration_dbc` VALUES (16,230000,0,230000);
INSERT INTO `spellduration_dbc` VALUES (17,5000000,100,7000);
INSERT INTO `spellduration_dbc` VALUES (18,20000,0,20000);
INSERT INTO `spellduration_dbc` VALUES (19,3000000,500,40000);
INSERT INTO `spellduration_dbc` VALUES (20,60000000,1000,80000);
INSERT INTO `spellduration_dbc` VALUES (21,-1,0,-1);
INSERT INTO `spellduration_dbc` VALUES (22,45000,0,45000);
INSERT INTO `spellduration_dbc` VALUES (23,90000,0,90000);
INSERT INTO `spellduration_dbc` VALUES (24,160000,0,160000);
INSERT INTO `spellduration_dbc` VALUES (25,180000,0,180000);
INSERT INTO `spellduration_dbc` VALUES (26,240000,0,240000);
INSERT INTO `spellduration_dbc` VALUES (27,3000,0,3000);
INSERT INTO `spellduration_dbc` VALUES (28,5000,0,5000);
INSERT INTO `spellduration_dbc` VALUES (29,12000,0,12000);
INSERT INTO `spellduration_dbc` VALUES (30,1800000,0,1800000);
INSERT INTO `spellduration_dbc` VALUES (31,8000,0,8000);
INSERT INTO `spellduration_dbc` VALUES (32,6000,0,6000);
INSERT INTO `spellduration_dbc` VALUES (35,4000,0,4000);
INSERT INTO `spellduration_dbc` VALUES (36,1000,0,1000);
INSERT INTO `spellduration_dbc` VALUES (37,1,0,1);
INSERT INTO `spellduration_dbc` VALUES (38,11000,0,11000);
INSERT INTO `spellduration_dbc` VALUES (39,2000,0,2000);
INSERT INTO `spellduration_dbc` VALUES (40,1200000,0,1200000);
INSERT INTO `spellduration_dbc` VALUES (41,360000,0,360000);
INSERT INTO `spellduration_dbc` VALUES (42,3600000,0,3600000);
INSERT INTO `spellduration_dbc` VALUES (62,75000,0,75000);
INSERT INTO `spellduration_dbc` VALUES (63,25000,0,25000);
INSERT INTO `spellduration_dbc` VALUES (64,40000,0,40000);
INSERT INTO `spellduration_dbc` VALUES (65,1500,0,1500);
INSERT INTO `spellduration_dbc` VALUES (66,2500,0,2500);
INSERT INTO `spellduration_dbc` VALUES (85,18000,0,18000);
INSERT INTO `spellduration_dbc` VALUES (86,21000,0,21000);
INSERT INTO `spellduration_dbc` VALUES (105,9000,0,9000);
INSERT INTO `spellduration_dbc` VALUES (106,24000,0,24000);
INSERT INTO `spellduration_dbc` VALUES (125,35000,0,35000);
INSERT INTO `spellduration_dbc` VALUES (145,2700000,0,2700000);
INSERT INTO `spellduration_dbc` VALUES (165,7000,0,7000);
INSERT INTO `spellduration_dbc` VALUES (185,6000,0,21000);
INSERT INTO `spellduration_dbc` VALUES (186,2000,0,22000);
INSERT INTO `spellduration_dbc` VALUES (187,0,0,5000);
INSERT INTO `spellduration_dbc` VALUES (205,27000,0,27000);
INSERT INTO `spellduration_dbc` VALUES (225,604800000,0,604800000);
INSERT INTO `spellduration_dbc` VALUES (245,50000,0,50000);
INSERT INTO `spellduration_dbc` VALUES (265,55000,0,55000);
INSERT INTO `spellduration_dbc` VALUES (285,1000,0,6000);
INSERT INTO `spellduration_dbc` VALUES (305,14000,0,14000);
INSERT INTO `spellduration_dbc` VALUES (325,36000,0,36000);
INSERT INTO `spellduration_dbc` VALUES (326,44000,0,44000);
INSERT INTO `spellduration_dbc` VALUES (327,500,0,500);
INSERT INTO `spellduration_dbc` VALUES (328,250,0,250);
INSERT INTO `spellduration_dbc` VALUES (347,900000,0,900000);
INSERT INTO `spellduration_dbc` VALUES (367,7200000,0,7200000);
INSERT INTO `spellduration_dbc` VALUES (387,16000,0,16000);
INSERT INTO `spellduration_dbc` VALUES (407,100,0,100);
INSERT INTO `spellduration_dbc` VALUES (427,-600000,60000,600000);
INSERT INTO `spellduration_dbc` VALUES (447,2000,0,6000);
INSERT INTO `spellduration_dbc` VALUES (467,22000,0,22000);
INSERT INTO `spellduration_dbc` VALUES (468,26000,0,26000);
INSERT INTO `spellduration_dbc` VALUES (487,1700,0,1700);
INSERT INTO `spellduration_dbc` VALUES (507,1100,0,1100);
INSERT INTO `spellduration_dbc` VALUES (508,1100,0,1100);
INSERT INTO `spellduration_dbc` VALUES (527,14400000,0,14400000);
INSERT INTO `spellduration_dbc` VALUES (547,5400000,0,5400000);
INSERT INTO `spellduration_dbc` VALUES (548,10800000,0,10800000);
INSERT INTO `spellduration_dbc` VALUES (549,3800,0,3800);
INSERT INTO `spellduration_dbc` VALUES (550,2147483647,0,2147483647);
INSERT INTO `spellduration_dbc` VALUES (551,3500,0,3500);
INSERT INTO `spellduration_dbc` VALUES (552,210000,0,210000);
INSERT INTO `spellduration_dbc` VALUES (553,6000,0,16000);
INSERT INTO `spellduration_dbc` VALUES (554,155000,0,155000);
INSERT INTO `spellduration_dbc` VALUES (555,4500,0,4500);
INSERT INTO `spellduration_dbc` VALUES (556,28000,0,28000);
INSERT INTO `spellduration_dbc` VALUES (557,165000,0,165000);
INSERT INTO `spellduration_dbc` VALUES (558,114000,0,114000);
INSERT INTO `spellduration_dbc` VALUES (559,53000,0,53000);
INSERT INTO `spellduration_dbc` VALUES (560,299000,0,299000);
INSERT INTO `spellduration_dbc` VALUES (561,3300000,0,3300000);
INSERT INTO `spellduration_dbc` VALUES (562,150000,0,150000);
INSERT INTO `spellduration_dbc` VALUES (563,20500,0,20500);
INSERT INTO `spellduration_dbc` VALUES (564,13000,0,13000);
INSERT INTO `spellduration_dbc` VALUES (565,70000,0,70000);
INSERT INTO `spellduration_dbc` VALUES (566,0,0,0);
INSERT INTO `spellduration_dbc` VALUES (567,135000,0,135000);
INSERT INTO `spellduration_dbc` VALUES (568,1250,0,1250);
INSERT INTO `spellduration_dbc` VALUES (569,280000,0,280000);
INSERT INTO `spellduration_dbc` VALUES (570,32000,0,32000);
INSERT INTO `spellduration_dbc` VALUES (571,5500,0,5500);
INSERT INTO `spellduration_dbc` VALUES (572,100000,0,100000);
INSERT INTO `spellduration_dbc` VALUES (573,11999900,0,11999900);
INSERT INTO `spellduration_dbc` VALUES (574,200,0,200);
INSERT INTO `spellduration_dbc` VALUES (575,17000,0,17000);
INSERT INTO `spellduration_dbc` VALUES (576,43200000,0,43200000);
INSERT INTO `spellduration_dbc` VALUES (577,160000,0,160000);
INSERT INTO `spellduration_dbc` VALUES (578,14250,0,14250);
INSERT INTO `spellduration_dbc` VALUES (579,170000,0,170000);
INSERT INTO `spellduration_dbc` VALUES (580,64800000,0,64800000);
INSERT INTO `spellduration_dbc` VALUES (581,9000,0,34000);
INSERT INTO `spellduration_dbc` VALUES (582,3200,0,3200);
INSERT INTO `spellduration_dbc` VALUES (583,600,0,600);
INSERT INTO `spellduration_dbc` VALUES (584,800,0,800);
INSERT INTO `spellduration_dbc` VALUES (585,0,0,0);
INSERT INTO `spellduration_dbc` VALUES (586,0,0,25000);
INSERT INTO `spellduration_dbc` VALUES (587,31000,0,31000);
INSERT INTO `spellduration_dbc` VALUES (588,0,0,30000);
INSERT INTO `spellduration_dbc` VALUES (589,6500,0,6500);
INSERT INTO `spellduration_dbc` VALUES (590,330000,0,330000);
INSERT INTO `spellduration_dbc` VALUES (591,80000,0,80000);
INSERT INTO `spellduration_dbc` VALUES (592,400,0,400);
INSERT INTO `spellduration_dbc` VALUES (593,300,0,300);
INSERT INTO `spellduration_dbc` VALUES (594,660000,0,660000);
INSERT INTO `spellduration_dbc` VALUES (596,900,0,900);
INSERT INTO `spellduration_dbc` VALUES (597,4700,0,4700);
INSERT INTO `spellduration_dbc` VALUES (598,3600,0,3600);
INSERT INTO `spellduration_dbc` VALUES (600,42000,0,42000);
INSERT INTO `spellduration_dbc` VALUES (602,480000,0,480000);
/*!40000 ALTER TABLE `spellduration_dbc` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-15 20:39:21
