/*
SQLyog Enterprise - MySQL GUI v6.56
MySQL - 5.0.67-community-nt : Database - stock_predection
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`stock_predection` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `stock_predection`;

/*Table structure for table `articlereg` */

DROP TABLE IF EXISTS `articlereg`;

CREATE TABLE `articlereg` (
  `articlename` varchar(1000) default NULL,
  `password` varchar(1000) default NULL,
  `articleid` varchar(1000) default NULL,
  `articletype` varchar(1000) default NULL,
  `address` varchar(1000) default NULL,
  `employees` varchar(1000) default NULL,
  `branches` varchar(1000) default NULL,
  `status` varchar(1000) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `articlereg` */

insert  into `articlereg`(`articlename`,`password`,`articleid`,`articletype`,`address`,`employees`,`branches`,`status`) values ('timesofindia','123','1591804690854330','public','hyderabad','100','10','waiting'),('the hindu','123','318075888696996','public','asdfghjkl','100','10','waiting'),('decconschronicle','123','1591804690854330','public','hyderabad','100','10','waiting');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `articlename` varchar(1000) default NULL,
  `companyname` varchar(1000) default NULL,
  `companyid` varchar(1000) default NULL,
  `opinion` varchar(1000) default NULL,
  `comment` varchar(1000) default NULL,
  `date` varchar(1000) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comment` */

insert  into `comment`(`articlename`,`companyname`,`companyid`,`opinion`,`comment`,`date`) values ('timesofindia','techmahindra','1','negative','bad','2018-03-26 14:36:18'),('timesofindia','techmahindra','1','negative','very bad','2018-03-26 14:36:29'),('timesofindia','techmahindra','1','neutral','may be gud','2018-03-26 14:36:42'),('timesofindia','techmahindra','1','neutral','maybe bad','2018-03-26 14:36:53'),('timesofindia','techmahindra','1','positive','nice','2018-03-26 14:39:59'),('timesofindia','techmahindra','1','positive','very nice','2018-03-26 14:40:11'),('timesofindia','techmahindra','1','negative','bad','2018-03-26 14:42:34');

/*Table structure for table `comregister` */

DROP TABLE IF EXISTS `comregister`;

CREATE TABLE `comregister` (
  `companyname` varchar(1000) NOT NULL,
  `companyid` varchar(1000) NOT NULL,
  `product` varchar(1000) default NULL,
  `companytype` varchar(1000) NOT NULL,
  `companyaddress` varchar(1000) NOT NULL,
  `employees` varchar(1000) NOT NULL,
  `branches` varchar(1000) NOT NULL,
  `turnover` double NOT NULL,
  `username` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `status` varchar(1000) NOT NULL,
  `shares` double NOT NULL,
  `sharevalue` double NOT NULL,
  `availableshares` double default NULL,
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `comregister` */

insert  into `comregister`(`companyname`,`companyid`,`product`,`companytype`,`companyaddress`,`employees`,`branches`,`turnover`,`username`,`password`,`status`,`shares`,`sharevalue`,`availableshares`,`id`) values ('techmahindra','123','softwares','it','gachibowli','100','10',2000000,'venkat','venkat','activated',1000,2000,1000,1);

/*Table structure for table `publish` */

DROP TABLE IF EXISTS `publish`;

CREATE TABLE `publish` (
  `publishedby` varchar(1000) default NULL,
  `companyname` varchar(1000) default NULL,
  `description` varchar(1000) default NULL,
  `status` varchar(1000) default NULL,
  `quality` varchar(1000) default NULL,
  `positive` varchar(1000) default NULL,
  `negative` varchar(1000) default NULL,
  `nutral` varchar(1000) default NULL,
  `id` int(11) NOT NULL auto_increment,
  `date` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `publish` */

insert  into `publish`(`publishedby`,`companyname`,`description`,`status`,`quality`,`positive`,`negative`,`nutral`,`id`,`date`) values ('timesofindia','techmahindra','this is the one of the software company in india','possitive','80','3','4','3',1,'2018-03-26 13:47:53'),('the hindu','techmahindra','this is the software company which is the best in india','possitive','90','0','0','0',2,'2018-03-26 15:24:55'),('decconschronicle','techmahindra','best software company','possitive','70','0','0','0',3,'2018-03-26 15:25:55');

/*Table structure for table `purchaseshare` */

DROP TABLE IF EXISTS `purchaseshare`;

CREATE TABLE `purchaseshare` (
  `buyer` varchar(1000) default NULL,
  `companyname` varchar(1000) default NULL,
  `companyid` varchar(1000) default NULL,
  `totalshares` double default NULL,
  `purchasedshare` double default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `purchaseshare` */

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `username` varchar(200) default NULL,
  `password` varchar(200) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock` */

insert  into `stock`(`username`,`password`) values ('Stock','Stock');

/*Table structure for table `userreg` */

DROP TABLE IF EXISTS `userreg`;

CREATE TABLE `userreg` (
  `fullname` varchar(1000) default NULL,
  `emailid` varchar(1000) default NULL,
  `aadhar` varchar(1000) default NULL,
  `panno` varchar(1000) default NULL,
  `mobile` varchar(1000) default NULL,
  `address` varchar(1000) default NULL,
  `username` varchar(1000) default NULL,
  `password` varchar(1000) default NULL,
  `status` varchar(1000) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userreg` */

insert  into `userreg`(`fullname`,`emailid`,`aadhar`,`panno`,`mobile`,`address`,`username`,`password`,`status`) values ('venkat','venkatjavaprojects@gmail.com','`123456789','beypg1212B','1234567890','hyd','venkat','venkat','activated');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
