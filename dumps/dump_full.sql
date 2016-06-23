CREATE DATABASE  IF NOT EXISTS `searchin` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `searchin`;
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` text,
  `parent_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `domain_id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(4000) DEFAULT NULL,
  `ind_tipo` int(3) NOT NULL COMMENT '1 = pasta da rede\n2 = conector web\n3 = conector xml',
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES (1,'//192.168.33.117/Users/edubo/Documentos/',1),(2,'//192.168.33.117/Users/edubo/xml/',1);
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains_sites`
--

DROP TABLE IF EXISTS `domains_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains_sites` (
  `domain_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`domain_id`,`site_id`),
  KEY `site` (`site_id`),
  CONSTRAINT `domain` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`domain_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `site` FOREIGN KEY (`site_id`) REFERENCES `sites` (`site_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains_sites`
--

LOCK TABLES `domains_sites` WRITE;
/*!40000 ALTER TABLE `domains_sites` DISABLE KEYS */;
INSERT INTO `domains_sites` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `domains_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fila_index`
--

DROP TABLE IF EXISTS `fila_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fila_index` (
  `id_index` bigint(19) NOT NULL AUTO_INCREMENT,
  `url` varchar(4000) NOT NULL,
  `ind_in_process` int(1) NOT NULL,
  `ind_tipo` int(1) NOT NULL COMMENT '0=http; 1=files',
  `val_level` int(3) NOT NULL,
  `url_option` char(25) DEFAULT NULL,
  `ind_reindex` int(2) DEFAULT NULL,
  `adv_domaincb` int(2) DEFAULT NULL,
  `adv_in` text,
  `adv_out` text,
  `hra_inicio` datetime DEFAULT NULL,
  `val_prioridade` int(5) DEFAULT '1',
  `dom_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fila_index`
--

LOCK TABLES `fila_index` WRITE;
/*!40000 ALTER TABLE `fila_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `fila_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywords` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(150) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `keyword_UNIQUE` (`keyword`),
  KEY `keyword` (`keyword`(10)),
  KEY `kw` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyword`
--

DROP TABLE IF EXISTS `link_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyword` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `wight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  PRIMARY KEY (`link_id`,`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyword`
--

LOCK TABLES `link_keyword` WRITE;
/*!40000 ALTER TABLE `link_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyword0`
--

DROP TABLE IF EXISTS `link_keyword0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyword0` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyword0`
--

LOCK TABLES `link_keyword0` WRITE;
/*!40000 ALTER TABLE `link_keyword0` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyword1`
--

DROP TABLE IF EXISTS `link_keyword1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyword1` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyword1`
--

LOCK TABLES `link_keyword1` WRITE;
/*!40000 ALTER TABLE `link_keyword1` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyword2`
--

DROP TABLE IF EXISTS `link_keyword2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyword2` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyword2`
--

LOCK TABLES `link_keyword2` WRITE;
/*!40000 ALTER TABLE `link_keyword2` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyword3`
--

DROP TABLE IF EXISTS `link_keyword3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyword3` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyword3`
--

LOCK TABLES `link_keyword3` WRITE;
/*!40000 ALTER TABLE `link_keyword3` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyword4`
--

DROP TABLE IF EXISTS `link_keyword4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyword4` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyword4`
--

LOCK TABLES `link_keyword4` WRITE;
/*!40000 ALTER TABLE `link_keyword4` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyword5`
--

DROP TABLE IF EXISTS `link_keyword5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyword5` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyword5`
--

LOCK TABLES `link_keyword5` WRITE;
/*!40000 ALTER TABLE `link_keyword5` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyword6`
--

DROP TABLE IF EXISTS `link_keyword6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyword6` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyword6`
--

LOCK TABLES `link_keyword6` WRITE;
/*!40000 ALTER TABLE `link_keyword6` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyword7`
--

DROP TABLE IF EXISTS `link_keyword7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyword7` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyword7`
--

LOCK TABLES `link_keyword7` WRITE;
/*!40000 ALTER TABLE `link_keyword7` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyword8`
--

DROP TABLE IF EXISTS `link_keyword8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyword8` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyword8`
--

LOCK TABLES `link_keyword8` WRITE;
/*!40000 ALTER TABLE `link_keyword8` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyword9`
--

DROP TABLE IF EXISTS `link_keyword9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyword9` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyword9`
--

LOCK TABLES `link_keyword9` WRITE;
/*!40000 ALTER TABLE `link_keyword9` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyword9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyworda`
--

DROP TABLE IF EXISTS `link_keyworda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyworda` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyworda`
--

LOCK TABLES `link_keyworda` WRITE;
/*!40000 ALTER TABLE `link_keyworda` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyworda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keywordb`
--

DROP TABLE IF EXISTS `link_keywordb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keywordb` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keywordb`
--

LOCK TABLES `link_keywordb` WRITE;
/*!40000 ALTER TABLE `link_keywordb` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keywordb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keywordc`
--

DROP TABLE IF EXISTS `link_keywordc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keywordc` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keywordc`
--

LOCK TABLES `link_keywordc` WRITE;
/*!40000 ALTER TABLE `link_keywordc` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keywordc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keywordd`
--

DROP TABLE IF EXISTS `link_keywordd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keywordd` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keywordd`
--

LOCK TABLES `link_keywordd` WRITE;
/*!40000 ALTER TABLE `link_keywordd` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keywordd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keyworde`
--

DROP TABLE IF EXISTS `link_keyworde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keyworde` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keyworde`
--

LOCK TABLES `link_keyworde` WRITE;
/*!40000 ALTER TABLE `link_keyworde` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keyworde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_keywordf`
--

DROP TABLE IF EXISTS `link_keywordf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_keywordf` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) DEFAULT NULL,
  `domain` int(4) DEFAULT NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_keywordf`
--

LOCK TABLES `link_keywordf` WRITE;
/*!40000 ALTER TABLE `link_keywordf` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_keywordf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `url` varchar(4000) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fulltxt` mediumtext,
  `indexdate` date DEFAULT NULL,
  `size` char(20) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `visible` int(11) DEFAULT '0',
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `md5key` (`md5sum`),
  KEY `url` (`url`(1000))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_index`
--

DROP TABLE IF EXISTS `log_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_index` (
  `site_id` int(11) NOT NULL,
  `dsc_saida_sys` text,
  `dsc_link` text,
  `dsc_comando` text,
  `dat_inc` datetime DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_index`
--

LOCK TABLES `log_index` WRITE;
/*!40000 ALTER TABLE `log_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending`
--

DROP TABLE IF EXISTS `pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending` (
  `site_id` int(11) DEFAULT NULL,
  `temp_id` varchar(32) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending`
--

LOCK TABLES `pending` WRITE;
/*!40000 ALTER TABLE `pending` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_log`
--

DROP TABLE IF EXISTS `query_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_log` (
  `query` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `elapsed` float DEFAULT NULL,
  `results` int(11) DEFAULT NULL,
  KEY `query_key` (`query`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_log`
--

LOCK TABLES `query_log` WRITE;
/*!40000 ALTER TABLE `query_log` DISABLE KEYS */;
INSERT INTO `query_log` VALUES ('necessário','2016-06-21 16:07:04',0.04,1),('critica','2016-06-21 16:07:15',0.03,12),('calculo critica','2016-06-21 16:07:22',0.01,20),('eduardo','2016-06-21 17:09:16',0.01,9),('eduardo de acordo','2016-06-21 17:13:41',0.01,15),('eduardo','2016-06-22 16:28:10',0.01,9),('eduardo','2016-06-22 17:30:31',0.02,9),('teste','2016-06-23 13:30:12',0.06,7),('perguntas','2016-06-23 13:42:03',0.14,1),('criticas','2016-06-23 13:42:13',0.02,9),('doc','2016-06-23 13:42:27',0,1),('pdf','2016-06-23 13:42:38',0.04,2),('ambev','2016-06-23 13:42:43',0,1),('eduardo','2016-06-23 13:42:46',0,1),('','2016-06-23 14:16:37',0,0),('teste','2016-06-23 14:16:41',0.1,0),('eduardo','2016-06-23 14:16:45',0,0);
/*!40000 ALTER TABLE `query_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_category`
--

DROP TABLE IF EXISTS `site_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_category` (
  `site_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_category`
--

LOCK TABLES `site_category` WRITE;
/*!40000 ALTER TABLE `site_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(4000) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_desc` text,
  `indexdate` date DEFAULT NULL,
  `spider_depth` int(11) DEFAULT '2',
  `required` text,
  `disallowed` text,
  `can_leave_domain` tinyint(1) DEFAULT NULL,
  `ind_tipo` int(3) DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'//192.168.33.117/Users/edubo/Documents/','aa','aaa','2016-06-21',-1,'','',1,1),(2,'//192.168.56.1/Users/edubo/xml/','Conector XML','Teste','2016-06-21',-1,'','',1,3);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites_file_connector`
--

DROP TABLE IF EXISTS `sites_file_connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites_file_connector` (
  `site_id` int(11) NOT NULL,
  `val_unidade` char(3) DEFAULT NULL,
  `nom_dns` char(255) DEFAULT NULL,
  `nom_login` char(255) DEFAULT NULL,
  `nom_senha` char(255) DEFAULT NULL,
  `ip_server` char(255) DEFAULT NULL,
  PRIMARY KEY (`site_id`),
  CONSTRAINT `sites_file_connector_sites` FOREIGN KEY (`site_id`) REFERENCES `sites` (`site_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites_file_connector`
--

LOCK TABLES `sites_file_connector` WRITE;
/*!40000 ALTER TABLE `sites_file_connector` DISABLE KEYS */;
INSERT INTO `sites_file_connector` VALUES (1,'c:','edubort','edubort','edubort','192.168.33.117'),(2,'i:','edubort','edubort','edubort','192.168.33.117');
/*!40000 ALTER TABLE `sites_file_connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp` (
  `link` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `id` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-23 11:19:01
