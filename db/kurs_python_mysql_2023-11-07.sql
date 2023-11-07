# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.43)
# Database: kurs_python_mysql
# Generation Time: 2023-11-07 15:32:54 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table knjiga
# ------------------------------------------------------------

DROP TABLE IF EXISTS `knjiga`;

CREATE TABLE `knjiga` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `naziv_knjige` varchar(30) DEFAULT NULL,
  `pisac_id` int(11) unsigned DEFAULT NULL,
  `zanr` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `knjiga_pisac_relation` (`pisac_id`),
  CONSTRAINT `knjiga_pisac_relation` FOREIGN KEY (`pisac_id`) REFERENCES `pisac` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `knjiga` WRITE;
/*!40000 ALTER TABLE `knjiga` DISABLE KEYS */;

INSERT INTO `knjiga` (`id`, `naziv_knjige`, `pisac_id`, `zanr`)
VALUES
	(1,'Zivotinjska farma',2,'Futurizam'),
	(2,'Zlocin i kazna',1,'Realizam'),
	(3,'Besnilo',3,'Naucna fantastika'),
	(4,'Braca Karamazovi',1,'Realizam');

/*!40000 ALTER TABLE `knjiga` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pisac
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pisac`;

CREATE TABLE `pisac` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ime_pisca` varchar(30) DEFAULT NULL,
  `godina_rodjenja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pisac` WRITE;
/*!40000 ALTER TABLE `pisac` DISABLE KEYS */;

INSERT INTO `pisac` (`id`, `ime_pisca`, `godina_rodjenja`)
VALUES
	(1,'Fjodor Dostojevski',1834),
	(2,'Dzordz Orvel',1915),
	(3,'Borislav Peic',1929);

/*!40000 ALTER TABLE `pisac` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
