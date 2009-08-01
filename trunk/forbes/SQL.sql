CREATE TABLE `forbes_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `click` int(11) DEFAULT '0',
  `title` varchar(80) DEFAULT NULL,
  `pubdate` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `rank` smallint(6) DEFAULT '0',
  `content` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

CREATE TABLE `forbes_user_daily_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `sn` int(11) unsigned DEFAULT '0' COMMENT 'ÐòºÅ',
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `limit_time` datetime DEFAULT NULL,
  `is_complete` tinyint(3) DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

CREATE TABLE `forbes_user_daily_accredit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `sn` int(11) unsigned DEFAULT '0' COMMENT 'ÐòºÅ',
  `receiver` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `limit_time` datetime DEFAULT NULL,
  `is_complete` tinyint(3) DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=gbk;

CREATE TABLE `forbes_user_daily_sumup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `sn` int(11) unsigned DEFAULT '0',
  `advance` text,
  `meditate` text,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
