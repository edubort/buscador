-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: searchin
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES (1,'//192.168.33.117/Users/edubo/Documentos/',1),(2,'//192.168.33.117/Users/edubo/xml/',1);
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `domains_sites`
--

LOCK TABLES `domains_sites` WRITE;
/*!40000 ALTER TABLE `domains_sites` DISABLE KEYS */;
INSERT INTO `domains_sites` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `domains_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fila_index`
--

LOCK TABLES `fila_index` WRITE;
/*!40000 ALTER TABLE `fila_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `fila_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyword`
--

LOCK TABLES `link_keyword` WRITE;
/*!40000 ALTER TABLE `link_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyword0`
--

LOCK TABLES `link_keyword0` WRITE;
/*!40000 ALTER TABLE `link_keyword0` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyword1`
--

LOCK TABLES `link_keyword1` WRITE;
/*!40000 ALTER TABLE `link_keyword1` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyword2`
--

LOCK TABLES `link_keyword2` WRITE;
/*!40000 ALTER TABLE `link_keyword2` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyword3`
--

LOCK TABLES `link_keyword3` WRITE;
/*!40000 ALTER TABLE `link_keyword3` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyword4`
--

LOCK TABLES `link_keyword4` WRITE;
/*!40000 ALTER TABLE `link_keyword4` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyword5`
--

LOCK TABLES `link_keyword5` WRITE;
/*!40000 ALTER TABLE `link_keyword5` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyword6`
--

LOCK TABLES `link_keyword6` WRITE;
/*!40000 ALTER TABLE `link_keyword6` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyword7`
--

LOCK TABLES `link_keyword7` WRITE;
/*!40000 ALTER TABLE `link_keyword7` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyword8`
--

LOCK TABLES `link_keyword8` WRITE;
/*!40000 ALTER TABLE `link_keyword8` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyword9`
--

LOCK TABLES `link_keyword9` WRITE;
/*!40000 ALTER TABLE `link_keyword9` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyworda`
--

LOCK TABLES `link_keyworda` WRITE;
/*!40000 ALTER TABLE `link_keyworda` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyworda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keywordb`
--

LOCK TABLES `link_keywordb` WRITE;
/*!40000 ALTER TABLE `link_keywordb` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keywordb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keywordc`
--

LOCK TABLES `link_keywordc` WRITE;
/*!40000 ALTER TABLE `link_keywordc` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keywordc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keywordd`
--

LOCK TABLES `link_keywordd` WRITE;
/*!40000 ALTER TABLE `link_keywordd` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keywordd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keyworde`
--

LOCK TABLES `link_keyworde` WRITE;
/*!40000 ALTER TABLE `link_keyworde` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyworde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `link_keywordf`
--

LOCK TABLES `link_keywordf` WRITE;
/*!40000 ALTER TABLE `link_keywordf` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keywordf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_index`
--

LOCK TABLES `log_index` WRITE;
/*!40000 ALTER TABLE `log_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pending`
--

LOCK TABLES `pending` WRITE;
/*!40000 ALTER TABLE `pending` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `query_log`
--

LOCK TABLES `query_log` WRITE;
/*!40000 ALTER TABLE `query_log` DISABLE KEYS */;
INSERT INTO `query_log` VALUES ('necessário','2016-06-21 16:07:04',0.04,1),('critica','2016-06-21 16:07:15',0.03,12),('calculo critica','2016-06-21 16:07:22',0.01,20),('eduardo','2016-06-21 17:09:16',0.01,9),('eduardo de acordo','2016-06-21 17:13:41',0.01,15),('eduardo','2016-06-22 16:28:10',0.01,9),('eduardo','2016-06-22 17:30:31',0.02,9),('teste','2016-06-23 13:30:12',0.06,7),('perguntas','2016-06-23 13:42:03',0.14,1),('criticas','2016-06-23 13:42:13',0.02,9),('doc','2016-06-23 13:42:27',0,1),('pdf','2016-06-23 13:42:38',0.04,2),('ambev','2016-06-23 13:42:43',0,1),('eduardo','2016-06-23 13:42:46',0,1);
/*!40000 ALTER TABLE `query_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `site_category`
--

LOCK TABLES `site_category` WRITE;
/*!40000 ALTER TABLE `site_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'//192.168.33.117/Users/edubo/Documents/','aa','aaa','2016-06-21',-1,'','',1,1),(2,'//192.168.56.1/Users/edubo/xml/','Conector XML','Teste','2016-06-21',-1,'','',1,3);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sites_file_connector`
--

LOCK TABLES `sites_file_connector` WRITE;
/*!40000 ALTER TABLE `sites_file_connector` DISABLE KEYS */;
INSERT INTO `sites_file_connector` VALUES (1,'c:','edubort','edubort','edubort','192.168.33.117'),(2,'i:','edubort','edubort','edubort','192.168.33.117');
/*!40000 ALTER TABLE `sites_file_connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'searchin'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-23 11:11:16
