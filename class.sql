-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: schoolclass
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin','李老师');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classroom` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES (1,'管院大楼101','管院大楼一楼，东半楼，南侧'),(2,'管院大楼107','管理学院大楼西半楼，南侧一楼'),(5,'管院大楼109','管理学院大楼西半楼，北侧一楼'),(6,'管院大楼116','管理学院大楼西半楼，北侧一楼');
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsrecord`
--

DROP TABLE IF EXISTS `lsrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lsrecord` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `aid` int DEFAULT NULL,
  `sid` int DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `sdate` date DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `state` int DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `review` varchar(100) DEFAULT NULL,
  `admin` varchar(20) DEFAULT NULL,
  `student` varchar(20) DEFAULT NULL,
  `classroom` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsrecord`
--

LOCK TABLES `lsrecord` WRITE;
/*!40000 ALTER TABLE `lsrecord` DISABLE KEYS */;
INSERT INTO `lsrecord` VALUES (2,1,1,1,'2020-08-02','14:00:00','16:00:00',2,'学生会','','','',''),(3,1,1,1,'2020-08-02','17:00:00','19:00:00',2,'学生会','','李老师','',''),(9,NULL,1,1,'2020-08-02','17:00:00','19:00:00',2,'管院易班',NULL,'李老师','曹文华','管院大楼101'),(10,NULL,1,1,'2020-08-02','17:00:00','19:00:00',1,'理工易班',NULL,'李老师','曹文华','管院大楼101'),(11,NULL,1,1,'2020-08-02','14:00:00','16:00:00',2,'管院马研',NULL,'李老师','曹文华','管院大楼101'),(12,NULL,1,1,'2020-08-05','14:38:02','16:38:06',2,'信管党支部',NULL,NULL,'曹文华','管院大楼101'),(16,NULL,1,2,'2020-08-06','14:00:00','16:00:00',1,'2222',NULL,'李老师','曹文华','管院大楼107'),(17,NULL,8,1,'2020-08-06','13:25:00','17:25:04',2,'111',NULL,'李老师','李文华','管院大楼101'),(18,NULL,1,1,'2020-08-06','14:36:06','17:36:10',2,'',NULL,'李老师','曹文华','管院大楼101'),(20,NULL,1,1,'2020-08-06','14:05:22','16:05:25',1,'信管1班班会',NULL,'李老师','曹文华','管院大楼101'),(21,NULL,1,1,'2020-08-06','19:16:51','21:16:56',3,'',NULL,NULL,'曹文华','管院大楼101'),(22,NULL,1,1,'2021-03-30','20:46:31','23:46:36',1,'123',NULL,'李老师','曹文华','管院大楼101'),(23,NULL,14,1,'2021-05-22','20:46:31','23:46:36',1,'123',NULL,'李老师','于骏翔','管院大楼101'),(24,NULL,14,1,'2021-05-28','20:46:31','23:46:36',3,'',NULL,NULL,'于骏翔','管院大楼101'),(25,NULL,14,1,'2021-05-29','20:46:31','23:46:36',3,'',NULL,NULL,'于骏翔','管院大楼101'),(26,NULL,14,1,'2021-05-22','20:46:31','23:46:36',3,'',NULL,NULL,'于骏翔','管院大楼101');
/*!40000 ALTER TABLE `lsrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stuNo` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `stuName` varchar(20) DEFAULT NULL,
  `stuSchool` varchar(20) DEFAULT NULL,
  `stuGrade` varchar(20) DEFAULT NULL,
  `stuClass` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stuNo_INDEX` (`stuNo`,`password`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (15,'28987477','123456','孟令哲','管理学院','0121903490218','信管1906','13485311619');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'schoolclass'
--

--
-- Dumping routines for database 'schoolclass'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-20 16:08:16
