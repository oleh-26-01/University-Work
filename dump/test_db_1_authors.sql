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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `spotify_id` varchar(22) NOT NULL,
  `full_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`,`spotify_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (6,'1jKpNUjiz4KXgaAZD5FI9S','Zack De La Rocha'),(7,'0LgrViZrCyMgg5MfTc33bd','EDDIE'),(8,'6guC9FqvlVboSKTI77NG2k','Dance Gavin Dance'),(9,'1Bj395MP3AL2B6KouMzkFO','Case & Point'),(10,'7kHzfxMLtVHHb523s43rY1','Converge'),(11,'1d8nxzS6sB0MoA9Ot3y0te','Shattered Void'),(12,'27VhXJzIph9c75cBh1e8XM','P.T. Adamczyk'),(13,'7g9IIZVavPOJdU9eNwTNLr','Fukkk Offf'),(14,'0iV8JK3Hpv4tHi5hY1s3O6','Cult Classique'),(15,'58AaQRBQr9QgTMutEuEQly','Erata'),(16,'2jtjyIKx9XY1wuIc5UKwSp','Caspro'),(17,'2CIMQHirSU0MQqyYHq0eOx','deadmau5'),(18,'0Aob82fk8XM9qBRhiCvSBO','Vector Seven'),(19,'51AYEWCEKer7b99vxXT0tT','Hypomaniacs'),(20,'4DotIIZU4xta9EFAMvO6Kx','PHONK WALKER'),(21,'17PKqjvXIlUPIx2TrwnVnb','Ku$h Drifter'),(22,'6YAOorJSNGWyH8m9N7cDeX','DEADLIFE'),(23,'133frzkTt6CsngIbqSjXgL','OT Greens'),(24,'6akhyFW3YCsKmLZrp6QmiJ','Raze'),(25,'4q2KeruDOYFXarHwsLA2eK','Sonic Mayhem'),(26,'0dalJaAT80lKfkZsC86lnW','Power Glove'),(27,'0360rTDeUjEyBXaz2Ki00a','Paul Leonard-Morgan'),(28,'4FidvjA9dxE6bhpHGC6ns9','CryJaxx'),(29,'6XoMjNBDFTRqFgBcy48zHO','Junior Charles'),(30,'1X0HaTcdkHW7LviblBiEeq','Rosa Walton'),(31,'5JNkPX6dYGLeEm4cUjHNGc','Hallie Coggins'),(32,'15nEVeIcqkAHozFdELFtrN','Head Splitter'),(33,'6DFJfhZxwWe1yKQvRDJmdl','Hyper'),(34,'6lNuZfZqCWUtNZJtoiHfqM','Peace Bringa'),(35,'6nFvVbL2RN5czSm7NZjE51','The Anix'),(36,'358aVgId2jUiL2HnPZa76q','Aura Shred'),(37,'68bAI2WX5wKSRMTx1qZafO','Shortwire'),(38,'62vhPMEE2pO5G1IvFsVwcI','Techlash'),(39,'3hteYQFiMFbJY7wS0xDymP','Gesaffelstein'),(40,'1Xyo4u8uXC1ZmMpatF05PJ','The Weeknd'),(41,'2IDLDx25HU1nQMKde4n61a','Rich Brian'),(42,'6f9bmfkqiYbhCtdAZsv7KI','Keith Ape'),(43,'15UsOTVnJzReFVN1VCnxy4','XXXTENTACION'),(44,'46HcJG62ky3Tj7yJpB2Qqg','Gost'),(45,'3GrokOnyG1LloekRSuNPPM','M.A.D.E.S'),(46,'2DYDFBqoaBP2i9XrTGpOgF','Naeleck'),(47,'58obmxGKVKCenZAkACSMgJ','Sarah Rebecca'),(48,'76SN9zHelSpjo9cqp6mJsw','Protector 101'),(49,'2rhFzFmezpnW82MNqEKVry','Ski Mask The Slump God'),(50,'1Ffb6ejR6Fe5IamqA5oRUF','Bring Me The Horizon'),(51,'6Ad91Jof8Niiw0lGLLi3NW','YUNGBLUD'),(52,'2VYQTNDsvvKN9wmU5W7xpj','Marilyn Manson'),(53,'2iUZ7aGjaOQ1aXVfkK4lfl','Konrad OldMoney'),(54,'5sqmJTPdOxO4IsRYq3FG7s','DJ CholoZ'),(55,'5NicD4I4cyxszrBMFY9aOq','Cerbeus'),(56,'1gEHdJ4DIEL2JuyRnNfMkt','Virtual Mage'),(57,'6SNjNqLGVBime9bLOFXWqZ','Deafkids'),(58,'0IqkUaxCFD8O4nWdobEaxf','Tainted Overlord'),(59,'5fD2qYm3eTtnx2EbsD1ELy','Light4storm'),(60,'5V9RbFZN8G82d2BoRKeJAP','Revizia'),(61,'1oZmFNkGAT93yD1xX4vTRE','Nina Kraviz'),(62,'2jzbYdD55IHAm5Rk7RHoYf','Bara Nova'),(63,'0t6BgJaiS4H0myMkXO4ezI','Geno Lenardo'),(64,'1k6KRwnr4J48zlQmhpusik','Code 137'),(65,'4OLKqrzAgoMVLWC3yw9rQD','Zeale'),(66,'74GPpxM5i8gN1sgNXh8JKu','Nightcrawler'),(67,'5VX8hxrcfJWwaTLiqGUHG3','TobyMac'),(68,'5Lv9Qc7dCi7vps4rQ5MfTV','SAMURAI'),(69,'7zX2YUEyaDjCJefgovrv3O','OnenO'),(70,'11JJ12asyKTafnVRa09Cxd','Slavoj McAllister'),(71,'3BTWVoLvHwiHPFcqLE8EB4','Kyubik'),(72,'1r4KmNdANyj8zWY78gCyrR','Johnny Gr4ves'),(73,'4UZtbKvU38q0kujsIRtrLE','Sebastian Robertson'),(74,'1gLb3owjx1aRHlHDspqXXT','Kill The Computer'),(75,'7xAbKeyE9AKjJ9DGkUkyvf','Indijinouz'),(76,'5xjJbcaQ19efgerJx4CClz','Kill Trigger'),(77,'5SYKAsVXahV1PNIdXAfESN','Paul Senai'),(78,'7LoaI7FeTDs9i7eV9GueGZ','KraKow'),(79,'31TPClRtHm23RisEBtV3X7','Justin Timberlake'),(80,'5Y5TRrQiqgUO4S36tzjIRZ','Timbaland'),(81,'7dGJo4pcD2V6oG8kP0tJRR','Eminem'),(82,'4RnezwRV7VBJUCI1S0AE5u','Block B'),(83,'0LyP0Zn0mXLb65AgGOS6EY','Ethan Bortnick'),(84,'4GxWcui9BlMJH9VOOK5wav','Higuchi Ai'),(85,'6t41YgqHULlgOq9TK1kcrG','The Kiffness'),(86,'66JL1PrbdExKUOHQ5ayPBB','Alugalug Cat 2.0'),(87,'3MoZ4E89fo2vGdf2IKfRCj','Karna'),(88,'5M3ffmRiOX9Q8Y4jNeR5wu','Wren Evans'),(89,'0nuGLpGw9XwyMLIKZxeRzE','Henri Werner'),(90,'7aWpPjjgItUnXljFxYYKZI','DeathbyRomy'),(91,'2X83WOmjaTu2FDixzCvP7P','INUMA'),(92,'4IFgewC2urR62Fwt7uAU03','Kerli'),(93,'6gWGD0yeQYobb2sq0LUr7k','L.Dre'),(94,'0qr7Rhj0yU7BPySYecNUlm','KWON EUN BI'),(95,'2AfmfGFbe0A0WsTYm0SDTx','(G)I-DLE'),(96,'6UbmqUEgjLA6jAcXwbM1Z9','BIBI'),(97,'2QM5S4yO6xHgnNvF0nbZZq','SEULGI'),(98,'28ot3wh4oNmoFOdVajibBl','NMIXX'),(99,'41MozSoPIsD1dJM0CLPjZF','BLACKPINK'),(100,'6MoXcK2GyGg7FIyxPU5yW6','SUNMI');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
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
