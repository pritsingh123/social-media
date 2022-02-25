CREATE DATABASE  IF NOT EXISTS `project_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project_db`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: project_db
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_recived` tinyint(1) DEFAULT '0',
  `content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (2,2,'2020-03-09 23:39:36','2020-03-10 15:54:31',1,'New message from prit : hello pankaj how are you bro'),(3,1,'2020-03-09 23:42:33','2020-03-10 15:54:02',1,'New message from pnkj : hello prit am fine '),(4,1,'2020-03-09 23:42:49','2020-03-10 15:54:02',1,'New message from pnkj : am getting late ok'),(5,1,'2020-03-09 23:43:05','2020-03-10 15:54:02',1,'New message from pnkj : ok done'),(6,2,'2020-03-10 10:22:10','2020-03-10 15:54:31',1,'prit Liked Your post ??'),(7,3,'2020-03-10 10:22:12','2020-03-10 10:22:12',0,'prit Liked Your post ??'),(8,1,'2020-03-10 10:24:19','2020-03-10 10:25:14',1,'pnkj Liked Your post ??'),(9,1,'2020-03-10 10:24:21','2020-03-10 10:25:14',1,'pnkj Liked Your post ??'),(10,1,'2020-03-10 10:24:22','2020-03-10 10:25:14',1,'pnkj Liked Your post ??'),(11,1,'2020-03-10 10:24:24','2020-03-10 10:25:14',1,'pnkj Liked Your post ??'),(12,1,'2020-03-10 10:32:42','2020-03-10 10:33:09',1,'pnkj Liked Your post ??'),(13,1,'2020-03-10 10:32:43','2020-03-10 10:33:09',1,'pnkj Liked Your post ??'),(14,1,'2020-03-10 10:32:44','2020-03-10 10:33:09',1,'pnkj Liked Your post ??'),(15,1,'2020-03-10 10:32:46','2020-03-10 10:33:09',1,'pnkj Liked Your post ??'),(16,1,'2020-03-10 15:56:00','2020-03-10 15:56:17',1,'New message from pnkj : hello prit am pankaj'),(17,1,'2020-03-10 16:16:30','2020-03-10 16:18:01',1,'pnkj Liked Your post'),(18,1,'2020-03-10 16:16:31','2020-03-10 16:18:01',1,'pnkj Liked Your post'),(19,1,'2020-03-10 16:16:33','2020-03-10 16:18:01',1,'pnkj Liked Your post'),(20,1,'2020-03-10 16:17:41','2020-03-10 16:18:01',1,'New message from pnkj : hello prit am pankaj how are you'),(21,1,'2020-03-10 16:20:11','2020-03-10 16:20:23',1,'pnkj Liked Your post'),(22,1,'2020-03-10 17:20:20','2020-03-10 17:57:45',1,'New message from pritpal : bhaii block krtaa menu'),(23,1,'2020-03-10 17:25:09','2020-03-10 17:57:45',1,'New message from pritpal : hello prit plz reply'),(24,1,'2020-03-10 17:29:03','2020-03-10 17:57:45',1,'New message from pritpal : hi nonnoooo');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-15 14:00:41
