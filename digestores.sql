-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: tecnoredDB
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

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
-- Table structure for table `ab_permission`
--

DROP TABLE IF EXISTS `ab_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_permission`
--

LOCK TABLES `ab_permission` WRITE;
/*!40000 ALTER TABLE `ab_permission` DISABLE KEYS */;
INSERT INTO `ab_permission` VALUES (6,'can_add'),(15,'can_chart'),(5,'can_delete'),(8,'can_download'),(7,'can_edit'),(16,'can_get'),(3,'can_list'),(4,'can_show'),(1,'can_this_form_get'),(2,'can_this_form_post'),(9,'can_userinfo'),(14,'copyrole'),(13,'menu_access'),(10,'resetmypassword'),(11,'resetpasswords'),(12,'userinfoedit');
/*!40000 ALTER TABLE `ab_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_permission_view`
--

DROP TABLE IF EXISTS `ab_permission_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_permission_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) DEFAULT NULL,
  `view_menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_id` (`permission_id`,`view_menu_id`),
  KEY `view_menu_id` (`view_menu_id`),
  CONSTRAINT `ab_permission_view_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ab_permission` (`id`),
  CONSTRAINT `ab_permission_view_ibfk_2` FOREIGN KEY (`view_menu_id`) REFERENCES `ab_view_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_permission_view`
--

LOCK TABLES `ab_permission_view` WRITE;
/*!40000 ALTER TABLE `ab_permission_view` DISABLE KEYS */;
INSERT INTO `ab_permission_view` VALUES (1,1,5),(3,1,6),(5,1,7),(2,2,5),(4,2,6),(6,2,7),(7,3,9),(19,3,12),(29,3,16),(31,3,18),(33,3,20),(41,3,23),(49,3,26),(57,3,29),(64,3,31),(72,3,34),(79,3,36),(87,3,39),(94,3,41),(102,3,44),(8,4,9),(20,4,12),(39,4,23),(47,4,26),(55,4,29),(62,4,31),(70,4,34),(77,4,36),(85,4,39),(92,4,41),(100,4,44),(9,5,9),(21,5,12),(38,5,23),(46,5,26),(54,5,29),(61,5,31),(69,5,34),(76,5,36),(84,5,39),(91,5,41),(99,5,44),(10,6,9),(22,6,12),(36,6,23),(44,6,26),(52,6,29),(59,6,31),(67,6,34),(74,6,36),(82,6,39),(89,6,41),(97,6,44),(11,7,9),(23,7,12),(37,7,23),(45,7,26),(53,7,29),(60,7,31),(68,7,34),(75,7,36),(83,7,39),(90,7,41),(98,7,44),(12,8,9),(24,8,12),(40,8,23),(48,8,26),(56,8,29),(63,8,31),(71,8,34),(78,8,36),(86,8,39),(93,8,41),(101,8,44),(13,9,9),(14,10,9),(15,11,9),(16,12,9),(17,13,10),(18,13,11),(26,13,13),(28,13,15),(30,13,17),(32,13,19),(34,13,21),(42,13,24),(43,13,25),(50,13,27),(51,13,28),(58,13,30),(65,13,32),(66,13,33),(73,13,35),(80,13,37),(81,13,38),(88,13,40),(95,13,42),(96,13,43),(25,14,12),(27,15,14),(35,16,22);
/*!40000 ALTER TABLE `ab_permission_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_permission_view_role`
--

DROP TABLE IF EXISTS `ab_permission_view_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_permission_view_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_view_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_view_id` (`permission_view_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `ab_permission_view_role_ibfk_1` FOREIGN KEY (`permission_view_id`) REFERENCES `ab_permission_view` (`id`),
  CONSTRAINT `ab_permission_view_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `ab_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_permission_view_role`
--

LOCK TABLES `ab_permission_view_role` WRITE;
/*!40000 ALTER TABLE `ab_permission_view_role` DISABLE KEYS */;
INSERT INTO `ab_permission_view_role` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(27,27,1),(28,28,1),(29,29,1),(30,30,1),(31,31,1),(32,32,1),(33,33,1),(34,34,1),(35,35,1),(36,36,1),(37,37,1),(38,38,1),(39,39,1),(40,40,1),(41,41,1),(42,42,1),(43,43,1),(44,44,1),(45,45,1),(46,46,1),(47,47,1),(48,48,1),(49,49,1),(50,50,1),(51,51,1),(52,52,1),(53,53,1),(54,54,1),(55,55,1),(56,56,1),(57,57,1),(58,58,1),(59,59,1),(60,60,1),(61,61,1),(62,62,1),(63,63,1),(64,64,1),(65,65,1),(66,66,1),(67,67,1),(68,68,1),(69,69,1),(70,70,1),(71,71,1),(72,72,1),(73,73,1),(74,74,1),(75,75,1),(76,76,1),(77,77,1),(78,78,1),(79,79,1),(80,80,1),(81,81,1),(82,82,1),(83,83,1),(84,84,1),(85,85,1),(86,86,1),(87,87,1),(88,88,1),(89,89,1),(90,90,1),(91,91,1),(92,92,1),(93,93,1),(94,94,1),(95,95,1),(96,96,1),(97,97,1),(98,98,1),(99,99,1),(100,100,1),(101,101,1),(102,102,1);
/*!40000 ALTER TABLE `ab_permission_view_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_register_user`
--

DROP TABLE IF EXISTS `ab_register_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_register_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `registration_date` datetime DEFAULT NULL,
  `registration_hash` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_register_user`
--

LOCK TABLES `ab_register_user` WRITE;
/*!40000 ALTER TABLE `ab_register_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ab_register_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_role`
--

DROP TABLE IF EXISTS `ab_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_role`
--

LOCK TABLES `ab_role` WRITE;
/*!40000 ALTER TABLE `ab_role` DISABLE KEYS */;
INSERT INTO `ab_role` VALUES (1,'Admin'),(2,'Public');
/*!40000 ALTER TABLE `ab_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_user`
--

DROP TABLE IF EXISTS `ab_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `login_count` int(11) DEFAULT NULL,
  `fail_login_count` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `changed_on` datetime DEFAULT NULL,
  `created_by_fk` int(11) DEFAULT NULL,
  `changed_by_fk` int(11) DEFAULT NULL,
  `idTdni` int(11) NOT NULL,
  `idPais` int(11) NOT NULL,
  `idProfesion` int(11) NOT NULL,
  `numerodniUser` int(11) NOT NULL,
  `celUser` int(11) DEFAULT NULL,
  `fnacimientoUser` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `numerodniUser` (`numerodniUser`),
  KEY `created_by_fk` (`created_by_fk`),
  KEY `changed_by_fk` (`changed_by_fk`),
  KEY `idTdni` (`idTdni`),
  KEY `idPais` (`idPais`),
  KEY `idProfesion` (`idProfesion`),
  CONSTRAINT `ab_user_ibfk_1` FOREIGN KEY (`created_by_fk`) REFERENCES `ab_user` (`id`),
  CONSTRAINT `ab_user_ibfk_2` FOREIGN KEY (`changed_by_fk`) REFERENCES `ab_user` (`id`),
  CONSTRAINT `ab_user_ibfk_3` FOREIGN KEY (`idTdni`) REFERENCES `tdni` (`idTdni`),
  CONSTRAINT `ab_user_ibfk_4` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`),
  CONSTRAINT `ab_user_ibfk_5` FOREIGN KEY (`idProfesion`) REFERENCES `profesion` (`idProfesion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_user`
--

LOCK TABLES `ab_user` WRITE;
/*!40000 ALTER TABLE `ab_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ab_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_user_role`
--

DROP TABLE IF EXISTS `ab_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `ab_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ab_user` (`id`),
  CONSTRAINT `ab_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `ab_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_user_role`
--

LOCK TABLES `ab_user_role` WRITE;
/*!40000 ALTER TABLE `ab_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `ab_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_view_menu`
--

DROP TABLE IF EXISTS `ab_view_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_view_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_view_menu`
--

LOCK TABLES `ab_view_menu` WRITE;
/*!40000 ALTER TABLE `ab_view_menu` DISABLE KEYS */;
INSERT INTO `ab_view_menu` VALUES (38,'Area/Planta'),(39,'AreaView'),(44,'Area_PlanView'),(8,'AuthDBView'),(17,'Base Permissions'),(25,'Consultor'),(23,'ConsultoraView'),(40,'CRUD Area'),(42,'CRUD Area Plan'),(24,'crud consultora'),(27,'CRUD Paises'),(37,'CRUD Plantas'),(35,'CRUD Profesion'),(30,'CRUD Provincia'),(32,'CRUD Tdni'),(1,'IndexView'),(13,'List Roles'),(10,'List Users'),(3,'LocaleView'),(22,'MenuApi'),(9,'MyUserDBModelView'),(26,'PaisView'),(21,'Permission on Views/Menus'),(16,'PermissionModelView'),(20,'PermissionViewModelView'),(33,'Personas'),(43,'planta usuario'),(36,'PlantaView'),(41,'PlanUsuaView'),(34,'ProfesionView'),(29,'ProvinciaView'),(6,'ResetMyPasswordView'),(5,'ResetPasswordView'),(12,'RoleModelView'),(28,'Secundarios'),(11,'Security'),(4,'SecurityApi'),(31,'TdniView'),(15,'User\'s Statistics'),(7,'UserInfoEditView'),(14,'UserStatsChartView'),(2,'UtilView'),(18,'ViewMenuModelView'),(19,'Views/Menus');
/*!40000 ALTER TABLE `ab_view_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `idArea` int(11) NOT NULL AUTO_INCREMENT,
  `nombreArea` varchar(100) NOT NULL,
  `descripcionArea` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idArea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_plan`
--

DROP TABLE IF EXISTS `area_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_plan` (
  `idArea_plan` int(11) NOT NULL AUTO_INCREMENT,
  `idPlanta` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  `fechacargaArea_plan` date DEFAULT NULL,
  PRIMARY KEY (`idArea_plan`),
  KEY `idPlanta` (`idPlanta`),
  KEY `idArea` (`idArea`),
  CONSTRAINT `area_plan_ibfk_1` FOREIGN KEY (`idPlanta`) REFERENCES `planta` (`idPlanta`),
  CONSTRAINT `area_plan_ibfk_2` FOREIGN KEY (`idArea`) REFERENCES `area` (`idArea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_plan`
--

LOCK TABLES `area_plan` WRITE;
/*!40000 ALTER TABLE `area_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charDige`
--

DROP TABLE IF EXISTS `charDige`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charDige` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pHc` decimal(10,0) DEFAULT NULL,
  `FOS` int(11) NOT NULL,
  `TAC` int(11) NOT NULL,
  `temp` decimal(10,0) DEFAULT NULL,
  `fech` date NOT NULL,
  `dige_id` int(11) DEFAULT NULL,
  `FOSdivTAC` decimal(5,2) GENERATED ALWAYS AS ((`FOS` / `TAC`)) STORED,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charDige`
--

LOCK TABLES `charDige` WRITE;
/*!40000 ALTER TABLE `charDige` DISABLE KEYS */;
INSERT INTO `charDige` (`id`, `pHc`, `FOS`, `TAC`, `temp`, `fech`, `dige_id`) VALUES (4,NULL,3785,11201,1,'2020-10-23',1),(5,NULL,4125,10858,1,'2020-10-24',1),(6,NULL,4209,12748,1,'2020-10-25',1),(7,NULL,3911,9874,1,'2020-10-26',1),(8,NULL,4319,10244,1,'2020-10-27',1),(9,NULL,3927,12166,1,'2020-10-28',1),(10,NULL,4177,11627,1,'2020-10-29',1),(11,NULL,3906,12156,1,'2020-10-30',1),(12,NULL,4045,11826,1,'2020-10-31',1),(13,NULL,3910,12077,1,'2020-11-01',1),(14,NULL,4082,11413,1,'2020-11-02',1),(15,NULL,3806,10806,1,'2020-11-03',1),(16,NULL,4173,9867,NULL,'2020-11-04',1),(17,NULL,3992,11092,NULL,'2020-11-05',1),(18,NULL,4219,10791,NULL,'2020-11-06',1),(19,NULL,2141,5784,NULL,'2020-10-30',2),(20,NULL,1987,6241,NULL,'2020-11-03',2),(21,NULL,2252,6521,1,'2020-11-01',2),(22,NULL,1874,5985,NULL,'2020-11-05',2),(23,NULL,2058,6075,NULL,'2020-11-07',2),(24,NULL,2255,6247,NULL,'2020-11-09',2),(25,NULL,1925,5187,NULL,'2020-10-31',2),(26,NULL,1524,6701,NULL,'2020-11-02',2),(27,NULL,1358,6574,NULL,'2020-11-04',2),(28,NULL,2388,5278,NULL,'2020-11-06',2),(29,NULL,1847,5822,NULL,'2020-11-08',2);
/*!40000 ALTER TABLE `charDige` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultora`
--

DROP TABLE IF EXISTS `consultora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultora` (
  `idConsultora` int(11) NOT NULL AUTO_INCREMENT,
  `nombreConsultora` varchar(250) NOT NULL,
  `cuitConsultora` varchar(15) NOT NULL,
  `idSfiscal` int(11) NOT NULL,
  `mailConsultora` varchar(100) DEFAULT NULL,
  `telFijoConsultora` varchar(100) DEFAULT NULL,
  `celConsultora` varchar(100) DEFAULT NULL,
  `direccionConsultora` varchar(100) DEFAULT NULL,
  `idLoc` int(11) NOT NULL,
  `fCargaConsultora` date DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idConsultora`),
  KEY `idSfiscal` (`idSfiscal`),
  KEY `idLoc` (`idLoc`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `consultora_ibfk_1` FOREIGN KEY (`idSfiscal`) REFERENCES `sfiscal` (`idSfiscal`),
  CONSTRAINT `consultora_ibfk_2` FOREIGN KEY (`idLoc`) REFERENCES `localidad` (`idLocalidad`),
  CONSTRAINT `consultora_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `ab_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultora`
--

LOCK TABLES `consultora` WRITE;
/*!40000 ALTER TABLE `consultora` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidad` (
  `idLocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nomLocalidad` varchar(45) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  PRIMARY KEY (`idLocalidad`),
  KEY `idProvincia` (`idProvincia`),
  CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`idProvincia`) REFERENCES `provincia` (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `nomPais` varchar(45) NOT NULL,
  `parentId` int(11) NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_usua`
--

DROP TABLE IF EXISTS `plan_usua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_usua` (
  `idPlan_usua` int(11) NOT NULL AUTO_INCREMENT,
  `idPlanta` int(11) NOT NULL,
  `fcargaPlan_usua` date DEFAULT NULL,
  `finicioPlan_usua` date DEFAULT NULL,
  `activoPlan_usua` tinyint(1) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idPlan_usua`),
  KEY `idPlanta` (`idPlanta`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `plan_usua_ibfk_1` FOREIGN KEY (`idPlanta`) REFERENCES `planta` (`idPlanta`),
  CONSTRAINT `plan_usua_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `ab_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_usua`
--

LOCK TABLES `plan_usua` WRITE;
/*!40000 ALTER TABLE `plan_usua` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_usua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planta`
--

DROP TABLE IF EXISTS `planta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planta` (
  `idPlanta` int(11) NOT NULL AUTO_INCREMENT,
  `idConsultora` int(11) NOT NULL,
  `razonsocialPlanta` varchar(200) NOT NULL,
  `nombrePlanta` varchar(250) NOT NULL,
  `cuitPlanta` varchar(15) NOT NULL,
  `idSfiscal` int(11) NOT NULL,
  `telfijocontactoPlanta` varchar(100) DEFAULT NULL,
  `celcontactoPlanta` varchar(100) DEFAULT NULL,
  `cargocontactoPlanta` varchar(100) NOT NULL,
  `potinstaladaPlanta` decimal(10,0) DEFAULT NULL,
  `potadjudicadaPlanta` decimal(10,0) DEFAULT NULL,
  `idLocf` int(11) NOT NULL,
  `direccionfiscalPlanta` varchar(200) DEFAULT NULL,
  `ubicacionPlanta` varchar(200) NOT NULL,
  `idLoc` int(11) NOT NULL,
  `mailPlanta` varchar(100) DEFAULT NULL,
  `contactoPlanta` varchar(150) NOT NULL,
  `fcargaPlanta` date NOT NULL,
  `activoPlanta` tinyint(1) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idPlanta`),
  KEY `idConsultora` (`idConsultora`),
  KEY `idSfiscal` (`idSfiscal`),
  KEY `idLocf` (`idLocf`),
  KEY `idLoc` (`idLoc`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `planta_ibfk_1` FOREIGN KEY (`idConsultora`) REFERENCES `consultora` (`idConsultora`),
  CONSTRAINT `planta_ibfk_2` FOREIGN KEY (`idSfiscal`) REFERENCES `sfiscal` (`idSfiscal`),
  CONSTRAINT `planta_ibfk_3` FOREIGN KEY (`idLocf`) REFERENCES `localidad` (`idLocalidad`),
  CONSTRAINT `planta_ibfk_4` FOREIGN KEY (`idLoc`) REFERENCES `localidad` (`idLocalidad`),
  CONSTRAINT `planta_ibfk_5` FOREIGN KEY (`idUsuario`) REFERENCES `ab_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planta`
--

LOCK TABLES `planta` WRITE;
/*!40000 ALTER TABLE `planta` DISABLE KEYS */;
/*!40000 ALTER TABLE `planta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesion`
--

DROP TABLE IF EXISTS `profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesion` (
  `idProfesion` int(11) NOT NULL AUTO_INCREMENT,
  `nomProfesion` varchar(255) NOT NULL,
  PRIMARY KEY (`idProfesion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion`
--

LOCK TABLES `profesion` WRITE;
/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincia` (
  `idProvincia` int(11) NOT NULL AUTO_INCREMENT,
  `nomProvincia` varchar(45) NOT NULL,
  `idPais` int(11) NOT NULL,
  PRIMARY KEY (`idProvincia`),
  KEY `idPais` (`idPais`),
  CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfiscal`
--

DROP TABLE IF EXISTS `sfiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sfiscal` (
  `idSfiscal` int(11) NOT NULL AUTO_INCREMENT,
  `nombreSfiscal` varchar(255) NOT NULL,
  PRIMARY KEY (`idSfiscal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfiscal`
--

LOCK TABLES `sfiscal` WRITE;
/*!40000 ALTER TABLE `sfiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdni`
--

DROP TABLE IF EXISTS `tdni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdni` (
  `idTdni` int(11) NOT NULL AUTO_INCREMENT,
  `tipDni` varchar(20) NOT NULL,
  PRIMARY KEY (`idTdni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdni`
--

LOCK TABLES `tdni` WRITE;
/*!40000 ALTER TABLE `tdni` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdni` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11 13:00:16
