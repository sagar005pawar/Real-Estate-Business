-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: t5d
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(45) NOT NULL,
  `info` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `eprice` double NOT NULL,
  `bprice` double DEFAULT NULL,
  `sellername` varchar(45) NOT NULL,
  `buyername` varchar(45) DEFAULT NULL,
  `negotiator` varchar(45) DEFAULT NULL,
  `isvalid` varchar(45) NOT NULL,
  `bstatus` tinyint(5) NOT NULL,
  `image1` varchar(145) DEFAULT NULL,
  `image2` varchar(145) DEFAULT NULL,
  `image3` varchar(145) DEFAULT NULL,
  `image4` varchar(145) DEFAULT NULL,
  `image5` varchar(145) DEFAULT NULL,
  `pdate` varchar(45) NOT NULL,
  `ptype` varchar(45) DEFAULT NULL,
  `utype` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `condition1` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (17,'sagar','4234, dfsdf, fsdf, fsdf, tert, 435','Real Estate',434,4234,'a','admin','','Authorized',1,'Users/a/AssetImages/sagar/46780_509120019139729_97459795_n.jpg','Users/a/AssetImages/sagar/10559801_725687084137179_2739689111846554240_n.jpg','Users/a/AssetImages/sagar/10rlbgo.jpg','Users/a/AssetImages/sagar/beautifulindia.jpg','Users/a/AssetImages/sagar/india-031.jpg','05/24/2016','Town House','Secondary',NULL,NULL,NULL),(18,'house','434, dgdfg, gdfg, gdfg, gdfgd, 234','Real Estate',46545,9865,'admin','admin','admin','Authorized',0,'Users/admin/AssetImages/house/alpha_grandcanyon_dusk.jpg','Users/admin/AssetImages/house/alpha_grandcanyon_landscape.jpg','Users/a/AssetImages/sagar/10rlbgo.jpg','Users/admin/AssetImages/house/alpha_iguazufalls_rainbow.jpg','Users/a/AssetImages/sagar/india-031.jpg','05/24/2016','Condo','Rental',NULL,NULL,NULL),(21,'para','432, sulwade, snk, mh, ind, 425406','Real Estate',3,5675,'a','admin','','Authorized',1,'Users/a/AssetImages/para/alpha_iguazufalls_sunrise.jpg','Users/admin/AssetImages/house/alpha_grandcanyon_landscape.jpg','Users/a/AssetImages/para/alpha_montsaint-michel.jpg','Users/admin/AssetImages/house/alpha_iguazufalls_rainbow.jpg','Users/admin/AssetImages/house/alpha_iguazufalls_rainbow.jpg','05/27/2016','Town House','Secondary',NULL,NULL,NULL),(22,'pawar','honda121900','Vehicle',42342,0,'pawar','-','-','Authorized',0,'Users/a/AssetImages/para/alpha_iguazufalls_sunrise.jpg','Users/a/AssetImages/para/alpha_iguazufalls_sunrise.jpg','Users/a/AssetImages/para/alpha_iguazufalls_sunrise.jpg','Users/a/AssetImages/para/alpha_iguazufalls_sunrise.jpg','Users/a/AssetImages/para/alpha_iguazufalls_sunrise.jpg','12',NULL,NULL,'black','b','a'),(23,'my-bike','Suzuki, 22/12/15, 2015','Vehicle',85001,82000,'a','admin','','Authorized',0,'Users/a/AssetImages/para/alpha_iguazufalls_sunrise.jpg','Users/a/AssetImages/para/alpha_iguazufalls_sunrise.jpg','Users/a/AssetImages/para/alpha_iguazufalls_sunrise.jpg','Users/a/AssetImages/para/alpha_iguazufalls_sunrise.jpg','Users/a/AssetImages/para/alpha_iguazufalls_sunrise.jpg','22/12/15',NULL,NULL,'grey','a','b'),(24,'Anand','34, baner, pune, MH, India, 534533','Real Estate',546544,0,'admin','-','-','Requested',0,'Users/admin/AssetImages/Anand/gazebos_in_amar_sagar_lake_in_india.jpg','Users/admin/AssetImages/Anand/Beautiful_Happy_Diwali_Greetings_Widescreen_Wallpapers.jpg','Users/admin/AssetImages/Anand/diwali-san-sharma.jpg',NULL,'Users/admin/AssetImages/Anand/computerdesktopwallpaperscollection663_044.jpg','05/30/2016','Single Flat','Primary',NULL,NULL,NULL);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bids` (
  `id` int(11) NOT NULL,
  `bprices` double NOT NULL,
  `buyername` varchar(45) NOT NULL,
  KEY `id_idx` (`id`),
  KEY `buyername_idx` (`buyername`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `assets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` VALUES (22,34534,'admin'),(23,82000,'admin'),(23,453,'admin'),(22,39546,'a'),(23,82500,'a'),(18,9865,'admin');
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `isvalid` tinyint(5) NOT NULL,
  `reviewer` varchar(45) DEFAULT NULL,
  `negotiator` varchar(45) DEFAULT NULL,
  `proprietor` varchar(45) DEFAULT NULL,
  `image` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('a','a','a@gmail.com','a',1,NULL,NULL,NULL,'Users/a/ProfilePhoto/2016 - 1.jpg'),('abc','abc','abc@gmail.com','abc',0,'requested','requested','requested','Users/abc/ProfilePhoto/6d51ec54c26b48f437b9de153abf9430.jpg'),('pawar','pa','pawar@gmail.com','pune',1,NULL,'authenticated',NULL,'Users/pawar/ProfilePhoto/11950198_577935105694394_3168354987427722696_o.jpg'),('sagar','sa','sagar@gmail.com','dhule',1,'authenticated',NULL,NULL,'Users/sagar/ProfilePhoto/sagarpic.JPG'),('user','test','user@gmail.com','pune',0,NULL,NULL,'requested','Users/user/ProfilePhoto/6d51ec54c26b48f437b9de153abf9430.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-11 23:42:43
