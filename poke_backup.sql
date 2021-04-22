-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pokenti
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `base_type`
--

DROP TABLE IF EXISTS `base_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_type` (
  `id_base_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(16) NOT NULL,
  PRIMARY KEY (`id_base_type`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_type`
--

LOCK TABLES `base_type` WRITE;
/*!40000 ALTER TABLE `base_type` DISABLE KEYS */;
INSERT INTO `base_type` VALUES (1,'Bug'),(2,'Dragon'),(3,'Electric'),(4,'Fighting'),(5,'Fire'),(6,'Flying'),(7,'Ghost'),(8,'Grass'),(9,'Ground'),(10,'Ice'),(11,'Normal'),(12,'Poison'),(13,'Psychic'),(14,'Rock'),(15,'Water');
/*!40000 ALTER TABLE `base_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evolution_index`
--

DROP TABLE IF EXISTS `evolution_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evolution_index` (
  `id_evolution_index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pre_evolution` varchar(24) NOT NULL,
  `next_evolution` varchar(24) NOT NULL,
  `id_pokenti` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_evolution_index`),
  KEY `id_pokenti` (`id_pokenti`),
  CONSTRAINT `evolution_index_ibfk_1` FOREIGN KEY (`id_pokenti`) REFERENCES `pokentis` (`id_pokenti`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evolution_index`
--

LOCK TABLES `evolution_index` WRITE;
/*!40000 ALTER TABLE `evolution_index` DISABLE KEYS */;
INSERT INTO `evolution_index` VALUES (1,'Egg','Poliwhirl',1),(2,'Poliwag','Poliwrath',2),(3,'Poliwhirl','',3),(4,'Egg','Kadabra',4),(5,'Abra','Alakazam',5),(6,'Kadabra','',6),(7,'Egg','Machoke',7),(8,'Machop','Machamp',8),(9,'Machoke','',9),(10,'Egg','Weepinbell',10),(11,'Bellsprout','Victreebell',11),(12,'Weepinbell','',12),(13,'Egg','Graveler',13),(14,'Geodude','Golem',14),(15,'Graveler','',15),(16,'Egg','Dragonair',16),(17,'Dratini','Dragonite',17),(18,'Dragonair','',18),(19,'Egg','Gyarados',19),(20,'Magikarp','',20);
/*!40000 ALTER TABLE `evolution_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id_item` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(24) NOT NULL,
  `cost` int(11) NOT NULL,
  `consumable` tinyint(1) NOT NULL,
  `tradeable` tinyint(1) NOT NULL,
  `quest_item` tinyint(1) NOT NULL,
  `sprite` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `id_item_type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_item_type` (`id_item_type`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`id_item_type`) REFERENCES `items_types` (`id_item_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Poción de vida',25,1,1,0,'health_potion.png','Una poción que recupera vida HP',3),(2,'Gafas de sol',100,0,1,0,'sunglasses.png','Gafas de sol facheritas',2),(3,'Guijarro',0,0,0,1,'small_stone.png','Pequeña piedra que encuentras en el suelo, emana un aura misteriosa',4),(4,'Agua de manantial',1000,1,0,0,'river_water.png','Agua del río con propiedades medicinales que recupera puntos de poder PP',3),(5,'Manzana',3,1,1,0,'apple.png','Manzana Pro',3),(6,'Llave',0,0,0,1,'key.png','Llave que abre la puerta del destino',4),(7,'Gran Anillo',300,0,1,0,'big_ring.png','Gran anillo de las profundidades',2),(8,'Papel',2,0,1,0,'paper.png','Papel pequeño en blanco',1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_types`
--

DROP TABLE IF EXISTS `items_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_types` (
  `id_item_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL,
  PRIMARY KEY (`id_item_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_types`
--

LOCK TABLES `items_types` WRITE;
/*!40000 ALTER TABLE `items_types` DISABLE KEYS */;
INSERT INTO `items_types` VALUES (1,'Otros'),(2,'Equipable'),(3,'Consumible'),(4,'Clave');
/*!40000 ALTER TABLE `items_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_stats`
--

DROP TABLE IF EXISTS `pc_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_stats` (
  `id_pc_stats` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hp` int(11) NOT NULL,
  `attack` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `x_atk` int(11) NOT NULL,
  `x_def` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `accuracy` int(11) NOT NULL,
  `xp` int(11) NOT NULL,
  `id_pokenti` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_pc_stats`),
  KEY `id_pokenti` (`id_pokenti`),
  CONSTRAINT `pc_stats_ibfk_1` FOREIGN KEY (`id_pokenti`) REFERENCES `pokentis` (`id_pokenti`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_stats`
--

LOCK TABLES `pc_stats` WRITE;
/*!40000 ALTER TABLE `pc_stats` DISABLE KEYS */;
INSERT INTO `pc_stats` VALUES (1,40,50,40,40,40,90,20,318,1),(2,65,65,65,50,50,90,25,385,2),(3,90,95,95,70,90,70,30,510,3),(4,25,20,15,105,55,90,88,309,4),(5,40,35,30,120,70,105,90,400,5),(6,55,50,45,135,95,120,99,500,6),(7,70,80,50,35,35,35,40,305,7),(8,80,100,70,50,60,45,55,405,8),(9,90,130,80,65,85,55,55,505,9),(10,50,75,35,70,30,40,20,300,10),(11,65,90,50,85,45,55,35,390,11),(12,80,105,65,100,70,70,53,490,12),(13,40,80,100,30,30,20,14,300,13),(14,55,95,115,45,45,35,22,390,14),(15,80,120,130,55,65,45,60,495,15),(16,41,64,45,50,50,50,42,300,16),(17,61,84,65,70,70,71,64,420,17),(18,91,134,95,100,100,80,84,600,18),(19,20,10,55,15,20,80,1,200,19),(20,95,125,79,60,100,81,100,540,20);
/*!40000 ALTER TABLE `pc_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poke_evolving`
--

DROP TABLE IF EXISTS `poke_evolving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poke_evolving` (
  `id_evolving` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_evolution_index` int(10) unsigned DEFAULT NULL,
  `id_to_level` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_evolving`),
  KEY `id_evolution_index` (`id_evolution_index`),
  KEY `id_to_level` (`id_to_level`),
  CONSTRAINT `poke_evolving_ibfk_1` FOREIGN KEY (`id_evolution_index`) REFERENCES `evolution_index` (`id_evolution_index`),
  CONSTRAINT `poke_evolving_ibfk_2` FOREIGN KEY (`id_to_level`) REFERENCES `to_level` (`id_to_level`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poke_evolving`
--

LOCK TABLES `poke_evolving` WRITE;
/*!40000 ALTER TABLE `poke_evolving` DISABLE KEYS */;
INSERT INTO `poke_evolving` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,2),(5,5,2),(6,6,2),(7,7,3),(8,8,3),(9,9,3),(10,10,4),(11,11,4),(12,12,4),(13,13,5),(14,14,5),(15,15,5),(16,16,6),(17,17,6),(18,18,6),(19,19,7),(20,20,7);
/*!40000 ALTER TABLE `poke_evolving` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poke_items`
--

DROP TABLE IF EXISTS `poke_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poke_items` (
  `id_poke_item` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pokenti` int(10) unsigned NOT NULL,
  `id_item` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_poke_item`),
  KEY `id_pokenti` (`id_pokenti`),
  KEY `id_item` (`id_item`),
  CONSTRAINT `poke_items_ibfk_1` FOREIGN KEY (`id_pokenti`) REFERENCES `pokentis` (`id_pokenti`),
  CONSTRAINT `poke_items_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `items` (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poke_items`
--

LOCK TABLES `poke_items` WRITE;
/*!40000 ALTER TABLE `poke_items` DISABLE KEYS */;
INSERT INTO `poke_items` VALUES (1,1,1),(2,2,1),(3,3,3),(4,4,4),(5,5,1),(6,6,3),(7,7,1),(8,8,1),(9,9,2),(10,10,3),(11,11,1),(12,12,4),(13,13,7),(14,14,3),(15,15,1),(16,16,1),(17,17,1),(18,18,2),(19,19,2),(20,20,3);
/*!40000 ALTER TABLE `poke_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poke_pc`
--

DROP TABLE IF EXISTS `poke_pc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poke_pc` (
  `id_pc` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pokenti` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_pc`),
  KEY `id_pokenti` (`id_pokenti`),
  CONSTRAINT `poke_pc_ibfk_1` FOREIGN KEY (`id_pokenti`) REFERENCES `pokentis` (`id_pokenti`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poke_pc`
--

LOCK TABLES `poke_pc` WRITE;
/*!40000 ALTER TABLE `poke_pc` DISABLE KEYS */;
INSERT INTO `poke_pc` VALUES (1,3),(2,6),(4,12),(3,19);
/*!40000 ALTER TABLE `poke_pc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poke_team`
--

DROP TABLE IF EXISTS `poke_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poke_team` (
  `id_team` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pokenti` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_team`),
  KEY `id_pokenti` (`id_pokenti`),
  CONSTRAINT `poke_team_ibfk_1` FOREIGN KEY (`id_pokenti`) REFERENCES `pokentis` (`id_pokenti`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poke_team`
--

LOCK TABLES `poke_team` WRITE;
/*!40000 ALTER TABLE `poke_team` DISABLE KEYS */;
INSERT INTO `poke_team` VALUES (1,1),(2,4),(3,9),(4,15),(5,18);
/*!40000 ALTER TABLE `poke_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poke_types`
--

DROP TABLE IF EXISTS `poke_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poke_types` (
  `id_poke_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pokenti` int(10) unsigned NOT NULL,
  `id_base_type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_poke_type`),
  KEY `id_pokenti` (`id_pokenti`),
  KEY `id_base_type` (`id_base_type`),
  CONSTRAINT `poke_types_ibfk_1` FOREIGN KEY (`id_pokenti`) REFERENCES `pokentis` (`id_pokenti`),
  CONSTRAINT `poke_types_ibfk_2` FOREIGN KEY (`id_base_type`) REFERENCES `base_type` (`id_base_type`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poke_types`
--

LOCK TABLES `poke_types` WRITE;
/*!40000 ALTER TABLE `poke_types` DISABLE KEYS */;
INSERT INTO `poke_types` VALUES (1,1,15),(2,2,15),(3,3,15),(4,4,13),(5,5,13),(6,6,13),(7,7,4),(8,8,4),(9,9,4),(10,10,8),(11,11,8),(12,12,8),(13,13,14),(14,14,14),(15,15,14),(16,16,2),(17,17,2),(18,18,2),(19,19,15),(20,20,2);
/*!40000 ALTER TABLE `poke_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokentis`
--

DROP TABLE IF EXISTS `pokentis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokentis` (
  `id_pokenti` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  `wap_name` varchar(24) NOT NULL,
  `poke_index` int(11) NOT NULL,
  PRIMARY KEY (`id_pokenti`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokentis`
--

LOCK TABLES `pokentis` WRITE;
/*!40000 ALTER TABLE `pokentis` DISABLE KEYS */;
INSERT INTO `pokentis` VALUES (1,'Pacauros','Nyoromo',1),(2,'Poliwhirl','Nyorozo',2),(3,'Poliwrath','Nyoboron',3),(4,'Abra','Casey',4),(5,'Alejandro','Yungerer',5),(6,'Alakazam','Foodin',6),(7,'Machop','Wanriky',7),(8,'Machoke','Goriky',8),(9,'Machamp','Kairiky',9),(10,'Bellsprout','Madatsubomi',10),(11,'Weepinbell','Utsudon',11),(12,'Victrebeel','Utsubot',12),(13,'Geodude','Ishitsubute',13),(14,'Graveler','Golone',14),(15,'Golem','Golonya',15),(16,'Dratini','Miniryu',16),(17,'Dragonair','Hakuryu',17),(18,'Dragonite','Kairyu',18),(19,'Magikarp','Koiking',19),(20,'Gyarados','Gyarados',20);
/*!40000 ALTER TABLE `pokentis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_stats`
--

DROP TABLE IF EXISTS `team_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_stats` (
  `id_current_stat` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team_level` int(11) NOT NULL,
  `team_exp` int(11) NOT NULL,
  `team_hp` int(11) NOT NULL,
  `team_attack` int(11) NOT NULL,
  `team_defense` int(11) NOT NULL,
  `team_x_atk` int(11) NOT NULL,
  `team_x_def` int(11) NOT NULL,
  `team_speed` int(11) NOT NULL,
  `team_accuracy` int(11) NOT NULL,
  `id_pokenti` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_current_stat`),
  KEY `id_pokenti` (`id_pokenti`),
  CONSTRAINT `team_stats_ibfk_1` FOREIGN KEY (`id_pokenti`) REFERENCES `pokentis` (`id_pokenti`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_stats`
--

LOCK TABLES `team_stats` WRITE;
/*!40000 ALTER TABLE `team_stats` DISABLE KEYS */;
INSERT INTO `team_stats` VALUES (1,8,34,41,42,65,15,15,44,31,1),(2,22,33,6,43,80,8,6,45,31,2),(3,13,44,68,56,10,10,38,11,55,3),(4,14,14,62,32,60,35,45,12,39,4),(5,24,75,13,18,8,25,18,45,11,5),(6,94,88,45,42,65,45,65,66,31,6),(7,7,23,31,35,50,6,43,45,24,7),(8,31,28,3,20,35,10,58,47,14,8),(9,53,71,11,60,5,15,78,49,20,9),(10,12,21,70,31,10,20,45,11,15,10),(11,27,30,140,45,55,25,30,15,50,11),(12,55,76,15,40,14,30,70,33,45,12),(13,12,20,25,20,24,20,50,11,19,13),(14,26,47,15,12,15,2,35,33,45,14),(15,77,404,110,14,40,40,55,75,15,15),(16,6,42,15,40,32,32,53,44,25,16),(17,10,10,220,155,44,41,31,88,39,17),(18,77,189,50,75,17,14,10,90,79,18),(19,4,34,6,5,2,5,2,3,33,19),(20,54,1,11,60,15,40,9,110,41,20);
/*!40000 ALTER TABLE `team_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `to_level`
--

DROP TABLE IF EXISTS `to_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `to_level` (
  `id_to_level` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_evolution` int(11) DEFAULT NULL,
  `special_action` tinyint(4) DEFAULT NULL,
  `final_evolution` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_to_level`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `to_level`
--

LOCK TABLES `to_level` WRITE;
/*!40000 ALTER TABLE `to_level` DISABLE KEYS */;
INSERT INTO `to_level` VALUES (1,21,1,NULL),(2,16,1,NULL),(3,28,1,NULL),(4,21,1,NULL),(5,25,1,NULL),(6,30,0,55),(7,20,0,NULL);
/*!40000 ALTER TABLE `to_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_pokenti_items`
--

DROP TABLE IF EXISTS `view_pokenti_items`;
/*!50001 DROP VIEW IF EXISTS `view_pokenti_items`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_pokenti_items` (
  `id_pokenti` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `id_item` tinyint NOT NULL,
  `item` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_pokeskill_types`
--

DROP TABLE IF EXISTS `view_pokeskill_types`;
/*!50001 DROP VIEW IF EXISTS `view_pokeskill_types`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_pokeskill_types` (
  `id_pokenti` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `id_base_type` tinyint NOT NULL,
  `type_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_pokenti_items`
--

/*!50001 DROP TABLE IF EXISTS `view_pokenti_items`*/;
/*!50001 DROP VIEW IF EXISTS `view_pokenti_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`enti`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pokenti_items` AS select `pokentis`.`id_pokenti` AS `id_pokenti`,`pokentis`.`name` AS `name`,`items`.`id_item` AS `id_item`,`items`.`item` AS `item` from ((`pokentis` left join `poke_items` on(`pokentis`.`id_pokenti` = `poke_items`.`id_pokenti`)) left join `items` on(`items`.`id_item` = `poke_items`.`id_item`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_pokeskill_types`
--

/*!50001 DROP TABLE IF EXISTS `view_pokeskill_types`*/;
/*!50001 DROP VIEW IF EXISTS `view_pokeskill_types`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`enti`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pokeskill_types` AS select `pokentis`.`id_pokenti` AS `id_pokenti`,`pokentis`.`name` AS `name`,`base_type`.`id_base_type` AS `id_base_type`,`base_type`.`type_name` AS `type_name` from ((`pokentis` left join `poke_types` on(`pokentis`.`id_pokenti` = `poke_types`.`id_pokenti`)) left join `base_type` on(`base_type`.`id_base_type` = `poke_types`.`id_base_type`)) */;
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

-- Dump completed on 2021-04-22  6:20:57
