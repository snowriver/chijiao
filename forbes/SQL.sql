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
  `sn` int(11) unsigned DEFAULT '0' COMMENT '序号',
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `limit_time` datetime DEFAULT NULL,
  `is_complete` tinyint(3) DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

CREATE TABLE `forbes_user_daily_accredit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `sn` int(11) unsigned DEFAULT '0' COMMENT '序号',
  `receiver` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `limit_time` datetime DEFAULT NULL,
  `is_complete` tinyint(3) DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

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

CREATE TABLE `forbes_user_week_attitude` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `confident` enum('Y','N') DEFAULT 'Y' COMMENT '自信',
  `intent` enum('Y','N') DEFAULT 'Y' COMMENT '决心',
  `initiative` enum('Y','N') DEFAULT 'Y' COMMENT '主动',
  `ebullient` enum('Y','N') DEFAULT 'Y' COMMENT '热情',
  `love` enum('Y','N') DEFAULT 'Y' COMMENT '爱心',
  `study` enum('Y','N') DEFAULT 'Y' COMMENT '学习',
  `autonomic` enum('Y','N') DEFAULT 'Y' COMMENT '自律',
  `pertinacious` enum('Y','N') DEFAULT 'Y' COMMENT '顽强',
  `insist` enum('Y','N') DEFAULT 'Y' COMMENT '坚持',
  `serious` enum('Y','N') DEFAULT 'Y' COMMENT '认真',
  `rapid` enum('Y','N') DEFAULT 'Y' COMMENT '迅速',
  `optimism` enum('Y','N') DEFAULT 'Y' COMMENT '乐观',
  `innovation` enum('Y','N') DEFAULT 'Y' COMMENT '创新',
  `honest` enum('Y','N') DEFAULT 'Y' COMMENT '真诚',
  `responsibility` enum('Y','N') DEFAULT 'Y' COMMENT '负责',
  `sonsy` enum('Y','N') DEFAULT 'Y' COMMENT '豁达',
  `diligence` enum('Y','N') DEFAULT 'Y' COMMENT '勤奋',
  `humility` enum('Y','N') DEFAULT 'Y' COMMENT '谦虚',
  `purpose` enum('Y','N') DEFAULT 'Y' COMMENT '企图心',
  `clear` enum('Y','N') DEFAULT 'Y' COMMENT '日清日新',
  `dobest` enum('Y','N') DEFAULT 'Y' COMMENT '全力以赴',
  `team` enum('Y','N') DEFAULT 'Y' COMMENT '团队精神',
  `sluggish` enum('Y','N') DEFAULT 'N' COMMENT '拖沓',
  `inferiority` enum('Y','N') DEFAULT 'N' COMMENT '自卑',
  `fluke` enum('Y','N') DEFAULT 'N' COMMENT '侥幸',
  `conceited` enum('Y','N') DEFAULT 'N' COMMENT '自满',
  `pride` enum('Y','N') DEFAULT 'N' COMMENT '骄傲',
  `boggle` enum('Y','N') DEFAULT 'N' COMMENT '犹豫',
  `acedia` enum('Y','N') DEFAULT 'N' COMMENT '懒惰',
  `anxiety` enum('Y','N') DEFAULT 'N' COMMENT '忧虑',
  `falsity` enum('Y','N') DEFAULT 'N' COMMENT '虚伪',
  `dream` enum('Y','N') DEFAULT 'N' COMMENT '空想',
  `adamancy` enum('Y','N') DEFAULT 'N' COMMENT '固执',
  `cynical` enum('Y','N') DEFAULT 'N' COMMENT '愤世',
  `vulgar` enum('Y','N') DEFAULT 'N' COMMENT '庸俗',
  `recreance` enum('Y','N') DEFAULT 'N' COMMENT '懦弱',
  `peacockery` enum('Y','N') DEFAULT 'N' COMMENT '虚荣',
  `avarice` enum('Y','N') DEFAULT 'N' COMMENT '贪婪',
  `asocial` enum('Y','N') DEFAULT 'N' COMMENT '自私',
  `fussy` enum('Y','N') DEFAULT 'N' COMMENT '急躁',
  `testiness` enum('Y','N') DEFAULT 'N' COMMENT '易怒',
  `despair` enum('Y','N') DEFAULT 'N' COMMENT '绝望',
  `begrudge` enum('Y','N') DEFAULT 'N' COMMENT '嫉妒',
  `excuse` enum('Y','N') DEFAULT 'N' COMMENT '找借口',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

CREATE TABLE `forbes_user_week_aim_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `career_done` varchar(255) DEFAULT NULL,
  `career_next` varchar(255) DEFAULT NULL,
  `family_done` varchar(255) DEFAULT NULL,
  `family_next` varchar(255) DEFAULT NULL,
  `contact_done` varchar(255) DEFAULT NULL,
  `contact_next` varchar(255) DEFAULT NULL,
  `finance_done` varchar(255) DEFAULT NULL,
  `finance_next` varchar(255) DEFAULT NULL,
  `spirit_done` varchar(255) DEFAULT NULL,
  `spirit_next` varchar(255) DEFAULT NULL,
  `health_done` varchar(255) DEFAULT NULL,
  `health_next` varchar(255) DEFAULT NULL,
  `other_done` varchar(255) DEFAULT NULL,
  `other_next` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

CREATE TABLE `forbes_user_week_ability` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `user_id` int(11) unsigned default NULL,
  `date` date default NULL,
  `ardour` enum('Y','N') default 'Y' COMMENT '激情',
  `promises` enum('Y','N') default 'Y' COMMENT '承诺',
  `responsibility` enum('Y','N') default 'Y' COMMENT '负责任',
  `admire` enum('Y','N') default 'Y' COMMENT '欣赏',
  `contribute` enum('Y','N') default 'Y' COMMENT '贡献',
  `believe` enum('Y','N') default 'Y' COMMENT '信任',
  `win-win` enum('Y','N') default 'Y' COMMENT '共赢',
  `listen` enum('Y','N') default 'Y' COMMENT '聆听',
  `focus` enum('Y','N') default 'Y' COMMENT '注视',
  `echo` enum('Y','N') default 'Y' COMMENT '回应',
  `praise` enum('Y','N') default 'Y' COMMENT '赞美',
  `convince` enum('Y','N') default 'Y' COMMENT '说服',
  `feedback` enum('Y','N') default 'Y' COMMENT '反馈',
  `thank` enum('Y','N') default 'Y' COMMENT '感谢',
  `visualize` enum('Y','N') default 'Y' COMMENT '个人形象',
  `study` enum('Y','N') default 'Y' COMMENT '学习',
  `innovation` enum('Y','N') default 'Y' COMMENT '创新',
  `love` enum('Y','N') default 'Y' COMMENT '爱心',
  `gumption` enum('Y','N') default 'Y' COMMENT '进取心',
  `purpose` enum('Y','N') default 'Y' COMMENT '企图心',
  `intent` enum('Y','N') default 'Y' COMMENT '决心',
  `professional` enum('Y','N') default 'Y' COMMENT '专业知识',
  `willpower` enum('Y','N') default 'Y' COMMENT '毅力',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

CREATE TABLE `forbes_user_month_aim_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `year` smallint(4) unsigned DEFAULT '2010',
  `month` tinyint(3) unsigned DEFAULT NULL,
  `career_aim` varchar(255) DEFAULT NULL,
  `career_plan` varchar(255) DEFAULT NULL,
  `family_aim` varchar(255) DEFAULT NULL,
  `family_plan` varchar(255) DEFAULT NULL,
  `contact_aim` varchar(255) DEFAULT NULL,
  `contact_plan` varchar(255) DEFAULT NULL,
  `finance_aim` varchar(255) DEFAULT NULL,
  `finance_plan` varchar(255) DEFAULT NULL,
  `spirit_aim` varchar(255) DEFAULT NULL,
  `spirit_plan` varchar(255) DEFAULT NULL,
  `health_aim` varchar(255) DEFAULT NULL,
  `health_plan` varchar(255) DEFAULT NULL,
  `other_aim` varchar(255) DEFAULT NULL,
  `other_plan` varchar(255) DEFAULT NULL,
  `limit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

CREATE TABLE `forbes_user_year_aim_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `year` smallint(4) unsigned DEFAULT '2010',
  `quarter` tinyint(3) unsigned DEFAULT '1',
  `first_month` text,
  `second_month` text,
  `third_month` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

CREATE TABLE `forbes_user_month_sumup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `year` smallint(4) unsigned DEFAULT '2010',
  `month` tinyint(3) unsigned DEFAULT '1',
  `aim` text,
  `gain` text,
  `challenge` text,
  `improve` text,
  `analyse` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

CREATE TABLE `forbes_user_life_stage_aim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `years` tinyint(3) DEFAULT NULL,
  `aim` text,
  `limit_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;