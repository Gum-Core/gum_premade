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

-- Listage des données de la table gumcore.bank_users : ~0 rows (environ)
DELETE FROM `bank_users`;
/*!40000 ALTER TABLE `bank_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_users` ENABLE KEYS */;

-- Listage de la structure de la table gumcore. bans
CREATE TABLE IF NOT EXISTS `bans` (
  `identifier` varchar(50) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `date` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  KEY `identifier` (`identifier`),
  KEY `reason` (`reason`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table gumcore.bans : ~0 rows (environ)
DELETE FROM `bans`;
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;

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

-- Listage de la structure de la table gumcore. drops
CREATE TABLE IF NOT EXISTS `drops` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `drop_list` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7857 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table gumcore.drops : ~0 rows (environ)
DELETE FROM `drops`;
/*!40000 ALTER TABLE `drops` DISABLE KEYS */;
/*!40000 ALTER TABLE `drops` ENABLE KEYS */;

-- Listage de la structure de la table gumcore. inventory_storage
CREATE TABLE IF NOT EXISTS `inventory_storage` (
  `identifier` varchar(50) NOT NULL,
  `charid` int(11) NOT NULL DEFAULT 0,
  `items` longtext NOT NULL DEFAULT '{}',
  `size` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table gumcore.inventory_storage : ~0 rows (environ)
DELETE FROM `inventory_storage`;
/*!40000 ALTER TABLE `inventory_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_storage` ENABLE KEYS */;

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

-- Listage des données de la table gumcore.items : ~338 rows (environ)
DELETE FROM `items`;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`, `descriptions`, `metadata`, `category`) VALUES
	('acid', 'Acid', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Agarita', 'Agarita', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Agarita_Seed', 'Agarita Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Alaskan_Ginseng', 'Alaskan Ginseng', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Alaskan_Ginseng_Seed', 'Alaskan Ginseng Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('alcohol', 'Alcohol', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('American_Ginseng', 'American Ginseng', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('American_Ginseng_Seed', 'American Ginseng Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoarrmownormal', 'Arrow Normal', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoarrowdynamite', 'Arrow Dynamite', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoarrowfire', 'Arrow Fire', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoarrowimproved', 'Arrow Improved', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoarrowpoison', 'Arrow Poison', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoarrowsmallgame', 'Arrow Small Game', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammobolahawk', 'Bola Ammo Hawk', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammobolainterwired', 'Bola Ammo Interwired', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammobolaironspiked', 'Bola Ammo Ironspiked', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammobolla', 'Bolla Ammo', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammodynamite', 'Dynamite Ammo', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoelephant', 'Elephant Rifle Ammo', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoknives', 'Knives Ammo', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammomolotov', 'Molotov Ammo', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammopistolexplosive', 'Pistol Ammo Explosive', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammopistolexpress', 'Pistol Ammo Express', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammopistolnormal', 'Pistol Ammo Normal', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammopistolsplitpoint', 'Pistol Ammo Splitpoint', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammopistolvelocity', 'Pistol Ammo Velocity', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammopoisonbottle', 'Poison Bottle Ammo', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammorepeaterexplosive', 'Repeater Ammo Explosive', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammorepeaterexpress', 'Repeater Ammo Express', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammorepeaternormal', 'Repeater Ammo Normal', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammorepeatersplitpoint', 'Repeater Ammo Splitpoint', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammorepeatervelocity', 'Repeater Ammo Velocity', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammorevolverexplosive', 'Revolver Ammo Explosive', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammorevolverexpress', 'Revolver Ammo Express', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammorevolvernormal', 'Revolver Ammo Normal', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammorevolversplitpoint', 'Revolver Ammo Splitpoint', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammorevolvervelocity', 'Revolver Ammo Velocity', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammorifleexplosive', 'Rifle Ammo Explosive', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammorifleexpress', 'Rifle Ammo Express', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoriflenormal', 'Rifle Ammo Normal', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoriflesplitpoint', 'Rifle Ammo Splitpoint', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoriflevelocity', 'Rifle Ammo Velocity', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoshotgunexplosive', 'Shotgun Ammo Explosive', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoshotgunincendiary', 'Shotgun Ammo Incendiary', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoshotgunnormal', 'Shotgun Ammo Normal', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammoshotgunslug', 'Shotgun Ammo Slug', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammotomahawk', 'Tonmahawk Ammo', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammovarmint', 'Varmint Ammo', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammovarminttranq', 'Varmint Tranquilizer Ammo', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammovoldynamite', 'Volatile Dynamite Ammo', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ammovolmolotov', 'Volatile Molotov Ammo', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('antipoison', 'Antipoison', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('apple', 'Apple', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('appleCrumbMash', 'Minty Berry Mash', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('appleCrumbMoonshine', 'Minty Berry Moonshine', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('a_c_fishbluegil_01_ms', 'Medium Bluegil', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishbluegil_01_sm', 'Small Bluegil', 5.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishbullheadcat_01_ms', 'Medium Bullhead', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishbullheadcat_01_sm', 'Small Bullhead', 5.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishchainpickerel_01_ms', 'Medium Pickerel', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishchainpickerel_01_sm', 'Small Pickerel', 5.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishlargemouthbass_01_ms', 'Lardgemouth Bass', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishperch_01_ms', 'Medium Perch', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishperch_01_sm', 'Small Perch', 5.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishrainbowtrout_01_ms', 'Rainbow Trout', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishredfinpickerel_01_ms', 'Medium Redfin Pickerel', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishredfinpickerel_01_sm', 'Small Redfin Pickerel', 5.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishrockbass_01_ms', 'Medium Rockbass', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishrockbass_01_sm', 'Small Rockbass', 5.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishsalmonsockeye_01_ms', 'Sockeye Salmon', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('a_c_fishsmallmouthbass_01_ms', 'Smallmouth Bass', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('bag_of_cotton', 'Bag of cotton', 0.08, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('bait', 'Bait', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('banana', 'Banana', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('bandage', 'Bandage', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Bay_Bolete', 'Bay Bolete', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Bay_Bolete_Seed', 'Bay Bolete Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('beefjerky', 'Beef Jerky', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('beer', 'Beer', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Big_Leather', 'Big Leather', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Bitter_Weed', 'Bitter Weed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Bitter_Weed_Seed', 'Bitter Weed Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('blackberryale', 'Black Berry Ale', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Black_Berry', 'Black Berry', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Black_Berry_Seed', 'Black Berry Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Black_Currant', 'Black Currant', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Black_Currant_Seed', 'Black Currant Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Blood_Flower', 'Blood Flower', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Blood_Flower_Seed', 'Blood Flower Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('blueberry', 'Blueberry', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('boiledegg', 'Boiled Egg', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('book', 'Book', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('bountylicns', 'Bounty Hunter License', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Bread', 'Bread', 1.00, 1, 'item_standard', 1, 'Pan', '0', NULL),
	('Bulrush', 'Bulrush', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Bulrush_Seed', 'Bulrush Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Burdock_Root', 'Burdock Root', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Burdock_Root_Seed', 'Burdock Root Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('campfire', 'Campfire', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Cardinal_Flower', 'Cardinal Flower', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Cardinal_Flower_Seed', 'Cardinal Flower Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('carrots', 'Carrot', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Chanterelles', 'Chanterelles', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Chanterelles_Seed', 'Chanterelles Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('char', 'Char', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('chewingtobacco', 'Chewing Tobacco', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Choc_Daisy', 'Choc Daisy', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Choc_Daisy_Seed', 'Choc Daisy Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('cigar', 'Cigar', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('cigarette', 'Cigarette', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('cigarettefilter', 'Cig Filter', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('clay', 'Clay', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('coal', 'Coal', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('cocoa', 'Cocoa', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_bluegil', 'Dried Bluegil', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_breakfast', 'Breakfast', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_caramel', 'Caramel', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_chocolate', 'Chocolate Bar', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_coffee', 'Coffee', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_fruitsalad', 'Fruit Salad', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_game', 'Jerkied GameMeat', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_haycube', 'Haycube', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_herb_chanterelles', 'Chanterelles', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_herb_evergreen_huckleberry', 'Evergreen Huckleberry', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_herb_oregano', 'Oregano', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_herb_vanilla_flower', 'Vanilla Flower', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_herb_wintergreen_berry', 'Wintergreen Berry', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_kidneybeans_can', 'Kidney Beans', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_lock_breaker', 'Lock Breaker', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_meat_greavy', 'Meat Stew', 12.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_medicine', 'Medicine', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_peach', 'Peach', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_pear', 'Pear', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_raspberrywater', 'Berry Water', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_salmon', 'Dried Salmon', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_salmon_can', 'Salmon Can', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_trout', 'Cooked Trout', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('consumable_veggies', 'Edible Veggies', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('cookedbluegil', 'Cooked Bluegil with Veggies', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('copper', 'Copper', 30.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('corn', 'Corn', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('cornseed', 'Corn seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Creeking_Thyme', 'Creeping Thyme', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Creeking_Thyme_Seed', 'Creeping Thyme Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Creekplum', 'Creekplum', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Creekplum_Seed', 'Creekplum Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Crows_Garlic', 'Crows Garlic', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Crows_Garlic_Seed', 'Crows Garlic Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Desert_Sage', 'Desert Sage', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Desert_Sage_Seed', 'Desert Sage Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('diamond', 'Diamond', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Drink_For_Dog', 'Pet Water', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Duck_Egg', 'Duck Egg', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('dynamite', 'Pipe charge dynamite', 30.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('eggs', 'Egg', 50.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('emerald', 'Emerald', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('English_Mace', 'English Mace', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('English_Mace_Seed', 'English Mace Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Evergreen_Huckleberry', 'Evergreen Huckleberry', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Evergreen_Huckleberry_Seed', 'Evergreen Huckleberry Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('fan', 'Fan', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Fat', 'Animal Fat', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Feather', 'Feather', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Feed_For_Dog', 'Dog Food', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('fibers', 'Fibers', 20.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('fish', 'Fish', 50.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('fishbait', 'Fishbait', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('fishchips', 'Fish and Chips', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('flag', 'Camp Flag', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('flowercotton', 'Flowe rcotton', 0.01, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('friedtater', 'Fried Taters', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Gamey_Meat', 'Gamey Meat', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Gator_Egg_3', 'Aligator Egg 3', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Gator_Egg_4', 'Aligator Egg 4', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Gator_Egg_5', 'Aligator Egg 5', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ginsengtea', 'Ginseng Tea', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('glassbottle', 'Glass Bottle', 15.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('goldbar', 'GoldBar', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Golden_Currant', 'Golden Currant', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Golden_Currant_Seed', 'Golden Currant Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('goldfish', 'Gold Fish', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('goldnugget', 'Gold nugget', 30.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('goldpan', 'Gold pan', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('goldring', 'Gold Ring', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Goose_Egg_4', 'Goose Egg', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('hairpomade', 'Hair Pomade', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('handcuffs', 'Handcuffs', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('hatchet', 'Hatchet', 1.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Health_For_Dog', 'Pet Bandages', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('hemp', 'Hemp', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('hemp_cig', 'Hemp Cigarette', 1.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('herbmed', 'Herbal Remedy', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('heroin', 'Heroin', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('honey', 'Honey', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('horsebrush', 'Horse Brush', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Hummingbird_Sage', 'Hummingbird Sage', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Hummingbird_Sage_Seed', 'Hummingbird Sage Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('hwood', 'Hard Wood', 20.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('Indian_Tobbaco', 'Indian Tobbaco', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Indian_Tobbaco_Seed', 'Indian Tobbaco Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('iron', 'Iron Ore', 30.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ironbar', 'Iron Bar', 30.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('ironextract', 'Iron Extract', 1.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('ironhammer', 'Iron Hammer', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('kit_bandana', 'Bandana', 2.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('leather', 'Leather', 50.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('lockpick', 'Lockpick', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('lockpickmold', 'Lockpick Mold', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('mackerel', 'Mackerel', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('meat', 'Meat', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('milk', 'Milk', 50.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Milk_Weed', 'Milk Weed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Milk_Weed_Seed', 'Milk Weed Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('moonshine', 'Moonshine', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('morpcert', 'Morphine Perscription', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('morphine', 'Morphine', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('mp001_p_mp_still02x', 'Brennerei', 1.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Mutton', 'Mutton', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('nails', 'Nails', 40.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('newspaper', 'NewsPaper', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('nitrite', 'Nitrite', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('nitroglyserolia', 'Nitroglycerol', 30.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('notebook', 'Notebook', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Oleander_Sage', 'Oleander Sage', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Oleander_Sage_Seed', 'Oleander Sage Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('orden_presidente', 'Order of the President', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('Oregano', 'Oregano', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Oregano_Seed', 'Oregano Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('paper', 'Paper', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Parasol_Mushroom', 'Parasol Mushroom', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Parasol_Mushroom_Seed', 'Parasol Mushroom Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('pickaxe', 'Pickaxe', 1.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('pipe', 'Pipe', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('pocket_watch', 'Pocket Watch', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('potato', 'Potato', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Prairie_Poppy', 'Prairie Poppy', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Prairie_Poppy_Seed', 'Prairie Poppy Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('provision_jail_keys', 'Jail Keys', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('pulp', 'Pulp', 20.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('p_barrelmoonshine', 'Barrel', 1.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('quartz', 'Quartz', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('rajahdysoljy', 'Explosive Oil', 30.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Rams_Head', 'Rams Head', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Rams_Head_Seed', 'Rams Head Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('raspberryale', 'Raspberry Ale', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Red_Raspberry', 'Red Raspberry', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Red_Raspberry_Seed', 'Red Raspberry Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Red_Sage', 'Red Sage', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Red_Sage_Seed', 'Red Sage Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('repeaterbarrel', 'Repeater Barrel', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('repeatermold', 'Repeater Mold', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('repeaterreceiver', 'Repeater Receiver', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('repeaterrecmold', 'Repeater Receiver Mold', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('repeaterstock', 'Repeater Stock', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('revolverbarrel', 'Revolver Barrel', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('revolvercylinder', 'Revolver Cylinder', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('revolverhandle', 'Revolver Handle', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('revolvermold', 'Revolver Mold', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('riflebarrel', 'Rifle Barrel', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('riflemold', 'Rifle Mold', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('riflereceiver', 'Rifle Receiver', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('riflerecmold', 'Rifle Receiver Mold', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('riflestock', 'Rifle Stock', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('roach', 'Roach', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('rock', 'Rock', 30.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('rollingpaper', 'Rolling paper', 30.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('rubber', 'Rubber', 20.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('salamelle', 'Fresh Pork ', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('salmon', 'Salmon', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('salt', 'Salt', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Saltbush', 'Saltbush', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Saltbush_Seed', 'Saltbush Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('sap', 'Sap', 20.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('sarsaparilla', 'Sarsaparilla', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('scale', 'Scale', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('secondchance', 'Second Chance', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('shellcasing', 'Shell Casing', 40.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('shotgunbarrel', 'Shotgun Barrel', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('shotgunmold', 'Shotgun Mold', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('shotgunstock', 'Shotgun Stock', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('shrimps', 'Shrimp Stew', 1.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Small_Leather', 'Small Leather', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('SnakeSkin', 'Snake Skin', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Snake_Poison', 'Snake Poison', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('soborno', 'Soborno Alcohol', 15.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('steak', 'Steak', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('steakveg', 'Steak with Veggies', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('stim', 'Horse Stimulant', 2.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('stolenmerch', 'Stolen Items', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('stonehammer', 'Stone Hammer', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('sugar', 'Sugar', 20.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('sugarcaneseed', 'Surgarcane seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('sulfur', 'Sulfur', 30.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('syn', 'Syn', 50.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('synpackage', 'Syn Package', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('syringe', 'Syringe', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('syringecert', 'Syringe Cert', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('tent', 'Tent', 1.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('tequila', 'Tequila', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Texas_Bonnet', 'Texas Bonnet', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Texas_Bonnet_Seed', 'Texas Bonnet Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('token', 'Camp License', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('trainkey', 'Train Key', 1.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('tropicalPunchMash', 'Ginseng Mash', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('tropicalPunchMoonshine', 'Ginseng Moonshine', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('trout', 'Trout', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('TurtleShell', 'Turtle Shell', 20.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('tylenol', 'Tylenol', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('vanillaFlower', 'Vanille Flower', 20.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('Violet_Snowdrop', 'Violet Snowdrop', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Violet_Snowdrop_Seed', 'Violet Snowdrop Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('vodka', 'Vodka', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Volture_Egg', 'Volture Egg', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('water', 'Water', 15.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('wateringcan', 'Water Jug', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('wateringcan_dirtywater', 'Dirty Watering Jug', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('wateringcan_empty', 'Empty Watering Jug', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('whisky', 'Whisky', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('wildCiderMash', 'Black Berry Mash', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('wildCiderMoonshine', 'Black Berry Moonshine', 10.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('Wild_Carrot', 'Wild Carrot', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Wild_Carrot_Seed', 'Wild Carrot Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Wild_Feverfew', 'Wild Feverfew', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Wild_Feverfew_Seed', 'Wild Feverfew Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Wild_Mint', 'Wild Mint', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Wild_Mint_Seed', 'Wild Mint Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Wild_Rhubarb', 'Wild Rhubarb', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Wild_Rhubarb_Seed', 'Wild Rhubarb Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('wine', 'Wine', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Wintergreen_Berry', 'Wintergreen Berry', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Wintergreen_Berry_Seed', 'Wintergreen Berry Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Wisteria', 'Wisteria', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Wisteria_Seed', 'Wisteria Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('wojape', 'Wojape', 5.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('wood', 'Soft Wood', 20.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('wooden_boards', 'Wooden Boards', 25.00, 1, 'item_standard', 0, 'descriptions', '0', NULL),
	('wool', 'Wool', 50.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Yarrow', 'Yarrow', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL),
	('Yarrow_Seed', 'Yarrow Seed', 10.00, 1, 'item_standard', 1, 'descriptions', '0', NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

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

-- Listage des données de la table gumcore.loadout : ~0 rows (environ)
DELETE FROM `loadout`;
/*!40000 ALTER TABLE `loadout` DISABLE KEYS */;
/*!40000 ALTER TABLE `loadout` ENABLE KEYS */;

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

-- Listage des données de la table gumcore.outfits : ~0 rows (environ)
DELETE FROM `outfits`;
/*!40000 ALTER TABLE `outfits` DISABLE KEYS */;
/*!40000 ALTER TABLE `outfits` ENABLE KEYS */;

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

-- Listage des données de la table gumcore.storages : ~0 rows (environ)
DELETE FROM `storages`;
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;

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

-- Listage des données de la table gumcore.users : ~2 rows (environ)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`identifier`, `group`, `warnings`, `banned`, `chars`) VALUES
	('steam:', 'user', 0, 0, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Listage de la structure de la table gumcore. whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table gumcore.whitelist : ~0 rows (environ)
DELETE FROM `whitelist`;
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
