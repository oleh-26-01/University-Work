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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `spotify_id` varchar(32) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `reg_date` date NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `token_type` varchar(16) DEFAULT NULL,
  `expires_in` int DEFAULT NULL,
  `expires_at` int DEFAULT NULL,
  `refresh_token` varchar(256) NOT NULL,
  PRIMARY KEY (`id`,`spotify_id`,`access_token`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'dxec6epns5ny9htsgww6sgwir','Oleh','2022-11-25','BQDp8uPNwGOwIT5hV3a1DiNF_h2ak_cT7aeB91dku_hhGR8pbi_3NSjZCoKqArp6GLOlmPKrUO83KXIwYEaEb1pmG5-RSAJBdAUCvGv20BbFVW58i_ang9Nd9QM73M6MBttQiIBQ1a3WdJAt-7tSAExe1FsITuBQuv_7m8AxXknjbqn__s93ZRLh0_9tzxoauRP0EShmB7oIjZBV3NTpTRyGZPpSm-axmJhilPX2DaLuHneWj5b0P0owXxfk24JLBGJg_kbIqUt_FrEEwV9-RdigazGH17rqycomMKHhnKcc3Hp46zxqn3U0SnZRkvSkV8V9v6epWhaivY1Y','Bearer',3600,1669543574,'AQAe893GC8fTI4uK5h97pW7wEgIMZM9monB0HavEZgqpyzcqTrJdTXLpjK6fXTiWZR9mgXHLqiw-uXauW2ot1iS1ilfkOeDq-SlPEQ4AIw4XYUlu12JlpK0QqrOd6BDUiO8'),(7,'31cd76z4klcrhx4h7cillwl2oh2e','Sasha','2022-11-25','BQALoeZRGgKZfxOqr9TJRZhDLPU8aSV5cRQHAEWuUwIrKZD92sEAIMWVzfP-uwXoM4jXpvb6OrANzvScr-id4zYSLWqUdLehhbIVZQs0KMNhWfK87UBxkb7fMG1F5RIxExr81WUsEnKoeaXxH9IBDM6LQpeMGbJlj_qn498X4SzMNhpr1Znqv_FR9hw2sFRzY7z150t3gjnnMh8Z88hwfe25r-MKGXP7TFP_F3PatUvKDTw_IhOP9u8y8zSXJpgEFhhum9bRdkVQOxvAZPxL-5XcQxGxAAqXrRb_TEtTQT0gudriSJdYK6dnx4-Jbt1hwHDjKsdthKnLDGP5bbsC0K3O','Bearer',3600,1669534689,'AQCZ1lcJMX-jdMzR4N5OmOrQ-MarenfgnfwV-X6eUGOfPA5lKrVEnrJT3pzpmTgD7YLPsrV3t0p-HqeaHdB03ZIqbuXjjWZUFYKMLztbsx2cUoWpC4w3iQnACRra39WLWOg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 11:43:08