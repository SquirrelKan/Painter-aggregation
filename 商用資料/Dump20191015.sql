-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: member
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
  `artwork_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `dir_path` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `joindata` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`artwork_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artwork`
--

LOCK TABLES `artwork` WRITE;
/*!40000 ALTER TABLE `artwork` DISABLE KEYS */;
INSERT INTO `artwork` VALUES (1,1,'gccbb02498','2019-04-06 01:37:16');
/*!40000 ALTER TABLE `artwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artworklist`
--

DROP TABLE IF EXISTS `artworklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artworklist` (
  `artworklist_id` int(11) NOT NULL,
  `artwork_id` int(11) NOT NULL,
  `artwork_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `class_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `img_path` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `artwork_like` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`artworklist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artworklist`
--

LOCK TABLES `artworklist` WRITE;
/*!40000 ALTER TABLE `artworklist` DISABLE KEYS */;
INSERT INTO `artworklist` VALUES (1,1,'松鼠',1,1,'image_Tag.png',0),(2,1,'雷數',2,1,'圖片2',0);
/*!40000 ALTER TABLE `artworklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'Q版'),(2,'人物立繪');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity`
--

DROP TABLE IF EXISTS `identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity` (
  `identity_id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`identity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity`
--

LOCK TABLES `identity` WRITE;
/*!40000 ALTER TABLE `identity` DISABLE KEYS */;
INSERT INTO `identity` VALUES (1,'admin'),(2,'painter'),(3,'proposal');
/*!40000 ALTER TABLE `identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Q版'),(2,'壁紙'),(3,'遊戲場景'),(4,'插畫'),(5,'海報');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `itemview`
--

DROP TABLE IF EXISTS `itemview`;
/*!50001 DROP VIEW IF EXISTS `itemview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `itemview` AS SELECT 
 1 AS `item_name`,
 1 AS `subitem_name`,
 1 AS `price_min`,
 1 AS `price_max`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `login`
--

DROP TABLE IF EXISTS `login`;
/*!50001 DROP VIEW IF EXISTS `login`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `login` AS SELECT 
 1 AS `user_name`,
 1 AS `nickname`,
 1 AS `password`,
 1 AS `identity_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `memberdata`
--

DROP TABLE IF EXISTS `memberdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberdata` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '暱稱',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `birthday` date DEFAULT NULL COMMENT '出生年月日',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '使用者email',
  `identityid` int(11) NOT NULL COMMENT '使用者身分',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '使用者電話',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '使用者地址',
  `joinDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '加入時間',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberdata`
--

LOCK TABLES `memberdata` WRITE;
/*!40000 ALTER TABLE `memberdata` DISABLE KEYS */;
INSERT INTO `memberdata` VALUES (1,'gccbb02498','祁恩','楓滅','https://s25.postimg.cc/98r2cyxdr/moe10.png','10d37f81a5613f9d2a33d50b105c8d8a','1994-09-02','fdes40701@gmail.com',1,'0978925012','桃園市楊梅區迎旭三街4-1號','2019-04-06 13:27:15'),(2,'a11','','test','','10d37f81a5613f9d2a33d50b105c8d8a',NULL,'fdes40701@gmail.com',2,NULL,NULL,'2019-04-06 13:27:15'),(3,'fdes40701','','asda','','10d37f81a5613f9d2a33d50b105c8d8a',NULL,'fdes40701@gmail.com',2,NULL,NULL,'2019-04-06 13:27:15'),(4,'wayne772566','','S','','4afe1c2e17cfc53c98eb7e5447f53073','0000-00-00','wayne772566@gmail.com',1,'','','2019-04-06 13:27:15'),(5,'aaa','','aaa','','0b4e7a0e5fe84ad35fb5f95b9ceeac79',NULL,'aaa',2,NULL,NULL,'2019-04-06 14:26:45'),(6,'cuarychh','','奏夜','https://s25.postimg.cc/qysqxzg3j/moe9.png','f2ac2011a422d40b3ae34a027eb4aba7',NULL,'cuarychh@gmail.com',2,NULL,NULL,'2019-04-06 14:31:08'),(7,'w9330392000','黃偉倫','納茲多拉尼格爾','https://www.houseofpianos-uae.com/public/uploads/gallery/Steinway-sons-top.jpg','689c308912f3be686f3555d61822e7be','0000-00-00','aaa@gmail.com',2,'','','2019-04-06 14:32:16'),(8,'qqqq','','qqqq','','10d37f81a5613f9d2a33d50b105c8d8a',NULL,'11111',3,NULL,NULL,'2019-04-06 18:28:43'),(9,'321','','123','','e10adc3949ba59abbe56e057f20f883e',NULL,'321',3,NULL,NULL,'2019-04-06 18:42:31'),(17,'g','','g','','7815696ecbf1c96e6894b779456d330e',NULL,'asd',1,NULL,NULL,'2019-05-31 23:49:48'),(19,'111','祁恩','111','https://ichef.bbci.co.uk/news/320/cpsprodpb/1912/production/_105981460_d9ff6226-aae3-4bba-8634-d26742299c80.jpg','698d51a19d8a121ce581499d7b701668','1994-09-02','111',2,'0978925012','祕密','2019-06-06 18:37:00');
/*!40000 ALTER TABLE `memberdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `paintdata`
--

DROP TABLE IF EXISTS `paintdata`;
/*!50001 DROP VIEW IF EXISTS `paintdata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `paintdata` AS SELECT 
 1 AS `userid`,
 1 AS `username`,
 1 AS `nickname`,
 1 AS `password`,
 1 AS `birthday`,
 1 AS `email`,
 1 AS `identityid`,
 1 AS `phone`,
 1 AS `address`,
 1 AS `joinDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `painter`
--

DROP TABLE IF EXISTS `painter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `painter` (
  `painter_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `back_img` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`painter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `painter`
--

LOCK TABLES `painter` WRITE;
/*!40000 ALTER TABLE `painter` DISABLE KEYS */;
INSERT INTO `painter` VALUES (1,1,'/images/back1.png'),(2,3,NULL),(3,4,NULL),(4,2,NULL),(5,5,NULL),(6,6,NULL),(7,7,NULL),(9,19,NULL);
/*!40000 ALTER TABLE `painter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `painterall`
--

DROP TABLE IF EXISTS `painterall`;
/*!50001 DROP VIEW IF EXISTS `painterall`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `painterall` AS SELECT 
 1 AS `nickname`,
 1 AS `painter_id`,
 1 AS `user_id`,
 1 AS `joinDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `painterart`
--

DROP TABLE IF EXISTS `painterart`;
/*!50001 DROP VIEW IF EXISTS `painterart`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `painterart` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `nickname`,
 1 AS `artwork_id`,
 1 AS `artwork_name`,
 1 AS `img_path`,
 1 AS `class_name`,
 1 AS `style_name`,
 1 AS `artwork_like`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `subitem_id` int(11) NOT NULL,
  `price_min` int(11) NOT NULL,
  `price_max` int(11) NOT NULL,
  PRIMARY KEY (`price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,1,1,1000,2000),(2,1,2,200,200),(3,2,1,100,300),(4,3,1,100,500);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pricedata`
--

DROP TABLE IF EXISTS `pricedata`;
/*!50001 DROP VIEW IF EXISTS `pricedata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pricedata` AS SELECT 
 1 AS `item_name`,
 1 AS `subitem_name`,
 1 AS `price_id`,
 1 AS `item_id`,
 1 AS `subitem_id`,
 1 AS `price_min`,
 1 AS `price_max`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project_class`
--

DROP TABLE IF EXISTS `project_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_class` (
  `project_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_class_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`project_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_class`
--

LOCK TABLES `project_class` WRITE;
/*!40000 ALTER TABLE `project_class` DISABLE KEYS */;
INSERT INTO `project_class` VALUES (1,'個人企劃'),(2,'一般企劃'),(3,'商業企劃');
/*!40000 ALTER TABLE `project_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_use`
--

DROP TABLE IF EXISTS `project_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_use` (
  `project_use_id` int(11) NOT NULL AUTO_INCREMENT,
  `use_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`project_use_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_use`
--

LOCK TABLES `project_use` WRITE;
/*!40000 ALTER TABLE `project_use` DISABLE KEYS */;
INSERT INTO `project_use` VALUES (1,'其他');
/*!40000 ALTER TABLE `project_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `project_view`
--

DROP TABLE IF EXISTS `project_view`;
/*!50001 DROP VIEW IF EXISTS `project_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `project_view` AS SELECT 
 1 AS `user_id`,
 1 AS `projects_id`,
 1 AS `projects_name`,
 1 AS `nickname`,
 1 AS `project_class_name`,
 1 AS `use_name`,
 1 AS `class_name`,
 1 AS `style_name`,
 1 AS `release_time`,
 1 AS `end_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `projects_id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `projects_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `project_class_id` int(11) NOT NULL,
  `use_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `style_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `release_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`projects_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,1,'自用Q銅像',1,1,1,'1','2019-04-12 00:00:00','1999-09-09 00:00:00'),(2,1,'漫畫',2,1,2,'1','2019-04-12 00:00:00','1999-09-09 00:00:00'),(3,1,'UI',3,1,2,'1','2019-04-12 00:00:00','1999-09-09 00:00:00'),(4,1,'學校作業',1,1,1,'1','2019-04-12 00:00:00','1999-09-09 00:00:00'),(5,1,'松鼠的自畫像',2,1,2,'1','2019-04-12 00:00:00','1999-09-09 00:00:00');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal`
--

DROP TABLE IF EXISTS `proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal` (
  `proposal_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`proposal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal`
--

LOCK TABLES `proposal` WRITE;
/*!40000 ALTER TABLE `proposal` DISABLE KEYS */;
INSERT INTO `proposal` VALUES (1,1),(2,4),(3,8),(4,9);
/*!40000 ALTER TABLE `proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `proposaldata`
--

DROP TABLE IF EXISTS `proposaldata`;
/*!50001 DROP VIEW IF EXISTS `proposaldata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `proposaldata` AS SELECT 
 1 AS `userid`,
 1 AS `username`,
 1 AS `nickname`,
 1 AS `password`,
 1 AS `birthday`,
 1 AS `email`,
 1 AS `identityid`,
 1 AS `phone`,
 1 AS `address`,
 1 AS `joinDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `style` (
  `style_id` int(11) NOT NULL AUTO_INCREMENT,
  `style_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`style_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES (1,'日系'),(2,'美系');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subitem`
--

DROP TABLE IF EXISTS `subitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subitem` (
  `subitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `subitem_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`subitem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subitem`
--

LOCK TABLES `subitem` WRITE;
/*!40000 ALTER TABLE `subitem` DISABLE KEYS */;
INSERT INTO `subitem` VALUES (1,'彩色'),(2,'黑白');
/*!40000 ALTER TABLE `subitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `itemview`
--

/*!50001 DROP VIEW IF EXISTS `itemview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `itemview` AS select `item`.`item_name` AS `item_name`,`subitem`.`subitem_name` AS `subitem_name`,`price`.`price_min` AS `price_min`,`price`.`price_max` AS `price_max` from ((`item` left join `price` on((`item`.`item_id` = `price`.`item_id`))) join `subitem` on((`price`.`subitem_id` = `subitem`.`subitem_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `login`
--

/*!50001 DROP VIEW IF EXISTS `login`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `login` AS select `memberdata`.`username` AS `user_name`,`memberdata`.`nickname` AS `nickname`,`memberdata`.`password` AS `password`,`identity`.`identity_name` AS `identity_name` from (`memberdata` join `identity` on((`memberdata`.`identityid` = `identity`.`identity_id`))) where (0 <> ((`memberdata`.`username` = 'gccbb02498') & (`memberdata`.`password` = '10d37f81a5613f9d2a33d50b105c8d8a'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `paintdata`
--

/*!50001 DROP VIEW IF EXISTS `paintdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `paintdata` AS select `memberdata`.`userid` AS `userid`,`memberdata`.`username` AS `username`,`memberdata`.`nickname` AS `nickname`,`memberdata`.`password` AS `password`,`memberdata`.`birthday` AS `birthday`,`memberdata`.`email` AS `email`,`memberdata`.`identityid` AS `identityid`,`memberdata`.`phone` AS `phone`,`memberdata`.`address` AS `address`,`memberdata`.`joinDate` AS `joinDate` from (`memberdata` join `painter` on((`memberdata`.`userid` = `painter`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `painterall`
--

/*!50001 DROP VIEW IF EXISTS `painterall`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `painterall` AS select `memberdata`.`nickname` AS `nickname`,`painter`.`painter_id` AS `painter_id`,`painter`.`user_id` AS `user_id`,`memberdata`.`joinDate` AS `joinDate` from (`memberdata` join `painter` on((`memberdata`.`userid` = `painter`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `painterart`
--

/*!50001 DROP VIEW IF EXISTS `painterart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `painterart` AS select `painter`.`user_id` AS `user_id`,`memberdata`.`username` AS `username`,`memberdata`.`nickname` AS `nickname`,`artworklist`.`artwork_id` AS `artwork_id`,`artworklist`.`artwork_name` AS `artwork_name`,`artworklist`.`img_path` AS `img_path`,`class`.`class_name` AS `class_name`,`style`.`style_name` AS `style_name`,`artworklist`.`artwork_like` AS `artwork_like` from (((((`memberdata` join `painter` on((`memberdata`.`userid` = `painter`.`user_id`))) join `artwork` on((`painter`.`user_id` = `artwork`.`user_id`))) join `artworklist` on((`artwork`.`artwork_id` = `artworklist`.`artwork_id`))) join `class` on((`artworklist`.`class_id` = `class`.`class_id`))) join `style` on((`artworklist`.`style_id` = `style`.`style_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pricedata`
--

/*!50001 DROP VIEW IF EXISTS `pricedata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pricedata` AS select `item`.`item_name` AS `item_name`,`subitem`.`subitem_name` AS `subitem_name`,`price`.`price_id` AS `price_id`,`price`.`item_id` AS `item_id`,`price`.`subitem_id` AS `subitem_id`,`price`.`price_min` AS `price_min`,`price`.`price_max` AS `price_max` from ((`price` join `item` on((`item`.`item_id` = `price`.`item_id`))) join `subitem` on((`subitem`.`subitem_id` = `price`.`subitem_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `project_view`
--

/*!50001 DROP VIEW IF EXISTS `project_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_view` AS select `proposal`.`user_id` AS `user_id`,`projects`.`projects_id` AS `projects_id`,`projects`.`projects_name` AS `projects_name`,`memberdata`.`nickname` AS `nickname`,`project_class`.`project_class_name` AS `project_class_name`,`project_use`.`use_name` AS `use_name`,`class`.`class_name` AS `class_name`,`style`.`style_name` AS `style_name`,`projects`.`release_time` AS `release_time`,`projects`.`end_time` AS `end_time` from ((((((`memberdata` join `proposal` on((`memberdata`.`userid` = `proposal`.`user_id`))) join `projects` on((`proposal`.`proposal_id` = `projects`.`proposal_id`))) join `project_class` on((`projects`.`project_class_id` = `project_class`.`project_class_id`))) join `style` on((`projects`.`style_id` = `style`.`style_id`))) join `project_use` on((`projects`.`use_id` = `project_use`.`project_use_id`))) join `class` on((`projects`.`class_id` = `class`.`class_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `proposaldata`
--

/*!50001 DROP VIEW IF EXISTS `proposaldata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proposaldata` AS select `memberdata`.`userid` AS `userid`,`memberdata`.`username` AS `username`,`memberdata`.`nickname` AS `nickname`,`memberdata`.`password` AS `password`,`memberdata`.`birthday` AS `birthday`,`memberdata`.`email` AS `email`,`memberdata`.`identityid` AS `identityid`,`memberdata`.`phone` AS `phone`,`memberdata`.`address` AS `address`,`memberdata`.`joinDate` AS `joinDate` from (`memberdata` join `proposal` on((`memberdata`.`userid` = `proposal`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-15 14:00:40
