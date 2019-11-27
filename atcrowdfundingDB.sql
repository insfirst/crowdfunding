/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.62 : Database - atcrowdfunding
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`atcrowdfunding` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `atcrowdfunding`;

/*Table structure for table `t_account_type_cert` */

DROP TABLE IF EXISTS `t_account_type_cert`;

CREATE TABLE `t_account_type_cert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accttype` char(1) DEFAULT NULL,
  `certid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_account_type_cert` */

/*Table structure for table `t_advertisement` */

DROP TABLE IF EXISTS `t_advertisement`;

CREATE TABLE `t_advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `iconpath` varchar(255) DEFAULT NULL,
  `status` char(1) DEFAULT NULL COMMENT '0 - 草稿， 1 - 未审核， 2 - 审核完成， 3 - 发布',
  `url` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

/*Data for the table `t_advertisement` */

insert  into `t_advertisement`(`id`,`name`,`iconpath`,`status`,`url`,`userid`) values (18,'gg',NULL,'0','hh',1),(20,'aa',NULL,'0','aaa',NULL),(21,'bb',NULL,'0','bb',1),(22,'ddd',NULL,'0','ddd',1),(23,'eee',NULL,'0','eee',1),(24,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(25,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(26,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(27,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(28,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(29,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(30,'ee333',NULL,'0','ee',NULL),(31,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(32,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(33,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(34,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(35,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(36,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(37,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(38,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(39,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(40,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(41,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(42,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(43,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(44,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(45,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(46,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(47,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(48,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(49,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(50,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(51,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(52,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(53,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(54,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(55,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(56,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(57,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(58,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(59,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(60,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(61,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(62,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(63,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(64,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(65,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(66,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(67,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(68,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(69,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(70,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(71,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(72,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(73,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(74,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(75,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(76,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(77,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(78,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(79,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(80,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(81,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(82,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(83,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(84,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(85,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(86,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(87,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(88,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(89,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(90,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(91,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(92,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(93,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(94,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(95,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(96,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(97,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(98,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(99,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(100,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(101,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(102,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(103,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(104,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(105,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(106,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(107,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(108,'ee%','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(109,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(110,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(111,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(112,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(113,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(114,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(115,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(116,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(117,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(118,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(119,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(120,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(121,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(122,'ddd','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(123,'ee','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(124,'yyy','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(125,'ddd8','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(126,'ee7','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(127,'yyy6','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1),(128,'ddd5','71c8ba06-9a2b-4998-8b97-09d85c6c570a.jpg','1','ffff',1),(129,'ee4','9f967203-5e20-459d-8e6c-fb44956a3717.jpg','1','ee',1),(130,'yyy3','08c0e2ab-d421-486d-a64b-e7a537f3da04.jpg','1','yyy',1);

/*Table structure for table `t_cert` */

DROP TABLE IF EXISTS `t_cert`;

CREATE TABLE `t_cert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_cert` */

insert  into `t_cert`(`id`,`name`) values (1,'营业执照副本'),(2,'税务登记证'),(3,'组织机构代码证'),(4,'单位登记证件'),(5,'	法定代表人证件'),(6,'经营者证件'),(7,'手执身份证照片');

/*Table structure for table `t_dictionary` */

DROP TABLE IF EXISTS `t_dictionary`;

CREATE TABLE `t_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `subcode` varchar(255) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `t_dictionary` */

insert  into `t_dictionary`(`id`,`name`,`code`,`subcode`,`val`) values (1,'性别','sex','男','0'),(2,'性别','sex','女','1'),(3,'实名认证状态','authstatus','未实名认证','0'),(4,'实名认证状态','authstatus','实名认证审核中','1'),(5,'实名认证状态','authstatus','已实名认证','2'),(6,'账户类型','accttype','企业','0'),(7,'账户类型','accttype','个体','1'),(8,'账户类型','accttype','个人','2'),(9,'账户类型','accttype','政府','3');

/*Table structure for table `t_member` */

DROP TABLE IF EXISTS `t_member`;

CREATE TABLE `t_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginacct` varchar(255) NOT NULL,
  `userpswd` char(32) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `authstatus` char(1) NOT NULL COMMENT '实名认证状态 0 - 未实名认证， 1 - 实名认证申请中， 2 - 已实名认证',
  `usertype` char(1) NOT NULL COMMENT ' 0 - 个人， 1 - 企业',
  `realname` varchar(255) DEFAULT NULL,
  `cardnum` varchar(255) DEFAULT NULL,
  `accttype` char(1) DEFAULT NULL COMMENT '0 - 企业， 1 - 个体， 2 - 个人， 3 - 政府',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_member` */

/*Table structure for table `t_member_address` */

DROP TABLE IF EXISTS `t_member_address`;

CREATE TABLE `t_member_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_member_address` */

/*Table structure for table `t_member_cert` */

DROP TABLE IF EXISTS `t_member_cert`;

CREATE TABLE `t_member_cert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `certid` int(11) DEFAULT NULL,
  `iconpath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_member_cert` */

/*Table structure for table `t_member_project_follow` */

DROP TABLE IF EXISTS `t_member_project_follow`;

CREATE TABLE `t_member_project_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_member_project_follow` */

/*Table structure for table `t_message` */

DROP TABLE IF EXISTS `t_message`;

CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `senddate` char(19) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_message` */

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `projectid` int(11) DEFAULT NULL,
  `returnid` int(11) DEFAULT NULL,
  `ordernum` varchar(255) DEFAULT NULL,
  `createdate` char(19) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `rtncount` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL COMMENT '0 - 待付款， 1 - 交易完成， 9 - 交易关闭',
  `address` varchar(255) DEFAULT NULL,
  `invoice` char(1) DEFAULT NULL COMMENT '0 - 不开发票， 1 - 开发票',
  `invoictitle` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

/*Table structure for table `t_param` */

DROP TABLE IF EXISTS `t_param`;

CREATE TABLE `t_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_param` */

insert  into `t_param`(`id`,`name`,`code`,`val`) values (1,'项目列表显示数量','project-list-size','12'),(2,'首页项目显示数量','home-project-list-size','4');

/*Table structure for table `t_permission` */

DROP TABLE IF EXISTS `t_permission`;

CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `t_permission` */

insert  into `t_permission`(`id`,`pid`,`name`,`icon`,`url`) values (1,NULL,'系统权限菜单','glyphicon glyphicon-th-list',NULL),(2,1,'控制面板','glyphicon glyphicon-dashboard','main.htm'),(3,1,'权限管理','glyphicon glyphicon glyphicon-tasks',NULL),(4,3,'用户维护','glyphicon glyphicon-user','user/toIndex.htm'),(5,3,'角色维护','glyphicon glyphicon-king','role/toIndex.htm'),(6,3,'许可维护','glyphicon glyphicon-lock','permission/index.htm'),(7,1,'业务审核','glyphicon glyphicon-ok',NULL),(8,7,'实名认证审核','glyphicon glyphicon-check','auth_cert/index.htm'),(9,7,'广告审核','glyphicon glyphicon-check','auth_adv/index.htm'),(10,7,'项目审核','glyphicon glyphicon-check','auth_project/index.htm'),(11,1,'业务管理','glyphicon glyphicon-th-large',NULL),(12,11,'资质维护','glyphicon glyphicon-picture','cert/index.htm'),(13,11,'分类管理','glyphicon glyphicon-equalizer','type/index.htm'),(14,11,'流程管理','glyphicon glyphicon-random','process/index.htm'),(15,11,'广告管理','glyphicon glyphicon-hdd','advert/index.htm'),(16,11,'消息模板','glyphicon glyphicon-comment','message/index.htm'),(17,11,'项目分类','glyphicon glyphicon-list','projectType/index.htm'),(18,11,'项目标签','glyphicon glyphicon-tags','tag/index.htm'),(19,1,'参数管理','glyphicon glyphicon-list-alt','param/index.htm');

/*Table structure for table `t_project` */

DROP TABLE IF EXISTS `t_project`;

CREATE TABLE `t_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `money` bigint(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL COMMENT '0 - 即将开始， 1 - 众筹中， 2 - 众筹成功， 3 - 众筹失败',
  `deploydate` char(10) DEFAULT NULL,
  `supportmoney` bigint(11) DEFAULT NULL,
  `supporter` int(11) DEFAULT NULL,
  `completion` int(3) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `createdate` char(19) DEFAULT NULL,
  `follower` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_project` */

/*Table structure for table `t_project_tag` */

DROP TABLE IF EXISTS `t_project_tag`;

CREATE TABLE `t_project_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) DEFAULT NULL,
  `tagid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_7` (`projectid`),
  KEY `FK_Reference_8` (`tagid`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`projectid`) REFERENCES `t_project` (`id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`tagid`) REFERENCES `t_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_project_tag` */

/*Table structure for table `t_project_type` */

DROP TABLE IF EXISTS `t_project_type`;

CREATE TABLE `t_project_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`projectid`),
  KEY `FK_Reference_6` (`typeid`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`projectid`) REFERENCES `t_project` (`id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`typeid`) REFERENCES `t_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_project_type` */

/*Table structure for table `t_return` */

DROP TABLE IF EXISTS `t_return`;

CREATE TABLE `t_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) DEFAULT NULL,
  `type` char(1) DEFAULT NULL COMMENT '0 - 实物回报， 1 虚拟物品回报',
  `supportmoney` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '“0”为不限回报数量',
  `signalpurchase` int(11) DEFAULT NULL,
  `purchase` int(11) DEFAULT NULL,
  `freight` int(11) DEFAULT NULL,
  `invoice` char(1) DEFAULT NULL COMMENT '0 - 不开发票， 1 - 开发票',
  `rtndate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_return` */

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`name`) values (1,'PM - 项目经理'),(2,'	SE - 软件工程师'),(3,'PG - 程序员'),(4,'TL - 组长'),(5,'GL - 组长'),(6,'QA - 品质保证'),(7,'QC - 品质控制'),(8,'	SA - 软件架构师'),(9,'	CMO / CMS - 配置管理员');

/*Table structure for table `t_role_permission` */

DROP TABLE IF EXISTS `t_role_permission`;

CREATE TABLE `t_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `permissionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_3` (`roleid`),
  KEY `FK_Reference_4` (`permissionid`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`permissionid`) REFERENCES `t_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

/*Data for the table `t_role_permission` */

insert  into `t_role_permission`(`id`,`roleid`,`permissionid`) values (38,2,1),(39,2,2),(40,2,4),(41,2,5),(42,2,6),(71,3,1),(72,3,2),(85,4,1),(86,4,2),(87,4,11),(88,4,12),(89,4,13),(90,4,14),(91,4,15),(92,4,16),(93,4,17),(94,4,18),(95,5,1),(96,5,2),(97,5,11),(98,5,12),(99,5,13),(100,5,14),(101,5,15),(102,5,16),(103,5,17),(104,5,18),(105,5,19),(106,6,1),(107,6,2),(108,8,1),(109,8,2),(110,9,1),(111,9,2),(112,7,1),(113,7,2),(125,1,1),(126,1,2),(127,1,3),(128,1,4),(129,1,5),(130,1,6),(131,1,7),(132,1,8),(133,1,9),(134,1,10),(135,1,11),(136,1,12),(137,1,13),(138,1,14),(139,1,15),(140,1,16),(141,1,17),(142,1,18),(143,1,19);

/*Table structure for table `t_tag` */

DROP TABLE IF EXISTS `t_tag`;

CREATE TABLE `t_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_tag` */

/*Table structure for table `t_type` */

DROP TABLE IF EXISTS `t_type`;

CREATE TABLE `t_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_type` */

insert  into `t_type`(`id`,`name`,`remark`) values (1,'科技','sss'),(2,'农业','xxx'),(3,'电子','xxx');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginacct` varchar(255) NOT NULL,
  `userpswd` char(32) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `createtime` char(19) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`loginacct`,`userpswd`,`username`,`email`,`createtime`) values (1,'admin','202cb962ac59075b964b07152d234b70','张三','zhangsan@163.com','2017-06-15 13:27:38'),(17,'lisi','202cb962ac59075b964b07152d234b70','李四','lisi@163.com','2017-06-18 11:25:00'),(39,'admin22','202cb962ac59075b964b07152d234b70','管理员22','admin22@126.com','2019-10-25 23:02:08'),(40,'admin23','202cb962ac59075b964b07152d234b70','管理员23','admin23@126.com','2019-10-25 23:02:08');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`userid`),
  KEY `FK_Reference_2` (`roleid`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`id`,`userid`,`roleid`) values (15,1,1),(16,1,2),(17,1,3),(18,1,4),(19,17,3),(20,17,4),(25,17,8),(26,17,9),(35,40,3),(36,40,2),(37,39,5),(38,39,6),(39,39,7);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
