/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : recruitandemploy

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2017-05-07 22:36:17
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `fk_number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员登录表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `application`
-- ----------------------------
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
  CONSTRAINT `fk_Application_Resume1` FOREIGN KEY (`idResume`) REFERENCES `resume` (`idResume`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('4', '2017-03-27 14:34:43', '邀请', '1', '1');
INSERT INTO `application` VALUES ('5', '2017-03-27 14:35:05', '未查看', '1', '2');
INSERT INTO `application` VALUES ('6', '2017-05-04 22:58:50', '已查看', '1', '4');
INSERT INTO `application` VALUES ('8', '2017-05-04 22:58:56', '邀请', '1', '3');
INSERT INTO `application` VALUES ('10', '2017-05-04 22:58:53', '拒绝', '1', '5');
INSERT INTO `application` VALUES ('14', '2017-03-27 14:49:43', '未查看', '2', '1');
INSERT INTO `application` VALUES ('15', '2017-03-27 14:49:58', '未查看', '1', '1');
INSERT INTO `application` VALUES ('16', '2017-03-27 14:50:17', '未查看', '1', '1');
INSERT INTO `application` VALUES ('17', '2017-03-28 21:46:32', '邀请', '2', '18');
INSERT INTO `application` VALUES ('18', '2017-03-28 21:49:27', '邀请', '1', '21');

-- ----------------------------
-- Table structure for `enterpriseinformation`
-- ----------------------------
DROP TABLE IF EXISTS `enterpriseinformation`;
CREATE TABLE `enterpriseinformation` (
  `idEnterpriseInformation` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `mailbox` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `Authentication` varchar(45) DEFAULT '0',
  `homepage` varchar(45) DEFAULT NULL,
  `trademark` varchar(45) DEFAULT NULL,
  `BusinessLicense` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEnterpriseInformation`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enterpriseinformation
-- ----------------------------
INSERT INTO `enterpriseinformation` VALUES ('10', '123456', '林', '0', 'lin@qq.com', '', '1', '', '', '');
INSERT INTO `enterpriseinformation` VALUES ('151', '123456', '记书大有限公司', '15119534661', '11@qq.com', '吉林大学', '1', 'jluzh.com', 'asddf', 'asfd');
INSERT INTO `enterpriseinformation` VALUES ('152', '121asd', null, null, '12@qq.com', null, '1', null, null, null);
INSERT INTO `enterpriseinformation` VALUES ('153', '11', null, null, '855', null, '1', null, null, null);
INSERT INTO `enterpriseinformation` VALUES ('154', '123456', 'sss', '12345678910', '123@qq.com', 'sss', '1', '11', '11', '11');
INSERT INTO `enterpriseinformation` VALUES ('155', '123456', '222', '22222222222', 'a@qq.com', '222', '1', '222', '222', '222');
INSERT INTO `enterpriseinformation` VALUES ('156', '123456', '电脑公司', '15119534661', '1051209415@qq.com', '珠海', '0', 'baidu.com', '222222222', '444444444');
INSERT INTO `enterpriseinformation` VALUES ('157', '123456', '1111111111', '11111111111', '123456@qq.com', '1111111111', '0', '11111111111', 'd7bd04f3-f8c8-43f0-837a-9a407725d5b1.png', 'd1433653-2970-4b75-a114-47a49b7b2dc1.jpg');

-- ----------------------------
-- Table structure for `enterpriserecruitment`
-- ----------------------------
DROP TABLE IF EXISTS `enterpriserecruitment`;
CREATE TABLE `enterpriserecruitment` (
  `idEnterpriseRecruitment` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `requirement` varchar(45) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enterpriserecruitment
-- ----------------------------
INSERT INTO `enterpriserecruitment` VALUES ('1', 'java', '111', '2017-03-22 21:05:28', '2017-05-31 11:11:11', '1', '1', '金湾区', '10', '500', '111');
INSERT INTO `enterpriserecruitment` VALUES ('2', 'c++', '22', '2017-03-22 21:19:39', '2017-05-04 11:11:11', '1', '1', '金湾区', '10', '500', '22');
INSERT INTO `enterpriserecruitment` VALUES ('3', 'mysql', null, '2017-05-04 23:02:08', '2017-05-04 23:02:16', '2', '164', '金湾区', '151', '500', null);
INSERT INTO `enterpriserecruitment` VALUES ('4', 'struts2', '1111111111111111111111111', '2017-03-23 20:25:32', '2017-05-03 11:11:11', '2', '1', '金湾区', '151', '500', '111');
INSERT INTO `enterpriserecruitment` VALUES ('5', '祈同伟哭坟偷拍员', '55', '2017-03-23 20:26:33', '2017-05-07 11:11:11', '1', '1', '金湾区', '10', '500', '55');
INSERT INTO `enterpriserecruitment` VALUES ('7', '农民的儿子', '77', '2017-03-23 21:03:40', '1995-11-11 11:11:11', '1', '1', '金湾区', '10', '500', '77');
INSERT INTO `enterpriserecruitment` VALUES ('8', 'jsp', '55', '2017-03-23 23:00:28', '1995-11-11 11:11:11', '2', '1', '金湾区', '151', '500', '55');
INSERT INTO `enterpriserecruitment` VALUES ('10', '观星局局长', '9', '2017-03-24 19:19:36', '1995-11-11 11:11:11', '2', '1', '金湾区', '151', '500', '9');
INSERT INTO `enterpriserecruitment` VALUES ('15', '山水庄园外语教师', null, '2017-05-04 23:02:12', '2017-05-04 23:02:14', '2', '1', '金湾区', '151', '500', null);
INSERT INTO `enterpriserecruitment` VALUES ('16', '副市长', '55', '2017-03-24 21:45:18', '1995-11-11 11:11:11', '2', '1', '金湾区', '151', '500', '5555');
INSERT INTO `enterpriserecruitment` VALUES ('18', '护厂工人', '777', '2017-03-26 23:30:45', '2017-05-18 11:11:11', '1', '1', '金湾区', '151', '500', '77');
INSERT INTO `enterpriserecruitment` VALUES ('20', '检察官', '555', '2017-03-28 21:48:26', '1995-11-11 11:11:11', '1', '1', '金湾区', '151', '500', '44');
INSERT INTO `enterpriserecruitment` VALUES ('21', '反贪局局长', 't', '2017-03-28 21:49:08', '2017-05-30 11:11:11', '1', '1', '金湾区', '151', '500', '11');
INSERT INTO `enterpriserecruitment` VALUES ('29', '公安厅厅长', '77', '2017-03-29 18:43:06', '1995-11-11 11:11:11', '1', '3', '金湾区', '151', '700000', '777');
INSERT INTO `enterpriserecruitment` VALUES ('30', '省委书记', 'sd ', '2017-05-04 23:19:43', '2017-05-04 23:19:46', '1', '1', '金湾区', '10', '500', '88');
INSERT INTO `enterpriserecruitment` VALUES ('31', '荆州副市长', '会贪污', '2017-05-07 11:57:01', '2017-05-03 00:00:00', '1', '21', '香洲区', '151', '5000', '12');

-- ----------------------------
-- Table structure for `industry`
-- ----------------------------
DROP TABLE IF EXISTS `industry`;
CREATE TABLE `industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of industry
-- ----------------------------
INSERT INTO `industry` VALUES ('1', '传媒');
INSERT INTO `industry` VALUES ('2', '旅游');
INSERT INTO `industry` VALUES ('3', '服装');
INSERT INTO `industry` VALUES ('4', '运输物流');
INSERT INTO `industry` VALUES ('5', '教政');
INSERT INTO `industry` VALUES ('6', 'IT');
INSERT INTO `industry` VALUES ('7', '酒店餐饮');
INSERT INTO `industry` VALUES ('8', '建筑');
INSERT INTO `industry` VALUES ('9', '其他');

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `industryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1` (`industryid`),
  CONSTRAINT `fk1` FOREIGN KEY (`industryid`) REFERENCES `industry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '编导', '1');
INSERT INTO `job` VALUES ('2', '制片', '1');
INSERT INTO `job` VALUES ('3', '后期', '1');
INSERT INTO `job` VALUES ('21', '导游', '2');
INSERT INTO `job` VALUES ('40', '面料设计', '3');
INSERT INTO `job` VALUES ('62', '物流', '4');
INSERT INTO `job` VALUES ('75', '园长', '5');
INSERT INTO `job` VALUES ('94', '架构师', '6');
INSERT INTO `job` VALUES ('122', '大堂', '7');
INSERT INTO `job` VALUES ('140', '空间设计', '8');
INSERT INTO `job` VALUES ('164', '其他', '9');

-- ----------------------------
-- Table structure for `personalinformation`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personalinformation
-- ----------------------------
INSERT INTO `personalinformation` VALUES ('4', '11', '11', null, '11', '11', '11', null, null, null, null, null, null, null);
INSERT INTO `personalinformation` VALUES ('5', '', '', null, '', '1', '', null, null, null, null, null, null, null);
INSERT INTO `personalinformation` VALUES ('6', '', '', null, '', '', '', null, null, null, null, null, null, null);
INSERT INTO `personalinformation` VALUES ('7', '', '', null, '', '', '', null, null, null, null, null, null, null);
INSERT INTO `personalinformation` VALUES ('8', '', '', null, '', '', '', null, null, null, null, null, null, null);
INSERT INTO `personalinformation` VALUES ('9', '', '', null, '', '', '', null, null, null, null, null, null, null);
INSERT INTO `personalinformation` VALUES ('10', '123456', '陈书记', null, 'lin', '12345678910', '11@qq.com', '', '', '', '', '', '', '700fb3c5-6c0f-46dd-82b5-3959a4014e66.jpg');

-- ----------------------------
-- Table structure for `resume`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES ('1', '11', '11', '11', '11', '11', '11', '10', '2017-03-22 19:41:26', null);
INSERT INTO `resume` VALUES ('2', '88', '88', '88', '88', '88', '88', '10', '2017-03-24 19:11:37', null);
INSERT INTO `resume` VALUES ('3', '77', '77', '77', '77', '77', '77', '4', '2017-03-24 19:14:06', null);

-- ----------------------------
-- View structure for `view1`
-- ----------------------------
DROP VIEW IF EXISTS `view1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1` AS select `application`.`idEnterpriseRecruitment` AS `idEnterpriseRecruitment`,`enterpriserecruitment`.`idEnterpriseInformation` AS `idEnterpriseInformation`,`application`.`state` AS `state`,`application`.`idResume` AS `idResume`,`application`.`time` AS `time`,`application`.`idApplication` AS `idApplication` from (`application` join `enterpriserecruitment`) where (`application`.`idEnterpriseRecruitment` = `enterpriserecruitment`.`idEnterpriseRecruitment`);

-- ----------------------------
-- View structure for `view2`
-- ----------------------------
DROP VIEW IF EXISTS `view2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2` AS select `application`.`time` AS `vtime`,`application`.`state` AS `vstate`,`enterpriserecruitment`.`name` AS `ecname`,`enterpriserecruitment`.`startTime` AS `startTime`,`enterpriserecruitment`.`endTime` AS `endtime`,`resume`.`name` AS `rname`,`enterpriseinformation`.`idEnterpriseInformation` AS `idEnterpriseInformation`,`enterpriserecruitment`.`idEnterpriseRecruitment` AS `idEnterpriseRecruitment`,`personalinformation`.`name` AS `einame`,`resume`.`idResume` AS `idResume` from ((((`application` join `enterpriseinformation`) join `enterpriserecruitment`) join `resume`) join `personalinformation`) where ((`application`.`idEnterpriseRecruitment` = `enterpriserecruitment`.`idEnterpriseRecruitment`) and (`enterpriseinformation`.`idEnterpriseInformation` = `enterpriserecruitment`.`idEnterpriseInformation`) and (`application`.`idResume` = `resume`.`idResume`) and (`resume`.`idPersonalInformation` = `personalinformation`.`idPersonalInformation`));
