-- MySQL dump 10.11
--
-- Host: localhost    Database: game_site_development
-- ------------------------------------------------------
-- Server version	5.1.41

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `zip_code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'2010-09-10 07:16:00','2010-09-10 07:16:00','michael','villa',94402);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developers`
--

DROP TABLE IF EXISTS `developers`;
CREATE TABLE `developers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `year_established` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `developers`
--

LOCK TABLES `developers` WRITE;
/*!40000 ALTER TABLE `developers` DISABLE KEYS */;
INSERT INTO `developers` VALUES (1,'Bungie','1991','Bungie (founded as Bungie Software Products Corporation) is an American video game developer currently located in Bellevue, Washington, USA. The company was established in May 1991 by University of Chicago undergraduate student Alex Seropian, who later brought in programmer Jason Jones after publishing Jones game Minotaur: The Labyrinths of Crete.','2010-09-07 22:06:00','2010-09-11 01:27:13'),(2,'2K Czech','1997','2K Czech (previously known as Illusion Softworks) is game development company located in Brno, Czech Republic. It was founded by Petr Vochozka and its venture capital investors, Cash Reform Group in 1997. The company focuses most on first-person shooters and third-person shooters games. As of November 2003, it had about 170 employees.','2010-09-07 22:09:49','2010-09-07 22:09:49'),(3,'Blizzard','1993','Blizzard Entertainment, Inc. is an American video game developer and publisher founded in February 1991 under the name Silicon & Synapse by three graduates of UCLA, Michael Morhaime, Allen Adham and Frank Pearce. Based in Irvine, California, the company originally concentrated primarily on the creation of game ports for other studios before beginning development of their own software in 1993 with the development of games like Rock N Roll Racing and The Lost Vikings. In 1994 the company became Blizzard Entertainment Inc before being acquired by distributor Davidson & Associates. Shortly thereafter, Blizzard shipped their breakthrough hit Warcraft: Orcs and Humans. Blizzard went on to create several successful PC games, including the Warcraft, Starcraft and Diablo series, and the MMORPG World of Warcraft.','2010-09-07 22:50:29','2010-09-07 22:50:29');
/*!40000 ALTER TABLE `developers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editions`
--

DROP TABLE IF EXISTS `editions`;
CREATE TABLE `editions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `editions`
--

LOCK TABLES `editions` WRITE;
/*!40000 ALTER TABLE `editions` DISABLE KEYS */;
INSERT INTO `editions` VALUES (1,'Standard','2010-09-07 22:57:16','2010-09-07 22:57:16'),(2,'Collectors','2010-09-07 22:58:20','2010-09-07 22:58:20');
/*!40000 ALTER TABLE `editions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `platform_legacy` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `disc_condition` varchar(255) NOT NULL,
  `availability` varchar(255) NOT NULL,
  `esrb` varchar(255) NOT NULL,
  `rating` varchar(255) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `release_date` datetime NOT NULL,
  `pre_order_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `edition_id` int(4) NOT NULL,
  `developer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (2,2,'Fallout 3','PS3','Role-Playing','New','Usually Ships in 24 Hours','M','8.0','59.99','2008-06-02 03:49:00','2007-09-02 04:49:00','2010-09-13 02:55:00','2010-09-14 05:09:16','',0,1),(3,5,'Please Enter Game Title Here','PS3','Action','New','Pre-order Ships 9/7/2010','T','9.9','10.99','2010-09-07 00:01:00','2010-09-02 00:01:00','2010-09-13 01:24:00','2010-09-13 06:30:33','',0,1),(4,5,'Halo Reach','Xbox 360','First Person Shooter','New','Pre-order Ships 9/14/2010','M','9.9','15.99','2010-09-14 09:10:00','2010-06-02 09:10:00','2010-09-13 02:46:00','2010-09-14 19:19:15','',0,2),(6,1,'NHL 11','Xbox 360','Sports','New','Pre-order Ships 9/7/2010','E','9.8','89.99','2010-09-07 00:01:00','2010-09-01 00:00:00','2010-09-13 02:55:00','2010-09-13 06:12:01','',0,2),(11,7,'Halo','Xbox','First Person Shooter','Used','Available','M','8.9','15.99','2010-09-13 02:58:00','2010-09-13 02:58:00','2010-09-13 02:58:00','2010-09-14 19:52:32','',0,2),(8,4,'Wipeout: The Game','Wii','Party','New','Usually Ships in 24 Hours','E','8','19.99','2010-09-08 05:34:00','2010-11-08 05:34:00','2010-09-08 05:35:00','2010-09-14 05:46:37','image.jpg',1,1),(9,1,'Starcraft II','PC','Strategy','Used','Usually Ships in 24 Hours','T','9.9','45.99','2010-08-08 05:51:00','2010-09-08 05:51:00','2010-09-08 05:52:00','2010-09-14 05:05:58','',1,3),(10,1,'Warcraft','PC','Strategy','Used','Usually Ships in 24 Hours','T','8.9','15.99','2010-09-08 05:52:00','2010-09-08 05:52:00','2010-09-08 05:53:00','2010-09-14 04:36:04','image.jpg',1,3);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_platforms`
--

DROP TABLE IF EXISTS `games_platforms`;
CREATE TABLE `games_platforms` (
  `game_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `games_platforms`
--

LOCK TABLES `games_platforms` WRITE;
/*!40000 ALTER TABLE `games_platforms` DISABLE KEYS */;
INSERT INTO `games_platforms` VALUES (6,3),(6,4),(3,1),(3,2),(8,7),(11,2),(10,7),(10,3),(10,4),(4,2),(11,8);
/*!40000 ALTER TABLE `games_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_items`
--

DROP TABLE IF EXISTS `line_items`;
CREATE TABLE `line_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `quantity` int(5) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `line_items`
--

LOCK TABLES `line_items` WRITE;
/*!40000 ALTER TABLE `line_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2010-09-15 02:41:00','2010-09-15 02:41:00','123456789',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
CREATE TABLE `platforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES (1,'PS3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Xbox 360','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Wii','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'DS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'PS2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'PSP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'PC Games','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'Xbox','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
CREATE TABLE `publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `year_established` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Blizzard Entertainment','1994','Blizzard Entertainment® is a premier developer and publisher of entertainment software. After establishing the Blizzard Entertainment label in 1994, the company quickly became one of the most popular and well-respected makers of computer games. By focusing on creating well-designed, highly enjoyable entertainment experiences, Blizzard Entertainment has maintained an unparalleled reputation for quality since its inception.','2010-09-07 17:27:48','2010-09-07 17:27:48'),(2,'Electronic Arts','1982','Electronic Arts Inc. is a leading global interactive entertainment software company. EA develops, publishes, and distributes interactive software worldwide for video game systems, personal computers, wireless devices and the Internet.','2010-09-07 17:33:32','2010-09-07 17:33:32'),(3,'Nintendo','1985','Nintendo Entertainment System Introduced in 1985, the NES was an instant hit. Over the course of the next two years, it almost single-handedly revitalized the video game industry. Selling over 60 million units, people brought games like Mario and Zelda into their homes for the first time on the NES.','2010-09-07 17:39:51','2010-09-07 17:39:51'),(4,'Ubisoft','1986','Ubisoft Entertainment S.A, an educational software and video game publishing and distribution company, is created by the five Guillemot brothers. Growing success with a series of hits on PC, Amstrad?, Atari? and Amiga? and first distribution partnerships with the leading U.S. and European video game publishers : Elite?, Electronic Arts, Sierra, LucasArts?, Novalogic®?','2010-09-07 17:43:15','2010-09-07 17:43:15'),(5,'Take-Two Interactive','1999','Take-Two Interactive Software, Inc. is a leading worldwide publisher and developer of interactive entertainment software. Take-Two product offerings include titles for the leading hardware platforms - PlayStation®3 and PlayStation®2 computer entertainment systems, PSP® (PlayStation®Portable) system, Xbox 360® video game and entertainment system from Microsoft, Wii?, Nintendo DS? and for the PC. The Company publishes and develops products through its wholly owned labels Rockstar Games and 2K, which publishes its titles under 2K Games, 2K Sports and 2K Play.','2010-09-07 17:46:18','2010-09-07 17:46:18'),(7,'Microsoft Games Studios','2002','Microsoft Game Studios is a brand owned by Microsoft and introduced in 2002 to represent the company as a video game publisher, coinciding with the launch of the Xbox. Games published by Microsoft under the MGS label are typically released for the Windows and/or Xbox (360) platforms exclusively, regardless of whether the developer is a first or third party.','2010-09-08 10:08:00','2010-09-13 02:42:01');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-09-15  3:02:30
