# Host: localhost  (Version: 5.5.22)
# Date: 2017-06-06 14:40:14
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员登录表';

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES (1,'admin','admin');

#
# Source for table "enterpriseinformation"
#

DROP TABLE IF EXISTS `enterpriseinformation`;
CREATE TABLE `enterpriseinformation` (
  `idEnterpriseInformation` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `mailbox` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `Authentication` varchar(10) DEFAULT '0',
  `homepage` varchar(500) DEFAULT NULL,
  `trademark` varchar(500) DEFAULT NULL,
  `BusinessLicense` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idEnterpriseInformation`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

#
# Data for table "enterpriseinformation"
#

INSERT INTO `enterpriseinformation` VALUES (10,'123456','林干妈有限公司','07888697644','lin@qq.com','吉林大学珠海学院','2','','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png'),(151,'123456','记书大有限公司','15119534661','11@qq.com','吉林大学珠海学院','1','jluzh.com','0919a707-5c0e-454b-bd05-8d383461c4cf.jpg','0919a707-5c0e-454b-bd05-8d383461c4cf.jpg'),(152,'121asd','林干爹有限公司','12345678974','12@qq.com','吉林大学珠海学院','1',NULL,'d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png'),(153,'11','林妹妹有限公司','32345311215','855','吉林大学珠海学院','1',NULL,'d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png'),(154,'123456','林干福有限公司','12345678910','123@qq.com','吉林大学珠海学院','2','11','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png'),(155,'123456','林干妹有限公司','22222222222','a@qq.com','吉林大学珠海学院','1','222','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png'),(156,'123456','电脑公司','15119534661','1051209415@qq.com','吉林大学珠海学院','1','baidu.com','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png'),(157,'123456','林干哈有限公司','11111111111','123456@qq.com','吉林大学珠海学院','1','11111111111','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d1433653-2970-4b75-a114-47a49b7b2dc1.jpg'),(158,'12345678a','威欧克斯（北京）信息技术有限公司\r\n','13567656545','112@163.com','北京朝阳区小营路9号银座九号大厦二层','1','http://www.taomingshi.com','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d1433653-2970-4b75-a114-47a49b7b2dc1.jpg'),(159,'12345678a','上海翰鑫信息科技有限公司\r\n','13567656546','113@163.com','上海浦东新区峨山路91弄58号B座4楼','1','http://www.bypay.cn','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d1433653-2970-4b75-a114-47a49b7b2dc1.jpg'),(160,'12345679a','上海泽维信息技术有限公司\r\n','13567656547','114@163.com','上海上海','2','http://www.lagou.com','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d1433653-2970-4b75-a114-47a49b7b2dc1.jpg'),(161,'12345680a','上海奕行信息科技公司\r\n','13567656548','115@163.com','上海上海','1','http://www.51yixing.com','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d1433653-2970-4b75-a114-47a49b7b2dc1.jpg'),(162,'12345681a','天翼科技创业投资有限公司\r\n','13567656549','116@163.com','上海上海市浦东新区杨高南路5678号中国电信信息园区','2','http://www.189chuangyi.com','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d1433653-2970-4b75-a114-47a49b7b2dc1.jpg'),(163,'12345682a','上海百夫长信息科技有限公司\r\n','13567656550','117@163.com','上海上海','0','http://www.zhaohuobao.cn','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d1433653-2970-4b75-a114-47a49b7b2dc1.jpg'),(164,'12345683a','好卡（北京）网络技术有限公司\r\n','13567656551','118@163.com','北京朝阳区惠新西街16号蓝珏苑1单元1101','0','http://www.ichezhen.com','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d1433653-2970-4b75-a114-47a49b7b2dc1.jpg'),(165,'12345684a','北京极品无限科技发展股份有限公司\r\n','13567656552','119@163.com','北京北京','0','http://www.a-onesoft.cn','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d1433653-2970-4b75-a114-47a49b7b2dc1.jpg'),(166,'12345685a','北京花生时尚技术有限公司\r\n','13567656553','120@163.com','北京北京','0','http://www.hsgh.com','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d1433653-2970-4b75-a114-47a49b7b2dc1.jpg'),(167,'12345686a','北京沃立森德软件技术有限公司\r\n','13567656554','121@163.com','北京海淀区中关村北大街151号燕园大厦4楼','0','http://www.xtools.cn','d7bd04f3-f8c8-43f0-837a-9a407725d5b1.png','d1433653-2970-4b75-a114-47a49b7b2dc1.jpg');

#
# Source for table "ecollectionclass"
#

DROP TABLE IF EXISTS `ecollectionclass`;
CREATE TABLE `ecollectionclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eiid` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eiid` (`eiid`),
  CONSTRAINT `eiid` FOREIGN KEY (`eiid`) REFERENCES `enterpriseinformation` (`idEnterpriseInformation`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=gbk;

#
# Data for table "ecollectionclass"
#

INSERT INTO `ecollectionclass` VALUES (37,NULL,'软件1'),(38,NULL,'a');

#
# Source for table "industry"
#

DROP TABLE IF EXISTS `industry`;
CREATE TABLE `industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

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
  CONSTRAINT `fk1` FOREIGN KEY (`industryid`) REFERENCES `industry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=gbk;

#
# Data for table "job"
#

INSERT INTO `job` VALUES (1,'编导',1),(2,'制片',1),(3,'后期',1),(4,'编剧',1),(5,'剪辑',1),(6,'平面设计',1),(7,'图形设计',1),(8,'舞台设计',1),(9,'原画师',1),(10,'美术',1),(11,'策划',1),(12,'广告',1),(13,'文案',1),(14,'排版',1),(15,'印刷',1),(16,'美术编辑',1),(17,'视频编辑',1),(18,'记者',1),(19,'网络编辑',1),(20,'摄影记者',1),(21,'导游',2),(22,'领队',2),(23,'司机',2),(24,'旅行社',2),(25,'外联',2),(26,'旅游企划',2),(27,'产品',2),(28,'项目',2),(29,'技术',2),(30,'旅游电商运营',2),(31,'培训',2),(32,'翻译',2),(33,'旅游传媒',2),(34,'旅游策划',2),(35,'高尔夫',2),(36,'市场',2),(37,'推广',2),(38,'产品',2),(39,'拓展',2),(40,'面料设计',3),(41,'服装陈列',3),(42,'平面设计',3),(43,'童装设计',3),(44,'搭配师',3),(45,'厂长',3),(46,'样衣工',3),(47,'裁缝',3),(48,'针织',3),(49,'量体师',3),(50,'纸样师',3),(51,'销售总监',3),(52,'销售经理',3),(53,'营业员',3),(54,'模特',3),(55,'客服',3),(56,'总经理',3),(57,'行政总监',3),(58,'财务',3),(59,'人力资源',3),(60,'收银员',3),(61,'后勤',3),(62,'物流',4),(63,'运输',4),(64,'快递',4),(65,'仓库',4),(66,'理货',4),(67,'贸易',4),(68,'货运',4),(69,'供应商 ',4),(70,'总经理',4),(71,'秘书',4),(72,'运营主管',4),(73,'调研',4),(74,'策划',4),(75,'园长',5),(76,'幼儿教师',5),(77,'保育',5),(78,'医生',5),(79,'校长',5),(80,'主任',5),(81,'语文',5),(82,'数学',5),(83,'英语',5),(84,'教导',5),(85,'物理',5),(86,'化学',5),(87,'历史',5),(88,'地理',5),(89,' 生物',5),(90,'高职',5),(91,'外语',5),(92,'辅导',5),(93,'家教',5),(94,'架构师',6),(95,'网络开发',6),(96,'前端',6),(97,'脚本开发',6),(98,'UI设计',6),(99,' 电子商务',6),(100,'游戏',6),(101,'技术总监',6),(102,'维护',6),(103,'信息技术',6),(104,'项目',6),(105,'网络安全',6),(106,'系统测试',6),(107,'文档',6),(108,'系统工程',6),(109,'软件工程',6),(110,'PHP',6),(111,'计算机辅助 ',6),(112,'IOS',6),(113,'Android',6),(114,'程序员',6),(115,'数据库',6),(116,'硬件工程师',6),(117,'硬件维护',6),(118,'CEO',6),(119,'COO ',6),(120,'O1O',6),(121,'CTO',6),(122,'大堂',7),(123,'迎宾',7),(124,'礼仪',7),(125,'传菜',7),(126,'服务',7),(127,'中式厨师',7),(128,'西式厨师',7),(129,'营养',7),(130,'切配',7),(131,'厨工',7),(132,'清洁',7),(133,'楼面',7),(134,'维修',7),(135,'连锁',7),(136,'招商 ',7),(137,'企划',7),(138,'经理',7),(139,'主管',7),(140,'空间设计',8),(141,'结构设计',8),(142,'方案设计',8),(143,'建筑师',8),(144,'管道设计',8),(145,'照明设计',8),(146,'园林设计',8),(147,'园艺工程师',8),(148,'景观工程师',8),(149,'植物造景',8),(150,'绿化工程师',8),(151,'园林养护师 ',8),(152,'造价员',8),(153,'房地产策划',8),(154,' 招投标员',8),(155,'物业',8),(156,'维修 ',8),(157,'行政后勤',8),(158,'文秘',8),(159,'销售',8),(160,'质检工程师',8),(161,'试验员',8),(162,'出纳',8),(163,'经理 ',8),(164,'其他',9);

#
# Source for table "enterpriserecruitment"
#

DROP TABLE IF EXISTS `enterpriserecruitment`;
CREATE TABLE `enterpriserecruitment` (
  `idEnterpriseRecruitment` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `requirement` varchar(255) DEFAULT '',
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `isending` int(45) NOT NULL DEFAULT '1',
  `position` int(45) DEFAULT NULL,
  `workingPlace` varchar(45) DEFAULT NULL,
  `idEnterpriseInformation` int(11) NOT NULL,
  `salary` int(11) DEFAULT '1',
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEnterpriseRecruitment`),
  KEY `fk_EnterpriseRecruitment_EnterpriseInformation_idx` (`idEnterpriseInformation`),
  KEY `fkj` (`position`),
  CONSTRAINT `fkj` FOREIGN KEY (`position`) REFERENCES `job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EnterpriseRecruitment_EnterpriseInformation` FOREIGN KEY (`idEnterpriseInformation`) REFERENCES `enterpriseinformation` (`idEnterpriseInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

#
# Data for table "enterpriserecruitment"
#

INSERT INTO `enterpriserecruitment` VALUES (1,'java','555','2017-03-22 21:05:28','2017-05-31 11:11:11',2,1,'金湾区',10,500,111),(2,'c++','22','2017-03-22 21:19:39','2017-05-04 11:11:11',2,1,'金湾区',10,500,22),(3,'mysql',NULL,'2017-05-04 23:02:08','2017-06-04 23:02:16',2,164,'金湾区',151,500,NULL),(4,'struts2','1111111111111111111111111','2017-03-23 20:25:32','2017-06-03 11:11:11',2,1,'金湾区',151,500,111),(5,'祈同伟哭坟偷拍员','55','2017-03-23 20:26:33','2017-06-07 11:11:11',1,1,'金湾区',10,500,55),(7,'农民的儿子','77','2017-03-23 21:03:40','2017-06-07 11:11:11',1,1,'金湾区',10,500,77),(8,'jsp','55','2017-03-23 23:00:28','2017-06-07 11:11:11',1,1,'金湾区',151,500,55),(10,'观星局局长','9','2017-03-24 19:19:36','2017-06-07 11:11:11',1,1,'金湾区',151,500,9),(15,'山水庄园外语教师',NULL,'2017-05-04 23:02:12','2017-05-04 23:02:14',2,1,'金湾区',151,500,NULL),(16,'副市长','55','2017-03-24 21:45:18','1995-11-11 11:11:11',2,1,'金湾区',151,500,5555),(18,'护厂工人','777','2017-03-26 23:30:45','2017-05-18 11:11:11',2,1,'金湾区',151,500,77),(20,'检察官','555','2017-03-28 21:48:26','1995-11-11 11:11:11',2,1,'金湾区',151,500,44),(21,'反贪局局长','t','2017-03-28 21:49:08','2017-05-30 11:11:11',2,1,'金湾区',151,500,11),(29,'公安厅厅长','77','2017-03-29 18:43:06','1995-11-11 11:11:11',2,3,'金湾区',151,700000,777),(30,'省委书记','sd ','2017-05-04 23:19:43','2017-05-04 23:19:46',2,1,'金湾区',10,500,88),(31,'荆州副市长','会贪污','2017-05-07 11:57:01','2017-05-03 00:00:00',2,21,'香洲区',151,5000,12),(32,'超级英雄','1.会超能力。\r\n2.有责任心。\r\n3.不怕牺牲。\r\n4.外表好看。\r\n5.智商150.','2017-05-13 15:00:12','2017-05-18 00:00:00',2,21,'香洲区',151,50000,2),(33,'java实习','1.会java。\r\n2.英语好.\r\n3.适应强','2017-05-25 17:23:10','2017-05-25 00:00:00',2,22,'金湾区',151,2000,12),(34,'java','java12','2017-05-25 17:27:05','2017-05-31 00:00:00',2,22,'香洲区',151,2000,12),(35,'java实习','无要求','2017-05-25 19:31:14','2017-05-27 00:00:00',2,22,'香洲区',151,5000,12),(36,'淘宝客服','打字速度快','2017-05-30 16:51:19','2017-11-02 00:00:00',1,99,'高新区',151,3008,3),(37,'赛车配件销售精英','1、完成所辖区域的产品销售任务，提升产品在区域内的占比；<br>2、负责所辖区域内市场的开拓、客户的开发、网点的布局及新客户前期进场谈判工作；<br>3、负责所辖区域内卖场的出样规划布置，整体形象的维护；<br>4、负责所辖区域内的产品线的设定，产品零售价、标价的制订，整体价格体系的维护5、掌握所辖区域内客户进、销、存情况，及时跟进客户提货计划和物流发货状况','2017-05-30 16:51:19','2017-11-02 00:00:00',1,159,'高新区',159,3000,10),(38,'三千底薪高提成丶地产销售','<p>招聘售楼员，以网络销售，电话销售为主<br>岗位待遇：底薪3000元.+提成（30%','2017-05-30 16:51:19','2017-11-02 00:00:00',1,159,'高新区',159,4999,10),(39,'韩丽意大利进口橱柜销售员','<p>中国橱柜十大品牌，意大利原板进口，“韩丽橱柜”现隆重进驻珠海居然之家，招聘销售经理多','2017-05-30 16:51:19','2017-11-02 00:00:00',1,159,'高新区',159,6773,10),(40,'销售助理/渠道文员','<p>客户经理 无责任底薪3000元/月+（15%-35%）业绩提成+现金奖+社保＋培训+','2017-05-30 16:51:19','2017-11-02 00:00:00',1,159,'香洲区',159,2334,10),(41,'销售经理/主管','<p>岗位职责：<br>1、本部门为区域拓展部（可为老客户做后续的跟踪服务，在此基础上完成','2017-05-30 16:51:19','2017-11-02 00:00:00',1,159,'香洲区',159,2343,10),(42,'无责急招聘+销售精英','<p>岗位职责：<br>1、负责搜集新客户的资料并进行沟通，开发新客户；<br>2、与客户','2017-05-30 16:51:19','2017-11-02 00:00:00',1,159,'金湾区',156,2222,10),(43,'国企急招置业顾问','<p>工作内容：<br>1、全面熟练地掌握所租售楼盘情况，了解房地产法律、法规以及相关交易','2017-05-30 16:51:19','2017-11-02 00:00:00',1,159,'金湾区',157,1111,11),(44,'底薪2500/月社保旅游','<p>职位描述：<br> 1.男女不限，20岁以上，对房地产经职位要求和待遇如下纪行业有浓','2017-05-30 16:51:19','2017-11-02 00:00:00',1,159,'金湾区',157,6000,22),(45,'业务员','<p>岗位职责：<br>1、负责公司产品业务拓展及推广；<br>2、根据市场计划，完成部门','2017-05-30 16:51:19','2017-11-02 00:00:00',1,159,'金湾区',157,2000,2),(46,'装饰工程诚招业务员+话补','1、负责搜集新客户的资料并进行沟通，开发新客户；<br>2、通过电话与客户进行有效沟通了解客户需求, 寻找销售机会并完成销售业绩；<br>3、维护老客户的业务，挖掘客户的最大潜力；<br>4、定期与合作客户进行沟通，建立良好的长期合作关系。','2017-05-30 16:51:19','2017-11-02 00:00:00',1,159,'金湾区',159,3000,20),(47,'荆州市长','帅','2017-06-04 20:35:48','2017-06-06 00:00:00',1,23,'金湾区',151,10,1);

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
  `picture` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPersonalInformation`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "personalinformation"
#

INSERT INTO `personalinformation` VALUES (4,'11','镇元子',NULL,'11','11','11',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'','',NULL,'','1','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'','',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'','',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'','',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'','',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'123456','黄如花','2017-05-10','女','12345678910','11@qq.com','汉','广东珠海','广东揭阳','研究生','吉林大学珠海学院','预备党员','126551cd-28ff-44b6-9bb0-1c1d7d81cb2a.jpg'),(11,'qazxsw123','程哈镜','1992-01-30','女','13222233222','1234567@qq.com','','','','本科','','中共党员','19524b89-a6cc-4921-acba-0a4932030614.png');

#
# Source for table "collection"
#

DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `idPersonalInformation` int(11) DEFAULT '0',
  `idEnterpriseRecruitment` int(11) DEFAULT NULL,
  `collectionTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `idPersonFK` (`idPersonalInformation`),
  KEY `idEFK` (`idEnterpriseRecruitment`),
  CONSTRAINT `idEFK` FOREIGN KEY (`idEnterpriseRecruitment`) REFERENCES `enterpriserecruitment` (`idEnterpriseRecruitment`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idPersonFK` FOREIGN KEY (`idPersonalInformation`) REFERENCES `personalinformation` (`idPersonalInformation`) ON DELETE CASCADE ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='收藏表';

#
# Data for table "collection"
#

INSERT INTO `collection` VALUES (16,10,2,'2017-05-15 00:33:21'),(24,10,4,'2017-06-06 00:13:46'),(25,10,15,'2017-06-06 00:13:51'),(26,10,18,'2017-06-06 00:13:57'),(27,10,33,'2017-06-06 00:23:07'),(29,10,33,'2017-06-06 00:55:24'),(30,10,37,'2017-06-06 09:29:24');

#
# Source for table "resume"
#

DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `idResume` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `hobby` varchar(200) DEFAULT NULL,
  `HandsOnBackground` varchar(200) DEFAULT NULL,
  `awardSituation` varchar(200) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `workingPlace` varchar(45) DEFAULT NULL,
  `idPersonalInformation` int(11) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `isdelete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idResume`),
  KEY `fk_Resume_PersonalInformation1_idx` (`idPersonalInformation`),
  CONSTRAINT `fk_Resume_PersonalInformation1` FOREIGN KEY (`idPersonalInformation`) REFERENCES `personalinformation` (`idPersonalInformation`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "resume"
#

INSERT INTO `resume` VALUES (1,' 软件','11sfffffffffff','11','11','11','11',10,'2017-03-22 19:41:26','2017-05-26 02:50:25',1),(2,'  影视','88','88','88','88','88后天发货',10,'2017-03-24 19:11:37','2017-06-05 00:38:27',0),(3,'音乐','77','77','77','77','77',4,'2017-03-24 19:14:06',NULL,0),(4,'的点点滴滴多多多多多','呃呃呃鹅鹅鹅鹅鹅鹅饿鹅鹅鹅饿鹅鹅鹅饿','鹅鹅鹅鹅鹅鹅饿鹅鹅鹅饿法尔','发送噶过过过过过过过','是是是','金湾区',10,'2017-05-30 21:08:32',NULL,1),(5,'PHP简历','实在是处女座就是开导和试试看从就长城保护层白菜价或查看说你是理科\r\n没萨拉\r\n吗，k\r\n马萨卡','DHK你在今年初  骂你什么从巴萨','一等奖续集好','PHP','万山区',10,'2017-06-05 00:39:29',NULL,0),(6,'灌灌灌灌','发发发','反反复复','反反复复付','反反复复付付',' 横琴新区',10,'2017-06-05 00:45:35',NULL,0);

#
# Source for table "ecollection"
#

DROP TABLE IF EXISTS `ecollection`;
CREATE TABLE `ecollection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eiid` int(11) DEFAULT NULL,
  `resumeid` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `eclass` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ei` (`eiid`),
  KEY `resumeid` (`resumeid`),
  KEY `eclass` (`eclass`),
  CONSTRAINT `eclass` FOREIGN KEY (`eclass`) REFERENCES `ecollectionclass` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `ei` FOREIGN KEY (`eiid`) REFERENCES `enterpriseinformation` (`idEnterpriseInformation`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `resumeid` FOREIGN KEY (`resumeid`) REFERENCES `resume` (`idResume`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

#
# Data for table "ecollection"
#

INSERT INTO `ecollection` VALUES (2,151,2,'2017-06-04 17:10:44',NULL),(3,151,3,'2017-06-04 17:10:58',NULL),(4,151,1,'2017-06-04 20:34:58',NULL),(6,151,1,'2017-06-04 20:36:15',37),(7,151,1,'2017-06-04 20:48:22',NULL),(8,151,1,'2017-06-05 01:34:27',37),(9,151,1,'2017-06-05 01:34:27',37);

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
  `remark` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idApplication`),
  KEY `fk_Application_Resume1_idx` (`idResume`),
  KEY `fk_Application_EnterpriseRecruitment1_idx` (`idEnterpriseRecruitment`),
  CONSTRAINT `fk_Application_EnterpriseRecruitment1` FOREIGN KEY (`idEnterpriseRecruitment`) REFERENCES `enterpriserecruitment` (`idEnterpriseRecruitment`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Application_Resume1` FOREIGN KEY (`idResume`) REFERENCES `resume` (`idResume`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Data for table "application"
#

INSERT INTO `application` VALUES (4,'2017-03-27 14:34:43','未查看',1,1,NULL),(5,'2017-03-27 14:35:05','未查看',1,2,NULL),(6,'2017-05-04 22:58:50','拒绝',1,4,'你的简历与我司招聘要求不符'),(8,'2017-05-04 22:58:56','邀请',1,3,'傻'),(10,'2017-05-04 22:58:53','未查看',1,5,NULL),(14,'2017-03-27 14:49:43','未查看',2,1,NULL),(15,'2017-03-27 14:49:58','未查看',1,1,NULL),(16,'2017-03-27 14:50:17','未查看',1,1,NULL),(17,'2017-03-28 21:46:32','拒绝',2,18,'你的简历与我司招聘要求不符'),(18,'2017-03-28 21:49:27','邀请',1,21,'2017-06-09 南方软件园'),(19,'2017-05-14 23:19:47','未查看',1,1,NULL),(20,'2017-05-15 00:35:33','未查看',1,2,NULL),(21,'2017-05-15 00:35:39','未查看',2,2,NULL),(22,'2017-05-15 00:36:12','未查看',1,2,NULL),(23,'2017-05-15 00:36:39','未查看',1,2,NULL),(24,'2017-05-15 00:37:36','未查看',1,1,NULL),(25,'2017-05-15 00:39:45','未查看',1,1,NULL),(26,'2017-05-15 00:44:46','未查看',1,1,NULL),(27,'2017-05-15 00:49:19','邀请',2,31,'2017-06-09 南方软件园');

#
# Source for view "ecollectionview"
#

DROP VIEW IF EXISTS `ecollectionview`;
CREATE VIEW `ecollectionview` AS 
  select `recruitandemploy`.`ecollection`.`id` AS `id`,`recruitandemploy`.`ecollection`.`eiid` AS `eiid`,`recruitandemploy`.`ecollection`.`resumeid` AS `resumeid`,`recruitandemploy`.`ecollection`.`time` AS `time`,`recruitandemploy`.`ecollection`.`eclass` AS `eclass`,`recruitandemploy`.`personalinformation`.`name` AS `name` from ((`recruitandemploy`.`ecollection` join `recruitandemploy`.`resume`) join `recruitandemploy`.`personalinformation`) where ((`recruitandemploy`.`ecollection`.`resumeid` = `recruitandemploy`.`resume`.`idResume`) and (`recruitandemploy`.`resume`.`idPersonalInformation` = `recruitandemploy`.`personalinformation`.`idPersonalInformation`));

#
# Source for view "view1"
#

DROP VIEW IF EXISTS `view1`;
CREATE VIEW `view1` AS 
  select `recruitandemploy`.`application`.`idEnterpriseRecruitment` AS `idEnterpriseRecruitment`,`recruitandemploy`.`enterpriserecruitment`.`idEnterpriseInformation` AS `idEnterpriseInformation`,`recruitandemploy`.`application`.`state` AS `state`,`recruitandemploy`.`application`.`idResume` AS `idResume`,`recruitandemploy`.`application`.`time` AS `time`,`recruitandemploy`.`application`.`idApplication` AS `idApplication`,`recruitandemploy`.`application`.`remark` AS `remark` from (`recruitandemploy`.`application` join `recruitandemploy`.`enterpriserecruitment`) where (`recruitandemploy`.`application`.`idEnterpriseRecruitment` = `recruitandemploy`.`enterpriserecruitment`.`idEnterpriseRecruitment`);

#
# Source for view "view2"
#

DROP VIEW IF EXISTS `view2`;
CREATE VIEW `view2` AS 
  select `recruitandemploy`.`application`.`time` AS `vtime`,`recruitandemploy`.`application`.`state` AS `vstate`,`recruitandemploy`.`enterpriserecruitment`.`name` AS `ecname`,`recruitandemploy`.`enterpriserecruitment`.`startTime` AS `startTime`,`recruitandemploy`.`enterpriserecruitment`.`endTime` AS `endtime`,`recruitandemploy`.`resume`.`name` AS `rname`,`recruitandemploy`.`enterpriseinformation`.`idEnterpriseInformation` AS `idEnterpriseInformation`,`recruitandemploy`.`enterpriserecruitment`.`idEnterpriseRecruitment` AS `idEnterpriseRecruitment`,`recruitandemploy`.`personalinformation`.`name` AS `einame`,`recruitandemploy`.`resume`.`idResume` AS `idResume`,`recruitandemploy`.`personalinformation`.`education` AS `education`,`recruitandemploy`.`personalinformation`.`school` AS `school`,`recruitandemploy`.`personalinformation`.`picture` AS `picture` from ((((`recruitandemploy`.`application` join `recruitandemploy`.`enterpriseinformation`) join `recruitandemploy`.`enterpriserecruitment`) join `recruitandemploy`.`resume`) join `recruitandemploy`.`personalinformation`) where ((`recruitandemploy`.`application`.`idEnterpriseRecruitment` = `recruitandemploy`.`enterpriserecruitment`.`idEnterpriseRecruitment`) and (`recruitandemploy`.`enterpriseinformation`.`idEnterpriseInformation` = `recruitandemploy`.`enterpriserecruitment`.`idEnterpriseInformation`) and (`recruitandemploy`.`application`.`idResume` = `recruitandemploy`.`resume`.`idResume`) and (`recruitandemploy`.`resume`.`idPersonalInformation` = `recruitandemploy`.`personalinformation`.`idPersonalInformation`));

#
# Source for view "view3"
#

DROP VIEW IF EXISTS `view3`;
CREATE VIEW `view3` AS 
  select `recruitandemploy`.`application`.`time` AS `time`,`recruitandemploy`.`application`.`state` AS `state`,`recruitandemploy`.`application`.`remark` AS `remark`,`recruitandemploy`.`enterpriseinformation`.`name` AS `einame`,`recruitandemploy`.`enterpriserecruitment`.`name` AS `ername`,`recruitandemploy`.`resume`.`name` AS `rname`,`recruitandemploy`.`enterpriserecruitment`.`endTime` AS `endTime`,`recruitandemploy`.`resume`.`idPersonalInformation` AS `idPersonalInformation`,`recruitandemploy`.`enterpriseinformation`.`idEnterpriseInformation` AS `idEnterpriseInformation` from (((`recruitandemploy`.`application` join `recruitandemploy`.`enterpriseinformation`) join `recruitandemploy`.`enterpriserecruitment`) join `recruitandemploy`.`resume`) where ((`recruitandemploy`.`application`.`idResume` = `recruitandemploy`.`resume`.`idResume`) and (`recruitandemploy`.`application`.`idEnterpriseRecruitment` = `recruitandemploy`.`enterpriserecruitment`.`idEnterpriseRecruitment`) and (`recruitandemploy`.`enterpriserecruitment`.`idEnterpriseInformation` = `recruitandemploy`.`enterpriseinformation`.`idEnterpriseInformation`));
