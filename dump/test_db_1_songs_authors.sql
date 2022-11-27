-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: test_db_1
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `songs_authors`
--

DROP TABLE IF EXISTS `songs_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs_authors` (
  `song_id` int NOT NULL,
  `author_id` int NOT NULL,
  KEY `song_id_idx` (`song_id`),
  KEY `author_id_idx` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs_authors`
--

LOCK TABLES `songs_authors` WRITE;
/*!40000 ALTER TABLE `songs_authors` DISABLE KEYS */;
INSERT INTO `songs_authors` VALUES (7,6),(8,7),(9,8),(10,9),(11,10),(11,11),(12,12),(13,13),(13,14),(14,15),(15,16),(16,17),(17,18),(18,19),(19,20),(19,21),(20,22),(21,23),(22,24),(23,25),(23,26),(24,27),(25,28),(25,29),(26,30),(26,31),(27,32),(28,33),(29,34),(30,35),(30,36),(31,37),(31,38),(32,39),(32,40),(33,41),(33,42),(33,43),(34,44),(36,45),(37,46),(37,47),(38,48),(39,43),(39,49),(40,50),(40,51),(41,52),(42,53),(42,54),(42,55),(43,56),(44,12),(45,57),(45,58),(46,59),(47,43),(48,60),(49,61),(49,62),(50,63),(50,64),(50,65),(51,66),(52,27),(53,67),(54,68),(54,68),(56,69),(56,70),(57,53),(57,71),(57,72),(58,73),(58,74),(58,75),(58,76),(58,77),(58,78),(59,79),(59,80),(60,81),(61,82),(62,83),(63,84),(64,85),(64,86),(65,87),(66,87),(67,87),(68,88),(69,89),(70,90),(71,91),(72,92),(73,93),(74,94),(75,95),(76,94),(77,96),(78,97),(79,98),(80,99),(81,100);
/*!40000 ALTER TABLE `songs_authors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 11:43:07
