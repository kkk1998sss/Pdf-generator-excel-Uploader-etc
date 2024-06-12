CREATE DATABASE  IF NOT EXISTS `om_ticket_raise` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `om_ticket_raise`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: om_ticket_raise
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `om_customer_master`
--

DROP TABLE IF EXISTS `om_customer_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `om_customer_master` (
  `customerId` bigint NOT NULL AUTO_INCREMENT,
  `phoneNumer` bigint NOT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `enterBy` int NOT NULL,
  `enterDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customertype` varchar(45) NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `om_customer_master`
--

LOCK TABLES `om_customer_master` WRITE;
/*!40000 ALTER TABLE `om_customer_master` DISABLE KEYS */;
INSERT INTO `om_customer_master` VALUES (1,8009697699,NULL,88899,'2023-04-29 10:55:32','cutomer'),(2,12345649,NULL,12345649,'2023-04-29 10:58:53','Customer');
/*!40000 ALTER TABLE `om_customer_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `om_ticket_detail`
--

DROP TABLE IF EXISTS `om_ticket_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `om_ticket_detail` (
  `tiket_id` bigint NOT NULL,
  `ticketNumber` bigint NOT NULL,
  `assignUser` varchar(45) NOT NULL,
  `helpTopic` varchar(45) NOT NULL,
  `remarks` varchar(155) NOT NULL,
  `enterDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enterBy` varchar(45) NOT NULL,
  `modifyBy` varchar(45) DEFAULT NULL,
  `modifyDate` timestamp NULL DEFAULT NULL,
  `remainingTime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tiket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `om_ticket_detail`
--

LOCK TABLES `om_ticket_detail` WRITE;
/*!40000 ALTER TABLE `om_ticket_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `om_ticket_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `om_ticket_master`
--

DROP TABLE IF EXISTS `om_ticket_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `om_ticket_master` (
  `tiket_id` bigint NOT NULL AUTO_INCREMENT,
  `ticker_Number` varchar(45) NOT NULL,
  `ticket_status` varchar(45) NOT NULL,
  `ticket_helpTopic` varchar(155) NOT NULL,
  `PhoneNumber` bigint NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `emailId` varchar(45) NOT NULL,
  `enterBy` int NOT NULL,
  `enterDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifyBy` int DEFAULT NULL,
  `modifyDate` timestamp NULL DEFAULT NULL,
  `fullName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tiket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `om_ticket_master`
--

LOCK TABLES `om_ticket_master` WRITE;
/*!40000 ALTER TABLE `om_ticket_master` DISABLE KEYS */;
INSERT INTO `om_ticket_master` VALUES (1,'132244','start','test',324567543,'testst','abc@gmail.com',2147483647,'2023-04-27 09:15:06',NULL,NULL,NULL),(2,'132244','start','test',324567543,'testst','abc@gmail.com',88002,'2023-04-27 09:15:17',NULL,NULL,NULL),(3,'2342','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-27 09:40:21',NULL,NULL,'Anubhav'),(4,'2342','yrs','testrst',1156515,'tests','undefined',1306,'2023-04-27 09:43:52',NULL,NULL,'Anubhav'),(5,'2342','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 06:19:08',NULL,NULL,'Anubhav'),(6,'2342','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 06:19:49',NULL,NULL,'Anubhav'),(7,'42','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 06:20:00',NULL,NULL,'Anubhav'),(8,'42','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 06:20:09',NULL,NULL,'Anubhav'),(9,'2342','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 06:28:18',NULL,NULL,'Anubhav'),(10,'2342','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 06:33:28',NULL,NULL,'Anubhav'),(11,'2342','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 06:34:37',NULL,NULL,'beena'),(12,'23222','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 10:32:10',NULL,NULL,'Anubhav'),(13,'23222','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 10:33:30',NULL,NULL,'btry'),(14,'23222','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 10:41:50',NULL,NULL,'nailwal'),(15,'23222','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 10:44:23',NULL,NULL,'nailwal'),(16,'23222','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 10:46:05',NULL,NULL,'nailwal'),(17,'23222','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 10:46:14',NULL,NULL,'bbbbbbbbbbbbbbbbbb'),(18,'23222','yrs','testrst',1156515,'tests','abhisubh47@gmail.com',1306,'2023-04-28 10:48:23',NULL,NULL,'bbbbbbbbbbbbbbbbbb'),(19,'undefined','undefined','One',1,'','beena@121',1306,'2023-04-28 11:03:46',NULL,NULL,'beena'),(20,'undefined','undefined','One',12,'','beena@121',1306,'2023-04-28 11:03:46',NULL,NULL,'beena'),(21,'undefined','undefined','One',123,'','beena@121',1306,'2023-04-28 11:03:47',NULL,NULL,'beena'),(22,'undefined','undefined','One',1234,'','beena@121',1306,'2023-04-28 11:03:47',NULL,NULL,'beena'),(23,'undefined','undefined','One',12345,'','beena@121',1306,'2023-04-28 11:03:49',NULL,NULL,'beena'),(24,'undefined','undefined','1',12345,'','beena@121',1306,'2023-04-28 11:03:51',NULL,NULL,'beena'),(25,'undefined','undefined','1',12345,'j','beena@121',1306,'2023-04-28 11:03:53',NULL,NULL,'beena'),(26,'undefined','undefined','1',12345,'js','beena@121',1306,'2023-04-28 11:03:53',NULL,NULL,'beena'),(27,'undefined','undefined','1',12345,'jsd','beena@121',1306,'2023-04-28 11:03:53',NULL,NULL,'beena'),(28,'undefined','undefined','1',12345,'jsdk','beena@121',1306,'2023-04-28 11:03:53',NULL,NULL,'beena'),(29,'undefined','undefined','1',12345,'jsdka','beena@121',1306,'2023-04-28 11:03:53',NULL,NULL,'beena'),(30,'undefined','undefined','1',12345,'jsdkas','beena@121',1306,'2023-04-28 11:03:53',NULL,NULL,'beena'),(31,'undefined','undefined','1',12345,'jsdkasd','beena@121',1306,'2023-04-28 11:03:53',NULL,NULL,'beena'),(32,'undefined','undefined','1',12345,'jsdkas','beena@121',1306,'2023-04-28 11:03:55',NULL,NULL,'beena'),(33,'undefined','undefined','1',12345,'jsdka','beena@121',1306,'2023-04-28 11:03:55',NULL,NULL,'beena'),(34,'undefined','undefined','1',12345,'jsdk','beena@121',1306,'2023-04-28 11:03:55',NULL,NULL,'beena'),(35,'undefined','undefined','1',12345,'jsd','beena@121',1306,'2023-04-28 11:03:55',NULL,NULL,'beena'),(36,'undefined','undefined','1',12345,'js','beena@121',1306,'2023-04-28 11:03:55',NULL,NULL,'beena'),(37,'undefined','undefined','1',12345,'j','beena@121',1306,'2023-04-28 11:03:55',NULL,NULL,'beena'),(38,'undefined','undefined','1',12345,'','beena@121',1306,'2023-04-28 11:03:55',NULL,NULL,'beena'),(39,'undefined','undefined','1',12345,'k','beena@121',1306,'2023-04-28 11:03:59',NULL,NULL,'beena'),(40,'undefined','undefined','1',12345,'ks','beena@121',1306,'2023-04-28 11:03:59',NULL,NULL,'beena'),(41,'undefined','undefined','1',12345,'ksd','beena@121',1306,'2023-04-28 11:03:59',NULL,NULL,'beena'),(42,'undefined','undefined','1',12345,'ksdk','beena@121',1306,'2023-04-28 11:03:59',NULL,NULL,'beena'),(43,'undefined','undefined','1',12345,'ksdkl','beena@121',1306,'2023-04-28 11:03:59',NULL,NULL,'beena'),(44,'undefined','undefined','1',12345,'ksdkls','beena@121',1306,'2023-04-28 11:04:00',NULL,NULL,'beena'),(45,'undefined','undefined','1',12345,'ksdklsd','beena@121',1306,'2023-04-28 11:04:00',NULL,NULL,'beena'),(46,'undefined','undefined','1',12345,'ksdklsd.','beena@121',1306,'2023-04-28 11:04:00',NULL,NULL,'beena'),(47,'undefined','undefined','1',12345,'ksdklsd.m','beena@121',1306,'2023-04-28 11:04:00',NULL,NULL,'beena'),(48,'undefined','undefined','1',12345,'ksdklsd.','beena@121',1306,'2023-04-28 11:04:02',NULL,NULL,'beena'),(49,'undefined','undefined','1',12345,'ksdklsd','beena@121',1306,'2023-04-28 11:04:02',NULL,NULL,'beena'),(50,'undefined','undefined','1',12345,'ksdkls','beena@121',1306,'2023-04-28 11:04:02',NULL,NULL,'beena'),(51,'undefined','undefined','1',12345,'ksdkl','beena@121',1306,'2023-04-28 11:04:02',NULL,NULL,'beena'),(52,'undefined','undefined','1',12345,'ksdk','beena@121',1306,'2023-04-28 11:04:02',NULL,NULL,'beena'),(53,'undefined','undefined','1',12345,'ksd','beena@121',1306,'2023-04-28 11:04:02',NULL,NULL,'beena'),(54,'undefined','undefined','1',12345,'ks','beena@121',1306,'2023-04-28 11:04:02',NULL,NULL,'beena'),(55,'undefined','undefined','1',12345,'k','beena@121',1306,'2023-04-28 11:04:02',NULL,NULL,'beena'),(56,'undefined','undefined','1',12345,'','beena@121',1306,'2023-04-28 11:04:02',NULL,NULL,'beena'),(57,'undefined','undefined','1',12345,'d','beena@121',1306,'2023-04-28 11:04:03',NULL,NULL,'beena'),(58,'undefined','undefined','1',12345,'','beena@121',1306,'2023-04-28 11:04:03',NULL,NULL,'beena'),(59,'undefined','undefined','1',12345,'d','beena@121',1306,'2023-04-28 11:04:03',NULL,NULL,'beena'),(60,'undefined','undefined','1',12345,'dm','beena@121',1306,'2023-04-28 11:04:04',NULL,NULL,'beena'),(61,'undefined','undefined','1',12345,'dms','beena@121',1306,'2023-04-28 11:04:04',NULL,NULL,'beena'),(62,'undefined','undefined','1',12345,'dms,','beena@121',1306,'2023-04-28 11:04:04',NULL,NULL,'beena'),(63,'undefined','undefined','1',12345,'dms,d','beena@121',1306,'2023-04-28 11:04:04',NULL,NULL,'beena'),(64,'undefined','undefined','1',12345,'dms,dm','beena@121',1306,'2023-04-28 11:04:04',NULL,NULL,'beena'),(65,'undefined','undefined','1',12345,'dms,dms','beena@121',1306,'2023-04-28 11:04:04',NULL,NULL,'beena'),(66,'undefined','undefined','1',12345,'dms,dms.','beena@121',1306,'2023-04-28 11:04:04',NULL,NULL,'beena'),(67,'undefined','undefined','1',12345,'dms,dms.,','beena@121',1306,'2023-04-28 11:04:04',NULL,NULL,'beena'),(68,'undefined','undefined','1',12345,'dms,dms.','beena@121',1306,'2023-04-28 11:04:05',NULL,NULL,'beena'),(69,'undefined','undefined','1',12345,'dms,dms','beena@121',1306,'2023-04-28 11:04:05',NULL,NULL,'beena'),(70,'undefined','undefined','1',12345,'dms,dm','beena@121',1306,'2023-04-28 11:04:05',NULL,NULL,'beena'),(71,'undefined','undefined','1',12345,'dms,d','beena@121',1306,'2023-04-28 11:04:06',NULL,NULL,'beena'),(72,'undefined','undefined','1',12345,'dms,','beena@121',1306,'2023-04-28 11:04:06',NULL,NULL,'beena'),(73,'undefined','undefined','1',12345,'dms','beena@121',1306,'2023-04-28 11:04:06',NULL,NULL,'beena'),(74,'undefined','undefined','1',12345,'dmsj','beena@121',1306,'2023-04-28 11:04:07',NULL,NULL,'beena'),(75,'undefined','undefined','1',12345,'dmsjd','beena@121',1306,'2023-04-28 11:04:07',NULL,NULL,'beena'),(76,'undefined','undefined','1',12345,'dmsjdk','beena@121',1306,'2023-04-28 11:04:07',NULL,NULL,'beena'),(77,'undefined','undefined','1',12345,'dmsjdkd','beena@121',1306,'2023-04-28 11:04:07',NULL,NULL,'beena'),(78,'undefined','undefined','1',12345,'dmsjdkdk','beena@121',1306,'2023-04-28 11:04:09',NULL,NULL,'beena'),(79,'undefined','undefined','1',12345,'dmsjdkdkj','beena@121',1306,'2023-04-28 11:04:10',NULL,NULL,'beena'),(80,'undefined','undefined','One',12345,'','beena@121',1306,'2023-04-28 11:35:58',NULL,NULL,'beena'),(81,'undefined','undefined','1',12345,'','beena@121',1306,'2023-04-28 11:36:01',NULL,NULL,'beena'),(82,'undefined','undefined','1',12345,'b','beena@121',1306,'2023-04-28 11:36:06',NULL,NULL,'beena'),(83,'undefined','undefined','1',12345,'be','beena@121',1306,'2023-04-28 11:36:06',NULL,NULL,'beena'),(84,'undefined','undefined','1',12345,'bee','beena@121',1306,'2023-04-28 11:36:06',NULL,NULL,'beena'),(85,'undefined','undefined','1',12345,'been','beena@121',1306,'2023-04-28 11:36:07',NULL,NULL,'beena'),(86,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 11:36:09',NULL,NULL,'beena'),(87,'undefined','undefined','1',12345,'been','beena@121',1306,'2023-04-28 11:36:55',NULL,NULL,'beena'),(88,'undefined','undefined','1',12345,'bee','beena@121',1306,'2023-04-28 11:36:55',NULL,NULL,'beena'),(89,'undefined','undefined','1',12345,'be','beena@121',1306,'2023-04-28 11:36:55',NULL,NULL,'beena'),(90,'undefined','undefined','1',12345,'b','beena@121',1306,'2023-04-28 11:36:55',NULL,NULL,'beena'),(91,'undefined','undefined','1',12345,'','beena@121',1306,'2023-04-28 11:36:55',NULL,NULL,'beena'),(92,'undefined','undefined','1',12345,'b','beena@121',1306,'2023-04-28 11:36:56',NULL,NULL,'beena'),(93,'undefined','undefined','1',12345,'be','beena@121',1306,'2023-04-28 11:36:56',NULL,NULL,'beena'),(94,'undefined','undefined','1',12345,'bee','beena@121',1306,'2023-04-28 11:36:57',NULL,NULL,'beena'),(95,'undefined','undefined','1',12345,'been','beena@121',1306,'2023-04-28 11:36:58',NULL,NULL,'beena'),(96,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 11:36:58',NULL,NULL,'beena'),(97,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 11:40:04',NULL,NULL,'beena'),(98,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 11:41:03',NULL,NULL,'beena'),(99,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 11:41:14',NULL,NULL,'beena'),(100,'undefined','undefined','One',12345,'','beena@121',1306,'2023-04-28 14:50:26',NULL,NULL,'beena'),(101,'undefined','undefined','1',12345,'','beena@121',1306,'2023-04-28 14:50:28',NULL,NULL,'beena'),(102,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 14:50:31',NULL,NULL,'beena'),(103,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 15:13:56',NULL,NULL,'beena'),(104,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 15:14:36',NULL,NULL,'beena'),(105,'undefined','undefined','One',12345,'','beena@121',1306,'2023-04-28 15:16:13',NULL,NULL,'beena'),(106,'undefined','undefined','1',12345,'','beena@121',1306,'2023-04-28 15:16:15',NULL,NULL,'beena'),(107,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 15:16:18',NULL,NULL,'beena'),(108,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 15:18:17',NULL,NULL,'beena'),(109,'undefined','undefined','1',12345,'beena','beenanailwal@123',1306,'2023-04-28 15:19:09',NULL,NULL,'beena nailwal'),(110,'undefined','undefined','2',12345,'beena','as@12',1306,'2023-04-28 15:23:36',NULL,NULL,'beena'),(111,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 15:37:43',NULL,NULL,'beena'),(112,'undefined','undefined','1',12345,'beena','asrty@12',1306,'2023-04-28 15:38:43',NULL,NULL,'beena'),(113,'undefined','undefined','1',12345,'beena','asrty@12',1306,'2023-04-28 15:39:30',NULL,NULL,'beena'),(114,'undefined','undefined','1',12345,'beena','asrty@12',1306,'2023-04-28 15:39:31',NULL,NULL,'beena'),(115,'undefined','undefined','1',12345,'beena','asrty@12',1306,'2023-04-28 15:39:37',NULL,NULL,'beena'),(116,'undefined','undefined','1',12345,'beena','asrty@12',1306,'2023-04-28 15:39:52',NULL,NULL,'beena'),(117,'undefined','undefined','1',12345,'beena','asrty@12',1306,'2023-04-28 15:51:32',NULL,NULL,'beena'),(118,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 15:52:11',NULL,NULL,'beena'),(119,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 16:21:24',NULL,NULL,'beena'),(120,'undefined','undefined','1',12345,'beena','as@12',1306,'2023-04-28 16:41:00',NULL,NULL,'beena'),(121,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-28 16:44:21',NULL,NULL,'beena'),(122,'undefined','undefined','3',12322,'beena','beena@121',1306,'2023-04-28 16:45:06',NULL,NULL,'beena'),(123,'undefined','undefined','2',12345,'beena','beena@121',1306,'2023-04-29 04:19:23',NULL,NULL,'beena'),(124,'undefined','undefined','3',12322,'beena','beena@121',1306,'2023-04-29 04:20:06',NULL,NULL,'beena'),(125,'undefined','undefined','1',12345,'beena','beena@121',1306,'2023-04-29 06:55:44',NULL,NULL,'beena'),(126,'19658','undefined','1',12345,'beena','beena@121',1306,'2023-04-29 07:33:11',NULL,NULL,'beena'),(127,'19874','undefined','1',12345,'beena','beena@121',1306,'2023-04-29 07:34:09',NULL,NULL,'beena'),(128,'OM_27784','undefined','1',12345,'beena','beena@121',1306,'2023-04-29 10:10:54',NULL,NULL,'beena'),(129,'OM_75692','undefined','1',12345,'beena','beena@121',1306,'2023-04-29 10:10:55',NULL,NULL,'beena'),(130,'OM_94010','To DO','1',2345678654321,'ewrtgfc','as@12',1306,'2023-04-29 10:18:34',NULL,NULL,'beena nailwal'),(131,'OM_98963','To DO','1',2345678654321,'ewrtgfc','as@12',1306,'2023-04-29 10:19:53',NULL,NULL,'beena nailwal'),(132,'OM_73185','To DO','1',2345678654321,'ewrtgfc','as@12',1306,'2023-04-29 10:21:49',NULL,NULL,'beena nailwal'),(133,'OM_94607','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 10:49:33',NULL,NULL,'beena'),(134,'OM_36914','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 10:51:26',NULL,NULL,'beena'),(135,'OM_78196','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 10:51:32',NULL,NULL,'beena'),(136,'OM_29321','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 10:51:39',NULL,NULL,'beena'),(137,'OM_22674','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 10:51:45',NULL,NULL,'beena'),(138,'OM_10645','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 10:51:48',NULL,NULL,'beena'),(139,'OM_06225','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:28:52',NULL,NULL,'beena'),(140,'OM_22309','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:29:08',NULL,NULL,'beena'),(141,'OM_33044','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:29:11',NULL,NULL,'beena'),(142,'OM_08152','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:30:09',NULL,NULL,'beena'),(143,'OM_53465','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:30:17',NULL,NULL,'beena'),(144,'OM_61095','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:30:35',NULL,NULL,'beena'),(145,'OM_04810','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:31:28',NULL,NULL,''),(146,'OM_66519','To DO','1',12345,'beena','',1306,'2023-04-30 12:31:37',NULL,NULL,''),(147,'OM_98611','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:33:59',NULL,NULL,'beena'),(148,'OM_61226','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:34:08',NULL,NULL,'beena'),(149,'OM_23280','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:34:28',NULL,NULL,'beena'),(150,'OM_51644','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:34:33',NULL,NULL,'beena'),(151,'OM_45741','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:34:41',NULL,NULL,'beena'),(152,'OM_79913','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:34:48',NULL,NULL,'beena'),(153,'OM_99137','To DO','1',12345,'beena','beena@121',1306,'2023-04-30 12:35:32',NULL,NULL,'beena');
/*!40000 ALTER TABLE `om_ticket_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `om_user_master`
--

DROP TABLE IF EXISTS `om_user_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `om_user_master` (
  `userId` bigint NOT NULL AUTO_INCREMENT,
  `userLavel` int DEFAULT NULL,
  `phoneNumber` bigint DEFAULT NULL,
  `emailId` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `userType` varchar(45) NOT NULL,
  `enterBy` bigint NOT NULL,
  `enterDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `om_user_master`
--

LOCK TABLES `om_user_master` WRITE;
/*!40000 ALTER TABLE `om_user_master` DISABLE KEYS */;
INSERT INTO `om_user_master` VALUES (1,1,2147483647,'abhisubh47@gmail.com','','',8009697699,'2023-04-27 08:44:02'),(2,1,8009697699,'abhisubh47@gmail.com','','',8009697699,'2023-04-27 08:44:53'),(3,2,800965966,'abc@gmail.com','12321','admin',78899,'2023-04-29 11:01:58'),(4,1,8009697699,'abhisubh47@gmail.com','uhs988','Admin',8009697699,'2023-04-29 11:06:34'),(5,1,12345,'beena@121','beena','Admin',12345,'2023-05-01 04:59:20'),(6,1,12345,'beena@121','beena','Admin',12345,'2023-05-01 05:31:07'),(7,1,12345,'beena@121','beena','Admin',12345,'2023-05-01 05:33:53');
/*!40000 ALTER TABLE `om_user_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 11:11:39
