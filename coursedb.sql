-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: coursedb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add category',6,'add_category'),(22,'Can change category',6,'change_category'),(23,'Can delete category',6,'delete_category'),(24,'Can view category',6,'view_category'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add course',8,'add_course'),(30,'Can change course',8,'change_course'),(31,'Can delete course',8,'delete_course'),(32,'Can view course',8,'view_course'),(33,'Can add tag',9,'add_tag'),(34,'Can change tag',9,'change_tag'),(35,'Can delete tag',9,'delete_tag'),(36,'Can view tag',9,'view_tag'),(37,'Can add lesson',10,'add_lesson'),(38,'Can change lesson',10,'change_lesson'),(39,'Can delete lesson',10,'delete_lesson'),(40,'Can view lesson',10,'view_lesson'),(41,'Can add comment',11,'add_comment'),(42,'Can change comment',11,'change_comment'),(43,'Can delete comment',11,'delete_comment'),(44,'Can view comment',11,'view_comment'),(45,'Can add like',12,'add_like'),(46,'Can change like',12,'change_like'),(47,'Can delete like',12,'delete_like'),(48,'Can view like',12,'view_like'),(49,'Can add rating',13,'add_rating'),(50,'Can change rating',13,'change_rating'),(51,'Can delete rating',13,'delete_rating'),(52,'Can view rating',13,'view_rating'),(53,'Can add application',14,'add_application'),(54,'Can change application',14,'change_application'),(55,'Can delete application',14,'delete_application'),(56,'Can view application',14,'view_application'),(57,'Can add access token',15,'add_accesstoken'),(58,'Can change access token',15,'change_accesstoken'),(59,'Can delete access token',15,'delete_accesstoken'),(60,'Can view access token',15,'view_accesstoken'),(61,'Can add grant',16,'add_grant'),(62,'Can change grant',16,'change_grant'),(63,'Can delete grant',16,'delete_grant'),(64,'Can view grant',16,'view_grant'),(65,'Can add refresh token',17,'add_refreshtoken'),(66,'Can change refresh token',17,'change_refreshtoken'),(67,'Can delete refresh token',17,'delete_refreshtoken'),(68,'Can view refresh token',17,'view_refreshtoken'),(69,'Can add id token',18,'add_idtoken'),(70,'Can change id token',18,'change_idtoken'),(71,'Can delete id token',18,'delete_idtoken'),(72,'Can view id token',18,'view_idtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_ManagementCourseApp_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_ManagementCourseApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `managementcourseapp_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-03-21 12:59:15.123129','1','Tag1',1,'[{\"added\": {}}]',9,1),(2,'2024-03-21 12:59:21.974292','2','Tag2',1,'[{\"added\": {}}]',9,1),(3,'2024-03-21 13:23:26.073939','1','C1',1,'[{\"added\": {}}]',6,1),(4,'2024-03-21 13:24:45.473554','1','Course1',1,'[{\"added\": {}}]',8,1),(5,'2024-03-21 14:18:16.779351','2','Course2',1,'[{\"added\": {}}]',8,1),(6,'2024-03-21 14:18:42.698875','4','Lesson object (4)',1,'[{\"added\": {}}]',10,1),(7,'2024-03-21 14:32:57.467823','2','Categorys1',1,'[{\"added\": {}}]',6,1),(8,'2024-03-21 14:33:05.427097','3','Categorys2',1,'[{\"added\": {}}]',6,1),(9,'2024-03-21 14:33:11.331167','4','Categorys3',1,'[{\"added\": {}}]',6,1),(10,'2024-03-21 14:42:33.974938','5','Lesson object (5)',1,'[{\"added\": {}}]',10,1),(11,'2024-03-31 05:23:03.934709','5','Course 4',1,'[{\"added\": {}}]',8,1),(12,'2024-03-31 16:22:16.273088','6','Course 5',1,'[{\"added\": {}}]',8,1),(13,'2024-04-04 05:36:52.201881','7','Lesson object (7)',2,'[{\"changed\": {\"fields\": [\"Content\", \"Course\", \"Tags\"]}}]',10,1),(14,'2024-04-04 05:37:01.946772','6','Lesson object (6)',2,'[{\"changed\": {\"fields\": [\"Content\", \"Course\", \"Tags\"]}}]',10,1),(15,'2024-04-04 05:37:30.517642','1','Lesson object (1)',2,'[{\"changed\": {\"fields\": [\"Content\", \"Course\", \"Tags\"]}}]',10,1),(16,'2024-04-05 07:52:04.713556','1','Python Basics',2,'[{\"changed\": {\"fields\": [\"Subject\", \"description\"]}}]',8,1),(17,'2024-04-05 07:52:41.540927','2','React Native',2,'[{\"changed\": {\"fields\": [\"Subject\", \"description\"]}}]',8,1),(18,'2024-04-05 07:53:32.020138','3','C++',2,'[{\"changed\": {\"fields\": [\"Subject\", \"description\", \"Tags\", \"User\"]}}]',8,1),(19,'2024-04-05 07:53:41.292682','2','React Native',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',8,1),(20,'2024-04-05 07:53:47.367054','1','Python Basics',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',8,1),(21,'2024-04-05 07:54:30.641603','4','JavaScript Basics',2,'[{\"changed\": {\"fields\": [\"Subject\", \"description\", \"Tags\", \"User\"]}}]',8,1),(22,'2024-04-05 07:55:04.709327','5','JavaScript Advanced',2,'[{\"changed\": {\"fields\": [\"Subject\", \"description\", \"Tags\", \"User\"]}}]',8,1),(23,'2024-04-05 07:56:40.197263','6','React JS',2,'[{\"changed\": {\"fields\": [\"Subject\", \"description\", \"User\"]}}]',8,1),(24,'2024-04-05 07:58:24.167392','7','Grammar English Level 1',2,'[{\"changed\": {\"fields\": [\"Subject\", \"description\", \"Tags\", \"User\"]}}]',8,1),(25,'2024-04-05 07:58:47.384352','8','Grammar English Level 2',2,'[{\"changed\": {\"fields\": [\"Subject\", \"description\", \"Tags\", \"User\"]}}]',8,1),(26,'2024-04-05 08:12:21.259276','1','Python Basics',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',8,1),(27,'2024-04-05 08:12:56.800418','4','JavaScript Basics',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',8,1),(28,'2024-04-05 08:15:48.972857','1','Python Basics',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',8,1),(29,'2024-04-05 08:16:01.591592','2','React Native',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',8,1),(30,'2024-04-05 08:16:08.460360','3','C++',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',8,1),(31,'2024-04-05 08:16:16.029337','4','JavaScript Basics',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',8,1),(32,'2024-04-05 08:16:24.166578','5','JavaScript Advanced',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',8,1),(33,'2024-04-05 08:16:29.676435','5','JavaScript Advanced',2,'[]',8,1),(34,'2024-04-05 08:16:39.353212','5','JavaScript Advanced',2,'[{\"changed\": {\"fields\": [\"Tags\"]}}]',8,1),(35,'2024-04-05 08:16:46.565967','6','React JS',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',8,1),(36,'2024-04-05 08:16:52.985655','7','Grammar English Level 1',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',8,1),(37,'2024-04-05 08:17:00.951713','8','Grammar English Level 2',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',8,1),(38,'2024-04-05 08:18:10.694380','1','Python Basics',2,'[]',8,1),(39,'2024-04-05 08:18:49.722540','1','Lesson object (1)',2,'[{\"changed\": {\"fields\": [\"Subject\"]}}]',10,1),(40,'2024-04-05 08:19:05.910495','2','Lesson object (2)',2,'[{\"changed\": {\"fields\": [\"Subject\", \"Content\", \"Tags\"]}}]',10,1),(41,'2024-04-05 08:19:11.158980','1','Lesson object (1)',2,'[]',10,1),(42,'2024-04-05 08:19:57.355063','3','Lesson object (3)',2,'[{\"changed\": {\"fields\": [\"Subject\", \"Content\", \"Tags\"]}}]',10,1),(43,'2024-04-05 08:20:21.652432','4','Lesson object (4)',2,'[{\"changed\": {\"fields\": [\"Subject\", \"Content\", \"Tags\"]}}]',10,1),(44,'2024-04-05 08:20:54.206125','5','Lesson object (5)',2,'[{\"changed\": {\"fields\": [\"Subject\", \"Content\", \"Tags\"]}}]',10,1),(45,'2024-04-05 08:21:02.906430','6','Lesson object (6)',2,'[{\"changed\": {\"fields\": [\"Subject\"]}}]',10,1),(46,'2024-04-05 08:21:18.200009','7','Lesson object (7)',3,'',10,1),(47,'2024-04-05 08:25:25.485042','1','Python Basics',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(48,'2024-04-05 08:33:57.240208','7','English Level 1',2,'[{\"changed\": {\"fields\": [\"Subject\"]}}]',8,1),(49,'2024-04-05 08:34:04.267558','8','English Level 2',2,'[{\"changed\": {\"fields\": [\"Subject\"]}}]',8,1),(50,'2024-04-05 08:42:39.006031','1','Python Basics',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(51,'2024-04-05 08:44:18.400209','4','JavaScript Basics',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(52,'2024-04-05 08:44:35.783698','5','JavaScript Advanced',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(53,'2024-04-05 08:47:46.661725','2','React Native',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(54,'2024-04-05 08:48:07.797995','3','C++',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(55,'2024-04-05 08:48:24.146082','6','React JS',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(56,'2024-04-05 08:48:37.343602','7','English Level 1',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(57,'2024-04-05 08:48:47.688813','8','English Level 2',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(58,'2024-04-05 09:07:45.541236','1','Lesson object (1)',2,'[{\"changed\": {\"fields\": [\"Course\"]}}]',10,1),(59,'2024-04-05 09:08:21.997868','1','Lesson object (1)',2,'[{\"changed\": {\"fields\": [\"Course\"]}}]',10,1),(60,'2024-04-05 09:09:23.254698','8','Lesson object (8)',1,'[{\"added\": {}}]',10,1),(61,'2024-04-05 09:09:44.095806','9','Lesson object (9)',1,'[{\"added\": {}}]',10,1),(62,'2024-04-05 09:10:06.403969','10','Lesson object (10)',1,'[{\"added\": {}}]',10,1),(63,'2024-04-05 09:10:29.419248','11','Lesson object (11)',1,'[{\"added\": {}}]',10,1),(64,'2024-04-05 09:10:46.276847','12','Lesson object (12)',1,'[{\"added\": {}}]',10,1),(65,'2024-04-05 09:11:09.189321','13','Lesson object (13)',1,'[{\"added\": {}}]',10,1),(66,'2024-04-05 09:54:58.025567','14','Lesson object (14)',1,'[{\"added\": {}}]',10,1),(67,'2024-04-05 09:55:08.227844','15','Lesson object (15)',1,'[{\"added\": {}}]',10,1),(68,'2024-04-05 09:55:20.912560','16','Lesson object (16)',1,'[{\"added\": {}}]',10,1),(69,'2024-04-05 09:55:27.864089','15','Lesson object (15)',2,'[]',10,1),(70,'2024-04-05 09:55:33.909826','14','Lesson object (14)',2,'[]',10,1),(71,'2024-04-05 09:55:48.699179','17','Lesson object (17)',1,'[{\"added\": {}}]',10,1),(72,'2024-04-05 09:56:00.892359','18','Lesson object (18)',1,'[{\"added\": {}}]',10,1),(73,'2024-04-05 09:56:14.613947','19','Lesson object (19)',1,'[{\"added\": {}}]',10,1),(74,'2024-04-05 09:56:34.722533','20','Lesson object (20)',1,'[{\"added\": {}}]',10,1),(75,'2024-04-05 10:03:05.615906','1','Lesson object (1)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(76,'2024-04-05 10:03:20.293988','2','Lesson object (2)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(77,'2024-04-05 10:03:28.719257','3','Lesson object (3)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(78,'2024-04-05 10:03:38.811089','4','Lesson object (4)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(79,'2024-04-05 10:03:51.567466','5','Lesson object (5)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(80,'2024-04-05 10:04:11.898335','6','Lesson object (6)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(81,'2024-04-05 10:04:30.648473','8','Lesson object (8)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(82,'2024-04-05 10:04:40.038493','9','Lesson object (9)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(83,'2024-04-05 10:04:49.474326','10','Lesson object (10)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(84,'2024-04-05 10:05:17.337676','11','Lesson object (11)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(85,'2024-04-05 10:05:25.394848','12','Lesson object (12)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(86,'2024-04-05 10:05:37.518676','13','Lesson object (13)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(87,'2024-04-05 10:06:05.078212','14','Lesson object (14)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(88,'2024-04-05 10:06:13.596017','15','Lesson object (15)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(89,'2024-04-05 10:06:21.498735','16','Lesson object (16)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(90,'2024-04-05 10:06:29.418820','17','Lesson object (17)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(91,'2024-04-05 10:06:37.779533','18','Lesson object (18)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(92,'2024-04-05 10:06:48.481896','19','Lesson object (19)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(93,'2024-04-05 10:07:04.074444','20','Lesson object (20)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(94,'2024-04-05 10:07:18.873538','20','Lesson object (20)',2,'[]',10,1),(95,'2024-04-05 10:07:30.640173','21','Lesson object (21)',1,'[{\"added\": {}}]',10,1),(96,'2024-04-05 10:07:41.622606','22','Lesson object (22)',1,'[{\"added\": {}}]',10,1),(97,'2024-04-05 10:07:57.824511','23','Lesson object (23)',1,'[{\"added\": {}}]',10,1),(98,'2024-04-05 10:08:11.203723','24','Lesson object (24)',1,'[{\"added\": {}}]',10,1),(99,'2024-04-05 10:08:24.524660','25','Lesson object (25)',1,'[{\"added\": {}}]',10,1),(100,'2024-04-05 10:09:05.155019','26','Lesson object (26)',1,'[{\"added\": {}}]',10,1),(101,'2024-04-05 10:09:14.139852','27','Lesson object (27)',1,'[{\"added\": {}}]',10,1),(102,'2024-04-05 10:09:28.308324','28','Lesson object (28)',1,'[{\"added\": {}}]',10,1),(103,'2024-04-05 10:09:41.574248','29','Lesson object (29)',1,'[{\"added\": {}}]',10,1),(104,'2024-04-05 10:09:51.398417','30','Lesson object (30)',1,'[{\"added\": {}}]',10,1),(105,'2024-04-05 10:10:04.958677','31','Lesson object (31)',1,'[{\"added\": {}}]',10,1),(106,'2024-04-05 10:17:01.000684','2','React Native',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',8,1),(107,'2024-04-05 10:38:33.735649','10','PHP',1,'[{\"added\": {}}]',8,1),(108,'2024-04-05 10:38:49.526147','32','Lesson object (32)',1,'[{\"added\": {}}]',10,1),(109,'2024-04-05 10:38:58.061902','33','Lesson object (33)',1,'[{\"added\": {}}]',10,1),(110,'2024-04-05 10:39:07.968622','34','Lesson object (34)',1,'[{\"added\": {}}]',10,1),(111,'2024-04-05 10:39:23.629489','35','Lesson object (35)',1,'[{\"added\": {}}]',10,1),(112,'2024-04-05 10:39:38.651849','36','Lesson object (36)',1,'[{\"added\": {}}]',10,1),(113,'2024-04-05 10:39:53.904837','37','Lesson object (37)',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'ManagementCourseApp','category'),(11,'ManagementCourseApp','comment'),(8,'ManagementCourseApp','course'),(10,'ManagementCourseApp','lesson'),(12,'ManagementCourseApp','like'),(13,'ManagementCourseApp','rating'),(9,'ManagementCourseApp','tag'),(7,'ManagementCourseApp','user'),(15,'oauth2_provider','accesstoken'),(14,'oauth2_provider','application'),(16,'oauth2_provider','grant'),(18,'oauth2_provider','idtoken'),(17,'oauth2_provider','refreshtoken'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-03-21 02:28:57.773994'),(2,'contenttypes','0002_remove_content_type_name','2024-03-21 02:28:57.947670'),(3,'auth','0001_initial','2024-03-21 02:28:58.629270'),(4,'auth','0002_alter_permission_name_max_length','2024-03-21 02:28:58.763012'),(5,'auth','0003_alter_user_email_max_length','2024-03-21 02:28:58.776656'),(6,'auth','0004_alter_user_username_opts','2024-03-21 02:28:58.793441'),(7,'auth','0005_alter_user_last_login_null','2024-03-21 02:28:58.808793'),(8,'auth','0006_require_contenttypes_0002','2024-03-21 02:28:58.815203'),(9,'auth','0007_alter_validators_add_error_messages','2024-03-21 02:28:58.828056'),(10,'auth','0008_alter_user_username_max_length','2024-03-21 02:28:58.841527'),(11,'auth','0009_alter_user_last_name_max_length','2024-03-21 02:28:58.855039'),(12,'auth','0010_alter_group_name_max_length','2024-03-21 02:28:58.888043'),(13,'auth','0011_update_proxy_permissions','2024-03-21 02:28:58.906198'),(14,'auth','0012_alter_user_first_name_max_length','2024-03-21 02:28:58.919225'),(15,'ManagementCourseApp','0001_initial','2024-03-21 02:28:59.815000'),(16,'ManagementCourseApp','0002_category_active_category_create_date_and_more','2024-03-21 02:29:00.129128'),(17,'ManagementCourseApp','0003_tag_alter_course_category_alter_course_image_and_more','2024-03-21 02:29:01.440050'),(18,'ManagementCourseApp','0004_alter_course_image_alter_lesson_image','2024-03-21 02:29:01.748367'),(19,'ManagementCourseApp','0005_user_avatar_alter_course_category_and_more','2024-03-21 02:29:01.821236'),(20,'ManagementCourseApp','0006_comment','2024-03-21 02:29:02.152456'),(21,'ManagementCourseApp','0007_like_rating','2024-03-21 02:29:02.838423'),(22,'ManagementCourseApp','0008_alter_like_active_alter_like_unique_together','2024-03-21 02:29:02.898138'),(23,'ManagementCourseApp','0009_user_role','2024-03-21 02:29:02.945486'),(24,'ManagementCourseApp','0010_user_address_user_gender_alter_user_role','2024-03-21 02:29:03.109076'),(25,'ManagementCourseApp','0011_course_user','2024-03-21 02:29:03.501158'),(26,'admin','0001_initial','2024-03-21 02:29:03.885223'),(27,'admin','0002_logentry_remove_auto_add','2024-03-21 02:29:03.902555'),(28,'admin','0003_logentry_add_action_flag_choices','2024-03-21 02:29:03.919481'),(29,'oauth2_provider','0001_initial','2024-03-21 02:29:05.956631'),(30,'oauth2_provider','0002_auto_20190406_1805','2024-03-21 02:29:06.079185'),(31,'oauth2_provider','0003_auto_20201211_1314','2024-03-21 02:29:06.216981'),(32,'oauth2_provider','0004_auto_20200902_2022','2024-03-21 02:29:07.298379'),(33,'oauth2_provider','0005_auto_20211222_2352','2024-03-21 02:29:07.432144'),(34,'oauth2_provider','0006_alter_application_client_secret','2024-03-21 02:29:07.482523'),(35,'oauth2_provider','0007_application_post_logout_redirect_uris','2024-03-21 02:29:07.791219'),(36,'sessions','0001_initial','2024-03-21 02:29:07.871631'),(37,'ManagementCourseApp','0012_alter_user_role','2024-03-21 03:00:59.394055'),(38,'ManagementCourseApp','0013_alter_course_tags_alter_course_user','2024-03-21 03:17:26.450452'),(39,'ManagementCourseApp','0014_alter_user_role','2024-03-21 12:51:07.011191'),(40,'ManagementCourseApp','0015_alter_lesson_image','2024-03-31 04:28:00.255233'),(41,'ManagementCourseApp','0016_alter_course_image','2024-03-31 05:01:29.922422'),(42,'ManagementCourseApp','0017_category_description','2024-04-03 05:19:47.937973');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3ivnmf5tg4pvg9wbr10dx0jflg4bq8kp','.eJxVjDkOwjAUBe_iGll2sBObkj5niP5KAsiWslSIu0OkFNC-mXkvM8C2jsO2yDxMbC7Gm9PvhkAPKTvgO5RbtVTLOk9od8UedLF9ZXleD_fvYIRl_NY5JkCkhAQZlRiDQNQIrmtIuRNtQRpHIWByMTXqXcxy1pbZt51XMu8PLJ85UQ:1rnHm4:P135H_3hf3_iCTEGZZ2Mw3GAVULpQN3w0C0tHi3MRM4','2024-04-04 12:44:00.141027'),('3zx8c381e2sxt9erfw9oh0zbpswsky8q','.eJxVjDkOwjAUBe_iGll2sBObkj5niP5KAsiWslSIu0OkFNC-mXkvM8C2jsO2yDxMbC7Gm9PvhkAPKTvgO5RbtVTLOk9od8UedLF9ZXleD_fvYIRl_NY5JkCkhAQZlRiDQNQIrmtIuRNtQRpHIWByMTXqXcxy1pbZt51XMu8PLJ85UQ:1rn8SG:Q729WJNj7a8ssgP-mZtPo_pYafT4-RV_jOnLNqDO8JM','2024-04-04 02:46:56.852751'),('69kiraewnf9iw8ad8tmx6k0gjtsnfro4','.eJxVjDsOwjAQBe_iGllJHH-Wkj5niNa7axxAtpRPhbg7iZQC2jcz761G3NY8bovM48Tqqry6_G4R6SnlAPzAcq-aalnnKepD0Sdd9FBZXrfT_TvIuOS97gVNalwkBmscRbbAyCm0DAQdm5DAiITWg6Cn3jbgDHW77MijIa8-XwysOIo:1rn8es:9-H5fzOKU2JT_jf68yuJ3oNlXHibjXB0rvuNI5dnSFQ','2024-04-04 02:59:58.350846'),('7p2gjthlrs26icuy582edau3qldp29ph','.eJxVjDkOwjAUBe_iGll2sBObkj5niP5KAsiWslSIu0OkFNC-mXkvM8C2jsO2yDxMbC7Gm9PvhkAPKTvgO5RbtVTLOk9od8UedLF9ZXleD_fvYIRl_NY5JkCkhAQZlRiDQNQIrmtIuRNtQRpHIWByMTXqXcxy1pbZt51XMu8PLJ85UQ:1rqncD:dNY6_8DTNuu5uXeuDhd2kpvUFOFi5Jh8WY7xK6pSxvM','2024-04-14 05:20:21.670087'),('dy123664x6d7g0jnkhxhjedumoo60sg6','.eJxVjDkOwjAUBe_iGll2sBObkj5niP5KAsiWslSIu0OkFNC-mXkvM8C2jsO2yDxMbC7Gm9PvhkAPKTvgO5RbtVTLOk9od8UedLF9ZXleD_fvYIRl_NY5JkCkhAQZlRiDQNQIrmtIuRNtQRpHIWByMTXqXcxy1pbZt51XMu8PLJ85UQ:1rsaXK:GLtdXNt8cfZxxYnsfen6AQ74NJJV1pNzq2hR8RtTADQ','2024-04-19 03:46:42.176848'),('eqyvsqdk8qkw47j72ne6fxii1kjsa6af','.eJxVjDkOwjAUBe_iGll2sBObkj5niP5KAsiWslSIu0OkFNC-mXkvM8C2jsO2yDxMbC7Gm9PvhkAPKTvgO5RbtVTLOk9od8UedLF9ZXleD_fvYIRl_NY5JkCkhAQZlRiDQNQIrmtIuRNtQRpHIWByMTXqXcxy1pbZt51XMu8PLJ85UQ:1rsFls:Q3mzJDhP-7iaD31txGaWUEEPcxFFfq3jgTQZCmpxUiQ','2024-04-18 05:36:20.976271'),('msgk4y2oe87i50ij9ohuooqwdlnxfpl2','.eJxVjDkOwjAUBe_iGll2sBObkj5niP5KAsiWslSIu0OkFNC-mXkvM8C2jsO2yDxMbC7Gm9PvhkAPKTvgO5RbtVTLOk9od8UedLF9ZXleD_fvYIRl_NY5JkCkhAQZlRiDQNQIrmtIuRNtQRpHIWByMTXqXcxy1pbZt51XMu8PLJ85UQ:1rqxvL:A1wRRa8GHF3Wv6DtuMkPTa0u5UWENrYD994J2QL8rlk','2024-04-14 16:20:47.935901'),('oyv8m2k6yly05rb00k230b2u31ft1yqs','.eJxVjMsOwiAQRf-FtSEM5enSvd9ABgakaiAp7cr479qkC93ec859sYDbWsM28hJmYmfm2Ol3i5geue2A7thunafe1mWOfFf4QQe_dsrPy-H-HVQc9VsDgdRACE4pUaxLDoVW0oMpsegJJu-kESILNwnUngwUpEje2mKjsZq9P7j3Nuo:1rn8hQ:Itxg37gvLQY6Wb9s8VGi7FxjP8J1oSeDpe10wXgi3ms','2024-04-04 03:02:36.063691');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_category`
--

DROP TABLE IF EXISTS `managementcourseapp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_category`
--

LOCK TABLES `managementcourseapp_category` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_category` DISABLE KEYS */;
INSERT INTO `managementcourseapp_category` VALUES (1,'Video Course',1,'2024-03-21','2024-03-21','Our highly qualified English teachers are by your side and provide you with the right tools to help you interact confidently in the real world and achieve the professional and personal success you are working towards.'),(2,'Basic Course',1,'2024-03-21','2024-03-21','Our highly qualified English teachers are by your side and provide you with the right tools to help you interact confidently in the real world and achieve the professional and personal success you are working towards.'),(3,'Advanced Courses',1,'2024-03-21','2024-03-21','Our highly qualified English teachers are by your side and provide you with the right tools to help you interact confidently in the real world and achieve the professional and personal success you are working towards.');
/*!40000 ALTER TABLE `managementcourseapp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_comment`
--

DROP TABLE IF EXISTS `managementcourseapp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `lesson_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ManagementCourseApp__lesson_id_ce0dd7f7_fk_Managemen` (`lesson_id`),
  KEY `ManagementCourseApp__user_id_d89d6083_fk_Managemen` (`user_id`),
  CONSTRAINT `ManagementCourseApp__lesson_id_ce0dd7f7_fk_Managemen` FOREIGN KEY (`lesson_id`) REFERENCES `managementcourseapp_lesson` (`id`),
  CONSTRAINT `ManagementCourseApp__user_id_d89d6083_fk_Managemen` FOREIGN KEY (`user_id`) REFERENCES `managementcourseapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_comment`
--

LOCK TABLES `managementcourseapp_comment` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_comment` DISABLE KEYS */;
INSERT INTO `managementcourseapp_comment` VALUES (1,'2024-03-25','2024-03-25',1,'Hello',3,1),(2,'2024-04-03','2024-04-03',1,'Hay quá',3,3),(3,'2024-04-03','2024-04-03',1,'Xin chào',3,3),(4,'2024-04-03','2024-04-03',1,'Chào',3,3),(5,'2024-04-03','2024-04-03',1,'Chào',4,3),(6,'2024-04-04','2024-04-04',1,'Ddd',1,1),(7,'2024-04-04','2024-04-04',1,'Ddd',1,1),(8,'2024-04-04','2024-04-04',1,'',1,1),(9,'2024-04-04','2024-04-04',1,'',1,1),(10,'2024-04-04','2024-04-04',1,'',1,1),(11,'2024-04-04','2024-04-04',1,'Nhu',1,1),(12,'2024-04-04','2024-04-04',1,'Nhu',1,1),(13,'2024-04-04','2024-04-04',1,'Nhu',1,1),(14,'2024-04-04','2024-04-04',1,'Nhu',1,1),(15,'2024-04-04','2024-04-04',1,'Nhu',1,1),(16,'2024-04-04','2024-04-04',1,'Nhu',1,1),(17,'2024-04-04','2024-04-04',1,'Nhu',1,1),(18,'2024-04-04','2024-04-04',1,'Nhu',1,1),(19,'2024-04-04','2024-04-04',1,'Nhu',1,1),(20,'2024-04-04','2024-04-04',1,'Hello',1,1),(21,'2024-04-04','2024-04-04',1,'Hello',1,1),(22,'2024-04-04','2024-04-04',1,'Hello',1,1),(23,'2024-04-04','2024-04-04',1,'Ngộ ha',2,1),(24,'2024-04-04','2024-04-04',1,'Chào',2,1),(25,'2024-04-04','2024-04-04',1,'Chào',2,1),(26,'2024-04-04','2024-04-04',1,'Chào1',2,1),(27,'2024-04-04','2024-04-04',1,'Hihi',4,1),(28,'2024-04-04','2024-04-04',1,'1111',4,1),(29,'2024-04-04','2024-04-04',1,'555',4,1),(30,'2024-04-04','2024-04-04',1,'Hello',1,1),(31,'2024-04-04','2024-04-04',1,'Hi',1,11),(32,'2024-04-05','2024-04-05',1,'Hi guys',13,11),(33,'2024-04-05','2024-04-05',1,'Hello guys',14,15),(34,'2024-04-05','2024-04-05',1,'Amazing! Good job em',14,15),(35,'2024-04-05','2024-04-05',1,'Vụ nổ lớn nha! ',14,15);
/*!40000 ALTER TABLE `managementcourseapp_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_course`
--

DROP TABLE IF EXISTS `managementcourseapp_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ManagementCourseApp_course_subject_category_id_5ecd67a9_uniq` (`subject`,`category_id`),
  KEY `ManagementCourseApp__category_id_aff02ed0_fk_Managemen` (`category_id`),
  CONSTRAINT `ManagementCourseApp__category_id_aff02ed0_fk_Managemen` FOREIGN KEY (`category_id`) REFERENCES `managementcourseapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_course`
--

LOCK TABLES `managementcourseapp_course` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_course` DISABLE KEYS */;
INSERT INTO `managementcourseapp_course` VALUES (1,'2024-03-21','2024-04-05',1,'Python Basics','<p>Python is a general-purpose, high-level programming language. Its design philosophy emphasizes code readability with its notable use of significant whitespace.</p>','image/upload/v1712306558/khcdcvlyiunfeeyngx8p.jpg',2),(2,'2024-03-21','2024-04-05',1,'React Native','<p>React Native is a general-purpose, high-level programming language. Its design philosophy emphasizes code readability with its notable use of significant whitespace.</p>','image/upload/v1712306865/gwysvmev4qanphnjp9iw.jpg',1),(3,'2024-03-21','2024-04-05',1,'C++','<p>C++ is a general-purpose, high-level programming language. Its design philosophy emphasizes code readability with its notable use of significant whitespace.</p>','image/upload/v1712306887/mtg8tfurrcpy8u9gsuht.jpg',1),(4,'2024-03-21','2024-04-05',1,'JavaScript Basics','<p>JavaScript&nbsp;is a general-purpose, high-level programming language. Its design philosophy emphasizes code readability with its notable use of significant whitespace.</p>','image/upload/v1712306657/t9flfwtxrgcmhrawfibb.png',2),(5,'2024-03-31','2024-04-05',1,'JavaScript Advanced','<p>JavaScript is a general-purpose, high-level programming language. Its design philosophy emphasizes code readability with its notable use of significant whitespace with advanced.</p>','image/upload/v1712306675/exktaxq0jibwqpyl7jof.png',2),(6,'2024-03-31','2024-04-05',1,'React JS','<p>React JS is a powerful JavaScript library used for building user interfaces, particularly for single-page applications where data can change over time without reloading the page. Developed and maintained by Facebook, React has become one of the most popular libraries for front-end development due to its simplicity, efficiency, and component-based architecture.</p>','image/upload/v1712306903/k1nmhpah0inkynleou6f.png',3),(7,'2024-03-31','2024-04-05',1,'English Level 1','<p>Grammar is the foundation of language and essential for effective communication in English. In a Level 1 Grammar course, you will cover basic grammar concepts that form the building blocks of English sentences. Here&#39;s a brief overview of what you might learn in a Grammar English Level 1 course.</p>','image/upload/v1712306916/onclqiqen5ttfxtyjfrr.png',3),(8,'2024-03-31','2024-04-05',1,'English Level 2','<p>Grammar is the foundation of language and essential for effective communication in English. In a Level 1 Grammar course, you will cover basic grammar concepts that form the building blocks of English sentences. Here&#39;s a brief overview of what you might learn in a Grammar English Level 2 course.</p>','image/upload/v1712306926/g3jxart72lquacnrhp4b.png',3),(10,'2024-04-05','2024-04-05',1,'PHP','<p>PHP (Hypertext Preprocessor) is a widely-used server-side scripting language designed for web development. It is particularly well-suited for creating dynamic and interactive web pages. PHP code is embedded within HTML documents and processed by a PHP interpreter on the server to generate dynamic content.</p>','image/upload/v1712313513/wknh4juyjl1e9dhzrlzm.png',1);
/*!40000 ALTER TABLE `managementcourseapp_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_course_tags`
--

DROP TABLE IF EXISTS `managementcourseapp_course_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_course_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ManagementCourseApp_course_tags_course_id_tag_id_e43550d6_uniq` (`course_id`,`tag_id`),
  KEY `ManagementCourseApp__tag_id_d0abd330_fk_Managemen` (`tag_id`),
  CONSTRAINT `ManagementCourseApp__course_id_efc7c6aa_fk_Managemen` FOREIGN KEY (`course_id`) REFERENCES `managementcourseapp_course` (`id`),
  CONSTRAINT `ManagementCourseApp__tag_id_d0abd330_fk_Managemen` FOREIGN KEY (`tag_id`) REFERENCES `managementcourseapp_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_course_tags`
--

LOCK TABLES `managementcourseapp_course_tags` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_course_tags` DISABLE KEYS */;
INSERT INTO `managementcourseapp_course_tags` VALUES (1,1,1),(2,2,2),(5,3,1),(6,4,1),(7,5,1),(4,6,1),(8,7,1),(9,8,1),(10,10,1);
/*!40000 ALTER TABLE `managementcourseapp_course_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_course_user`
--

DROP TABLE IF EXISTS `managementcourseapp_course_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_course_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ManagementCourseApp_course_user_course_id_user_id_6e962bef_uniq` (`course_id`,`user_id`),
  KEY `ManagementCourseApp__user_id_d22a0b90_fk_Managemen` (`user_id`),
  CONSTRAINT `ManagementCourseApp__course_id_06ccd577_fk_Managemen` FOREIGN KEY (`course_id`) REFERENCES `managementcourseapp_course` (`id`),
  CONSTRAINT `ManagementCourseApp__user_id_d22a0b90_fk_Managemen` FOREIGN KEY (`user_id`) REFERENCES `managementcourseapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_course_user`
--

LOCK TABLES `managementcourseapp_course_user` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_course_user` DISABLE KEYS */;
INSERT INTO `managementcourseapp_course_user` VALUES (61,1,11),(160,1,15),(84,2,12),(158,2,15),(73,3,12),(159,3,15),(162,4,11),(107,4,12),(118,5,12),(129,6,12),(163,7,11),(141,7,12),(153,8,12),(161,10,12);
/*!40000 ALTER TABLE `managementcourseapp_course_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_lesson`
--

DROP TABLE IF EXISTS `managementcourseapp_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_lesson` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ManagementCourseApp_lesson_subject_course_id_f8015a22_uniq` (`subject`,`course_id`),
  KEY `ManagementCourseApp__course_id_7862bcaa_fk_Managemen` (`course_id`),
  CONSTRAINT `ManagementCourseApp__course_id_7862bcaa_fk_Managemen` FOREIGN KEY (`course_id`) REFERENCES `managementcourseapp_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_lesson`
--

LOCK TABLES `managementcourseapp_lesson` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_lesson` DISABLE KEYS */;
INSERT INTO `managementcourseapp_lesson` VALUES (1,'2024-03-21','2024-04-05',1,'Introduction','<p>In Python, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/https://res.cloudinary.com/dhdca9ibd/image/upload/v1711860363/courseapp/qbb02va5zotuil8f1qpq.jpg',1),(2,'2024-03-21','2024-04-05',1,'Variables','<p>In Python, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/https://res.cloudinary.com/dhdca9ibd/image/upload/v1711860363/courseapp/qbb02va5zotuil8f1qpq.jpg',1),(3,'2024-03-21','2024-04-05',1,'Data Types','<p>In Python, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/https://res.cloudinary.com/dhdca9ibd/image/upload/v1711860363/courseapp/qbb02va5zotuil8f1qpq.jpg',1),(4,'2024-03-21','2024-04-05',1,'Numbers','<p>In Python, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/https://res.cloudinary.com/dhdca9ibd/image/upload/v1711860363/courseapp/qbb02va5zotuil8f1qpq.jpg',1),(5,'2024-03-21','2024-04-05',1,'Function','<p>In Python, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/https://res.cloudinary.com/dhdca9ibd/image/upload/v1711860363/courseapp/qbb02va5zotuil8f1qpq.jpg',1),(6,'2024-03-21','2024-04-05',1,'Final Project Assessment','<p>The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/https://res.cloudinary.com/dhdca9ibd/image/upload/v1711860363/courseapp/qbb02va5zotuil8f1qpq.jpg',1),(8,'2024-04-05','2024-04-05',1,'Introduction','<p>In React Native, variables are essential for managing data within components. State variables, defined using <code>useState</code>, hold component-specific data that can change over time. Props are used to pass data from parent to child components. Regular JavaScript constants (<code>const</code>) and variables (<code>let</code>) are employed for storing static data. Context variables, accessed with <code>useContext.</code></p>','image/upload/v1712308162/eo51un1ea95bqhezc8ku.png',2),(9,'2024-04-05','2024-04-05',1,'Variables','<p>In React Native, variables are essential for managing data within components. State variables, defined using <code>useState</code>, hold component-specific data that can change over time. Props are used to pass data from parent to child components. Regular JavaScript constants (<code>const</code>) and variables (<code>let</code>) are employed for storing static data. Context variables, accessed with <code>useContext.</code></p>','image/upload/v1712308183/l7tou1bayvywdmfaltoy.png',2),(10,'2024-04-05','2024-04-05',1,'Data Types','<p>In React Native, variables are essential for managing data within components. State variables, defined using <code>useState</code>, hold component-specific data that can change over time. Props are used to pass data from parent to child components. Regular JavaScript constants (<code>const</code>) and variables (<code>let</code>) are employed for storing static data. Context variables, accessed with <code>useContext.</code></p>','image/upload/v1712308205/gxipukdvymlwgc54sjuf.png',2),(11,'2024-04-05','2024-04-05',1,'Numbers','<p>In React Native, variables are essential for managing data within components. State variables, defined using <code>useState</code>, hold component-specific data that can change over time. Props are used to pass data from parent to child components. Regular JavaScript constants (<code>const</code>) and variables (<code>let</code>) are employed for storing static data. Context variables, accessed with <code>useContext.</code></p>','image/upload/v1712308228/bqcy4q2cl4dnekprkubf.png',2),(12,'2024-04-05','2024-04-05',1,'Function','<p>In React Native, variables are essential for managing data within components. State variables, defined using <code>useState</code>, hold component-specific data that can change over time. Props are used to pass data from parent to child components. Regular JavaScript constants (<code>const</code>) and variables (<code>let</code>) are employed for storing static data. Context variables, accessed with <code>useContext.</code></p>','image/upload/v1712308244/azaft1azhonmlyorbmqh.png',2),(13,'2024-04-05','2024-04-05',1,'Final Project Assessment','<p>Props are used to pass data from parent to child components. Regular JavaScript constants (<code>const</code>) and variables (<code>let</code>) are employed for storing static data. Context variables, accessed with <code>useContext.</code></p>','image/upload/v1712308268/srqn8x9l5fqxv3elfe0i.png',2),(14,'2024-04-05','2024-04-05',1,'Introduction','<p>In C++, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712310897/rsrfwglruoaikp78dwug.png',3),(15,'2024-04-05','2024-04-05',1,'Variables','<p>In C++, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712310907/ezjoke2bdv4b2km579cr.png',3),(16,'2024-04-05','2024-04-05',1,'Data Types','<p>In C++, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712310920/zbpm2udhz1zvxfz4ngfa.png',3),(17,'2024-04-05','2024-04-05',1,'Numbers','<p>In C++, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712310948/qyrpvjhnbuasv6g6l8pw.png',3),(18,'2024-04-05','2024-04-05',1,'Function','<p>In C++, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712310960/mhnokelqqnstalatv1fi.png',3),(19,'2024-04-05','2024-04-05',1,'Final Project Assessment','<p>The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712310974/ouvetyp1xrphmhjfoayr.png',3),(20,'2024-04-05','2024-04-05',1,'Introduction','<p>In Javascript, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712310994/iuv4ds7agdkjyed7sedt.png',4),(21,'2024-04-05','2024-04-05',1,'Variables','<p>In Javascript, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712311649/buxavjfqurkbuduzei5c.png',4),(22,'2024-04-05','2024-04-05',1,'Data Types','<p>In Javascript, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712311660/wefbejim5ykbu86mv2qm.png',4),(23,'2024-04-05','2024-04-05',1,'Numbers','<p>In Javascript, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712311677/pugrf4sgoa2gc9jonzuq.png',4),(24,'2024-04-05','2024-04-05',1,'Function','<p>In Javascript, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712311690/nbe72sy1znazpnlw0aa4.png',4),(25,'2024-04-05','2024-04-05',1,'Final Project Assessment','<p>The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712311703/qzn48evmvnttzomorkek.png',4),(26,'2024-04-05','2024-04-05',1,'Introduction','<p>In ReactJS, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712311744/ym9ywcdzhnrcnrgbrqgb.png',6),(27,'2024-04-05','2024-04-05',1,'Variables','<p>In ReactJS, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712311753/vdbyb0vhavl6usid5trw.png',6),(28,'2024-04-05','2024-04-05',1,'Data Types','<p>In ReactJS, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712311767/x9ut9jv5z9nv4fsavbsh.png',6),(29,'2024-04-05','2024-04-05',1,'Numbers','<p>In ReactJS, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712311780/dnfftv2avhbmkqoxyigl.png',6),(30,'2024-04-05','2024-04-05',1,'Function','<p>In ReactJS, variables are used to store data with specific types such as integers (<code>int</code>), floating-point numbers (<code>double</code>), characters (<code>char</code>), and more. Variables must be declared with a data type before use, and they can optionally be initialized at the same time. The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712311790/pccn6qdx0mzgw34h5acf.png',6),(31,'2024-04-05','2024-04-05',1,'Final Project Assessment','<p>The scope of a variable determines where it can be accessed within the program, and variables have a lifetime that defines their existence from creation to destruction within a program&#39;s execution.</p>','image/upload/v1712311804/ghka3ynjqqaiy0bfmblu.png',6),(32,'2024-04-05','2024-04-05',1,'Introduction','<p>PHP (Hypertext Preprocessor) is a widely-used server-side scripting language designed for web development. It is particularly well-suited for creating dynamic and interactive web pages. PHP code is embedded within HTML documents and processed by a PHP interpreter on the server to generate dynamic content.</p>','image/upload/v1712313528/tecoqyisfswv38dxw7vr.png',10),(33,'2024-04-05','2024-04-05',1,'Variables','<p>PHP (Hypertext Preprocessor) is a widely-used server-side scripting language designed for web development. It is particularly well-suited for creating dynamic and interactive web pages. PHP code is embedded within HTML documents and processed by a PHP interpreter on the server to generate dynamic content.</p>','image/upload/v1712313537/kqveofbvvbbfhpmlvawh.png',10),(34,'2024-04-05','2024-04-05',1,'Data Types','<p>PHP (Hypertext Preprocessor) is a widely-used server-side scripting language designed for web development. It is particularly well-suited for creating dynamic and interactive web pages. PHP code is embedded within HTML documents and processed by a PHP interpreter on the server to generate dynamic content.</p>','image/upload/v1712313547/iz6iynls3t0iacieoccm.png',10),(35,'2024-04-05','2024-04-05',1,'Numbers','<p>PHP (Hypertext Preprocessor) is a widely-used server-side scripting language designed for web development. It is particularly well-suited for creating dynamic and interactive web pages. PHP code is embedded within HTML documents and processed by a PHP interpreter on the server to generate dynamic content.</p>','image/upload/v1712313563/etikpq9rxlqk2t6jkpdf.png',10),(36,'2024-04-05','2024-04-05',1,'Function','<p>PHP (Hypertext Preprocessor) is a widely-used server-side scripting language designed for web development. It is particularly well-suited for creating dynamic and interactive web pages. PHP code is embedded within HTML documents and processed by a PHP interpreter on the server to generate dynamic content.</p>','image/upload/v1712313577/y4y6edpoaadkvq3sb64u.jpg',10),(37,'2024-04-05','2024-04-05',1,'Final Project Assessment','<p>PHP (Hypertext Preprocessor) is a widely-used server-side scripting language designed for web development. It is particularly well-suited for creating dynamic and interactive web pages. PHP code is embedded within HTML documents and processed by a PHP interpreter on the server to generate dynamic content.</p>','image/upload/v1712313593/dpt1fzjclspwqimukmd0.png',10);
/*!40000 ALTER TABLE `managementcourseapp_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_lesson_tags`
--

DROP TABLE IF EXISTS `managementcourseapp_lesson_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_lesson_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lesson_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ManagementCourseApp_lesson_tags_lesson_id_tag_id_8f719b40_uniq` (`lesson_id`,`tag_id`),
  KEY `ManagementCourseApp__tag_id_818ab677_fk_Managemen` (`tag_id`),
  CONSTRAINT `ManagementCourseApp__lesson_id_a3a772b8_fk_Managemen` FOREIGN KEY (`lesson_id`) REFERENCES `managementcourseapp_lesson` (`id`),
  CONSTRAINT `ManagementCourseApp__tag_id_818ab677_fk_Managemen` FOREIGN KEY (`tag_id`) REFERENCES `managementcourseapp_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_lesson_tags`
--

LOCK TABLES `managementcourseapp_lesson_tags` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_lesson_tags` DISABLE KEYS */;
INSERT INTO `managementcourseapp_lesson_tags` VALUES (5,1,1),(6,2,1),(7,3,1),(8,4,1),(9,5,1),(4,6,1),(10,8,1),(11,9,1),(12,10,1),(13,11,1),(14,12,1),(15,13,1),(16,14,1),(17,15,1),(18,16,1),(19,17,1),(20,18,1),(21,19,1),(22,20,1),(23,21,1),(24,22,1),(25,23,1),(26,24,1),(27,25,1),(28,26,1),(29,27,1),(30,28,1),(31,29,1),(32,30,1),(33,31,1),(34,32,1),(35,33,1),(36,34,1),(37,35,1),(38,36,1),(39,37,1);
/*!40000 ALTER TABLE `managementcourseapp_lesson_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_like`
--

DROP TABLE IF EXISTS `managementcourseapp_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `lesson_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ManagementCourseApp_like_user_id_lesson_id_cbd5c03f_uniq` (`user_id`,`lesson_id`),
  KEY `ManagementCourseApp__lesson_id_1d1ebf64_fk_Managemen` (`lesson_id`),
  CONSTRAINT `ManagementCourseApp__lesson_id_1d1ebf64_fk_Managemen` FOREIGN KEY (`lesson_id`) REFERENCES `managementcourseapp_lesson` (`id`),
  CONSTRAINT `ManagementCourseApp__user_id_aff4f195_fk_Managemen` FOREIGN KEY (`user_id`) REFERENCES `managementcourseapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_like`
--

LOCK TABLES `managementcourseapp_like` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `managementcourseapp_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_rating`
--

DROP TABLE IF EXISTS `managementcourseapp_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `rate` smallint NOT NULL,
  `lesson_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ManagementCourseApp__lesson_id_bf38af83_fk_Managemen` (`lesson_id`),
  KEY `ManagementCourseApp__user_id_70468b5c_fk_Managemen` (`user_id`),
  CONSTRAINT `ManagementCourseApp__lesson_id_bf38af83_fk_Managemen` FOREIGN KEY (`lesson_id`) REFERENCES `managementcourseapp_lesson` (`id`),
  CONSTRAINT `ManagementCourseApp__user_id_70468b5c_fk_Managemen` FOREIGN KEY (`user_id`) REFERENCES `managementcourseapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_rating`
--

LOCK TABLES `managementcourseapp_rating` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `managementcourseapp_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_tag`
--

DROP TABLE IF EXISTS `managementcourseapp_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_tag`
--

LOCK TABLES `managementcourseapp_tag` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_tag` DISABLE KEYS */;
INSERT INTO `managementcourseapp_tag` VALUES (1,'2024-03-21','2024-03-21',1,'Tag1'),(2,'2024-03-21','2024-03-21',1,'Tag2');
/*!40000 ALTER TABLE `managementcourseapp_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_user`
--

DROP TABLE IF EXISTS `managementcourseapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_user`
--

LOCK TABLES `managementcourseapp_user` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_user` DISABLE KEYS */;
INSERT INTO `managementcourseapp_user` VALUES (1,'pbkdf2_sha256$720000$qnyQBiVS3TxmAjy1qTWu99$0zQ8xRLCFlA22mDR7NeZPCW/6MPqVPxnjxEvEOC+EyQ=','2024-04-05 03:46:42.172853',1,'admin','admin','admin','lth.nhu2670@gmail.com',1,1,'2024-03-21 02:39:05.892964',NULL,'admin',NULL,NULL),(3,'1',NULL,1,'nhu','Huỳnh','Như','huynhnhu2670@gmail.com',0,1,'2024-03-21 02:48:02.060871','image/upload/https://res.cloudinary.com/dhdca9ibd/image/upload/v1711334976/courseapp/lgdkxuktbuj76pjzmntm.jpg','admin',NULL,NULL),(4,'pbkdf2_sha256$720000$bIvqfkiw75RctXVfKnjGbj$8qVA9KClgNTVReSbp2jfQBTrS/0uL1kmkZ0BgPGELp8=',NULL,0,'user1','Huỳnh','Như','lth.nhu2670@gmail.com',0,1,'2024-03-21 02:48:15.604708',NULL,'user',NULL,NULL),(5,'pbkdf2_sha256$720000$3z5o1tODbcfuGlmF4QYPZH$0KQH1JF3UCS7AXb9ORvEIxFzv9iJ5+YOP79TtDTf8rg=',NULL,0,'user2','Huỳnh','Như','lth.nhu2670@gmail.com',0,1,'2024-03-21 02:48:20.478191',NULL,'user',NULL,NULL),(6,'pbkdf2_sha256$720000$3AWWluUgtZMzbCMx9EulYM$lJS0WRkovGkmniInfCs9LQ2Lps8hnKEEZW5mnN9aRFc=',NULL,0,'user3','Huỳnh','Như','',0,1,'2024-03-21 02:48:24.704830',NULL,'user',NULL,NULL),(8,'pbkdf2_sha256$720000$Z0HmZhwRwZLX70JvoBf3lB$iyfrNgAYLF1MeT+cXqFpLDjKPqt/n+rHwH/QsswYwug=','2024-03-21 03:08:39.612668',1,'Admin','Admin','Admin','a@gmail.com',1,1,'2024-03-21 03:02:08.031293',NULL,NULL,NULL,NULL),(9,'pbkdf2_sha256$720000$D4BbP6SPU3VVt9f3lfOPnF$sxAVU5CTPXzhmWzQtB/eqLCc3/P9WIab9uNw2xF6JV8=',NULL,0,'User8','Lê','Như','',0,1,'2024-03-31 15:14:18.299514',NULL,'student',NULL,NULL),(10,'pbkdf2_sha256$720000$AgUfkrsxjwHRwuQaix1B8A$UOi0UJn5V6gkbIrrSBd2t/JoD2yLRCJpUEFAuHs+9Rs=',NULL,0,'User9','Lê','Như','',0,1,'2024-03-31 15:19:22.952621',NULL,'student',NULL,NULL),(11,'pbkdf2_sha256$720000$D6gPy4rcWrYu85QGxRPmGk$Fjf7uiD3Z2d9dEpqmJpygUaRMTbH5APy9GFp4HNRLZk=',NULL,0,'Tuan123','Tuan','Dang','',0,1,'2024-04-04 09:13:19.317708',NULL,'student',NULL,NULL),(12,'pbkdf2_sha256$720000$u1nUY9rD8GIiyi45hhOSmx$aJDyNs3wdZAcDxDtPMVMbkkP0lDE8ReBdyt5S4veIbE=',NULL,0,'thai','Thai','Truong','',0,1,'2024-04-04 09:20:19.865340',NULL,'student',NULL,NULL),(13,'pbkdf2_sha256$720000$RqkzWCEnSYgxTjXowNDHj9$KzhBDnSJV6NZjGtOj1FHE9YiMygw2pIsQAxuf8GeXnQ=',NULL,0,'ngoha','Ngộ','Ha','lth.nhu2670@gmail.com',0,1,'2024-04-04 10:15:19.153883',NULL,'student',NULL,NULL),(14,'pbkdf2_sha256$720000$uVsSiqHAhyWyexwKKoCbwy$erBhBmqRKnHwwkh0E6x4bcJWxgracQ1O1g1u5L8hCZk=',NULL,0,'lenhu','Lê','Như','nhu01649500099@gmail.com',0,1,'2024-04-04 14:03:13.046208',NULL,'student',NULL,NULL),(15,'pbkdf2_sha256$720000$V1m11x2nPXILR7c3dOCeaW$K++LNQsBwZEuK/7SbOB66apJjX+eVZ13/sFU6oo6bCU=',NULL,0,'test','test','test','test@gmail.com',0,1,'2024-04-05 10:14:38.147921',NULL,'student',NULL,NULL);
/*!40000 ALTER TABLE `managementcourseapp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_user_groups`
--

DROP TABLE IF EXISTS `managementcourseapp_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ManagementCourseApp_user_groups_user_id_group_id_dfe7ffb2_uniq` (`user_id`,`group_id`),
  KEY `ManagementCourseApp__group_id_de68008d_fk_auth_grou` (`group_id`),
  CONSTRAINT `ManagementCourseApp__group_id_de68008d_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `ManagementCourseApp__user_id_15711006_fk_Managemen` FOREIGN KEY (`user_id`) REFERENCES `managementcourseapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_user_groups`
--

LOCK TABLES `managementcourseapp_user_groups` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `managementcourseapp_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementcourseapp_user_user_permissions`
--

DROP TABLE IF EXISTS `managementcourseapp_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managementcourseapp_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ManagementCourseApp_user_user_id_permission_id_5c08c5a8_uniq` (`user_id`,`permission_id`),
  KEY `ManagementCourseApp__permission_id_a8220081_fk_auth_perm` (`permission_id`),
  CONSTRAINT `ManagementCourseApp__permission_id_a8220081_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `ManagementCourseApp__user_id_1945731b_fk_Managemen` FOREIGN KEY (`user_id`) REFERENCES `managementcourseapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementcourseapp_user_user_permissions`
--

LOCK TABLES `managementcourseapp_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `managementcourseapp_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `managementcourseapp_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_acce_user_id_6e4c9a65_fk_Managemen` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_user_id_6e4c9a65_fk_Managemen` FOREIGN KEY (`user_id`) REFERENCES `managementcourseapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'unLc0A39Ya8cj2F7paMVrW9jnDiGaA','2024-03-21 13:06:26.663356','read write',1,1,'2024-03-21 03:06:26.664863','2024-03-21 03:06:26.664863',NULL,NULL),(2,'nMZ21A9Bd6sx1R6iTljl8fzOyHetHN','2024-03-21 13:07:59.954782','read write',1,8,'2024-03-21 03:07:59.954782','2024-03-21 03:07:59.954782',NULL,NULL),(3,'gA3s9LDjiLIbDjFZutOY1hMMet5AhY','2024-03-22 13:39:52.047888','read write',1,1,'2024-03-22 03:39:52.049840','2024-03-22 03:39:52.049840',NULL,NULL),(4,'kNzxH4SaIYv5AfI1fjUglzZj4wmRPA','2024-03-25 13:17:54.667468','read write',1,3,'2024-03-25 03:17:54.675904','2024-03-25 03:17:54.675904',NULL,NULL),(5,'o2LQ0B4mbtoGfdVw9KAcU7uTD9K7EE','2024-03-25 13:21:05.380788','read write',1,3,'2024-03-25 03:21:05.380788','2024-03-25 03:21:05.380788',NULL,NULL),(6,'Dpo0vVy08qLfW9JZBaOYqBcjUwWj3P','2024-03-25 13:47:06.868147','read write',1,1,'2024-03-25 03:47:06.868147','2024-03-25 03:47:06.868147',NULL,NULL),(7,'k80QrnVqox9OtQ3i6eQj441w2rg2ts','2024-03-25 14:08:58.622910','read write',1,1,'2024-03-25 04:08:58.622910','2024-03-25 04:08:58.622910',NULL,NULL),(8,'9dk0CSA0gV1qumdM8utaI330bsvHZc','2024-03-25 14:15:13.290348','read write',1,1,'2024-03-25 04:15:13.290348','2024-03-25 04:15:13.290348',NULL,NULL),(9,'zl6Rchub4zq5DQUL1Bh9YQedXz2pBn','2024-03-25 14:16:04.188945','read write',1,1,'2024-03-25 04:16:04.188945','2024-03-25 04:16:04.188945',NULL,NULL),(10,'rB1t9xFI76qUmCyEplnwIcqRaqIXdq','2024-03-26 01:10:35.488027','read write',1,1,'2024-03-25 15:10:35.495389','2024-03-25 15:10:35.495389',NULL,NULL),(11,'EBw1Unxyunxn3GyAHpycX0BbrhoHCg','2024-03-26 01:40:16.568527','read write',1,3,'2024-03-25 15:40:16.572479','2024-03-25 15:40:16.572479',NULL,NULL),(12,'Xdrk9y9DNPJTx6lLv8sCZIQw2VabdH','2024-03-26 12:37:01.157870','read write',1,3,'2024-03-26 02:37:01.158938','2024-03-26 02:37:01.158938',NULL,NULL),(13,'fi68gaHFClHsslZ6xWg57EPRZTQpw6','2024-03-26 13:00:34.337771','read write',1,3,'2024-03-26 03:00:34.337771','2024-03-26 03:00:34.337771',NULL,NULL),(14,'8MUrEAZs2zt7cUUqdJLvVIpasWdWNJ','2024-03-26 14:07:26.718988','read write',1,3,'2024-03-26 04:07:26.724164','2024-03-26 04:07:26.724164',NULL,NULL),(15,'WhHJXPtbrwZuWvoUsjbdedEygmJGsT','2024-03-26 14:16:22.270530','read write',1,3,'2024-03-26 04:16:22.270530','2024-03-26 04:16:22.270530',NULL,NULL),(16,'q1dGHKZx0RqHZIV0Ss4UwGGFLWEJsr','2024-03-26 14:17:51.836023','read write',1,3,'2024-03-26 04:17:51.836023','2024-03-26 04:17:51.836023',NULL,NULL),(17,'GWOYpo6y2Nyr6KBHHmOsWb1Ik0Nejh','2024-03-26 14:22:59.303994','read write',1,3,'2024-03-26 04:22:59.303994','2024-03-26 04:22:59.303994',NULL,NULL),(18,'XVO1yyB8HrWQJ7nCcrtwqmJYNAGtE0','2024-03-26 14:24:03.831004','read write',1,3,'2024-03-26 04:24:03.831004','2024-03-26 04:24:03.831004',NULL,NULL),(19,'E1kFZ8bVMwfRSDZ3Vu9ZvAAje6kA7r','2024-03-26 14:40:09.653587','read write',1,3,'2024-03-26 04:40:09.653587','2024-03-26 04:40:09.653587',NULL,NULL),(20,'42IcAKDodJ1VL5mAllPlFAToqUHAdO','2024-03-26 19:30:50.937619','read write',1,3,'2024-03-26 09:30:50.937619','2024-03-26 09:30:50.937619',NULL,NULL),(21,'uo7CF21UVJ9KFvqK0zqV9dO8PUrqiG','2024-03-26 20:02:33.405133','read write',1,3,'2024-03-26 10:02:33.405133','2024-03-26 10:02:33.405133',NULL,NULL),(22,'vnisMvehZQ2pfXO754Be2D4OOw2hgQ','2024-03-28 01:11:20.515725','read write',1,3,'2024-03-27 15:11:20.525073','2024-03-27 15:11:20.525073',NULL,NULL),(23,'BRh6YTOVMfARkeDCzssadGCNAmticW','2024-03-31 13:20:42.608198','read write',1,3,'2024-03-31 03:20:42.608198','2024-03-31 03:20:42.608198',NULL,NULL),(24,'fxuJUd1VBbRB4QOp4ZSQsek76BcmDp','2024-03-31 13:28:04.645358','read write',1,3,'2024-03-31 03:28:04.645358','2024-03-31 03:28:04.645358',NULL,NULL),(25,'7Y2ak9QLYub0x5P5UBvbkc05gq60Qa','2024-03-31 13:30:56.738090','read write',1,3,'2024-03-31 03:30:56.738594','2024-03-31 03:30:56.738594',NULL,NULL),(26,'1EaI3dxUBmz0jCaNeEeprktCKwLiBc','2024-03-31 13:31:24.731020','read write',1,3,'2024-03-31 03:31:24.731020','2024-03-31 03:31:24.731020',NULL,NULL),(27,'aMSNdSnuuDgLyLhi4IXZaeKqguV00Q','2024-03-31 13:39:14.250863','read write',1,3,'2024-03-31 03:39:14.253276','2024-03-31 03:39:14.253276',NULL,NULL),(28,'9Y5cTtFbKKhNiM3jniWFyfJf5UFuY2','2024-03-31 13:39:38.429374','read write',1,3,'2024-03-31 03:39:38.430454','2024-03-31 03:39:38.430454',NULL,NULL),(29,'HrUmoSbs4aKSWEE1BAN1jfoilFJc2E','2024-03-31 13:41:00.219105','read write',1,3,'2024-03-31 03:41:00.219105','2024-03-31 03:41:00.219105',NULL,NULL),(30,'y63mhSJ6GRKouIHEBCTSHjJoWvcaQF','2024-03-31 13:43:07.132058','read write',1,3,'2024-03-31 03:43:07.133128','2024-03-31 03:43:07.133128',NULL,NULL),(31,'CZKVDWznfu5tL93WxA8YnrqmlLoA9T','2024-03-31 13:44:03.834559','read write',1,3,'2024-03-31 03:44:03.834559','2024-03-31 03:44:03.834559',NULL,NULL),(32,'RGGSgWiI7g6fR5ZU5mQf8b1yGFVEfg','2024-03-31 13:44:13.730148','read write',1,3,'2024-03-31 03:44:13.730148','2024-03-31 03:44:13.730148',NULL,NULL),(33,'Yelh5IyaakMFZwOgEhtcvKgQ1SRL5y','2024-03-31 13:46:31.593573','read write',1,3,'2024-03-31 03:46:31.593573','2024-03-31 03:46:31.593573',NULL,NULL),(34,'rsDvRRFnkq9GcvB28xFTX9EBecuKpT','2024-03-31 14:53:03.404551','read write',1,3,'2024-03-31 04:53:03.405587','2024-03-31 04:53:03.405587',NULL,NULL),(35,'j4LSyXZAfVAdZ6goIq7yxY0oNCXr6f','2024-03-31 14:57:27.996944','read write',1,3,'2024-03-31 04:57:27.998002','2024-03-31 04:57:27.998002',NULL,NULL),(36,'tDr16l643lHETfwws07dE4lA4Y2TqE','2024-03-31 14:58:49.004890','read write',1,3,'2024-03-31 04:58:49.004890','2024-03-31 04:58:49.004890',NULL,NULL),(37,'N7WYTzUNUcjnsZNF62JXqOFHL4GKih','2024-03-31 15:02:54.056805','read write',1,3,'2024-03-31 05:02:54.057230','2024-03-31 05:02:54.057230',NULL,NULL),(38,'hqvYcv1gTQtYiPig05MCH7wfm5A87B','2024-03-31 15:04:58.959122','read write',1,3,'2024-03-31 05:04:58.960176','2024-03-31 05:04:58.960176',NULL,NULL),(39,'q5P3Argzhhl1Zvx7sEWBkBmTQRgNEk','2024-03-31 15:19:07.971626','read write',1,3,'2024-03-31 05:19:07.971626','2024-03-31 05:19:07.971626',NULL,NULL),(40,'sbomXnVk694IquZZzGy2jNyKqAIFxV','2024-03-31 15:19:36.964505','read write',1,3,'2024-03-31 05:19:36.964505','2024-03-31 05:19:36.964505',NULL,NULL),(41,'odNqaWtZcKdYTSfPP4CtC9e5MZHBJ5','2024-04-01 00:44:27.507245','read write',1,3,'2024-03-31 14:44:27.517317','2024-03-31 14:44:27.517317',NULL,NULL),(42,'5mEb1A7J8zPeZz6kHBGgbzJVk4KoOD','2024-04-01 00:45:03.066886','read write',1,3,'2024-03-31 14:45:03.066886','2024-03-31 14:45:03.066886',NULL,NULL),(43,'clKrin4q9uQpkiUVPYdzaZ2nXAAVhx','2024-04-01 00:51:08.737779','read write',1,3,'2024-03-31 14:51:08.737779','2024-03-31 14:51:08.737779',NULL,NULL),(44,'P7qesLo1Vhi0DqE7rUNvIBjht8Qaak','2024-04-01 00:53:19.383651','read write',1,3,'2024-03-31 14:53:19.383651','2024-03-31 14:53:19.383651',NULL,NULL),(45,'ljlAOiTo7ONtTtXgJBO7QObHnbzq4R','2024-04-01 01:19:39.927093','read write',1,10,'2024-03-31 15:19:39.927093','2024-03-31 15:19:39.927093',NULL,NULL),(46,'P1SVCjnUulR5WWqzlkjMz356Vh5Is7','2024-04-01 01:20:15.342745','read write',1,3,'2024-03-31 15:20:15.343740','2024-03-31 15:20:15.343740',NULL,NULL),(47,'jcSBebBFl1D0tcY0bZTLPgHyUcAmU5','2024-04-01 01:32:33.438999','read write',1,3,'2024-03-31 15:32:33.439990','2024-03-31 15:32:33.439990',NULL,NULL),(48,'A26zSRUynem50WKxrJL5U7J7CP6Qxh','2024-04-01 01:32:58.198344','read write',1,3,'2024-03-31 15:32:58.198344','2024-03-31 15:32:58.198344',NULL,NULL),(49,'asyowzVSXhO1nahXCDWi7Hr4790AXT','2024-04-01 01:46:47.257996','read write',1,3,'2024-03-31 15:46:47.258490','2024-03-31 15:46:47.258490',NULL,NULL),(50,'QhYDOrDRZhA1h3P7mjsMvAMXPfN3mh','2024-04-01 01:47:41.404525','read write',1,3,'2024-03-31 15:47:41.404525','2024-03-31 15:47:41.404525',NULL,NULL),(51,'SJNrl0jjMnsVOTqEWemjlbqJx7Nyb1','2024-04-01 01:50:10.721996','read write',1,3,'2024-03-31 15:50:10.723150','2024-03-31 15:50:10.723150',NULL,NULL),(52,'QUdjeUlfFNmjBYdu0YkeXeuRVaDeg0','2024-04-01 01:51:01.942202','read write',1,3,'2024-03-31 15:51:01.942202','2024-03-31 15:51:01.942202',NULL,NULL),(53,'ZUnisUZ8ZXCdaNs0sI3jXeo8mA6Qsf','2024-04-01 01:51:36.007243','read write',1,3,'2024-03-31 15:51:36.007243','2024-03-31 15:51:36.007243',NULL,NULL),(54,'rYIGNXed80egf0owOuDUr6uNKeaJeE','2024-04-01 01:54:20.732331','read write',1,3,'2024-03-31 15:54:20.732331','2024-03-31 15:54:20.732331',NULL,NULL),(55,'Nwu7jw1ABYMCg74MpAxpUK0XcxtBjp','2024-04-01 01:54:42.156656','read write',1,3,'2024-03-31 15:54:42.156656','2024-03-31 15:54:42.156656',NULL,NULL),(56,'wMhF9A9WExCbecqaved9cQMvcieExv','2024-04-01 02:10:11.454736','read write',1,3,'2024-03-31 16:10:11.454736','2024-03-31 16:10:11.454736',NULL,NULL),(57,'X0eJ4qP2mj6nPWJ3q7Wr0KtvXNydc2','2024-04-01 02:19:47.088625','read write',1,3,'2024-03-31 16:19:47.088625','2024-03-31 16:19:47.088625',NULL,NULL),(58,'mrrXZBRdEzI6qHSFfZuglo8ilRPRNp','2024-04-01 02:35:03.132131','read write',1,3,'2024-03-31 16:35:03.132131','2024-03-31 16:35:03.132131',NULL,NULL),(59,'hDUspwoErbxlm4x2pNCjIjI4dUZXNz','2024-04-03 13:12:46.805351','read write',1,3,'2024-04-03 03:12:46.809346','2024-04-03 03:12:46.809346',NULL,NULL),(60,'c2kVPKeKtZAJFzVZWLcNPVY07rh7NJ','2024-04-03 13:24:00.218603','read write',1,1,'2024-04-03 03:24:00.220605','2024-04-03 03:24:00.220605',NULL,NULL),(61,'Dhv1ZR5y76bv9ZjtOUpiMlZrbJGsYH','2024-04-03 13:47:33.490251','read write',1,3,'2024-04-03 03:47:33.492299','2024-04-03 03:47:33.492299',NULL,NULL),(62,'fJIBlqdUq2Ju9XCOUUI690jb0QCyRP','2024-04-03 13:53:17.459622','read write',1,3,'2024-04-03 03:53:17.459622','2024-04-03 03:53:17.459622',NULL,NULL),(63,'TFykeGHOFUCymPt9QWVeQKsMIPDbof','2024-04-03 13:56:33.966398','read write',1,3,'2024-04-03 03:56:33.966398','2024-04-03 03:56:33.966398',NULL,NULL),(64,'LWjPkO4JBNiXvb7Ii3nb0j8TdR3DJd','2024-04-03 13:56:57.727905','read write',1,3,'2024-04-03 03:56:57.727905','2024-04-03 03:56:57.727905',NULL,NULL),(65,'vmCZ84w9Cv01n4UajNlXrWtBBwQAx8','2024-04-03 14:01:51.052412','read write',1,3,'2024-04-03 04:01:51.052412','2024-04-03 04:01:51.052412',NULL,NULL),(66,'6BY314wyrHGo7gqvV59bEo9IbwBCGk','2024-04-03 14:08:37.458010','read write',1,3,'2024-04-03 04:08:37.459944','2024-04-03 04:08:37.459944',NULL,NULL),(67,'ErTfHM0ycPqDt3h04izpdGlImSpt79','2024-04-03 14:29:12.059340','read write',1,3,'2024-04-03 04:29:12.059340','2024-04-03 04:29:12.059340',NULL,NULL),(68,'jttzFsInugzb7gOpeFH6BdxCLtW8ku','2024-04-03 14:42:27.340102','read write',1,3,'2024-04-03 04:42:27.340102','2024-04-03 04:42:27.340102',NULL,NULL),(69,'L3KpxiPVrwqgPH3eYj4r7YsHglY6hn','2024-04-03 14:45:41.075267','read write',1,3,'2024-04-03 04:45:41.075267','2024-04-03 04:45:41.075267',NULL,NULL),(70,'kWIzDt5BKJx9ymzOPuMfWKrtEOHEYN','2024-04-03 14:54:27.697179','read write',1,3,'2024-04-03 04:54:27.700168','2024-04-03 04:54:27.700168',NULL,NULL),(71,'7wUF9KNh54fqfKHQJ9dyIGpC7mTthr','2024-04-04 01:06:07.486909','read write',1,3,'2024-04-03 15:06:07.486909','2024-04-03 15:06:07.486909',NULL,NULL),(72,'gAkO8eaTyUbapEtMnIQXlDKgBuoVFL','2024-04-04 01:31:59.442981','read write',1,3,'2024-04-03 15:31:59.442981','2024-04-03 15:31:59.442981',NULL,NULL),(73,'NMZdF7fkaSMufmiMju5J0Kvg68blNJ','2024-04-04 01:34:17.906227','read write',1,3,'2024-04-03 15:34:17.906227','2024-04-03 15:34:17.906227',NULL,NULL),(74,'VjcN3WLMv9154cOiYVBxDNlFsT6cSb','2024-04-04 15:21:28.111797','read write',1,1,'2024-04-04 05:21:28.111797','2024-04-04 05:21:28.111797',NULL,NULL),(75,'YpqykYB4XLe2vaIN6wtOuODb9W5G0C','2024-04-04 15:26:59.398804','read write',1,1,'2024-04-04 05:26:59.398804','2024-04-04 05:26:59.398804',NULL,NULL),(76,'sPyPt5xXPHgeqPWQL2CN4Ggpu85602','2024-04-04 16:18:57.581694','read write',1,1,'2024-04-04 06:18:57.582691','2024-04-04 06:18:57.582691',NULL,NULL),(77,'1OIO7b6WQv5hvoSPNe3zNBb0oOhsux','2024-04-04 16:27:18.505849','read write',1,1,'2024-04-04 06:27:18.505849','2024-04-04 06:27:18.505849',NULL,NULL),(78,'RTU71fJSlkMFLkpGZ7lQeKyetWCTw9','2024-04-04 17:37:16.349680','read write',1,1,'2024-04-04 07:37:16.358172','2024-04-04 07:37:16.358172',NULL,NULL),(79,'OjxRXpnVqm4JzLz6lnE2I30m7M7Dlf','2024-04-04 17:49:33.074748','read write',1,1,'2024-04-04 07:49:33.075742','2024-04-04 07:49:33.075742',NULL,NULL),(80,'biX0L7j3vk5Yd3PuAbx19okBJa8Wlk','2024-04-04 17:50:15.012267','read write',1,1,'2024-04-04 07:50:15.013264','2024-04-04 07:50:15.013264',NULL,NULL),(81,'LomPgvYhLMN06tKUQNq5acsJ1T7eKB','2024-04-04 17:51:20.229093','read write',1,1,'2024-04-04 07:51:20.230077','2024-04-04 07:51:20.230077',NULL,NULL),(82,'9jlLXnYu5Pr4Ynqyq80qo1mVAytZJs','2024-04-04 18:05:45.277745','read write',1,1,'2024-04-04 08:05:45.277745','2024-04-04 08:05:45.277745',NULL,NULL),(83,'LAz1wHnK00s1CRMm9EkEEngmvqWsOu','2024-04-04 18:06:54.776487','read write',1,1,'2024-04-04 08:06:54.776487','2024-04-04 08:06:54.776487',NULL,NULL),(84,'7qNI7es0HgQcSXSRUszdZlXBMAzzZ8','2024-04-04 18:07:30.660373','read write',1,1,'2024-04-04 08:07:30.660373','2024-04-04 08:07:30.661380',NULL,NULL),(85,'lFLJCnB0sACb8qtmtMy06T78eEZwm3','2024-04-04 18:07:57.171065','read write',1,1,'2024-04-04 08:07:57.171065','2024-04-04 08:07:57.171065',NULL,NULL),(86,'mYuC1kElchhBhQ3Y0TPYhYYmWjkJWL','2024-04-04 18:20:22.116674','read write',1,1,'2024-04-04 08:20:22.117658','2024-04-04 08:20:22.117658',NULL,NULL),(87,'1OPr0iHZTEfWNSaSmbmBVKgFCQfT5m','2024-04-04 18:38:42.943490','read write',1,1,'2024-04-04 08:38:42.944486','2024-04-04 08:38:42.944486',NULL,NULL),(88,'BNOi5rdU436Y81XabeDX357srgRlXR','2024-04-04 18:49:12.482214','read write',1,1,'2024-04-04 08:49:12.483271','2024-04-04 08:49:12.483271',NULL,NULL),(89,'n2F1r94O4YiEEasEaZRGYkLVIsj0VJ','2024-04-04 18:52:13.299958','read write',1,1,'2024-04-04 08:52:13.300955','2024-04-04 08:52:13.300955',NULL,NULL),(90,'ZL3pu1Z6elZA1cnPwRMV6shTxWzEnE','2024-04-04 19:13:35.429672','read write',1,11,'2024-04-04 09:13:35.430693','2024-04-04 09:13:35.430693',NULL,NULL),(91,'hAKIQDAJnlHpPAl0r7A3vFItXqBPEt','2024-04-04 19:17:06.543105','read write',1,11,'2024-04-04 09:17:06.544105','2024-04-04 09:17:06.544105',NULL,NULL),(92,'omIrbKKsHXwhdOgPfgDWspOXoqVXGm','2024-04-04 19:20:33.296438','read write',1,12,'2024-04-04 09:20:33.297438','2024-04-04 09:20:33.297438',NULL,NULL),(93,'l3PVz0L74ObG7FZJ5QlxFoyIl97m1C','2024-04-04 19:32:40.354647','read write',1,11,'2024-04-04 09:32:40.358851','2024-04-04 09:32:40.358851',NULL,NULL),(94,'fEvzPGkoqvyN60GVdv8E8SABO1z0eP','2024-04-04 19:34:05.329326','read write',1,12,'2024-04-04 09:34:05.329824','2024-04-04 09:34:05.330833',NULL,NULL),(95,'pksKrufmz6kplakJ7lUl9879a8oT4w','2024-04-04 19:46:25.905556','read write',1,1,'2024-04-04 09:46:25.906552','2024-04-04 09:46:25.906552',NULL,NULL),(96,'srHhiSFOvfd20bfJFNOOWILKsE0Yb2','2024-04-04 19:46:53.593671','read write',1,11,'2024-04-04 09:46:53.595135','2024-04-04 09:46:53.595135',NULL,NULL),(97,'uPZv5q4nmqoq3ZWmXwoIavrlG964nt','2024-04-04 19:46:58.604471','read write',1,1,'2024-04-04 09:46:58.605694','2024-04-04 09:46:58.605694',NULL,NULL),(98,'2Joge9CFSqymTkG9py9Aj5pVE1BzKk','2024-04-04 19:48:06.718731','read write',1,1,'2024-04-04 09:48:06.718731','2024-04-04 09:48:06.718731',NULL,NULL),(99,'x9QL8Uq8A9tMEsDskxDcOmJV6WxRRp','2024-04-04 19:50:41.289369','read write',1,1,'2024-04-04 09:50:41.290386','2024-04-04 09:50:41.290386',NULL,NULL),(100,'GR7tbly9hqZCCeHRqYvkTtMS56foxd','2024-04-04 19:51:32.083268','read write',1,8,'2024-04-04 09:51:32.084558','2024-04-04 09:51:32.084558',NULL,NULL),(101,'ag76Niv5QaZCOUvUvB8L9s7Rl05ScY','2024-04-04 19:51:41.687841','read write',1,11,'2024-04-04 09:51:41.688840','2024-04-04 09:51:41.688840',NULL,NULL),(102,'8Iyzb0JFVI8biRKsiRtSkqNJKRYerF','2024-04-04 19:52:09.102681','read write',1,1,'2024-04-04 09:52:09.105409','2024-04-04 09:52:09.105409',NULL,NULL),(103,'g3UwUkmPYf7MRenHbg64kUIJvJc6P0','2024-04-04 19:55:26.511616','read write',1,8,'2024-04-04 09:55:26.511616','2024-04-04 09:55:26.511616',NULL,NULL),(104,'BqeVLoysS4cCzop4nHfyeI75jhVUgf','2024-04-04 19:55:41.935923','read write',1,8,'2024-04-04 09:55:41.940473','2024-04-04 09:55:41.940473',NULL,NULL),(105,'wwKmIK8hdqrHn4ffAOTrkHsHxjSw6V','2024-04-04 19:55:49.545161','read write',1,1,'2024-04-04 09:55:49.545658','2024-04-04 09:55:49.545658',NULL,NULL),(106,'x3YZeXVjZzHleE4fVFw57CfxuZVABb','2024-04-04 19:56:00.232498','read write',1,11,'2024-04-04 09:56:00.233577','2024-04-04 09:56:00.233577',NULL,NULL),(107,'jQu9F7VmWEzm6lP86crnNkhJmdVoBs','2024-04-04 19:58:32.094658','read write',1,1,'2024-04-04 09:58:32.094658','2024-04-04 09:58:32.095647',NULL,NULL),(108,'69Hb5aXNBl1FZSQYq1VrYHVSO2wR5R','2024-04-04 19:58:45.213295','read write',1,8,'2024-04-04 09:58:45.213295','2024-04-04 09:58:45.213295',NULL,NULL),(109,'ep3KT3BDuMw1wqmse5JdW1FkSQn47X','2024-04-04 19:58:59.013303','read write',1,8,'2024-04-04 09:58:59.014325','2024-04-04 09:58:59.014325',NULL,NULL),(110,'LNC3umsP7X7w4yW7Cdqnf8oJkTggJf','2024-04-04 19:59:08.084782','read write',1,1,'2024-04-04 09:59:08.085778','2024-04-04 09:59:08.085778',NULL,NULL),(111,'KVpdTK05zJaDIl4pfpUErSoIhjOLwX','2024-04-04 20:00:03.779403','read write',1,1,'2024-04-04 10:00:03.780485','2024-04-04 10:00:03.780485',NULL,NULL),(112,'zrjHnYw0Q15gEoCvgOQ2P49uiWwTq5','2024-04-04 20:00:06.216683','read write',1,8,'2024-04-04 10:00:06.216683','2024-04-04 10:00:06.216683',NULL,NULL),(113,'GOX3VxrOH971P7npjo3ihHkwyJXsT9','2024-04-04 20:00:54.188839','read write',1,1,'2024-04-04 10:00:54.191826','2024-04-04 10:00:54.191826',NULL,NULL),(114,'mRq4Y27kO7ZylNc9dSsaFwKRWE9P36','2024-04-04 20:02:04.347555','read write',1,11,'2024-04-04 10:02:04.348537','2024-04-04 10:02:04.348537',NULL,NULL),(115,'WVjIXK0UF0uV0BWVU4TotTD09JJa7d','2024-04-04 20:03:13.973442','read write',1,8,'2024-04-04 10:03:13.974442','2024-04-04 10:03:13.974442',NULL,NULL),(116,'zAPNNkyWHSfZ2C7QIbNOhZfFPanPN7','2024-04-04 20:06:27.688912','read write',1,8,'2024-04-04 10:06:27.688912','2024-04-04 10:06:27.688912',NULL,NULL),(117,'bVOIFp3JqnSAHHhxA8lVaH903epvvk','2024-04-04 20:15:30.927878','read write',1,13,'2024-04-04 10:15:30.929127','2024-04-04 10:15:30.929127',NULL,NULL),(118,'yp73uYjQMf7tMT2BZzZDdkXlFumskj','2024-04-04 20:16:05.538132','read write',1,13,'2024-04-04 10:16:05.538132','2024-04-04 10:16:05.538132',NULL,NULL),(119,'T3VBmlB2B3PFzCvYYVY0N5AJbIL0qi','2024-04-04 23:40:04.034336','read write',1,1,'2024-04-04 13:40:04.034336','2024-04-04 13:40:04.034336',NULL,NULL),(120,'ZijG2qAfqda4AqTvACw1bUhJaqnCwR','2024-04-04 23:43:02.388521','read write',1,1,'2024-04-04 13:43:02.389524','2024-04-04 13:43:02.389524',NULL,NULL),(121,'GTxbUpc2ngSXhOFYlMvDYcJhkLhN2F','2024-04-05 00:03:41.178331','read write',1,14,'2024-04-04 14:03:41.178331','2024-04-04 14:03:41.179304',NULL,NULL),(122,'K4cseuxnbCqrYNXGiq7q7roUaoN8kW','2024-04-05 00:27:41.704217','read write',1,14,'2024-04-04 14:27:41.707005','2024-04-04 14:27:41.707005',NULL,NULL),(123,'EqXNYOB2Li6hcr2vuqLcmeZqPltjVa','2024-04-05 00:29:58.167321','read write',1,14,'2024-04-04 14:29:58.168301','2024-04-04 14:29:58.168301',NULL,NULL),(124,'rQHHou6GLLdW2bwOeRujvb6w6qGmPc','2024-04-05 00:35:43.759649','read write',1,14,'2024-04-04 14:35:43.760632','2024-04-04 14:35:43.760632',NULL,NULL),(125,'OW4a6jHOFvqhG7NkAHrv0po82Lz2gE','2024-04-05 00:44:54.891130','read write',1,1,'2024-04-04 14:44:54.892127','2024-04-04 14:44:54.892127',NULL,NULL),(126,'XdfE1C3d5KVMfRXcCO1hXB1dlduVvj','2024-04-05 00:45:08.118522','read write',1,14,'2024-04-04 14:45:08.118522','2024-04-04 14:45:08.118522',NULL,NULL),(127,'Uw6a2NWV3vGNpEZn2OWkGovHlf8MUo','2024-04-05 00:48:33.622731','read write',1,14,'2024-04-04 14:48:33.622731','2024-04-04 14:48:33.622731',NULL,NULL),(128,'3nQVV8Gtd0wiLbB2aftsJ4XdpCayu7','2024-04-05 00:53:26.591647','read write',1,14,'2024-04-04 14:53:26.592645','2024-04-04 14:53:26.592645',NULL,NULL),(129,'mwrXXVSoU1x0pyEcDmfE8Z2ecOAGAh','2024-04-05 01:03:51.107397','read write',1,14,'2024-04-04 15:03:51.107397','2024-04-04 15:03:51.107397',NULL,NULL),(130,'EjK8LFbOIMSWfRnsHLTqulC2wjpd8z','2024-04-05 01:12:32.286742','read write',1,14,'2024-04-04 15:12:32.286742','2024-04-04 15:12:32.286742',NULL,NULL),(131,'i5HenrlkBf7u8HoT3rYz5DEIiUACSl','2024-04-05 01:13:00.480282','read write',1,14,'2024-04-04 15:13:00.480282','2024-04-04 15:13:00.480282',NULL,NULL),(132,'Xr4k6yG09Y5KYyfJQHfAj6VOtzQcsi','2024-04-05 01:15:09.498280','read write',1,14,'2024-04-04 15:15:09.498280','2024-04-04 15:15:09.498280',NULL,NULL),(133,'cWYGdSuz5MSgfSdmICxjlb79I2l1Ht','2024-04-05 01:20:26.547778','read write',1,14,'2024-04-04 15:20:26.547778','2024-04-04 15:20:26.547778',NULL,NULL),(134,'oGkvIDrhQtSYtqxQ85dXcJpJiQziqQ','2024-04-05 01:24:33.124133','read write',1,14,'2024-04-04 15:24:33.124133','2024-04-04 15:24:33.124133',NULL,NULL),(135,'oOeO0AHrfl4gqNBikTB7LMPzr4mg7Q','2024-04-05 01:26:03.388641','read write',1,14,'2024-04-04 15:26:03.388641','2024-04-04 15:26:03.388641',NULL,NULL),(136,'Mz6AtygmVuMZfTGfTYoFEONqs4xxlw','2024-04-05 13:54:48.123617','read write',1,11,'2024-04-05 03:54:48.123617','2024-04-05 03:54:48.123617',NULL,NULL),(137,'aKKD5q1ULh6RySlXCw0JAPHHZxreAQ','2024-04-05 14:18:18.857838','read write',1,11,'2024-04-05 04:18:18.857838','2024-04-05 04:18:18.857838',NULL,NULL),(138,'VGitiETJoCdiubfIEBfoxhPWiJSaoN','2024-04-05 14:56:44.805363','read write',1,11,'2024-04-05 04:56:44.805363','2024-04-05 04:56:44.805363',NULL,NULL),(139,'bE309vXhRwpyMMHe7eVQRE3LxoV5jy','2024-04-05 17:20:52.394774','read write',1,11,'2024-04-05 07:20:52.394774','2024-04-05 07:20:52.394774',NULL,NULL),(140,'tJgGrQz2NgXgcgduupGiTJTOpLrBJ6','2024-04-05 17:59:03.995647','read write',1,11,'2024-04-05 07:59:03.995647','2024-04-05 07:59:03.995647',NULL,NULL),(141,'BmZkROLV0d7tndUZw9d5PAF8nQRvPK','2024-04-05 18:06:17.863367','read write',1,11,'2024-04-05 08:06:17.863367','2024-04-05 08:06:17.863367',NULL,NULL),(142,'hvqiaW4JaRkli3NlYTsHEAE9tgXozv','2024-04-05 18:13:10.975267','read write',1,11,'2024-04-05 08:13:10.975267','2024-04-05 08:13:10.975267',NULL,NULL),(143,'qwHCVvl7behZl0kZd33BujKMcoLTlT','2024-04-05 18:17:13.189829','read write',1,11,'2024-04-05 08:17:13.190828','2024-04-05 08:17:13.190828',NULL,NULL),(144,'Nv8JqHuflzIw5d45GTDoJTJJ8muqeF','2024-04-05 18:21:33.104122','read write',1,11,'2024-04-05 08:21:33.104122','2024-04-05 08:21:33.104122',NULL,NULL),(145,'hfwH4JMkcGFlxMquIUfafIqhRVCSF5','2024-04-05 18:25:43.056462','read write',1,11,'2024-04-05 08:25:43.056462','2024-04-05 08:25:43.056462',NULL,NULL),(146,'7XM6XNT231ANkRhMsPxJZYz37Y2qpX','2024-04-05 18:27:01.291894','read write',1,11,'2024-04-05 08:27:01.291894','2024-04-05 08:27:01.291894',NULL,NULL),(147,'nPA9SCgwozP5ld4VzfNNAeOBoHEa6b','2024-04-05 18:34:19.219749','read write',1,11,'2024-04-05 08:34:19.220704','2024-04-05 08:34:19.220704',NULL,NULL),(148,'2JOVa74dCQ3PtWajhEWdAiCLFGOJPK','2024-04-05 18:42:52.535349','read write',1,11,'2024-04-05 08:42:52.536387','2024-04-05 08:42:52.536387',NULL,NULL),(149,'acbQyq7Qt6GaDhZ0c19NMiFLTKYMBo','2024-04-05 18:48:58.726713','read write',1,11,'2024-04-05 08:48:58.726713','2024-04-05 08:48:58.726713',NULL,NULL),(150,'pSyo1O1QBegSkql2YnBzvM38mYeRbS','2024-04-05 19:08:00.551052','read write',1,11,'2024-04-05 09:08:00.551052','2024-04-05 09:08:00.551052',NULL,NULL),(151,'CfWntBV6Ff43wO2DxUmCVebrDqdGzB','2024-04-05 19:11:21.823734','read write',1,11,'2024-04-05 09:11:21.823734','2024-04-05 09:11:21.823734',NULL,NULL),(152,'6IaHbluU3YXYKRiUsoBAVSLJIz4bAO','2024-04-05 19:50:41.782582','read write',1,11,'2024-04-05 09:50:41.782582','2024-04-05 09:50:41.782582',NULL,NULL),(153,'NBt6ZoUe6XbBXi6OErejz0fL8CaNA6','2024-04-05 20:10:47.363990','read write',1,11,'2024-04-05 10:10:47.363990','2024-04-05 10:10:47.363990',NULL,NULL),(154,'kYNNRNBLAZglpDhCXtT8yKzk8vGRGe','2024-04-05 20:13:40.635830','read write',1,11,'2024-04-05 10:13:40.635830','2024-04-05 10:13:40.635830',NULL,NULL),(155,'YPvrS3VYhj0xWgnptMuaTwjwpJEIaM','2024-04-05 20:14:54.528715','read write',1,15,'2024-04-05 10:14:54.528715','2024-04-05 10:14:54.528715',NULL,NULL),(156,'fkp63lk02ZJjRyXPI3YY0tNQfLV6qA','2024-04-05 20:17:25.204498','read write',1,15,'2024-04-05 10:17:25.204498','2024-04-05 10:17:25.204498',NULL,NULL),(157,'Kw4fM7Db4mmjM95QTrAeui7mEQc5Ll','2024-04-05 20:19:26.289892','read write',1,15,'2024-04-05 10:19:26.289892','2024-04-05 10:19:26.289892',NULL,NULL),(158,'FPBFxS1r7aPRJnhIvzsp06PiQcGWIT','2024-04-05 20:40:21.843349','read write',1,11,'2024-04-05 10:40:21.843349','2024-04-05 10:40:21.843349',NULL,NULL),(159,'bi16dftoCPLz582qt3W2jScw06MYZr','2024-04-06 01:00:45.454920','read write',1,11,'2024-04-05 15:00:45.454920','2024-04-05 15:00:45.454920',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `redirect_uris` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `client_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `authorization_grant_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `post_logout_redirect_uris` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_appl_user_id_79829054_fk_Managemen` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_appl_user_id_79829054_fk_Managemen` FOREIGN KEY (`user_id`) REFERENCES `managementcourseapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'1AiXXkVfi9qbUKx1DyOgZsctavNp41KtQ5cYyRR8','','confidential','password','pbkdf2_sha256$720000$FoYIYNKbJFt5O1CUNXxIZ9$PXUd/lsCrYUHEMm4mQU8mfrvxPWNe200cR4Sxz8EP2s=','Admin',8,0,'2024-03-21 03:05:57.545117','2024-03-21 03:05:57.545117','','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `code_challenge_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `nonce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `claims` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_gran_user_id_e8f62af8_fk_Managemen` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_gran_user_id_e8f62af8_fk_Managemen` FOREIGN KEY (`user_id`) REFERENCES `managementcourseapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idto_user_id_dd512b59_fk_Managemen` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idto_user_id_dd512b59_fk_Managemen` FOREIGN KEY (`user_id`) REFERENCES `managementcourseapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refr_user_id_da837fce_fk_Managemen` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refr_user_id_da837fce_fk_Managemen` FOREIGN KEY (`user_id`) REFERENCES `managementcourseapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'97ER8Ljnr0ke2xQipCakKoFoeTBYlD',1,1,1,'2024-03-21 03:06:26.719450','2024-03-21 03:06:26.719450',NULL),(2,'LOg7KNBtg5TTIV2lvhHkZeHynjCpGP',2,1,8,'2024-03-21 03:07:59.958839','2024-03-21 03:07:59.958839',NULL),(3,'XRB9VlQv6MWO4Ld3TCRll6HWBFFwth',3,1,1,'2024-03-22 03:39:52.069309','2024-03-22 03:39:52.069309',NULL),(4,'QP6aS0UHu7fkNckmb4LM0VruwDUiWu',4,1,3,'2024-03-25 03:17:54.695582','2024-03-25 03:17:54.695582',NULL),(5,'iPIjDIrVWf9IY9FR76TrXm8FUCxcDl',5,1,3,'2024-03-25 03:21:05.384770','2024-03-25 03:21:05.384770',NULL),(6,'hHV01tKF7TEjprCMy3hAUHI3O8y9wc',6,1,1,'2024-03-25 03:47:06.871874','2024-03-25 03:47:06.871874',NULL),(7,'TpIceEEHDptDGebmrHNSM1VHX7q0hO',7,1,1,'2024-03-25 04:08:58.639977','2024-03-25 04:08:58.639977',NULL),(8,'zaXzKcuh5kAulKS8n3iQc0mafljgYi',8,1,1,'2024-03-25 04:15:13.293607','2024-03-25 04:15:13.293607',NULL),(9,'1wZtUQkxs0VIfACWxG2AqCtfzPx4BO',9,1,1,'2024-03-25 04:16:04.190858','2024-03-25 04:16:04.190858',NULL),(10,'05niAKrXWkO9cR3eSmasyTZQunVclG',10,1,1,'2024-03-25 15:10:35.516159','2024-03-25 15:10:35.516159',NULL),(11,'I60xlSqCBjWPiCs7rUdQMfuoVI3nN2',11,1,3,'2024-03-25 15:40:16.576480','2024-03-25 15:40:16.576480',NULL),(12,'GU8Y4QBEc7e3IY2VAy03yo2SbcJPYz',12,1,3,'2024-03-26 02:37:01.181520','2024-03-26 02:37:01.181520',NULL),(13,'PPqBZOlZPYEATpcGWElfp58qisEyYp',13,1,3,'2024-03-26 03:00:34.340877','2024-03-26 03:00:34.340877',NULL),(14,'5U1i1CNzXwupob2FFx9U3NETIKfL4s',14,1,3,'2024-03-26 04:07:26.728679','2024-03-26 04:07:26.728679',NULL),(15,'CzWzYXxxUlMANzi6qqQBpLOGxZzjLX',15,1,3,'2024-03-26 04:16:22.272045','2024-03-26 04:16:22.272045',NULL),(16,'AawMNHLg9Po68R2WOAfiWbVAb3uSZp',16,1,3,'2024-03-26 04:17:51.836023','2024-03-26 04:17:51.836023',NULL),(17,'T61VJzjCiQwdEgUT71QWpbEJ6R2UcT',17,1,3,'2024-03-26 04:22:59.303994','2024-03-26 04:22:59.303994',NULL),(18,'rS33E7ohg4dISVvJExkES3xWNgsC88',18,1,3,'2024-03-26 04:24:03.834106','2024-03-26 04:24:03.834106',NULL),(19,'gCObEVfoMnMNRdh6N95glqFUGztCjn',19,1,3,'2024-03-26 04:40:09.655597','2024-03-26 04:40:09.655597',NULL),(20,'rkKuf0ZaEMsanqj5nEIWsrOkaQG9YI',20,1,3,'2024-03-26 09:30:50.969013','2024-03-26 09:30:50.969013',NULL),(21,'kW5vgZkABK8vvLnBDB5hNNkGpABsSa',21,1,3,'2024-03-26 10:02:33.405133','2024-03-26 10:02:33.405133',NULL),(22,'yWwr40xfSqtyd0nHnvHHIDsDO2HCBt',22,1,3,'2024-03-27 15:11:20.557325','2024-03-27 15:11:20.557325',NULL),(23,'aYceoobNKT41gbnKuIk6VcMT6KG0dY',23,1,3,'2024-03-31 03:20:42.623839','2024-03-31 03:20:42.623839',NULL),(24,'cy0A6Sz30bdS3c3OWA5HzFFtL4wxaz',24,1,3,'2024-03-31 03:28:04.648858','2024-03-31 03:28:04.648858',NULL),(25,'Usq9WtEOsB6gbmW1S0BbcUuOG4QAjy',25,1,3,'2024-03-31 03:30:56.741593','2024-03-31 03:30:56.741593',NULL),(26,'U2plpb2nQKVzUerNyB8Ex7lgE5KMae',26,1,3,'2024-03-31 03:31:24.734312','2024-03-31 03:31:24.734312',NULL),(27,'AfQEO0miXiZqTGhEvguSiGKGTf3FJ4',27,1,3,'2024-03-31 03:39:14.254189','2024-03-31 03:39:14.254189',NULL),(28,'6v5RM8ImplPlJl6Zo16PZ7egYldlnj',28,1,3,'2024-03-31 03:39:38.431692','2024-03-31 03:39:38.431692',NULL),(29,'xNMFHdfP7nrRHuG2Nlh1AxEwZ050C0',29,1,3,'2024-03-31 03:41:00.220295','2024-03-31 03:41:00.220295',NULL),(30,'EsaO5vUu1Mwu3XIORawG4rKJtKon6w',30,1,3,'2024-03-31 03:43:07.134214','2024-03-31 03:43:07.134214',NULL),(31,'wC7E2IvcV63wBdhSvox7krMc9xsy5o',31,1,3,'2024-03-31 03:44:03.835618','2024-03-31 03:44:03.835618',NULL),(32,'4cl7m64XrJz6LIkmUs4NXBrhhQLfzI',32,1,3,'2024-03-31 03:44:13.732307','2024-03-31 03:44:13.732307',NULL),(33,'Yu40FJVbJdEDxNM9RDIAn0BiQ8rqrE',33,1,3,'2024-03-31 03:46:31.609225','2024-03-31 03:46:31.609225',NULL),(34,'7onUoFL2hmScvwKpL9Awj6m1KrvRY7',34,1,3,'2024-03-31 04:53:03.410290','2024-03-31 04:53:03.410290',NULL),(35,'8yd4yTC1RlebNyRIfp7O87tjfpo8Jb',35,1,3,'2024-03-31 04:57:28.000144','2024-03-31 04:57:28.000144',NULL),(36,'a98b0gc1wDnYBrJ5AEgxzA0tS5WWyq',36,1,3,'2024-03-31 04:58:49.006972','2024-03-31 04:58:49.006972',NULL),(37,'1Y3BUnuHO8oq0Uz4cLLF5rffsnyJWr',37,1,3,'2024-03-31 05:02:54.058232','2024-03-31 05:02:54.058232',NULL),(38,'jn7zfYk1VFWm9aI0KxrzrxluLMkxE2',38,1,3,'2024-03-31 05:04:58.962383','2024-03-31 05:04:58.962383',NULL),(39,'nhN9luxt4SvexVcFzkY6cWHvMWYuYo',39,1,3,'2024-03-31 05:19:07.987242','2024-03-31 05:19:07.987242',NULL),(40,'VgnlUpb5Glr2EYqiG9c55eVdQFbFhW',40,1,3,'2024-03-31 05:19:36.964505','2024-03-31 05:19:36.964505',NULL),(41,'38WAsPECWHDdMoVLvxq7zp0qNNhM0U',41,1,3,'2024-03-31 14:44:27.547034','2024-03-31 14:44:27.547034',NULL),(42,'NiOR3Wt59QOlEaH829YYlTbd2eI6Zx',42,1,3,'2024-03-31 14:45:03.066886','2024-03-31 14:45:03.066886',NULL),(43,'DM16RdtZVqeZLiHqXm54K1D6RvAHej',43,1,3,'2024-03-31 14:51:08.742378','2024-03-31 14:51:08.742378',NULL),(44,'5F5QBMuKLrkvfXkAU3DMIu4fG5ec0A',44,1,3,'2024-03-31 14:53:19.383651','2024-03-31 14:53:19.383651',NULL),(45,'tJdljaQJK3ntbIeInsok9u2Vh4rlsM',45,1,10,'2024-03-31 15:19:39.932260','2024-03-31 15:19:39.932260',NULL),(46,'YLhAtRKT29cEhfKSnhM6C7FmzeeCZU',46,1,3,'2024-03-31 15:20:15.344738','2024-03-31 15:20:15.344738',NULL),(47,'J0vpDN5LIekaTvAvGP6MrMe5to793O',47,1,3,'2024-03-31 15:32:33.441012','2024-03-31 15:32:33.441012',NULL),(48,'QKWeBKqu1TCDPZRA9B6uaNum7SvXPj',48,1,3,'2024-03-31 15:32:58.203401','2024-03-31 15:32:58.203401',NULL),(49,'8cqhVI76KkGWp5zFQ4NpJQabBCMRos',49,1,3,'2024-03-31 15:46:47.261487','2024-03-31 15:46:47.261487',NULL),(50,'eLf01P4ITYilxAKz5hiVK2hiY1Mk8I',50,1,3,'2024-03-31 15:47:41.406838','2024-03-31 15:47:41.406838',NULL),(51,'jtCTdSAVtb1dY2f0LZtwPyrIEGWxQ6',51,1,3,'2024-03-31 15:50:10.723150','2024-03-31 15:50:10.723150',NULL),(52,'BANGcdqdTKgRlHnjAznSTMnmSt6DE6',52,1,3,'2024-03-31 15:51:01.942202','2024-03-31 15:51:01.942202',NULL),(53,'odUshFBe7eHXY7peLBHjcWnOYctvSJ',53,1,3,'2024-03-31 15:51:36.007243','2024-03-31 15:51:36.007243',NULL),(54,'FmhtfkDoYJTHkTs2oKSjkEFctxcLtc',54,1,3,'2024-03-31 15:54:20.742311','2024-03-31 15:54:20.742311',NULL),(55,'SpC5KBqLnYTexXZSkeMbxs18mAl4Re',55,1,3,'2024-03-31 15:54:42.158643','2024-03-31 15:54:42.158643',NULL),(56,'5q6FyWMHW6aFr7S8Ld9C2XxMtNihlv',56,1,3,'2024-03-31 16:10:11.455998','2024-03-31 16:10:11.455998',NULL),(57,'a1d7YgaTGJ4mygL1Gu2tfK9txifnyP',57,1,3,'2024-03-31 16:19:47.090772','2024-03-31 16:19:47.090772',NULL),(58,'N9IVqKqO2Ai4KqXHM7ZZBS8l7thxN9',58,1,3,'2024-03-31 16:35:03.135120','2024-03-31 16:35:03.135120',NULL),(59,'eZvPwG1bTTAnWJWzYrCJw18vBH7wA5',59,1,3,'2024-04-03 03:12:46.840867','2024-04-03 03:12:46.840867',NULL),(60,'c7yZEno6IDStDzY5Hk82ILkP3wg5yu',60,1,1,'2024-04-03 03:24:00.225576','2024-04-03 03:24:00.225576',NULL),(61,'o6UhRpyWawXDavRRkvgcnIB4RejEYm',61,1,3,'2024-04-03 03:47:33.497871','2024-04-03 03:47:33.497871',NULL),(62,'EmqCI8RbF42wy0NoBOLKCYXePi9JDI',62,1,3,'2024-04-03 03:53:17.459622','2024-04-03 03:53:17.459622',NULL),(63,'1qkcmSnmZ6xpi0fMFQhbmFFFtCFfL9',63,1,3,'2024-04-03 03:56:33.966398','2024-04-03 03:56:33.966398',NULL),(64,'1b0vk1DKfLgYFi5Yb51a4DW95KOB2L',64,1,3,'2024-04-03 03:56:57.730040','2024-04-03 03:56:57.730040',NULL),(65,'0QcnQCG0VG6a8pNfYHafv3DwV6cAEJ',65,1,3,'2024-04-03 04:01:51.052412','2024-04-03 04:01:51.052412',NULL),(66,'NIIhmqC9P7tMnkF7U9dEtVlVf2t9jB',66,1,3,'2024-04-03 04:08:37.461997','2024-04-03 04:08:37.461997',NULL),(67,'Snnu3gqVNbUuTQDFr9ZrFgBJjFjL6s',67,1,3,'2024-04-03 04:29:12.059340','2024-04-03 04:29:12.059340',NULL),(68,'5gAdd1MsCHwHusUTwUvXAvCpxi1rwy',68,1,3,'2024-04-03 04:42:27.344713','2024-04-03 04:42:27.344713',NULL),(69,'JRvQqkRTH6XxvXAaD0K8aGVSen0DuI',69,1,3,'2024-04-03 04:45:41.075267','2024-04-03 04:45:41.075267',NULL),(70,'aQyGeqiulizOzqJPOOhVUoQsVwrsIh',70,1,3,'2024-04-03 04:54:27.704154','2024-04-03 04:54:27.704154',NULL),(71,'3H8TBAYGrJfAU12Gnj1WN9BHDLrvnk',71,1,3,'2024-04-03 15:06:07.505714','2024-04-03 15:06:07.505714',NULL),(72,'dPnP4gvKpHnYWLPhZ6mcKnxiWvX7Q4',72,1,3,'2024-04-03 15:31:59.446262','2024-04-03 15:31:59.446262',NULL),(73,'WaoVhroYPpMXpRWH1zzIOm8AFho0f9',73,1,3,'2024-04-03 15:34:17.911231','2024-04-03 15:34:17.911231',NULL),(74,'wKcvK3ESWFhEt5keHAiA5n3SCQxi0C',74,1,1,'2024-04-04 05:21:28.145005','2024-04-04 05:21:28.145005',NULL),(75,'II9Clw7sd42iMXzR2lTJA5Y3BLWAut',75,1,1,'2024-04-04 05:26:59.414428','2024-04-04 05:26:59.414428',NULL),(76,'vcZVWkiti2NCz14LO3XFsO8gecE8ik',76,1,1,'2024-04-04 06:18:57.585681','2024-04-04 06:18:57.585681',NULL),(77,'M7flYUA4x5sGL6RXm4EkkUueizj7er',77,1,1,'2024-04-04 06:27:18.507893','2024-04-04 06:27:18.507893',NULL),(78,'HSEoLzUo5KNMC354ptjrLyPpGSjA9l',78,1,1,'2024-04-04 07:37:16.376499','2024-04-04 07:37:16.376499',NULL),(79,'V1TIxNf2IdzG7TEfsSl9flIfQfuwws',79,1,1,'2024-04-04 07:49:33.080728','2024-04-04 07:49:33.080728',NULL),(80,'MXETaMDqx191fhOeZHAEr4re0DLjFx',80,1,1,'2024-04-04 07:50:15.016254','2024-04-04 07:50:15.016254',NULL),(81,'uMFumuQAYSqAyyjzymCANfB25VQU1x',81,1,1,'2024-04-04 07:51:20.232065','2024-04-04 07:51:20.232065',NULL),(82,'WwlyqOLUjmRXu16TGYsX28klueyu1Q',82,1,1,'2024-04-04 08:05:45.280733','2024-04-04 08:05:45.280733',NULL),(83,'e8uraPG4OX3BDTz4rHXxI9DV04DxBm',83,1,1,'2024-04-04 08:06:54.777484','2024-04-04 08:06:54.777484',NULL),(84,'TrKj0kT5efFmPYDLlJq65pb34tRjAN',84,1,1,'2024-04-04 08:07:30.666852','2024-04-04 08:07:30.666852',NULL),(85,'PA2cqzLVJjoGy8mg2Q5UCC6rzBT0Zz',85,1,1,'2024-04-04 08:07:57.176087','2024-04-04 08:07:57.176087',NULL),(86,'Lp2OVFx5AbvMFpc9kFbEFAKqvE7qQX',86,1,1,'2024-04-04 08:20:22.121649','2024-04-04 08:20:22.121649',NULL),(87,'Z8unRxGEjl3qxxHpMXfY32pGvpMH2k',87,1,1,'2024-04-04 08:38:42.949471','2024-04-04 08:38:42.949471',NULL),(88,'THQa5euJ124LoJMEzXy6LlbOXFcffn',88,1,1,'2024-04-04 08:49:12.486259','2024-04-04 08:49:12.486259',NULL),(89,'3fi3nDF0FnbCG9zc5B4sBfzzasNoRh',89,1,1,'2024-04-04 08:52:13.304943','2024-04-04 08:52:13.304943',NULL),(90,'pYSv25iEWPUVPyUGvsRJQNTv3uc91l',90,1,11,'2024-04-04 09:13:35.441010','2024-04-04 09:13:35.441506',NULL),(91,'nqnDItjEAlqnTiQbRzc4GN2bAByZWf',91,1,11,'2024-04-04 09:17:06.547082','2024-04-04 09:17:06.547082',NULL),(92,'pocMRK9hsErsWqg2XH9JplJC0gBbKN',92,1,12,'2024-04-04 09:20:33.300424','2024-04-04 09:20:33.300424',NULL),(93,'In0sJD30RdNbnotAFRfTx7xZ2KjwQ7',93,1,11,'2024-04-04 09:32:40.389626','2024-04-04 09:32:40.389626',NULL),(94,'PbNFtBNlSRiJSKYwHTpTjvctu0SPTX',94,1,12,'2024-04-04 09:34:05.342383','2024-04-04 09:34:05.342383',NULL),(95,'m6VsFo3c4uWbWDSmssJmHsxIsF8GjY',95,1,1,'2024-04-04 09:46:25.915523','2024-04-04 09:46:25.915523',NULL),(96,'DeSd3zdPcHwtDQwB2D1KEhhirOLcXZ',96,1,11,'2024-04-04 09:46:53.598121','2024-04-04 09:46:53.599118',NULL),(97,'L4B8vLSDExj3fSJmNxHAunpj0JRDy7',97,1,1,'2024-04-04 09:46:58.608678','2024-04-04 09:46:58.608678',NULL),(98,'ZIlqWttvL7sQjVENb6fQaxzKvqI6DZ',98,1,1,'2024-04-04 09:48:06.722748','2024-04-04 09:48:06.722748',NULL),(99,'73dxb9N4eO2fz2Cwj34EOldF5JXNmv',99,1,1,'2024-04-04 09:50:41.293354','2024-04-04 09:50:41.293354',NULL),(100,'MfJeBUDszvjANldh880pdxCFzuUUfV',100,1,8,'2024-04-04 09:51:32.086549','2024-04-04 09:51:32.086549',NULL),(101,'VhlgQFVoOpL8nBrwwZFE9ix8CwWmSi',101,1,11,'2024-04-04 09:51:41.691828','2024-04-04 09:51:41.691828',NULL),(102,'aOli84le99KZdm99xi0he5JWUjoGG2',102,1,1,'2024-04-04 09:52:09.109649','2024-04-04 09:52:09.109649',NULL),(103,'9dbB32MPoc2dbAiVbauf70eKZFYHas',103,1,8,'2024-04-04 09:55:26.521593','2024-04-04 09:55:26.521593',NULL),(104,'03oggCe9dguJXxMqFwfx8HsRv3nkwX',104,1,8,'2024-04-04 09:55:41.947459','2024-04-04 09:55:41.947459',NULL),(105,'X44mq0SgVOgmMhg7YDcqNiIQBkRKeZ',105,1,1,'2024-04-04 09:55:49.548941','2024-04-04 09:55:49.548941',NULL),(106,'xLtdhvdHsvwVSuSkwUS6NMl8yjkksQ',106,1,11,'2024-04-04 09:56:00.237086','2024-04-04 09:56:00.237086',NULL),(107,'8SRd388jHaxjWzkitHBmzbptw71WgK',107,1,1,'2024-04-04 09:58:32.096646','2024-04-04 09:58:32.096646',NULL),(108,'ixils5DABJcH1il9pmgy2Jrq8Tazda',108,1,8,'2024-04-04 09:58:45.215325','2024-04-04 09:58:45.215325',NULL),(109,'XoMBLvIFQ5gerKJIUiu3eZiGHrejg4',109,1,8,'2024-04-04 09:58:59.016315','2024-04-04 09:58:59.016315',NULL),(110,'Vh80Zi10OkPE8VpnfDgK492eW1bsN2',110,1,1,'2024-04-04 09:59:08.087773','2024-04-04 09:59:08.087773',NULL),(111,'r5cDRhRbiNDM8Il6ZLY2bhpvw0ooc1',111,1,1,'2024-04-04 10:00:03.782539','2024-04-04 10:00:03.782539',NULL),(112,'41TMRhfRbAvxopMaDCNFxfPfxVsVXT',112,1,8,'2024-04-04 10:00:06.219413','2024-04-04 10:00:06.219413',NULL),(113,'a7cvOvtUBXyzPaIg0GJOh9eoPi6Zgv',113,1,1,'2024-04-04 10:00:54.195808','2024-04-04 10:00:54.195808',NULL),(114,'lWi672Vl24Otqbq7trtyABmwDj4Qp5',114,1,11,'2024-04-04 10:02:04.349573','2024-04-04 10:02:04.349573',NULL),(115,'BXJmTQRd6ol144BJ72jUxbxX6vhZOF',115,1,8,'2024-04-04 10:03:13.979434','2024-04-04 10:03:13.979434',NULL),(116,'UqeTNarWcQveOPza3PooxvG4dLznTc',116,1,8,'2024-04-04 10:06:27.690901','2024-04-04 10:06:27.690901',NULL),(117,'d9J2EVNopDT16otT4rz8i3L2FIYUU1',117,1,13,'2024-04-04 10:15:30.934272','2024-04-04 10:15:30.934272',NULL),(118,'WLTg8spDjxqjzwSFrVzEpBPMwOLTPY',118,1,13,'2024-04-04 10:16:05.541113','2024-04-04 10:16:05.541113',NULL),(119,'5IOgX8jtIy8Z698c88MP6nLXtsjV3n',119,1,1,'2024-04-04 13:40:04.064296','2024-04-04 13:40:04.064296',NULL),(120,'SyqlOBTK8hbMMfXlqCijbWK2LZqBZk',120,1,1,'2024-04-04 13:43:02.391703','2024-04-04 13:43:02.391703',NULL),(121,'zECxMKex4jsUnao7pYn9WbXppkSotK',121,1,14,'2024-04-04 14:03:41.181990','2024-04-04 14:03:41.181990',NULL),(122,'qhhg7y3dOLAjPePDl8GgYyzDAvzODy',122,1,14,'2024-04-04 14:27:41.710356','2024-04-04 14:27:41.710356',NULL),(123,'6Luj1om6iQT3Txx3g148OLHEJVg9uD',123,1,14,'2024-04-04 14:29:58.170919','2024-04-04 14:29:58.170919',NULL),(124,'OEKfXDiFi9r75EgQo3qrYh8Y3UvTab',124,1,14,'2024-04-04 14:35:43.764621','2024-04-04 14:35:43.764621',NULL),(125,'ZUWYWtSHhEpbv810jqVIvlXijNn1Ci',125,1,1,'2024-04-04 14:44:54.895993','2024-04-04 14:44:54.895993',NULL),(126,'ylfroH7tBjBNouWIiYmaA1B63VhwIY',126,1,14,'2024-04-04 14:45:08.120499','2024-04-04 14:45:08.120499',NULL),(127,'Gc00hsKgtZhybs1cNZGnWPplHTSKgi',127,1,14,'2024-04-04 14:48:33.622731','2024-04-04 14:48:33.622731',NULL),(128,'jzPI9Jfva5lTQF1g3xTRhKI66V3vcv',128,1,14,'2024-04-04 14:53:26.594602','2024-04-04 14:53:26.595610',NULL),(129,'bsI10feH7rqo1ZxDwopxE4456xUEs1',129,1,14,'2024-04-04 15:03:51.112401','2024-04-04 15:03:51.112401',NULL),(130,'BiF4saZ6D6LgGD27F3fY3NWberg62a',130,1,14,'2024-04-04 15:12:32.287658','2024-04-04 15:12:32.287658',NULL),(131,'QQTy1N2NY5DBpwGqODNEh4hB7Zw13S',131,1,14,'2024-04-04 15:13:00.480282','2024-04-04 15:13:00.480282',NULL),(132,'ubfeSMO11WKUhPzg0hKseVrIc30qzU',132,1,14,'2024-04-04 15:15:09.503279','2024-04-04 15:15:09.503279',NULL),(133,'PH7mEoM9USUnab4LJ8eEgpiVV01Fu1',133,1,14,'2024-04-04 15:20:26.547778','2024-04-04 15:20:26.547778',NULL),(134,'UVdwN2eiVZKTE21Ceird8IkmqaVLch',134,1,14,'2024-04-04 15:24:33.124133','2024-04-04 15:24:33.124133',NULL),(135,'jNcgofR2QtLYzykNoDcxHD7BpjaN30',135,1,14,'2024-04-04 15:26:03.392724','2024-04-04 15:26:03.392724',NULL),(136,'gQETloeS4w4RdHBHLBNFU11Rf646wQ',136,1,11,'2024-04-05 03:54:48.136301','2024-04-05 03:54:48.136301',NULL),(137,'1PpVG3T6icBpFnD5yhfkAP0lVeUyMP',137,1,11,'2024-04-05 04:18:18.857838','2024-04-05 04:18:18.857838',NULL),(138,'ZbqLkmnhs2KO1ZnjxfSATQsgggIXUQ',138,1,11,'2024-04-05 04:56:44.805363','2024-04-05 04:56:44.805363',NULL),(139,'kwdWdHDuyVic1vhzVidKpZZBFq3kvD',139,1,11,'2024-04-05 07:20:52.404557','2024-04-05 07:20:52.404557',NULL),(140,'aG4PlxpEYBpYVVi0p3oWY1iGePk9Jb',140,1,11,'2024-04-05 07:59:04.000658','2024-04-05 07:59:04.000658',NULL),(141,'CQ8dNqgLjx0RxypmpteQEcF8iG2UlV',141,1,11,'2024-04-05 08:06:17.865044','2024-04-05 08:06:17.865044',NULL),(142,'OLRmLFiYZwFHDtvUowEqUQUd0zJ26T',142,1,11,'2024-04-05 08:13:10.976446','2024-04-05 08:13:10.976446',NULL),(143,'jRGUlTag6p52tH22bR3cRFJMXjyTuy',143,1,11,'2024-04-05 08:17:13.191789','2024-04-05 08:17:13.191789',NULL),(144,'L5Agd33WJDSzQ4sHsmiRP01fnmWuBP',144,1,11,'2024-04-05 08:21:33.105426','2024-04-05 08:21:33.105426',NULL),(145,'yrmfB5RTBqzYStynYY5yGxcZgGyb9l',145,1,11,'2024-04-05 08:25:43.057465','2024-04-05 08:25:43.057465',NULL),(146,'gKFsv4gtoOEjdOKCybSHhzVtytCRwP',146,1,11,'2024-04-05 08:27:01.293039','2024-04-05 08:27:01.293039',NULL),(147,'qr6clTSELy5MebfBVUqgJpM9aRNOkq',147,1,11,'2024-04-05 08:34:19.221704','2024-04-05 08:34:19.221704',NULL),(148,'DjETciPtxKtcFNe6VOQQ2AGdQH59YP',148,1,11,'2024-04-05 08:42:52.537350','2024-04-05 08:42:52.537350',NULL),(149,'P0sGMJGEnnDO7EJwVOJ4z2FdRH7lec',149,1,11,'2024-04-05 08:48:58.727478','2024-04-05 08:48:58.727478',NULL),(150,'ytFDRn4Uz43BZTGiiSqpsDvpDna4hI',150,1,11,'2024-04-05 09:08:00.552469','2024-04-05 09:08:00.552469',NULL),(151,'0fXpOalJF1N8RW5VtVilbfD5RN9BRR',151,1,11,'2024-04-05 09:11:21.825197','2024-04-05 09:11:21.825197',NULL),(152,'DOyv76BIopvgespfxLBBlwj3LSfUf3',152,1,11,'2024-04-05 09:50:41.784582','2024-04-05 09:50:41.784582',NULL),(153,'vwVpRzU0UDh8KNJa5WzFwddIENaLsZ',153,1,11,'2024-04-05 10:10:47.373595','2024-04-05 10:10:47.373595',NULL),(154,'V4OEQDxaurtDuFhVFUElNmEMXn7q86',154,1,11,'2024-04-05 10:13:40.636833','2024-04-05 10:13:40.636833',NULL),(155,'Rqyy4aWazmZDD08GiC99YJmELMtTEM',155,1,15,'2024-04-05 10:14:54.528715','2024-04-05 10:14:54.528715',NULL),(156,'fnxwdxxoOb6FbWRVCZvhREVb5db3lU',156,1,15,'2024-04-05 10:17:25.218076','2024-04-05 10:17:25.218076',NULL),(157,'mmGu2eMVaMjzOa6lpksUPgj5s0h95w',157,1,15,'2024-04-05 10:19:26.290850','2024-04-05 10:19:26.290850',NULL),(158,'QT3jUuMhKRHNtkMSNnqXfnpEYjDk2j',158,1,11,'2024-04-05 10:40:21.854594','2024-04-05 10:40:21.854594',NULL),(159,'6dTDUT5wiRlO8OSsgk5y85cbqr6e4R',159,1,11,'2024-04-05 15:00:45.455659','2024-04-05 15:00:45.455659',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-06  7:23:27
