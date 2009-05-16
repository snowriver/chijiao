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