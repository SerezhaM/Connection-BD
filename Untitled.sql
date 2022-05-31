CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `Audio`
--

DROP TABLE IF EXISTS `Audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Audio` (
  `audio_id` int NOT NULL AUTO_INCREMENT,
  `audio_name` varchar(20) NOT NULL,
  `audio_length` varchar(5) NOT NULL,
  `audio_creator_id` int NOT NULL,
  PRIMARY KEY (`audio_id`),
  UNIQUE KEY `audio_id_UNIQUE` (`audio_id`),
  KEY `fk_Audio_User1_idx` (`audio_creator_id`),
  CONSTRAINT `fk_Audio_User1` FOREIGN KEY (`audio_creator_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Audio`
--

LOCK TABLES `Audio` WRITE;
/*!40000 ALTER TABLE `Audio` DISABLE KEYS */;
INSERT INTO `Audio` VALUES (1,'Песня №1','2:17',89721),(2,'Песня №2','2:01',89722),(3,'Песня №2','2:38',89721);
/*!40000 ALTER TABLE `Audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Chat`
--

DROP TABLE IF EXISTS `Chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chat` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `chat_title` varchar(45) NOT NULL,
  `chat_date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `chat_creator_id` int NOT NULL,
  PRIMARY KEY (`chat_id`),
  UNIQUE KEY `chat_id_UNIQUE` (`chat_id`),
  KEY `fk_Chat_User1_idx` (`chat_creator_id`),
  CONSTRAINT `fk_Chat_User1` FOREIGN KEY (`chat_creator_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chat`
--

LOCK TABLES `Chat` WRITE;
/*!40000 ALTER TABLE `Chat` DISABLE KEYS */;
INSERT INTO `Chat` VALUES (1,'Чат друзей','2019-02-01 21:00:00',89723),(2,'Рабочий чат','2020-08-31 21:00:00',89722);
/*!40000 ALTER TABLE `Chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Friendship`
--

DROP TABLE IF EXISTS `Friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Friendship` (
  `friendship_date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Friendship_status` enum('0','1','2') NOT NULL DEFAULT '0',
  `friendship_user_one` int NOT NULL,
  `friendship_user_two` int NOT NULL,
  PRIMARY KEY (`friendship_user_one`,`friendship_user_two`),
  KEY `fk_Friendship_User1_idx` (`friendship_user_one`),
  KEY `fk_Friendship_User2_idx` (`friendship_user_two`),
  CONSTRAINT `fk_Friendship_User1` FOREIGN KEY (`friendship_user_one`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `fk_Friendship_User2` FOREIGN KEY (`friendship_user_two`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Friendship`
--

LOCK TABLES `Friendship` WRITE;
/*!40000 ALTER TABLE `Friendship` DISABLE KEYS */;
INSERT INTO `Friendship` VALUES ('2021-12-22 16:15:55','1',89721,89722),('2021-12-22 16:15:49','1',89721,89726),('2021-12-22 14:59:59','1',89721,89727),('2021-12-23 11:29:01','1',89721,89730),('2021-12-22 16:04:08','1',89721,89731),('2021-12-20 12:54:41','1',89722,89721),('2021-12-19 11:57:30','1',89722,89723),('2021-12-20 12:48:59','0',89722,89724),('2021-12-20 12:48:59','1',89722,89725),('2021-12-20 13:18:49','1',89725,89721),('2021-12-20 13:18:49','1',89725,89723),('2021-12-22 15:00:23','1',89726,89721),('2021-12-23 11:29:56','1',89730,89731);
/*!40000 ALTER TABLE `Friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gallery`
--

DROP TABLE IF EXISTS `Gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gallery` (
  `photo_id` int NOT NULL AUTO_INCREMENT,
  `photo_date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `photo_content` blob NOT NULL,
  `photo_size` varchar(5) NOT NULL,
  `photo_user_id` int NOT NULL,
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `photo_id_UNIQUE` (`photo_id`),
  KEY `fk_Gallery_User1_idx` (`photo_user_id`),
  CONSTRAINT `fk_Gallery_User1` FOREIGN KEY (`photo_user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gallery`
--

LOCK TABLES `Gallery` WRITE;
/*!40000 ALTER TABLE `Gallery` DISABLE KEYS */;
INSERT INTO `Gallery` VALUES (1,'2021-12-20 11:58:39',_binary 'Фото№1','203KB',89723),(2,'2021-12-20 11:58:39',_binary 'Фото№2','205KB',89723),(3,'2021-12-20 11:58:39',_binary 'Фото№3','200KB',89723),(4,'2021-12-20 11:58:39',_binary 'Фото№1','199KB',89721),(5,'2021-12-20 11:58:39',_binary 'Фото№2','187KB',89721),(6,'2021-12-20 11:58:39',_binary 'Фото№1','235KB',89724);
/*!40000 ALTER TABLE `Gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Groups_`
--

DROP TABLE IF EXISTS `Groups_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Groups_` (
  `groups_id` int NOT NULL AUTO_INCREMENT,
  `groups_title` varchar(45) NOT NULL,
  `groups_information` varchar(255) NOT NULL,
  `groups_links` varchar(45) DEFAULT NULL,
  `groups_category` varchar(45) NOT NULL,
  `groups_creator_id` int NOT NULL,
  PRIMARY KEY (`groups_id`),
  UNIQUE KEY `group_id_UNIQUE` (`groups_id`),
  KEY `fk_Groups_User1_idx` (`groups_creator_id`),
  CONSTRAINT `fk_Groups_User1` FOREIGN KEY (`groups_creator_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groups_`
--

LOCK TABLES `Groups_` WRITE;
/*!40000 ALTER TABLE `Groups_` DISABLE KEYS */;
INSERT INTO `Groups_` VALUES (1,'Новостной паблик','Наша группа создана для того, чтобы рассказывать пользователям о новостях, которые проиходят в интернете!',NULL,'Новости',89724),(2,'Приколы','Все самое смешное только у нас!',NULL,'Юмор',89721),(3,'Странная группа','Все скандалы вы найдете только у нас *****',NULL,'*****',89723),(4,'Киномир','У нас вы найдете все новинки кино в хорошем качестве!',NULL,'Кино',89728);
/*!40000 ALTER TABLE `Groups_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_flag` tinyint NOT NULL DEFAULT '0',
  `message_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message_content` varchar(255) NOT NULL,
  `message_sender_id` int NOT NULL,
  `message_chat_id` int NOT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `Dialogs_id_UNIQUE` (`message_id`),
  KEY `fk_Dialogs_User1_idx` (`message_sender_id`),
  KEY `fk_Dialogs_Chat1_idx` (`message_chat_id`),
  CONSTRAINT `fk_Dialogs_Chat1` FOREIGN KEY (`message_chat_id`) REFERENCES `Chat` (`chat_id`),
  CONSTRAINT `fk_Dialogs_User1` FOREIGN KEY (`message_sender_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
INSERT INTO `Message` VALUES (1,0,'2019-02-01 21:00:00','Всем привет! Этот чат создан для общения между собой)',89723,1),(2,0,'2019-02-01 21:00:00','По любым вопросам пишите мне в личные сообщения',89723,1),(3,0,'2020-08-31 21:00:00','Всем привет!',89723,2),(4,1,'2020-08-31 21:00:00','Как дела?',89722,2),(5,0,'2021-12-20 10:50:29','С вами невозможно работать! Вы нервные!',89723,1),(6,0,'2021-12-20 11:29:26','Давайте встретимся завтра и все обсудил лично',89724,1),(7,0,'2021-12-20 14:29:40','Что тут происходит?',89729,2);
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Participants`
--

DROP TABLE IF EXISTS `Participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Participants` (
  `participants_id` int NOT NULL AUTO_INCREMENT,
  `participants_role` enum('User','Admin') NOT NULL DEFAULT 'User',
  `participants_date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `participants_chat_id` int NOT NULL,
  `participants_user_id` int NOT NULL,
  PRIMARY KEY (`participants_id`),
  KEY `fk_Participants_Chat1_idx` (`participants_chat_id`),
  KEY `fk_Participants_User1_idx` (`participants_user_id`),
  CONSTRAINT `fk_Participants_Chat1` FOREIGN KEY (`participants_chat_id`) REFERENCES `Chat` (`chat_id`),
  CONSTRAINT `fk_Participants_User1` FOREIGN KEY (`participants_user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participants`
--

LOCK TABLES `Participants` WRITE;
/*!40000 ALTER TABLE `Participants` DISABLE KEYS */;
INSERT INTO `Participants` VALUES (1,'Admin','2019-02-01 21:00:00',1,89723),(2,'User','2019-02-01 21:00:00',1,89722),(3,'Admin','2020-08-31 21:00:00',2,89722),(4,'User','2020-08-31 21:00:00',2,89723),(5,'User','2019-02-02 21:00:00',1,89721),(6,'User','2019-02-02 21:00:00',1,89724),(7,'User','2019-02-02 21:00:00',1,89725),(8,'User','2021-12-20 14:28:47',2,89729),(9,'User','2021-12-20 14:28:47',2,89727);
/*!40000 ALTER TABLE `Participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Participants_group`
--

DROP TABLE IF EXISTS `Participants_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Participants_group` (
  `participants_group_id` int NOT NULL AUTO_INCREMENT,
  `participants_group_role` enum('user','moderator','admin') NOT NULL DEFAULT 'user',
  `participants_group_date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `participants_group_groups_id` int NOT NULL,
  `participants_user_id` int NOT NULL,
  PRIMARY KEY (`participants_group_id`),
  KEY `fk_Participants_group_Groups1_idx` (`participants_group_groups_id`),
  KEY `fk_Participants_group_User1_idx` (`participants_user_id`),
  CONSTRAINT `fk_Participants_group_Groups1` FOREIGN KEY (`participants_group_groups_id`) REFERENCES `Groups_` (`groups_id`),
  CONSTRAINT `fk_Participants_group_User1` FOREIGN KEY (`participants_user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participants_group`
--

LOCK TABLES `Participants_group` WRITE;
/*!40000 ALTER TABLE `Participants_group` DISABLE KEYS */;
INSERT INTO `Participants_group` VALUES (1,'admin','2021-12-20 10:21:09',1,89724),(2,'user','2021-12-20 10:21:09',1,89722),(3,'user','2021-12-20 10:21:09',1,89721),(4,'admin','2021-12-20 10:23:47',2,89721),(5,'user','2021-12-20 10:23:47',2,89722),(6,'user','2021-12-20 10:23:47',2,89723),(7,'admin','2021-12-20 10:23:47',3,89723),(8,'user','2021-12-20 10:23:47',3,89724),(9,'user','2021-12-20 10:23:47',3,89722),(10,'admin','2021-12-20 14:40:49',4,89728),(11,'user','2021-12-20 14:40:49',4,89724),(12,'user','2021-12-20 14:40:49',4,89725),(13,'admin','2021-12-20 14:40:49',4,89726),(14,'user','2021-12-20 14:40:49',4,89727),(15,'user','2021-12-20 14:40:49',4,89723),(16,'user','2021-12-20 14:40:49',4,89729),(17,'user','2021-12-20 14:41:19',2,89726),(18,'user','2021-12-20 14:41:19',2,89725);
/*!40000 ALTER TABLE `Participants_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Report`
--

DROP TABLE IF EXISTS `Report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `report_type` varchar(45) NOT NULL,
  `report_text` text NOT NULL,
  `report_date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `report_user_id` int NOT NULL,
  `report_participants_id` int NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `fk_Report_User1_idx` (`report_user_id`),
  KEY `fk_Report_Participants1_idx` (`report_participants_id`),
  CONSTRAINT `fk_Report_Participants1` FOREIGN KEY (`report_participants_id`) REFERENCES `Participants` (`participants_id`),
  CONSTRAINT `fk_Report_User1` FOREIGN KEY (`report_user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report`
--

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report` DISABLE KEYS */;
INSERT INTO `Report` VALUES (1,'Оскорбления','Пользователь оскорблял других участников в чате.','2021-12-20 10:48:24',89724,1),(2,'Угроза','','2021-12-20 11:28:54',89721,6);
/*!40000 ALTER TABLE `Report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_audio`
--

DROP TABLE IF EXISTS `User_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_audio` (
  `user_audio_id` int NOT NULL AUTO_INCREMENT,
  `user_audio_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_audio_user_id` int NOT NULL,
  `user_audio_audio_id` int NOT NULL,
  PRIMARY KEY (`user_audio_id`),
  KEY `fk_User_groups_User1_idx` (`user_audio_user_id`),
  KEY `fk_User_audio_Audio1_idx` (`user_audio_audio_id`),
  CONSTRAINT `fk_User_audio_Audio1` FOREIGN KEY (`user_audio_audio_id`) REFERENCES `Audio` (`audio_id`),
  CONSTRAINT `fk_User_groups_User10` FOREIGN KEY (`user_audio_user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_audio`
--

LOCK TABLES `User_audio` WRITE;
/*!40000 ALTER TABLE `User_audio` DISABLE KEYS */;
INSERT INTO `User_audio` VALUES (1,'2021-12-19 12:46:16',89724,1),(2,'2021-12-20 10:25:42',89724,2),(3,'2021-12-20 10:25:42',89724,3),(4,'2021-12-20 10:26:03',89722,1),(5,'2021-12-20 10:26:03',89723,2),(6,'2021-12-20 10:26:03',89721,3);
/*!40000 ALTER TABLE `User_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_groups`
--

DROP TABLE IF EXISTS `User_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_groups` (
  `user_groups_id` int NOT NULL AUTO_INCREMENT,
  `user_groups_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_groups_groups_id` int NOT NULL,
  `user_groups_user_id` int NOT NULL,
  PRIMARY KEY (`user_groups_id`),
  KEY `fk_User_groups_Groups1_idx` (`user_groups_groups_id`),
  KEY `fk_User_groups_User1_idx` (`user_groups_user_id`),
  CONSTRAINT `fk_User_groups_Groups1` FOREIGN KEY (`user_groups_groups_id`) REFERENCES `Groups_` (`groups_id`),
  CONSTRAINT `fk_User_groups_User1` FOREIGN KEY (`user_groups_user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_groups`
--

LOCK TABLES `User_groups` WRITE;
/*!40000 ALTER TABLE `User_groups` DISABLE KEYS */;
INSERT INTO `User_groups` VALUES (1,'2021-12-20 10:12:14',1,89724),(2,'2021-12-20 10:12:14',2,89721),(3,'2021-12-20 10:12:14',3,89723),(4,'2021-12-20 14:35:20',4,89724),(8,'2021-12-20 14:35:20',4,89723),(9,'2021-12-20 14:35:20',4,89725),(10,'2021-12-20 14:35:20',4,89726),(11,'2021-12-20 14:35:20',4,89727),(12,'2021-12-20 14:35:20',4,89729),(13,'2021-12-20 14:36:52',2,89726),(14,'2021-12-20 14:36:56',2,89725),(15,'2021-12-20 14:43:23',3,89724),(16,'2021-12-20 14:43:23',3,89722),(17,'2021-12-20 14:44:04',1,89721),(18,'2021-12-20 14:44:04',1,89722),(19,'2021-12-20 14:44:40',2,89723),(20,'2021-12-20 14:44:40',2,89722),(21,'2021-12-20 14:45:20',4,89728);
/*!40000 ALTER TABLE `User_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_first_name` varchar(45) NOT NULL,
  `user_last_name` varchar(45) NOT NULL,
  `user_middle_name` varchar(45) DEFAULT NULL,
  `user_city` varchar(45) NOT NULL,
  `user_age` datetime NOT NULL,
  `user_phone` bigint NOT NULL,
  `user_reports` tinyint NOT NULL DEFAULT '0',
  `user_banned` tinyint NOT NULL DEFAULT '0',
  `user_password` varchar(75) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `idUser_UNIQUE` (`user_id`),
  UNIQUE KEY `user_phone_UNIQUE` (`user_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=89732 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (89721,'Сергей','Машоха','Алексеевич','Кисловодск','2001-11-09 00:00:00',89104486091,0,0,'1234567890'),(89722,'София','Тюрская','Александровна','Москва','2000-12-23 00:00:00',89114586697,0,0,'189260282'),(89723,'Максим','Попов',NULL,'Санкт-Петербург','2004-03-01 00:00:00',89344456045,5,1,'12345678900987654321'),(89724,'Ирина','Тихомирова','Львовна','Сочи','1999-10-07 00:00:00',89125598093,0,1,'178DBUYgu'),(89725,'Алексей','Крючков','Степанович','Новосибирск','1998-05-30 00:00:00',89114239099,0,0,'UYwvquy1988692'),(89726,'Анатолий','Новиков','Иванович','Самара','1989-03-29 00:00:00',89162280099,0,0,'c4e45effbd8b14cac9696c5d77f3923c'),(89727,'Антон','Крюков','Петрович','Анапа','2003-01-29 00:00:00',89142340097,1,0,'d8ad5a7a4401fbb49cbe0cf1c02a8284'),(89728,'Алина','Проданец','Павловна','Москва','1992-11-11 00:00:00',89232285559,0,0,'f62949a756c87555e9f95510ed9006bf'),(89729,'Юрий','Горбач','Сергеевич','Рязань','1996-04-17 00:00:00',89192769095,0,0,'73591efed54971328b5ff2f52e19adea'),(89730,'Юрий','Капустин','Алексеевич','Москва','2001-07-13 00:00:00',79346745992,0,0,'43e73c444e1f71160d3a4ef4621cd17f'),(89731,'Олег','Табув','Григорьевич','Новосибирск','1997-01-08 00:00:00',89453425623,0,1,'a9de257d3a18e19638bdcb31ece92e37');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-31 12:29:11
