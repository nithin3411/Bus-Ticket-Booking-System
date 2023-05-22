-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bus
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `b_id` varchar(15) NOT NULL,
  `b_name` varchar(15) DEFAULT NULL,
  `scdl_srcarr` time DEFAULT NULL,
  `scdl_destarr` time DEFAULT NULL,
  `dep_date` date DEFAULT NULL,
  `no_of_seat` int DEFAULT NULL,
  `r_id` varchar(15) DEFAULT NULL,
  `date_` date DEFAULT NULL,
  `time_` time DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `route` (`r_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES ('10','KSRTC','09:10:00','06:10:00','2023-05-04',40,'101','2023-05-04','10:43:25'),('100','vrl','10:10:00','06:00:00','2023-04-04',50,'100','2023-05-03','18:00:36'),('103','vrl','10:10:00','05:10:00','2023-05-05',30,'101','2023-05-04','10:41:57');
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_admin`
--

DROP TABLE IF EXISTS `login_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_admin`
--

LOCK TABLES `login_admin` WRITE;
/*!40000 ALTER TABLE `login_admin` DISABLE KEYS */;
INSERT INTO `login_admin` VALUES (1,'Admin','Admin','1111','9696964411','M','admin@gmail.com');
/*!40000 ALTER TABLE `login_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user`
--

DROP TABLE IF EXISTS `login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_user` (
  `name` varchar(15) DEFAULT NULL,
  `uname` varchar(15) NOT NULL,
  `password` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user`
--

LOCK TABLES `login_user` WRITE;
/*!40000 ALTER TABLE `login_user` DISABLE KEYS */;
INSERT INTO `login_user` VALUES ('Nithin','Nithin','1234','9731567161','M','nithinsa@gmail.com');
/*!40000 ALTER TABLE `login_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passdlt`
--

DROP TABLE IF EXISTS `passdlt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passdlt` (
  `uname` varchar(15) DEFAULT NULL,
  `p_name` varchar(15) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `b_id` varchar(15) DEFAULT NULL,
  `seat_no` int DEFAULT NULL,
  `t_id` varchar(15) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `time_` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passdlt`
--

LOCK TABLES `passdlt` WRITE;
/*!40000 ALTER TABLE `passdlt` DISABLE KEYS */;
/*!40000 ALTER TABLE `passdlt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `uname` varchar(15) NOT NULL,
  `p_name` varchar(15) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `address` varchar(15) DEFAULT NULL,
  `b_id` varchar(15) NOT NULL,
  `seat_no` int DEFAULT NULL,
  `t_id` varchar(15) NOT NULL,
  `date_` date DEFAULT NULL,
  `time_` time DEFAULT NULL,
  PRIMARY KEY (`t_id`,`b_id`,`uname`),
  KEY `b_id` (`b_id`),
  KEY `uname` (`uname`),
  CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `bus` (`b_id`) ON DELETE CASCADE,
  CONSTRAINT `passenger_ibfk_2` FOREIGN KEY (`uname`) REFERENCES `login_user` (`uname`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES ('Nithin','Gopi',28,'7894561233','m','Banglore','100',1,'867','2023-05-03','18:03:34');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES (1,'Nithin','Nithin SA','1111','M','nithinsa3411@gmail.com','9066933411'),(2,'pavan','KH','1111','M','p@gmail.com','9731336677'),(3,'Shanth','B M','1111','M','S@gmail.com','9901069200'),(4,'Raj','Raj','1111','M','raj@gmail.com','7956123641'),(5,'Nithin','Nithin','nithin@123','M','nithinsa@gmail.com','9066933411'),(6,'Nithin','Nithin','1212','M','nithin@gmail.com','7353921332'),(7,'Nithin','Nithin','1111','M','nithinsa@gmail.com','9731567161');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revi`
--

DROP TABLE IF EXISTS `revi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revi` (
  `b_id` varchar(15) NOT NULL,
  `uname` varchar(15) DEFAULT NULL,
  `ratings` varchar(15) DEFAULT NULL,
  `ticket_id` varchar(15) NOT NULL,
  PRIMARY KEY (`ticket_id`,`b_id`),
  KEY `b_id` (`b_id`),
  KEY `uname` (`uname`),
  CONSTRAINT `revi_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `bus` (`b_id`) ON DELETE CASCADE,
  CONSTRAINT `revi_ibfk_2` FOREIGN KEY (`uname`) REFERENCES `login_user` (`uname`) ON DELETE CASCADE,
  CONSTRAINT `revi_ibfk_3` FOREIGN KEY (`ticket_id`) REFERENCES `passenger` (`t_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revi`
--

LOCK TABLES `revi` WRITE;
/*!40000 ALTER TABLE `revi` DISABLE KEYS */;
INSERT INTO `revi` VALUES ('100','Nithin','4','867');
/*!40000 ALTER TABLE `revi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `r_id` varchar(15) NOT NULL,
  `src` varchar(15) DEFAULT NULL,
  `distination` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES ('100','Banglore','Mysore'),('101','Banglore','Manglore'),('102','Banglore','Shimoga'),('103','Banglore','udupi');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `t_id` varchar(15) DEFAULT NULL,
  `b_id` varchar(15) DEFAULT NULL,
  `seat_no` int DEFAULT NULL,
  UNIQUE KEY `t_id` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `tik_price` varchar(15) DEFAULT NULL,
  `b_id` varchar(15) NOT NULL,
  PRIMARY KEY (`b_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `bus` (`b_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('300','10'),('250','100');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 11:34:57
