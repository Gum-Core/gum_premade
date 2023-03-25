-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.10.2-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour gumcore
CREATE DATABASE IF NOT EXISTS `gumcore` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `gumcore`;

-- Listage de la structure de la table gumcore. bank_users
CREATE TABLE IF NOT EXISTS `bank_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT '0',
  `charidentifier` varchar(5) DEFAULT '0',
  `money` varchar(255) DEFAULT '0',
  `gold` varchar(255) DEFAULT '0',
  `name` varchar(255) DEFAULT '0',
  `borrow` double DEFAULT 0,
  `borrow_pay` datetime DEFAULT NULL,
  `borrow_money` double DEFAULT 0,
  `shared` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table gumcore. bans
CREATE TABLE IF NOT EXISTS `bans` (
  `identifier` varchar(50) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `date` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  KEY `identifier` (`identifier`),
  KEY `reason` (`reason`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table gumcore. characters
CREATE TABLE IF NOT EXISTS `characters` (
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `charidentifier` int(11) NOT NULL AUTO_INCREMENT,
  `money` double(11,2) DEFAULT 0.00,
  `gold` double(11,2) DEFAULT 0.00,
  `rol` double(11,2) NOT NULL DEFAULT 0.00,
  `inventory` longtext DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `status` varchar(140) DEFAULT '{}',
  `meta` varchar(255) NOT NULL DEFAULT '{}',
  `firstname` varchar(50) DEFAULT ' ',
  `lastname` varchar(50) DEFAULT ' ',
  `skinPlayer` longtext DEFAULT NULL,
  `compPlayer` longtext DEFAULT NULL,
  `jobgrade` int(11) DEFAULT 0,
  `coords` varchar(75) DEFAULT '{}',
  `isdead` tinyint(1) DEFAULT 0,
  `walking_style` varchar(50) DEFAULT 'Default',
  UNIQUE KEY `identifier_charidentifier` (`identifier`,`charidentifier`) USING BTREE,
  KEY `charidentifier` (`charidentifier`) USING BTREE,
  KEY `coords` (`coords`),
  KEY `compPlayer` (`compPlayer`(768)),
  KEY `skinPlayer` (`skinPlayer`(768)),
  KEY `money` (`money`),
  KEY `status` (`status`),
  CONSTRAINT `FK_characters_users` FOREIGN KEY (`identifier`) REFERENCES `users` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table gumcore. drops
CREATE TABLE IF NOT EXISTS `drops` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `drop_list` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7857 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table gumcore. inventory_storage
CREATE TABLE IF NOT EXISTS `inventory_storage` (
  `identifier` varchar(50) NOT NULL,
  `charid` int(11) NOT NULL DEFAULT 0,
  `items` longtext NOT NULL DEFAULT '{}',
  `size` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table gumcore. items
CREATE TABLE IF NOT EXISTS `items` (
  `item` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `limit` decimal(10,2) NOT NULL DEFAULT 1.00,
  `can_remove` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(50) DEFAULT NULL,
  `usable` tinyint(1) DEFAULT NULL,
  `descriptions` varchar(255) DEFAULT NULL,
  `metadata` varchar(1) NOT NULL DEFAULT '0',
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item`) USING BTREE,
  KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table gumcore. loadout
CREATE TABLE IF NOT EXISTS `loadout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `charidentifier` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ammo` varchar(255) NOT NULL DEFAULT '{}',
  `dirtlevel` double DEFAULT 0,
  `conditionlevel` double DEFAULT 0,
  `used` tinyint(4) DEFAULT 0,
  `comps` varchar(15000) DEFAULT '{}',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `identifier` (`identifier`),
  KEY `charidentifier` (`charidentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table gumcore. outfits
CREATE TABLE IF NOT EXISTS `outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(45) NOT NULL,
  `charidentifier` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `comps` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`),
  KEY `charidentifier` (`charidentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table gumcore. storages
CREATE TABLE IF NOT EXISTS `storages` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `charid` int(11) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `city` varchar(255) DEFAULT '',
  `upgrade` varchar(255) DEFAULT '0',
  `shared` longtext DEFAULT '[]',
  `prepay` datetime DEFAULT NULL,
  `money` varchar(255) DEFAULT '0',
  `payed` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table gumcore. users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) NOT NULL,
  `group` varchar(50) DEFAULT 'user',
  `warnings` int(11) DEFAULT 0,
  `banned` tinyint(4) DEFAULT 0,
  `chars` int(1) DEFAULT 1,
  PRIMARY KEY (`identifier`) USING BTREE,
  UNIQUE KEY `identifier` (`identifier`) USING BTREE,
  KEY `group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table gumcore. whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
