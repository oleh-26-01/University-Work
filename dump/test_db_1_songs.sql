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
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `spotify_id` varchar(22) NOT NULL,
  `name` varchar(100) NOT NULL,
  `duration` int NOT NULL,
  PRIMARY KEY (`id`,`spotify_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='duration in seconds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (7,'63cdCzzzWeNjZc3lKUSWTE','We Want It All',247),(8,'1TBYoKmgLjB9UkjNPQLMza','Still Healing',346),(9,'4PRYkxqoD1wiyIVmwegAjg','Pop Off!',188),(10,'7ytmVTRwGXQLz3cBPP3McS','Savage',242),(11,'1MBRdxHYVp5xZRZHR6TBdg','I Won\'t Let You Go',179),(12,'2wFCZCwlkjAh6Y8wM0n65U','Scavenger Hunt',228),(13,'0H9jOqgG6yafIJsx7RcrZd','Sweller',353),(14,'4GsBRFjuAXt7zVUqh89uwP','Passage',212),(15,'7bxItQqLaMjjLRa5T3R3wK','Goosebumps',173),(16,'2da53XT4pzOkiY3bRPnKlp','Some Chords',443),(17,'6qLI7SzldN2HQbDKDHPanK','Braindance',205),(18,'7DM16RZqHxIRNMhcYykRW3','Breach',287),(19,'2IFSfu19kxWBLQB2CEHqyb','Retribution',113),(20,'4wOhPUptCNCCJK0OtjFzpy','Deviant',322),(21,'2JYOR5Ooyt0pPy67Qk68SZ','let\'s go',120),(22,'0d9ihfYvkVGLdzAntwJeFZ','Okay',189),(23,'5UrCArd6UDDR2EPFOeWCxb','Futureland',363),(24,'5r1eE2isaoBbUzZCaNPDzN','Mining Minds',173),(25,'7u8rSIe0Rh7XrwPV9btvwG','Candy Shop',174),(26,'7mykoq6R3BArsSpNDjFQTm','I Really Want to Stay at Your House',246),(27,'6UTJcasEedZzJ73ems6RrK','Sneak Peak - Instrumental',181),(28,'4SLGLPxm7wTAVvnJGDlKqh','Lies - Original Mix',222),(29,'5bO9qus7AK2pZ0whNTeoau','Red Pill Dilemma',207),(30,'1qWnbfoPx8CGkawbgSP7Gc','Illusion Of Control',236),(31,'5Nmqm5UCcG91GwwzcmCIuJ','Prosthetics',230),(32,'2vXKRlJBXyOcvZYTdNeckS','Lost in the Fire (feat. The Weeknd)',202),(33,'2PqSNVmiEQpFkLoNPoDfwI','Gospel',173),(34,'4W4MshifF244xhzFoMu699','The Prowler',248),(35,'6pV1lc8lIc8ARNB6KsZukt','Never Fade Away (SAMURAI Cover)',286),(36,'6JS1zboZEMNJbfeJIfSzNU','Return - Original Mix',303),(37,'0TRmtiR9q6XnYDzXmoMpGC','All My Heroes - Radio Edit',228),(38,'3cg74qiQwnB5ttOc1IgJSV','Guns - Infiltrate 2015 Mix',315),(39,'658I1uDnmLSiltFCf98AWE','RIP Roach',169),(40,'6MD6xpFK4cfquxRqXxqwjq','Obey (with YUNGBLUD)',220),(41,'3D0bXrSv7O73vOaGOG8J9c','Sweet Dreams (Are Made Of This)',293),(42,'7H6684raxC6EMpk0lfIPOf','Westcoast Til I Die (feat. Cerbeus)',189),(43,'2muceWV06HPIW94IJZkxRo','Cube Is Angry',186),(44,'3m8UfZwPMMbiWfGR8Lg2cR','The Rebel Path',250),(45,'5fjxmMrRYy1h1oufXbz0C2','Selva Pulsátil',378),(46,'0QEK42BjP7K70BNcMPt952','Move South',172),(47,'2z6W6oeZvBaO56Mg587v0w','#ImSippinTeaInYoHood',173),(48,'4nfagaCPEtUrUN7SjAO63M','Massacre',305),(49,'1Wr2ewPsFJADpYIbkkHmq4','Surprise Me, I\'m Surprised Today',387),(50,'742Z7QRFuFZByPMvxfog0q','Suicide (feat. Zeale)',230),(51,'4eGLGjXg7R2NoxUruBY5g0','Partners in Pain',213),(52,'2WtxKEYDG007Lm8jC16xUF','The Suits Are Scared',151),(53,'6jHMLCvbOJbGeXx6BoIm4m','The Slam',199),(54,'5Ln8eNkYC9to99zsPEZbS2','Black Dog',263),(55,'5Ln8eNkYC9to99zsPEZbS2','Black Dog',263),(56,'76MHbYWPbE6fsrsVvZBt31','Makes Me Feel Better',321),(57,'7C8nA84nqtzdTZdKq9YVGF','Gr4ves (feat. Johnny Gr4ves)',179),(58,'100UB12ze62tK65TOy6nPV','The God Machines (feat. Paul Senai & KraKow)',188),(59,'0O45fw2L5vsWpdsOdXwNAR','SexyBack (feat. Timbaland)',242),(60,'3CpoeW0cZSDzIRv5z34F87','Sing For The Moment',339),(61,'4fZYGHiRcKxwVSnF498uaE','닐리리맘보',207),(62,'4u5CfuAGAHNYDIHSSW7BiY','engravings',180),(63,'4pw7EuK2WTWGHI51jCKuGJ','Akuma no Ko',229),(64,'27w85fUl9w1JnyK7ND1zxJ','Please Go Away',162),(65,'09Hj42bnAo4ktErctQeVCs','Маленька',223),(66,'3indfRjdborH9TbMigMQmS','Моя мила',239),(67,'3zbDuhylYYFTCh58HXfc0c','Party на Прикарпатті',205),(68,'45Mswno1F7FoZkcmQkp7fi','Thích Em Hơi Nhiều',171),(69,'0mp2ipE8nmfErRQlaEk58m','Demons',160),(70,'4Qt6fOWtoMdjQYtV5jztL2','Day I Die',177),(71,'6O2K6AekTMMROpbXeXvXFo','Not Good',244),(72,'69ZrXz17a2ajFEPvOpYCn6','One',200),(73,'7HWaB2AEfyhAUEPkW9G4ni','Gravity Falls',114),(74,'5bdmWBCaiaHk2HbqKOXLyJ','Underwater',170),(75,'4xc3JpkI8kxLwk1SJafjzh','DARK (X-file)',165),(76,'1EI12J2m1VnzHwFsLmHuDj','Croquis',187),(77,'3gAXVQOR0h7Ks71lsr5MFZ','Animal Farm',203),(78,'1dfsPqH09vnzUWEOsN98Ex','28 Reasons',189),(79,'1QpwvWMQGdOgA8MXXfgs4H','DICE',165),(80,'7gRFDGEzF9UkBV233yv2dc','Shut Down',175),(81,'4JmbtS0Muijl37KP9lDscy','Heart Burn',193);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
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
