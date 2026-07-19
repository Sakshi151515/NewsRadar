-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: newsradar1
-- ------------------------------------------------------
-- Server version	8.0.46

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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',9,'add_category'),(26,'Can change category',9,'change_category'),(27,'Can delete category',9,'delete_category'),(28,'Can view category',9,'view_category'),(29,'Can add article',7,'add_article'),(30,'Can change article',7,'change_article'),(31,'Can delete article',7,'delete_article'),(32,'Can view article',7,'view_article'),(33,'Can add bookmark',8,'add_bookmark'),(34,'Can change bookmark',8,'change_bookmark'),(35,'Can delete bookmark',8,'delete_bookmark'),(36,'Can view bookmark',8,'view_bookmark');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1200000$WMm8Meexe4z3qYZwiGRTWr$3tCLlC2xL5ytsGembfnYIHJtIwwvhpWKR7ONlnZRXuI=','2026-07-08 14:14:21.011467',1,'vaishu','','','vaishu@gmail.com',1,1,'2026-07-08 14:12:28.060518'),(2,'pbkdf2_sha256$1200000$XJ5LOUuwiRUCfI3AI9P3L3$vEgQYZ4N8JYic8sCpAKE0hwTrHwwZbS+1LRUs8TG+EA=',NULL,0,'sakshiamrutkar15@gmail.com','','','',0,1,'2026-07-08 15:42:24.363683'),(3,'pbkdf2_sha256$1200000$7eKlgTXqWs0SxokqQfQBzP$gACJ7ft67BhfCgJV2xqGPmgr/n23dlLh0/F98065ZI4=','2026-07-15 17:28:26.261754',0,'sakshi','','','sakshiamrutkar15@gmail.com',0,1,'2026-07-15 17:27:31.502721');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-07-08 14:15:52.318499','1','Category object (1)',1,'[{\"added\": {}}]',9,1),(2,'2026-07-08 14:16:01.746433','2','Category object (2)',1,'[{\"added\": {}}]',9,1),(3,'2026-07-08 14:16:10.842206','3','Category object (3)',1,'[{\"added\": {}}]',9,1),(4,'2026-07-08 14:16:20.487091','4','Category object (4)',1,'[{\"added\": {}}]',9,1),(5,'2026-07-08 14:16:29.787262','5','Category object (5)',1,'[{\"added\": {}}]',9,1),(6,'2026-07-08 14:16:58.363234','6','Category object (6)',1,'[{\"added\": {}}]',9,1),(7,'2026-07-08 14:19:13.826732','1','Article object (1)',1,'[{\"added\": {}}]',7,1),(8,'2026-07-08 14:23:32.883586','1','Article object (1)',3,'',7,1),(9,'2026-07-08 14:25:17.792323','2','Article object (2)',1,'[{\"added\": {}}]',7,1),(10,'2026-07-08 15:26:33.455342','3','Article object (3)',1,'[{\"added\": {}}]',7,1),(11,'2026-07-08 15:30:41.638813','4','Article object (4)',1,'[{\"added\": {}}]',7,1),(12,'2026-07-08 15:34:02.403707','5','Article object (5)',1,'[{\"added\": {}}]',7,1),(13,'2026-07-08 15:36:33.090560','6','Article object (6)',1,'[{\"added\": {}}]',7,1),(14,'2026-07-08 15:37:40.446429','6','Article object (6)',3,'',7,1),(15,'2026-07-08 15:38:33.375331','7','Article object (7)',1,'[{\"added\": {}}]',7,1),(16,'2026-07-08 15:40:49.700927','8','Article object (8)',1,'[{\"added\": {}}]',7,1),(17,'2026-07-08 15:42:25.612969','2','sakshiamrutkar15@gmail.com',1,'[{\"added\": {}}]',4,1),(18,'2026-07-08 15:45:21.888778','9','Article object (9)',1,'[{\"added\": {}}]',7,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'news','article'),(8,'news','bookmark'),(9,'news','category'),(6,'sessions','session');
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-07-08 14:11:00.963030'),(2,'auth','0001_initial','2026-07-08 14:11:01.855025'),(3,'admin','0001_initial','2026-07-08 14:11:02.107430'),(4,'admin','0002_logentry_remove_auto_add','2026-07-08 14:11:02.113331'),(5,'admin','0003_logentry_add_action_flag_choices','2026-07-08 14:11:02.138267'),(6,'contenttypes','0002_remove_content_type_name','2026-07-08 14:11:02.329773'),(7,'auth','0002_alter_permission_name_max_length','2026-07-08 14:11:02.429664'),(8,'auth','0003_alter_user_email_max_length','2026-07-08 14:11:02.459280'),(9,'auth','0004_alter_user_username_opts','2026-07-08 14:11:02.478582'),(10,'auth','0005_alter_user_last_login_null','2026-07-08 14:11:02.603680'),(11,'auth','0006_require_contenttypes_0002','2026-07-08 14:11:02.605686'),(12,'auth','0007_alter_validators_add_error_messages','2026-07-08 14:11:02.616437'),(13,'auth','0008_alter_user_username_max_length','2026-07-08 14:11:02.700672'),(14,'auth','0009_alter_user_last_name_max_length','2026-07-08 14:11:02.806501'),(15,'auth','0010_alter_group_name_max_length','2026-07-08 14:11:02.845276'),(16,'auth','0011_update_proxy_permissions','2026-07-08 14:11:02.857961'),(17,'auth','0012_alter_user_first_name_max_length','2026-07-08 14:11:02.955471'),(18,'news','0001_initial','2026-07-08 14:11:03.318935'),(19,'sessions','0001_initial','2026-07-08 14:11:03.362649');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_article`
--

DROP TABLE IF EXISTS `news_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `description` longtext NOT NULL,
  `url` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `author` varchar(200) NOT NULL,
  `published_date` datetime(6) NOT NULL,
  `credibility_score` double NOT NULL,
  `is_fake` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `news_article_category_id_7ede7614_fk_news_category_id` (`category_id`),
  CONSTRAINT `news_article_category_id_7ede7614_fk_news_category_id` FOREIGN KEY (`category_id`) REFERENCES `news_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_article`
--

LOCK TABLES `news_article` WRITE;
/*!40000 ALTER TABLE `news_article` DISABLE KEYS */;
INSERT INTO `news_article` VALUES (2,'AI Changing the world','Artificial Intelligence is transforming industries such as healthcare, education, banking, and transportation. Many companies are adopting AI to improve productivity and provide better services.','https://techcrunch.com/','','','2026-07-08 14:25:13.000000',0,0,'2026-07-08 14:25:17.792323',6),(3,'Python 3.14 Released','The Python development team has released a new version with improved performance, bug fixes, and additional language features. Developers are encouraged to upgrade to benefit from the latest improvements.','https://www.python.org/blogs/','','','2026-07-06 18:00:00.000000',0,0,'2026-07-08 15:26:33.447612',6),(4,'India Wins Cricket Series','India secured a memorable series victory with outstanding batting and bowling performances. The captain praised the team\'s effort and thanked fans for their support throughout the tournament.','https://www.espncricinfo.com/','','','2026-07-08 15:30:30.000000',0,1,'2026-07-08 15:30:41.634821',1),(5,'FIFA World Cup Preparations Begin','Teams from around the world have started training camps and friendly matches in preparation for the upcoming FIFA World Cup. Fans are eagerly waiting for the tournament to begin.','https://www.fifa.com/','','','2026-07-06 12:00:00.000000',0,0,'2026-07-08 15:34:02.399479',1),(7,'Stock Market Reaches Record High','Indian stock markets closed at record highs after strong gains in the banking and IT sectors. Investors remain optimistic due to positive economic indicators and corporate earnings.\r\nhttps://www.reuters.com/business/⁠�','https://www.reuters.com/business/⁠�','','','2026-07-08 15:38:14.000000',0,0,'2026-07-08 15:38:33.370537',2),(8,'New Startup Raises Funding','A fast-growing technology startup has raised significant funding to expand its AI-based products and enter international markets. The investment is expected to accelerate product development.','https://techcrunch.com/⁠�','','','2026-07-07 00:00:00.000000',0,0,'2026-07-08 15:40:49.696324',2),(9,'WHO Issues New Health Guidelines','The World Health Organization has released updated health guidelines encouraging healthy diets, regular physical activity, and preventive healthcare to reduce the risk of chronic diseases.','https://www.who.int/news⁠�','','','2026-07-08 15:45:13.000000',0,1,'2026-07-08 15:45:21.888778',3);
/*!40000 ALTER TABLE `news_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_bookmark`
--

DROP TABLE IF EXISTS `news_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_bookmark` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bookmarked_at` datetime(6) NOT NULL,
  `article_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_bookmark_user_id_article_id_59d9b940_uniq` (`user_id`,`article_id`),
  KEY `news_bookmark_article_id_70d4f623_fk_news_article_id` (`article_id`),
  CONSTRAINT `news_bookmark_article_id_70d4f623_fk_news_article_id` FOREIGN KEY (`article_id`) REFERENCES `news_article` (`id`),
  CONSTRAINT `news_bookmark_user_id_db1205ad_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_bookmark`
--

LOCK TABLES `news_bookmark` WRITE;
/*!40000 ALTER TABLE `news_bookmark` DISABLE KEYS */;
INSERT INTO `news_bookmark` VALUES (1,'2026-07-08 14:25:45.391989',2,1),(2,'2026-07-08 15:30:54.194658',4,1),(3,'2026-07-15 17:28:37.735755',3,3),(4,'2026-07-15 18:02:22.277917',2,3);
/*!40000 ALTER TABLE `news_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_category`
--

DROP TABLE IF EXISTS `news_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_category`
--

LOCK TABLES `news_category` WRITE;
/*!40000 ALTER TABLE `news_category` DISABLE KEYS */;
INSERT INTO `news_category` VALUES (2,'Business'),(5,'Education'),(4,'Entertainment'),(3,'Health'),(1,'Sports'),(6,'Technology');
/*!40000 ALTER TABLE `news_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-19 17:43:27
