-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.43-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema shope_online
--

CREATE DATABASE IF NOT EXISTS shope_online;
USE shope_online;

--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(45) NOT NULL,
  `cat_desc` varchar(200) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`cat_id`,`cat_name`,`cat_desc`) VALUES 
 (2,'Electronic Device','Electronic Device'),
 (3,'Mobile','Good'),
 (4,'Jewellary','Good'),
 (5,'Bags Collection','Good'),
 (6,'Cloth Collection','Good'),
 (7,'Bike','Good'),
 (8,'Watches','Good'),
 (9,'Computer','Good');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `delivary_cost`
--

DROP TABLE IF EXISTS `delivary_cost`;
CREATE TABLE `delivary_cost` (
  `delivary_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(45) NOT NULL,
  `delivary_cost` double NOT NULL,
  PRIMARY KEY (`delivary_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivary_cost`
--

/*!40000 ALTER TABLE `delivary_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivary_cost` ENABLE KEYS */;


--
-- Definition of table `pro_order`
--

DROP TABLE IF EXISTS `pro_order`;
CREATE TABLE `pro_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `order_date` date NOT NULL,
  `order_qty` int(10) unsigned NOT NULL,
  `total_price` double NOT NULL,
  `order_status` varchar(45) NOT NULL DEFAULT '"N"',
  `delivary_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_pro_order_user_id` (`user_id`),
  KEY `FK_pro_order_del_id` (`delivary_id`),
  CONSTRAINT `FK_pro_order_del_id` FOREIGN KEY (`delivary_id`) REFERENCES `delivary_cost` (`delivary_id`),
  CONSTRAINT `FK_pro_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `shop_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pro_order`
--

/*!40000 ALTER TABLE `pro_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_order` ENABLE KEYS */;


--
-- Definition of table `pro_order_details`
--

DROP TABLE IF EXISTS `pro_order_details`;
CREATE TABLE `pro_order_details` (
  `order_details_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `pro_id` int(10) unsigned NOT NULL,
  `pro_qty` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_details_id`),
  KEY `FK_pro_order_details_order_id` (`order_id`),
  KEY `FK_pro_order_details_pro_id` (`pro_id`),
  CONSTRAINT `FK_pro_order_details_order_id` FOREIGN KEY (`order_id`) REFERENCES `pro_order` (`order_id`),
  CONSTRAINT `FK_pro_order_details_pro_id` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pro_order_details`
--

/*!40000 ALTER TABLE `pro_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_order_details` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pro_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_cat_id` int(10) unsigned NOT NULL,
  `pro_name` varchar(45) NOT NULL,
  `pro_qty` int(10) unsigned NOT NULL,
  `pro_price` double NOT NULL,
  `pro_url` varchar(45) NOT NULL,
  `pro_desc` varchar(200) NOT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `FK_product_sub_cat_id` (`sub_cat_id`),
  CONSTRAINT `FK_product_sub_cat_id` FOREIGN KEY (`sub_cat_id`) REFERENCES `sub_category` (`sub_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`pro_id`,`sub_cat_id`,`pro_name`,`pro_qty`,`pro_price`,`pro_url`,`pro_desc`) VALUES 
 (28,13,'Xiaomi Redmi',10,21990,'phone.jpg','Good'),
 (29,14,'Huawei Y6',10,28990,'huawei.jpg','Good'),
 (31,15,'Vivo Apex',10,27990,'vivo.jpg','Good'),
 (32,16,'Y7',10,25990,'y7.jpg','Good'),
 (33,15,'Vivo Y12',12,25990,'vivo-y12_thumb.jpg','Good'),
 (34,17,'Apple',12,60990,'apple.jpg','Good'),
 (35,18,'Samsung',12,60000,'samsung.jpg','Good'),
 (36,18,'Samsung',12,80000,'samsung2.jpg','Good'),
 (37,18,'Samsung',12,80000,'samsung.jpg','Good'),
 (39,15,'Vivo S1',14,49900,'vivoS1.jpg','Good'),
 (40,19,'Pandent',14,10000,'locket2.jpg','Good'),
 (41,20,'Santi Hard',14,15000,'santiHard.jpg','Good'),
 (42,20,'Leather',11,5000,'leather1.jpg','Good'),
 (43,20,'Small Bag',10,2000,'smallBag.jpg','Good'),
 (44,20,'Leather Bag',5,2000,'leatherbag.jpg','Good'),
 (45,20,'Simple bag',5,2000,'bag2.jpg','Good'),
 (46,20,'Trendy',5,1500,'trendyBag.jpg','Good'),
 (47,20,'Red Leather',5,2500,'redbagjpg.jpg','Good'),
 (48,19,'Pandent',5,9900,'locket1.jpg','Good'),
 (49,19,'Jewellary',5,18900,'fashion.jpg','Good'),
 (50,21,'Gown',5,18900,'gown1.jpg','Good'),
 (51,19,'Daimond Collection',5,118900,'jw1.jpg','Good'),
 (52,21,'Gown',5,18900,'gown3.jpg','Good'),
 (53,19,'Diamon Neckless',5,118900,'jw2.jpg','Good'),
 (55,20,'Latest Bag',10,1500,'Bag.jpg','Good'),
 (56,22,'Net & Pure Shiffon',10,1500,'shari.jpg','Good'),
 (57,23,'Honda',10,150000,'bike1.jpg','Good'),
 (58,23,'Honda',10,150000,'honda1.jpg','Good'),
 (59,24,'Man\'s Watches',10,12000,'watches1.jpg','Good'),
 (60,25,'Desktop',10,40000,'Dell Optiplex 780 Desktop PC.jpg','Good'),
 (61,25,'Laptop',10,60000,'laptop1.jpg','Good'),
 (62,24,'Man\'s Watches',10,15000,'watches.jpg','Good'),
 (63,23,'Bike',10,150000,'hondajpg.jpg','Good');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `shop_user`
--

DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `req_date` date NOT NULL,
  `contact_no` varchar(11) NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_shop_use_role_id` (`role_id`),
  CONSTRAINT `FK_shop_use_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_user`
--

/*!40000 ALTER TABLE `shop_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_user` ENABLE KEYS */;


--
-- Definition of table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
CREATE TABLE `sub_category` (
  `sub_cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int(10) unsigned NOT NULL,
  `sub_cat_name` varchar(45) NOT NULL,
  `sub_cat_desc` varchar(200) NOT NULL,
  PRIMARY KEY (`sub_cat_id`),
  KEY `FK_sub_category_cat_id` (`cat_id`),
  CONSTRAINT `FK_sub_category_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category`
--

/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` (`sub_cat_id`,`cat_id`,`sub_cat_name`,`sub_cat_desc`) VALUES 
 (13,2,'Mobile','Good'),
 (14,3,'Huawei','Good'),
 (15,3,'Vivo','Good'),
 (16,3,'Y7','Good'),
 (17,3,'Apple','Good'),
 (18,3,'Samsung','Good'),
 (19,4,'Locket','Good'),
 (20,5,'Bags','Good'),
 (21,6,'Gown','Good'),
 (22,6,'Shari','Good'),
 (23,7,'Honda','Good'),
 (24,8,'Watches','Good'),
 (25,9,'Computer','Good');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;


--
-- Definition of table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
