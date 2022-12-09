/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.6.12-log : Database - tourism
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tourism` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tourism`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('ptw4x19ubb7wuvwcoc81tsqoz7nw9c78','eyJsaWQiOjh9:1ot2OU:6YgpKvx2oLFxUUXnoE-TpQCanfz15fJm4kqXiOXrw_s','2022-11-24 07:54:38.979726');

/*Table structure for table `tourism_booking` */

DROP TABLE IF EXISTS `tourism_booking`;

CREATE TABLE `tourism_booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Status` varchar(200) NOT NULL,
  `VEHICLEID_id` bigint(20) NOT NULL,
  `USERID_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Tourism_booking_VEHICLEID_id_dc409331_fk_Tourism_vehicle_id` (`VEHICLEID_id`),
  KEY `Tourism_booking_USERID_id_ed3e4a09_fk_Tourism_user_id` (`USERID_id`),
  CONSTRAINT `Tourism_booking_USERID_id_ed3e4a09_fk_Tourism_user_id` FOREIGN KEY (`USERID_id`) REFERENCES `tourism_user` (`id`),
  CONSTRAINT `Tourism_booking_VEHICLEID_id_dc409331_fk_Tourism_vehicle_id` FOREIGN KEY (`VEHICLEID_id`) REFERENCES `tourism_vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `tourism_booking` */

insert  into `tourism_booking`(`id`,`Date`,`Status`,`VEHICLEID_id`,`USERID_id`) values 
(1,'2022-11-09','Approved',1,2),
(3,'2022-11-09','Pending',1,2),
(10,'2022-11-23','Pending',1,2);

/*Table structure for table `tourism_complaints` */

DROP TABLE IF EXISTS `tourism_complaints`;

CREATE TABLE `tourism_complaints` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Complaints` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `Reply` varchar(200) NOT NULL,
  `Reply_date` date NOT NULL,
  `USERID_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tourism_complaints` */

insert  into `tourism_complaints`(`id`,`Complaints`,`date`,`Reply`,`Reply_date`,`USERID_id`) values 
(1,'bad','2022-11-17','pending','2022-11-17',2),
(2,'aaaa','2022-11-17','pending','2022-11-17',4),
(3,'haaai','2022-11-17','pending','2022-11-17',4),
(4,'hh','2022-11-21','pending','2022-11-21',9),
(5,'hh','2022-11-21','pending','2022-11-21',9),
(6,'Veryy baddd','2022-11-22','pending','2022-11-22',7);

/*Table structure for table `tourism_feedback` */

DROP TABLE IF EXISTS `tourism_feedback`;

CREATE TABLE `tourism_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Feedback` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `USERID_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Tourism_feedback_USERID_id_453aeb78_fk_Tourism_user_id` (`USERID_id`),
  CONSTRAINT `Tourism_feedback_USERID_id_453aeb78_fk_Tourism_user_id` FOREIGN KEY (`USERID_id`) REFERENCES `tourism_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tourism_feedback` */

insert  into `tourism_feedback`(`id`,`Feedback`,`date`,`USERID_id`) values 
(1,'aaaa','2022-11-15',2),
(2,'good','2022-11-15',2),
(3,'Veryy good','2022-11-16',2),
(4,'uu','2022-11-17',2),
(5,'yyu','2022-11-21',9),
(6,'yyu','2022-11-21',9),
(7,'Woww superb experience','2022-11-23',2);

/*Table structure for table `tourism_gallery` */

DROP TABLE IF EXISTS `tourism_gallery`;

CREATE TABLE `tourism_gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Photo` varchar(200) NOT NULL,
  `USERID_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tourism_gallery` */

insert  into `tourism_gallery`(`id`,`Photo`,`USERID_id`) values 
(1,'/static/221121-111021.jpg',2),
(2,'/static/221121-111409.jpg',9),
(3,'/static/221121-111409.jpg',9);

/*Table structure for table `tourism_login` */

DROP TABLE IF EXISTS `tourism_login`;

CREATE TABLE `tourism_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Username` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `usertype` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `tourism_login` */

insert  into `tourism_login`(`id`,`Username`,`Password`,`usertype`) values 
(1,'Razeen','admin','Admin'),
(2,'razeenrazi5agi@gmail.com','f','Traveler'),
(3,'razeenrazi@gmail.com','tr','Traveler'),
(4,'razee@gmail.com','trr','Traveler'),
(5,'razeenraziagi@gmail.com','trr','Traveler'),
(6,'razeen@gmail.com','u','User'),
(7,'gi@gmail.com','kkk','Traveler'),
(8,'razeenrazi3agi@gmail.com','u','User'),
(9,'ruzainruzi5uji@gmail.com','tra','Traveler'),
(10,'razeenrazi5agi@gmail.com','Ajii','User'),
(11,'razeenrazi5agi@gmail.com','Ajii','User'),
(12,'ruzainruzi5agi@gmail.com','Ruzi','User'),
(13,'Rani@gnail.com','rani','User'),
(14,'sa@gmail.com','s','User'),
(15,'raaz@gmail.com','user','User'),
(18,'Rizvan@gmail.com','riz','User'),
(19,'fafa@gmail.com','ff','User'),
(20,'fafa@gmail.com','ff','User'),
(21,'usuud@gmail.con','u','User'),
(22,'razeenazi5agi@gmail.com','u','User');

/*Table structure for table `tourism_place` */

DROP TABLE IF EXISTS `tourism_place`;

CREATE TABLE `tourism_place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Image` varchar(200) NOT NULL,
  `Place` varchar(200) NOT NULL,
  `Pin` int(11) NOT NULL,
  `Post` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tourism_place` */

insert  into `tourism_place`(`id`,`Name`,`Image`,`Place`,`Pin`,`Post`) values 
(1,'Munnar','/static/20221109105332.jpg','Idukki',685612,'Wayanad');

/*Table structure for table `tourism_travelers` */

DROP TABLE IF EXISTS `tourism_travelers`;

CREATE TABLE `tourism_travelers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Place` varchar(200) NOT NULL,
  `Post` varchar(200) NOT NULL,
  `Pin` int(11) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `PhoneNo` int(11) NOT NULL,
  `TRAVELID_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Tourism_travelers_TRAVELID_id_2135a760_fk_Tourism_login_id` (`TRAVELID_id`),
  CONSTRAINT `Tourism_travelers_TRAVELID_id_2135a760_fk_Tourism_login_id` FOREIGN KEY (`TRAVELID_id`) REFERENCES `tourism_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tourism_travelers` */

insert  into `tourism_travelers`(`id`,`Name`,`Place`,`Post`,`Pin`,`Email`,`Photo`,`PhoneNo`,`TRAVELID_id`) values 
(1,'razeen agi','kannur','kannur',124141,'razeenrazi5agi@gmail.com','/static/221108-132640.jpg',1241412412,2),
(2,'razeen agi','Idukki','Wayanad',670302,'razeenrazi@gmail.com','/static/221108-133618.jpg',2147483647,3),
(3,'razeen agi','Idukki','Wayanad',213,'razee@gmail.com','/static/221108-133711.jpg',1241412412,4),
(4,'razeen agi','kannur','kannur',124141,'razeenraziagi@gmail.com','/static/221108-133920.jpg',1241412412,5),
(5,'razeen agi','kannur','kannur',670002,'gi@gmail.com','/static/221109-110327.jpg',1241412412,7),
(6,'Ruzain Uji','kannur','kannur',670302,'ruzainruzi5uji@gmail.com','/static/221109-112835.jpg',2147483647,9);

/*Table structure for table `tourism_user` */

DROP TABLE IF EXISTS `tourism_user`;

CREATE TABLE `tourism_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Place` varchar(200) NOT NULL,
  `Post` varchar(200) NOT NULL,
  `Pin` int(6) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `PhoneNo` bigint(10) NOT NULL,
  `USERID_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Tourism_user_USERID_id_a3a5bec0_fk_Tourism_login_id` (`USERID_id`),
  CONSTRAINT `Tourism_user_USERID_id_a3a5bec0_fk_Tourism_login_id` FOREIGN KEY (`USERID_id`) REFERENCES `tourism_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `tourism_user` */

insert  into `tourism_user`(`id`,`Name`,`Place`,`Post`,`Pin`,`Email`,`Photo`,`PhoneNo`,`USERID_id`) values 
(1,'razeen agi','kannur','kannur',670302,'razeen@gmail.com','/static/221108-134933.jpg',2147483647,6),
(2,'razeen Abdu','kannur','kannur',670302,'razeenrazi3agi@gmail.com','/static/221109-111208.jpg',2147483647,8),
(3,'Razeen','Kannur','Kannur',670302,'razeenrazi5agi@gmail.com','',2147483647,11),
(4,'Ruzain','Kannapuram','Kannur',670302,'ruzainruzi5agi@gmail.com','',2147483647,12),
(5,'Rani','Kannur','kannur',670302,'Rani@gnail.com','',2147483647,13),
(6,'Safwa','kannur','kannur',678373,'sa@gmail.com','',2147483647,14),
(7,'razeen','Kannur','Kannur',670302,'raaz@gmail.com','/static/221118-114935.jpg',6238399717,15),
(8,'Rizwan','Mattul','Kannur',670301,'Rizvan@gmail.com','/static/221118-150611.jpg',9400567890,18),
(9,'fahad','kannur','kannur',670673,'fafa@gmail.com','/static/221121-111216.jpg',7689098767,19),
(10,'fahad','kannur','kannur',670673,'fafa@gmail.com','/static/221121-111216.jpg',7689098767,20),
(11,'ssd','rrf','gtg',645676,'razeenazi5agi@gmail.com','/static/221123-132139.jpg',6238399717,22);

/*Table structure for table `tourism_vehicle` */

DROP TABLE IF EXISTS `tourism_vehicle`;

CREATE TABLE `tourism_vehicle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Type` varchar(200) NOT NULL,
  `Details` varchar(200) NOT NULL,
  `Cost` int(11) NOT NULL,
  `TRAVELID_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tourism_vehicle` */

insert  into `tourism_vehicle`(`id`,`Name`,`Capacity`,`Type`,`Details`,`Cost`,`TRAVELID_id`) values 
(1,'Al Raaz',100,'Big traveller','Very Comfortable and Low budget',10000,5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
