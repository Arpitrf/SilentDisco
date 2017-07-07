-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: Db
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ChannelOne`
--

DROP TABLE IF EXISTS `ChannelOne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChannelOne` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `path` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChannelOne`
--

LOCK TABLES `ChannelOne` WRITE;
/*!40000 ALTER TABLE `ChannelOne` DISABLE KEYS */;
INSERT INTO `ChannelOne` VALUES (1,'Behind Blue Eyes','Limp Bizkit - Behind Blue Eyes lyrics.mp3'),(2,'Comfortably Numb','Pink Floyd - Comfortably Numb Pulse HD - 125kbps, 44KHz Audio.mp3');
/*!40000 ALTER TABLE `ChannelOne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChannelTwo`
--

DROP TABLE IF EXISTS `ChannelTwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChannelTwo` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `path` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChannelTwo`
--

LOCK TABLES `ChannelTwo` WRITE;
/*!40000 ALTER TABLE `ChannelTwo` DISABLE KEYS */;
INSERT INTO `ChannelTwo` VALUES (1,'One Day','One Day.mp3'),(2,'Stressed Out','twenty one pilots- Stressed Out OFFICIAL VIDEO.mp3');
/*!40000 ALTER TABLE `ChannelTwo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-07 11:17:00
