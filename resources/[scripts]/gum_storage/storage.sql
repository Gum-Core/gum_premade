CREATE TABLE `storages` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

CREATE TABLE `bank_users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1;