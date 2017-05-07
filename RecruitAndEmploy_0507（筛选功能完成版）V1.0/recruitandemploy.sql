# Host: localhost  (Version: 5.5.22)
# Date: 2017-05-07 01:09:10
# Generator: MySQL-Front 5.3  (Build 4.9)

/*!40101 SET NAMES utf8 */;

#
# Source for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `fk_number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员登录表';

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES (1,'chenwenting321','12345678'),(2,'wenting530','QAZXSWqaz');

#
# Source for table "enterpriseinformation"
#

DROP TABLE IF EXISTS `enterpriseinformation`;
CREATE TABLE `enterpriseinformation` (
  `idEnterpriseInformation` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `mailbox` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `Authentication` varchar(45) DEFAULT NULL,
  `homepage` varchar(45) DEFAULT NULL,
  `trademark` varchar(45) DEFAULT NULL,
  `BusinessLicense` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEnterpriseInformation`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COMMENT='企业基本信息表';

#
# Data for table "enterpriseinformation"
#

INSERT INTO `enterpriseinformation` VALUES (10,'','','0','','','1','','',''),(151,'123456','sdf','33333333333','121@qq.com','sdf ','1','sdf','dsfds','fdsf'),(152,'121',NULL,NULL,'12@qq.com',NULL,'0',NULL,NULL,NULL),(153,'12345678','qqqq','12345678909','woaiher@qq.com','qqqqq','0','qqqq','qqq','qqq'),(154,'12345678','么么么有限公司','12343545678','111@qq.com','广东省珠海吉林大学珠海学院','1','http://mmm.com','sss','sss'),(155,'1111111','111','11111111111','121@qq.com','1111','1','11','11','11'),(156,'123456789','呵呵呵服务公司','13456576876','woaiher11@qq.com','广东省珠海市吉林大学珠海学院创业孵化基地','1','ss','qq ','qq '),(157,'12345678','aa','13232345634','woaiher111@qq.com','aaa','1','aa','aa','aa'),(158,'aaaaaaaa','aaa','12312343555','woaiaher@qq.com','aaaa','1','aaa','aaa','aaa'),(159,'11111111','qqq','11111111111','woaqiher11@qq.com','qqqqq','1','11111','1111','1111'),(160,'1111111111','abn','13243454545','woaiheqr11@qq.com','guangbSSS','1','11111','1111','1111'),(161,'12345678','111','11111111111','11dd@qq.com','1111','1','1111','111','1111'),(162,'12345678','黑寡妇','12323232343','gg@qq.com','香洲','1','灌灌灌灌','857f9edb-9c8e-4db3-9232-411a1d0ae9c0.png','3a81712c-3a3b-49eb-9977-fb5dd2bb277b.gif');

#
# Source for table "industry"
#

DROP TABLE IF EXISTS `industry`;
CREATE TABLE `industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk COMMENT='种类表';

#
# Data for table "industry"
#

INSERT INTO `industry` VALUES (1,'传媒'),(2,'旅游'),(3,'服装'),(4,'运输物流'),(5,'教政'),(6,'IT'),(7,'酒店餐饮'),(8,'建筑'),(9,'其他');

#
# Source for table "job"
#

DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `industryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1` (`industryid`),
  CONSTRAINT `fk1` FOREIGN KEY (`industryid`) REFERENCES `industry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=gbk COMMENT='具体职位表';

#
# Data for table "job"
#

INSERT INTO `job` VALUES (1,'编导',1),(2,'制片',1),(3,'后期',1),(4,'编剧',1),(5,'剪辑',1),(6,'平面设计',1),(7,'图形设计',1),(8,'舞台设计',1),(9,'原画师',1),(10,'美术',1),(11,'策划',1),(12,'广告',1),(13,'文案',1),(14,'排版',1),(15,'印刷',1),(16,'美术编辑',1),(17,'视频编辑',1),(18,'记者',1),(19,'网络编辑',1),(20,'摄影记者',1),(21,'导游',2),(22,'领队',2),(23,'司机',2),(24,'旅行社',2),(25,'外联',2),(26,'旅游企划',2),(27,'产品',2),(28,'项目',2),(29,'技术',2),(30,'旅游电商运营',2),(31,'培训',2),(32,'翻译',2),(33,'旅游传媒',2),(34,'旅游策划',2),(35,'高尔夫',2),(36,'市场',2),(37,'推广',2),(38,'产品',2),(39,'拓展',2),(40,'面料设计',3),(41,'服装陈列',3),(42,'平面设计',3),(43,'童装设计',3),(44,'搭配师',3),(45,'厂长',3),(46,'样衣工',3),(47,'裁缝',3),(48,'针织',3),(49,'量体师',3),(50,'纸样师',3),(51,'销售总监',3),(52,'销售经理',3),(53,'营业员',3),(54,'模特',3),(55,'客服',3),(56,'总经理',3),(57,'行政总监',3),(58,'财务',3),(59,'人力资源',3),(60,'收银员',3),(61,'后勤',3),(62,'物流',4),(63,'运输',4),(64,'快递',4),(65,'仓库',4),(66,'理货',4),(67,'贸易',4),(68,'货运',4),(69,'供应商 ',4),(70,'总经理',4),(71,'秘书',4),(72,'运营主管',4),(73,'调研',4),(74,'策划',4),(75,'园长',5),(76,'幼儿教师',5),(77,'保育',5),(78,'医生',5),(79,'校长',5),(80,'主任',5),(81,'语文',5),(82,'数学',5),(83,'英语',5),(84,'教导',5),(85,'物理',5),(86,'化学',5),(87,'历史',5),(88,'地理',5),(89,' 生物',5),(90,'高职',5),(91,'外语',5),(92,'辅导',5),(93,'家教',5),(94,'架构师',6),(95,'网络开发',6),(96,'前端',6),(97,'脚本开发',6),(98,'UI设计',6),(99,' 电子商务',6),(100,'游戏',6),(101,'技术总监',6),(102,'维护',6),(103,'信息技术',6),(104,'项目',6),(105,'网络安全',6),(106,'系统测试',6),(107,'文档',6),(108,'系统工程',6),(109,'软件工程',6),(110,'PHP',6),(111,'计算机辅助 ',6),(112,'IOS',6),(113,'Android',6),(114,'程序员',6),(115,'数据库',6),(116,'硬件工程师',6),(117,'硬件维护',6),(118,'CEO',6),(119,'COO ',6),(120,'O1O',6),(121,'CTO',6),(122,'大堂',7),(123,'迎宾',7),(124,'礼仪',7),(125,'传菜',7),(126,'服务',7),(127,'中式厨师',7),(128,'西式厨师',7),(129,'营养',7),(130,'切配',7),(131,'厨工',7),(132,'清洁',7),(133,'楼面',7),(134,'维修',7),(135,'连锁',7),(136,'招商 ',7),(137,'企划',7),(138,'经理',7),(139,'主管',7),(140,'空间设计',8),(141,'结构设计',8),(142,'方案设计',8),(143,'建筑师',8),(144,'管道设计',8),(145,'照明设计',8),(146,'园林设计',8),(147,'园艺工程师',8),(148,'景观工程师',8),(149,'植物造景',8),(150,'绿化工程师',8),(151,'园林养护师 ',8),(152,'造价员',8),(153,'房地产策划',8),(154,' 招投标员',8),(155,'物业',8),(156,'维修 ',8),(157,'行政后勤',8),(158,'文秘',8),(159,'销售',8),(160,'质检工程师',8),(161,'试验员',8),(162,'出纳',8),(163,'经理 ',8);

#
# Source for table "enterpriserecruitment"
#

DROP TABLE IF EXISTS `enterpriserecruitment`;
CREATE TABLE `enterpriserecruitment` (
  `idEnterpriseRecruitment` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `requirement` varchar(45) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `isending` int(45) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '0',
  `workingPlace` varchar(45) DEFAULT NULL,
  `idEnterpriseInformation` int(11) NOT NULL,
  `salary` int(11) DEFAULT '1',
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEnterpriseRecruitment`),
  KEY `fk_EnterpriseRecruitment_EnterpriseInformation_idx` (`idEnterpriseInformation`),
  KEY `position` (`position`),
  CONSTRAINT `enterpriserecruitment_ibfk_1` FOREIGN KEY (`position`) REFERENCES `job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EnterpriseRecruitment_EnterpriseInformation` FOREIGN KEY (`idEnterpriseInformation`) REFERENCES `enterpriseinformation` (`idEnterpriseInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='招聘信息表';

#
# Data for table "enterpriserecruitment"
#

INSERT INTO `enterpriserecruitment` VALUES (1,'111','11','2017-03-22 21:05:28','1995-11-11 11:11:11',1,1,'11',10,11,111),(2,'22','22','2017-03-22 21:19:39','1995-11-11 11:11:11',1,1,'222',10,22,22),(3,'55',NULL,NULL,NULL,2,1,NULL,151,NULL,NULL),(4,'111','11','2017-03-23 20:25:32','1995-11-11 11:11:11',2,1,'111',151,111,111),(5,'55','55','2017-03-23 20:26:33','1995-11-11 11:11:11',1,1,'555',10,55,55),(7,'77','77','2017-03-23 21:03:40','1995-11-11 11:11:11',1,1,'77',10,77,77),(8,'55','55','2017-03-23 23:00:28','1995-11-11 11:11:11',2,1,'55',151,55,55),(10,'9','9','2017-03-24 19:19:36','1995-11-11 11:11:11',2,1,'9',151,9,9),(15,'555',NULL,NULL,NULL,2,1,NULL,151,1,NULL),(16,'55','55','2017-03-24 21:45:18','1995-11-11 11:11:11',2,1,'5555',151,5555,5555),(18,'77','777','2017-03-26 23:30:45','1995-11-11 11:11:11',1,1,'77',151,77,77),(19,'去去去','问问','2017-04-08 19:18:37','2018-09-11 00:00:00',1,43,'',153,11111,111),(20,'11','11','2017-04-08 19:22:57','2018-09-11 00:00:00',1,26,'',153,11111,11),(21,'java','精通java','2017-04-08 19:27:16','2018-09-11 00:00:00',1,2,'',153,11111,11),(22,'java去','去去去','2017-04-08 19:28:45','2018-09-11 00:00:00',1,1,'斗门区',153,2000,12),(23,'java工程师','优质人心，有耐心，复制人，有java编程基础，有一到两年实习经验为优','2017-04-10 17:08:37','2017-04-29 00:00:00',1,28,'上海',153,20000,12),(24,'珠海工程师','噶巴萨大的阿森纳好的撒大哥哈斯给大神的感受 ','2017-04-12 09:31:50','2017-04-30 00:00:00',1,21,'斗门区',154,2000,19),(25,'发','方法','2017-04-16 17:08:01','2017-04-30 00:00:00',1,2,'斗门区',156,3333,33),(26,'Php程序员','回答出我的问题\r\n会打代码\r\n有连年编程基础\r\n有项目经验','2017-04-16 21:03:14','2017-05-10 00:00:00',1,110,'香洲区',156,333,11),(27,'Php程序员','回答出我的问题\r\n会打代码\r\n有连年编程基础\r\n有项目经验','2017-04-16 21:05:57','2017-05-10 00:00:00',1,110,'香洲区',156,3000,11),(28,'sss','sss','2017-05-02 22:54:15','2017-05-10 00:00:00',1,46,'香洲区',155,1111,11),(29,'java实习生','java实习生','2017-05-06 22:24:19','2017-06-16 00:00:00',1,25,'金湾区',156,3000,222),(30,'PHP实习生','PHP实习生','2017-05-06 22:24:49','2017-05-31 00:00:00',1,66,'高新区',156,2000,1),(31,'搜索优化','搜索优化','2017-05-06 22:29:18','2017-07-07 00:00:00',1,103,'香洲区',156,222,11),(32,'幼儿园教师','算数','2017-05-06 22:30:48','2017-05-09 00:00:00',1,76,'高栏港经济区',156,5000,11),(35,'333','333',NULL,'2017-05-09 00:00:00',1,2,'香洲区',151,20001,2);

#
# Source for table "personalinformation"
#

DROP TABLE IF EXISTS `personalinformation`;
CREATE TABLE `personalinformation` (
  `idPersonalInformation` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `birth` date DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `phone` char(11) NOT NULL,
  `mailbox` varchar(45) DEFAULT NULL,
  `nation` varchar(45) DEFAULT NULL,
  `householdRegister` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `education` varchar(45) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `politicalStatus` varchar(45) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL COMMENT '证件照',
  PRIMARY KEY (`idPersonalInformation`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='个人信息表';

#
# Data for table "personalinformation"
#

INSERT INTO `personalinformation` VALUES (4,'11','11',NULL,'11','11','11',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'','',NULL,'','1','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'QAZXSW','',NULL,'','','1111@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'','',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'','',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'','',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'123456','abc','1994-09-08','女','12345678910','11@qq.com','汉族','广东珠海','广东省揭阳市小千县积极街道66号','本科','吉林大学珠海学院','团员','35f88b9b-3faa-49c1-ad74-b8e0f1fae407.jpg'),(11,'12345678','uu','1765-09-09','男','11111111111','12345@qq.com','汉族','qqq','广东急用','qqq','qqq','预备党员','2cb8a24f-378e-4d8e-bc55-b0ea524ec063.jpg'),(12,'12345678','程华','1998-09-09','女','12323234343','we@qq.com','朝鲜族','江西','江西','高中','揭阳华侨中学','团员','8767d60a-3ca4-4b74-9de7-70cd5f03c18e.jpg'),(13,'lijunji123','李俊基','1998-09-09','男','13631291632','lijunji@qq.com','汉族','广西桂林','广西桂林几号路XXX街道ＸＸ号','本科','华南理工大学','共青团员','9bed6298-e319-4580-8d61-4f2769ed9460.jpg');

#
# Source for table "resume"
#

DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `idResume` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `hobby` varchar(45) DEFAULT NULL,
  `HandsOnBackground` varchar(45) DEFAULT NULL,
  `awardSituation` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `workingPlace` varchar(45) DEFAULT NULL,
  `idPersonalInformation` int(11) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idResume`),
  KEY `fk_Resume_PersonalInformation1_idx` (`idPersonalInformation`),
  CONSTRAINT `fk_Resume_PersonalInformation1` FOREIGN KEY (`idPersonalInformation`) REFERENCES `personalinformation` (`idPersonalInformation`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='简历表';

#
# Data for table "resume"
#

INSERT INTO `resume` VALUES (1,'11','11','11','11','11','11',10,'2017-03-22 19:41:26',NULL),(2,'88','88','88','88','88','88',10,'2017-03-24 19:11:37',NULL),(3,'77','77','77','77','77','77',4,'2017-03-24 19:14:06',NULL),(5,'66','666','6666','66','66','66',11,'2017-03-28 08:49:38',NULL),(6,'求ｊａｖａ实习','打代码，吃饭，睡觉','无','无','ｊａｖａ实习','珠海金湾',13,'2017-04-17 18:32:52',NULL),(7,'哈哈哈','啊啊啊','啊啊啊','啊啊啊','啊啊','啊啊',12,'2017-04-17 23:15:04',NULL);

#
# Source for table "application"
#

DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `idApplication` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NULL DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `idResume` int(11) NOT NULL,
  `idEnterpriseRecruitment` int(11) NOT NULL,
  PRIMARY KEY (`idApplication`),
  KEY `fk_Application_Resume1_idx` (`idResume`),
  KEY `fk_Application_EnterpriseRecruitment1_idx` (`idEnterpriseRecruitment`),
  CONSTRAINT `fk_Application_EnterpriseRecruitment1` FOREIGN KEY (`idEnterpriseRecruitment`) REFERENCES `enterpriserecruitment` (`idEnterpriseRecruitment`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Application_Resume1` FOREIGN KEY (`idResume`) REFERENCES `resume` (`idResume`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='简历投递表';

#
# Data for table "application"
#

INSERT INTO `application` VALUES (4,'2017-03-27 14:34:43','邀请',1,1),(5,'2017-03-27 14:35:05','未查看',1,2),(6,NULL,'拒绝',1,4),(8,NULL,'未查看',1,3),(10,NULL,'拒绝',1,5),(14,'2017-03-27 14:49:43','未查看',2,1),(15,'2017-03-27 14:49:58','未查看',1,1),(16,'2017-03-27 14:50:17','未查看',1,1),(17,'2017-03-28 00:23:31','未查看',1,1),(18,'2017-03-28 08:51:59','未查看',5,7),(21,NULL,NULL,1,3),(23,'2017-04-12 01:21:39','未查看',1,19),(24,'2017-04-12 08:45:00','未查看',1,21),(25,'2017-05-06 21:59:02','未查看',1,22),(26,'2017-05-06 22:00:20','未查看',2,1);

#
# Source for view "view1"
#

DROP VIEW IF EXISTS `view1`;
CREATE VIEW `view1` AS 
  select `recruitandemploy`.`application`.`idEnterpriseRecruitment` AS `idEnterpriseRecruitment`,`recruitandemploy`.`enterpriserecruitment`.`idEnterpriseInformation` AS `idEnterpriseInformation`,`recruitandemploy`.`application`.`state` AS `state`,`recruitandemploy`.`application`.`idResume` AS `idResume`,`recruitandemploy`.`application`.`time` AS `time`,`recruitandemploy`.`application`.`idApplication` AS `idApplication` from (`recruitandemploy`.`application` join `recruitandemploy`.`enterpriserecruitment`) where (`recruitandemploy`.`application`.`idEnterpriseRecruitment` = `recruitandemploy`.`enterpriserecruitment`.`idEnterpriseRecruitment`);
