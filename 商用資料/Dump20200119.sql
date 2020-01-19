-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: painteraggregation
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `artwork`
--

DROP TABLE IF EXISTS `artwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artwork` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `style_id` int(10) unsigned NOT NULL,
  `genre_id` int(10) unsigned NOT NULL,
  `main_painter_id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `upload_dt` datetime NOT NULL,
  `start_dt` datetime NOT NULL,
  `end_dt` datetime NOT NULL,
  `artwork_file_path` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `zartwork` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `z_last_editor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`style_id`,`genre_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artwork`
--

LOCK TABLES `artwork` WRITE;
/*!40000 ALTER TABLE `artwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `artwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collaborate_relation`
--

DROP TABLE IF EXISTS `collaborate_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collaborate_relation` (
  `id` int(10) unsigned NOT NULL,
  `painter_id` int(10) unsigned NOT NULL,
  `collection_id` int(10) unsigned NOT NULL,
  `start_dt` datetime NOT NULL,
  `end_dt` datetime NOT NULL,
  `zcollaborate_relation` timestamp NOT NULL,
  `z_lazt_painter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`painter_id`,`collection_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaborate_relation`
--

LOCK TABLES `collaborate_relation` WRITE;
/*!40000 ALTER TABLE `collaborate_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `collaborate_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `main_painter_id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `upload_dt` datetime NOT NULL,
  `start_dt` datetime NOT NULL,
  `end_dt` datetime NOT NULL,
  `zcollection` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `zgenre` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (0,'全部','0000-00-00 00:00:00'),(1,'插圖','0000-00-00 00:00:00'),(2,'頭像','0000-00-00 00:00:00'),(3,'角色設計','0000-00-00 00:00:00'),(4,'立繪','0000-00-00 00:00:00'),(5,'版','0000-00-00 00:00:00'),(6,'壁紙','0000-00-00 00:00:00'),(7,'封面','0000-00-00 00:00:00'),(8,'海報','0000-00-00 00:00:00'),(9,'場景','0000-00-00 00:00:00'),(10,'概念設計','0000-00-00 00:00:00'),(11,'CG','0000-00-00 00:00:00'),(12,'和紙膠帶','0000-00-00 00:00:00'),(13,'卡牌','0000-00-00 00:00:00'),(14,'印花','0000-00-00 00:00:00'),(15,'條漫','0000-00-00 00:00:00'),(16,'圖標','0000-00-00 00:00:00'),(17,'UI','0000-00-00 00:00:00'),(18,'分鏡','0000-00-00 00:00:00'),(19,'抱枕','0000-00-00 00:00:00'),(20,'版型','0000-00-00 00:00:00'),(21,'像素圖','0000-00-00 00:00:00'),(22,'特效','0000-00-00 00:00:00'),(23,'Live2D','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity`
--

DROP TABLE IF EXISTS `identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `zidentity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='身分主檔';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity`
--

LOCK TABLES `identity` WRITE;
/*!40000 ALTER TABLE `identity` DISABLE KEYS */;
INSERT INTO `identity` VALUES (1,'系統管理員','2020-01-08 04:51:53'),(2,'提案者','2020-01-08 04:51:53'),(3,'繪師','2020-01-08 04:51:53'),(4,'觀看者','2020-01-08 04:51:53');
/*!40000 ALTER TABLE `identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `identity_id` int(10) unsigned NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nickname` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `birthday` date NOT NULL DEFAULT '1990-12-31',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cellphone` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `homephone` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `register_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP();',
  `zmember` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'gccbb02498',1,'aicdfida','gccbb02498','maple','1994-09-02','fdes40701','0978925012','034819484',' ','1990-12-30 16:00:00','1990-12-30 16:00:00'),(2,'w93303920000',1,'1234','w93303920000 ','','0000-00-00','','','','','1990-12-30 16:00:00','1990-12-30 16:00:00'),(3,'natsu_ft',2,'1234','natsu_ft','','0000-00-00','','','','','1990-12-30 16:00:00','1990-12-30 16:00:00'),(4,'lucy_ft',3,'1234','lucy_ft','','0000-00-00','','','','','1990-12-30 16:00:00','1990-12-30 16:00:00'),(5,'erza_ft',4,'1234','erza_ft','','0000-00-00','','','','','1990-12-30 16:00:00','1990-12-30 16:00:00');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `painter`
--

DROP TABLE IF EXISTS `painter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `painter` (
  `id` int(10) unsigned NOT NULL,
  `account` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `identity_id` int(10) unsigned NOT NULL,
  `painter_avatar` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `zmember_painter` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`account`,`identity_id`),
  UNIQUE KEY `account_UNIQUE` (`account`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `painter`
--

LOCK TABLES `painter` WRITE;
/*!40000 ALTER TABLE `painter` DISABLE KEYS */;
/*!40000 ALTER TABLE `painter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal`
--

DROP TABLE IF EXISTS `proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposer_id` int(11) NOT NULL,
  `proposal_type` int(11) NOT NULL,
  `demanded_style` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `start_dt` datetime DEFAULT NULL,
  `end_dt` datetime DEFAULT NULL,
  `applicant_count` int(11) DEFAULT NULL,
  `zproposal` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal`
--

LOCK TABLES `proposal` WRITE;
/*!40000 ALTER TABLE `proposal` DISABLE KEYS */;
INSERT INTO `proposal` VALUES (1,3,2,5,'妖精的尾巴_100年公會任務',NULL,NULL,NULL,NULL),(2,3,2,7,'高階機械式鍵盤展',NULL,NULL,NULL,NULL),(3,3,1,9,'拉赫曼尼諾夫鋼琴協奏曲見面會',NULL,NULL,NULL,NULL),(4,3,4,1,'館長好強壯健健美',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_type`
--

DROP TABLE IF EXISTS `proposal_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `zproposal_type` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_type`
--

LOCK TABLES `proposal_type` WRITE;
/*!40000 ALTER TABLE `proposal_type` DISABLE KEYS */;
INSERT INTO `proposal_type` VALUES (1,'商業企劃','1990-12-30 16:00:00'),(2,'個人企劃','1990-12-30 16:00:00');
/*!40000 ALTER TABLE `proposal_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposer`
--

DROP TABLE IF EXISTS `proposer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposer` (
  `id` int(10) unsigned NOT NULL,
  `account` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `identity_id` int(11) NOT NULL,
  `zmember_proposer` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`account`,`identity_id`),
  UNIQUE KEY `account_UNIQUE` (`account`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposer`
--

LOCK TABLES `proposer` WRITE;
/*!40000 ALTER TABLE `proposer` DISABLE KEYS */;
/*!40000 ALTER TABLE `proposer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_relation`
--

DROP TABLE IF EXISTS `series_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series_relation` (
  `id` int(10) unsigned NOT NULL,
  `collection_id` int(10) unsigned NOT NULL,
  `artwork_id` int(10) unsigned NOT NULL,
  `start_dt` datetime NOT NULL,
  `end_dt` datetime NOT NULL,
  `zcollaborate_relation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `z_painter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`collection_id`,`artwork_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_relation`
--

LOCK TABLES `series_relation` WRITE;
/*!40000 ALTER TABLE `series_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `series_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `zstyle` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES (0,'全部','0000-00-00 00:00:00'),(1,'日系','0000-00-00 00:00:00'),(2,'平塗','0000-00-00 00:00:00'),(3,'萌系','0000-00-00 00:00:00'),(4,'厚塗','0000-00-00 00:00:00'),(5,'賽璐璐','0000-00-00 00:00:00'),(6,'古風','0000-00-00 00:00:00'),(7,'中國風','0000-00-00 00:00:00'),(8,'寫實係','0000-00-00 00:00:00'),(9,'水彩','0000-00-00 00:00:00'),(10,'歐美系','0000-00-00 00:00:00'),(11,'童趣','0000-00-00 00:00:00'),(12,'韓系','0000-00-00 00:00:00'),(13,'少女漫畫','0000-00-00 00:00:00'),(14,'美式卡通','0000-00-00 00:00:00'),(15,'白描','0000-00-00 00:00:00'),(16,'科幻風','0000-00-00 00:00:00'),(17,'水墨','0000-00-00 00:00:00'),(18,'硬派','0000-00-00 00:00:00'),(19,'像素風','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'painteraggregation'
--
/*!50003 DROP PROCEDURE IF EXISTS `rsCreateGenre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rsCreateGenre`(name nvarchar(20))
BEGIN
	INSERT INTO `painteraggregation`.`genre` (`name`) VALUES (name); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rsCreateStyle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rsCreateStyle`(name nvarchar(20))
BEGIN
	INSERT INTO `painteraggregation`.`style` (`name`) VALUES (name); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rsCreateUserInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rsCreateUserInfo`(
	  account nvarchar(20)
	, identity_id int
	, password nvarchar(20)
	, username nvarchar(20))
BEGIN
	INSERT INTO `painteraggregation`.`member` (
    `account`
    , `identity_id`
    , `password`
    , `username`
    , `nickname`
    , `birthday`
    , `email`
    , `cellphone`
    , `homephone`
    , `address`) VALUES (
	  account
    , identity_id
    , password
    , username
    , ''
    , '0000-00-00'
    , ''
    , ''
    , ''
    , '');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rsGetArtwork` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rsGetArtwork`()
BEGIN
    select * from artwork;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rsGetGenre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rsGetGenre`(id int)
BEGIN
Set @id =id;
	SELECT 
    genre.id, name
FROM
    genre
WHERE
    1 = (CASE
        WHEN @id = 0 THEN 1
        WHEN genre.id = @id THEN 1
        ELSE 0
    END);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rsGetPaint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rsGetPaint`()
BEGIN
	select * from painterAggregation.member
    where identity_id=3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rsGetProposalList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rsGetProposalList`()
BEGIN
SELECT 
  proposal.id projects_id
, proposal.name projects_name
, nickname
, style.name style_name
FROM painteraggregation.proposal 
join painteraggregation.member on painteraggregation.member.id=proposal.proposer_id
join proposal_Type on proposal_Type.id=proposal.proposal_type
join style on style.id=proposal.demanded_style;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rsGetStyle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rsGetStyle`(id int)
BEGIN
Set @id =id;
	SELECT 
    style.id
    , name
FROM
    style
WHERE
    1 = (CASE
        WHEN @id = 0 THEN 1
        WHEN style.id = @id THEN 1
        ELSE 0
    END);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rsGetUserInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rsGetUserInfo`(username nvarchar(20) )
BEGIN
	Set @username =username;
	SELECT * FROM `member` WHERE `member`.username=@username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-19 18:56:22
