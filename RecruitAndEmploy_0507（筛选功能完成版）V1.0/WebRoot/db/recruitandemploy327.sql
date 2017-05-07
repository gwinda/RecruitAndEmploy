/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : recruitandemploy

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2017-03-27 15:20:26
*/

SET FOREIGN_KEY_CHECKS=0;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('4', '2017-03-27 14:34:43', '邀请', '1', '1');
INSERT INTO `application` VALUES ('5', '2017-03-27 14:35:05', '未查看', '1', '2');
INSERT INTO `application` VALUES ('6', null, '拒绝', '1', '4');
INSERT INTO `application` VALUES ('8', null, '未查看', '1', '3');
INSERT INTO `application` VALUES ('10', null, '拒绝', '1', '5');
INSERT INTO `application` VALUES ('14', '2017-03-27 14:49:43', '未查看', '2', '1');
INSERT INTO `application` VALUES ('15', '2017-03-27 14:49:58', '未查看', '1', '1');
INSERT INTO `application` VALUES ('16', '2017-03-27 14:50:17', '未查看', '1', '1');

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
  `Authentication` varchar(45) DEFAULT NULL,
  `homepage` varchar(45) DEFAULT NULL,
  `trademark` varchar(45) DEFAULT NULL,
  `BusinessLicense` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEnterpriseInformation`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enterpriseinformation
-- ----------------------------
INSERT INTO `enterpriseinformation` VALUES ('10', '', '', '0', '', '', null, '', '', '');
INSERT INTO `enterpriseinformation` VALUES ('151', '123456', 'sdf', '33333333333', '11@qq.com', 'sdf ', null, 'sdf', 'dsfds', 'fdsf');
INSERT INTO `enterpriseinformation` VALUES ('152', '121', null, null, '12@qq.com', null, null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enterpriserecruitment
-- ----------------------------
INSERT INTO `enterpriserecruitment` VALUES ('1', '111', '11', '2017-03-22 21:05:28', '1995-11-11 11:11:11', '1', '1', '11', '10', '11', '111');
INSERT INTO `enterpriserecruitment` VALUES ('2', '22', '22', '2017-03-22 21:19:39', '1995-11-11 11:11:11', '1', '1', '222', '10', '22', '22');
INSERT INTO `enterpriserecruitment` VALUES ('3', '55', null, null, null, '2', '164', null, '151', null, null);
INSERT INTO `enterpriserecruitment` VALUES ('4', '111', '11', '2017-03-23 20:25:32', '1995-11-11 11:11:11', '2', '1', '111', '151', '111', '111');
INSERT INTO `enterpriserecruitment` VALUES ('5', '55', '55', '2017-03-23 20:26:33', '1995-11-11 11:11:11', '1', '1', '555', '10', '55', '55');
INSERT INTO `enterpriserecruitment` VALUES ('7', '77', '77', '2017-03-23 21:03:40', '1995-11-11 11:11:11', '1', '1', '77', '10', '77', '77');
INSERT INTO `enterpriserecruitment` VALUES ('8', '55', '55', '2017-03-23 23:00:28', '1995-11-11 11:11:11', '2', '1', '55', '151', '55', '55');
INSERT INTO `enterpriserecruitment` VALUES ('10', '9', '9', '2017-03-24 19:19:36', '1995-11-11 11:11:11', '2', '1', '9', '151', '9', '9');
INSERT INTO `enterpriserecruitment` VALUES ('15', '555', null, null, null, '2', '1', null, '151', '1', null);
INSERT INTO `enterpriserecruitment` VALUES ('16', '55', '55', '2017-03-24 21:45:18', '1995-11-11 11:11:11', '2', '1', '5555', '151', '5555', '5555');
INSERT INTO `enterpriserecruitment` VALUES ('18', '77', '777', '2017-03-26 23:30:45', '1995-11-11 11:11:11', '1', '1', '77', '151', '77', '77');

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
  PRIMARY KEY (`idPersonalInformation`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personalinformation
-- ----------------------------
INSERT INTO `personalinformation` VALUES ('4', '11', '11', null, '11', '11', '11', null, null, null, null, null, null);
INSERT INTO `personalinformation` VALUES ('5', '', '', null, '', '1', '', null, null, null, null, null, null);
INSERT INTO `personalinformation` VALUES ('6', '', '', null, '', '', '', null, null, null, null, null, null);
INSERT INTO `personalinformation` VALUES ('7', '', '', null, '', '', '', null, null, null, null, null, null);
INSERT INTO `personalinformation` VALUES ('8', '', '', null, '', '', '', null, null, null, null, null, null);
INSERT INTO `personalinformation` VALUES ('9', '', '', null, '', '', '', null, null, null, null, null, null);
INSERT INTO `personalinformation` VALUES ('10', '123456', 'abc', null, 'lin', '12345678910', '11@qq.com', null, null, null, null, null, null);

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
