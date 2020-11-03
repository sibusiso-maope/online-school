-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema onlineschool
--

CREATE DATABASE IF NOT EXISTS onlineschool;
USE onlineschool;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `a_id` int(10) unsigned NOT NULL auto_increment,
  `a_name` varchar(45) NOT NULL,
  `a_email` varchar(45) NOT NULL,
  `a_phone` varchar(45) NOT NULL,
  PRIMARY KEY  (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `batch`
--

DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch` (
  `b_id` int(10) unsigned NOT NULL auto_increment,
  `d_name` varchar(45) NOT NULL,
  `c_id` int(10) unsigned NOT NULL,
  `sess_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`b_id`),
  KEY `FK_batch_c_id` (`c_id`),
  KEY `FK_batch_sess_id` (`sess_id`),
  CONSTRAINT `FK_batch_c_id` FOREIGN KEY (`c_id`) REFERENCES `class` (`c_id`),
  CONSTRAINT `FK_batch_sess_id` FOREIGN KEY (`sess_id`) REFERENCES `session` (`sess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;


--
-- Definition of table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `c_id` int(10) unsigned NOT NULL auto_increment,
  `c_name` varchar(45) NOT NULL,
  PRIMARY KEY  (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` (`c_id`,`c_name`) VALUES 
 (1,'six'),
 (2,'seven'),
 (3,'eight'),
 (4,'nine'),
 (5,'ten');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;


--
-- Definition of table `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `n_id` int(10) unsigned NOT NULL auto_increment,
  `n_title` varchar(250) NOT NULL,
  `n_description` varchar(500) NOT NULL,
  `publish_date` date NOT NULL,
  PRIMARY KEY  (`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice`
--

/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`n_id`,`n_title`,`n_description`,`publish_date`) VALUES 
 (1,'Class Six Admission Circular - 2019','ssss dddd aaaa','2018-10-10'),
 (2,'XII 2017-2018 Fees Notice ( Aug to Oct 2018)','aaasss ddf gghy ddrr ggjjbb ddefr vggth cdffr bmjbh hhg ','2018-10-28'),
 (3,'School Departure time for junior section has been changed','Dear Parents, School Departure time for junior section has been changed from Main Campus From November 01, 2017 until further notice.','2018-11-02');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;


--
-- Definition of table `result`
--

DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `res_id` int(10) unsigned NOT NULL auto_increment,
  `sem_id` int(10) unsigned NOT NULL,
  `s_id` int(10) unsigned NOT NULL,
  `sub_id` int(10) unsigned NOT NULL,
  `marks` int(10) unsigned NOT NULL,
  `g_point` double NOT NULL,
  `grade` varchar(10) NOT NULL,
  PRIMARY KEY  (`res_id`),
  KEY `FK_result_sem_id` (`sem_id`),
  KEY `FK_result_s_id` (`s_id`),
  KEY `FK_result_sub_id` (`sub_id`),
  CONSTRAINT `FK_result_sem_id` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`sem_id`),
  CONSTRAINT `FK_result_sub_id` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`sub_id`),
  CONSTRAINT `FK_result_s_id` FOREIGN KEY (`s_id`) REFERENCES `student_info` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` (`res_id`,`sem_id`,`s_id`,`sub_id`,`marks`,`g_point`,`grade`) VALUES 
 (1,1,1,1,80,5,'A+'),
 (3,1,2,2,75,4,'A'),
 (4,1,1,3,85,5,'A+'),
 (5,2,1,1,75,4,'A'),
 (6,2,1,3,60,3.5,'A-'),
 (7,1,1,2,75,4,'A'),
 (8,1,3,2,75,4,'A'),
 (9,1,3,1,82,4,'A+'),
 (10,1,3,3,67,3.5,'A-');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `r_id` int(10) unsigned NOT NULL auto_increment,
  `r_name` varchar(45) NOT NULL,
  PRIMARY KEY  (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`r_id`,`r_name`) VALUES 
 (1,'Admin'),
 (2,'Teacher'),
 (3,'Student');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `semester`
--

DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester` (
  `sem_id` int(10) unsigned NOT NULL auto_increment,
  `sem_name` varchar(45) NOT NULL,
  PRIMARY KEY  (`sem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` (`sem_id`,`sem_name`) VALUES 
 (1,'1st semester'),
 (2,'2nd semester'),
 (3,'Annual semester ');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;


--
-- Definition of table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `sess_id` int(10) unsigned NOT NULL auto_increment,
  `sess_year` varchar(45) NOT NULL,
  PRIMARY KEY  (`sess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session`
--

/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` (`sess_id`,`sess_year`) VALUES 
 (1,'2018-19'),
 (2,'2019-20'),
 (3,'2020-21');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;


--
-- Definition of table `student_attendance`
--

DROP TABLE IF EXISTS `student_attendance`;
CREATE TABLE `student_attendance` (
  `sa_id` int(10) unsigned NOT NULL auto_increment,
  `sa_date` date default NULL,
  `s_id` int(10) unsigned NOT NULL,
  `status` varchar(45) NOT NULL default 'A',
  PRIMARY KEY  (`sa_id`),
  KEY `FK_student_attendance_s_id` (`s_id`),
  CONSTRAINT `FK_student_attendance_s_id` FOREIGN KEY (`s_id`) REFERENCES `student_info` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_attendance`
--

/*!40000 ALTER TABLE `student_attendance` DISABLE KEYS */;
INSERT INTO `student_attendance` (`sa_id`,`sa_date`,`s_id`,`status`) VALUES 
 (16,'2020-06-08',1,'P'),
 (17,'2020-06-08',2,'P'),
 (18,'2020-06-08',4,'P'),
 (19,'2020-06-08',5,'P'),
 (20,'2020-06-08',3,'P'),
 (21,'2020-06-09',5,'P'),
 (22,'2020-06-09',1,'P'),
 (23,'2020-06-09',2,'A'),
 (24,'2020-06-09',4,'A'),
 (25,'2020-06-10',1,'P'),
 (26,'2020-06-10',2,'A'),
 (27,'2020-06-10',1,'P'),
 (28,'2020-06-10',1,'A'),
 (29,'2020-06-10',2,'P'),
 (30,'2020-06-11',4,'P'),
 (31,'2020-06-11',3,'P'),
 (32,'2020-06-11',3,'P'),
 (33,'2020-06-11',3,'A'),
 (34,'2020-06-11',1,'P');
/*!40000 ALTER TABLE `student_attendance` ENABLE KEYS */;


--
-- Definition of table `student_info`
--

DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `s_id` int(10) unsigned NOT NULL auto_increment,
  `s_name` varchar(500) NOT NULL,
  `c_id` int(10) unsigned NOT NULL,
  `sess_id` int(10) unsigned NOT NULL,
  `roll_no` int(10) unsigned NOT NULL,
  `gender` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `age` int(10) unsigned NOT NULL,
  `f_name` varchar(500) NOT NULL,
  `l_name` varchar(500) NOT NULL,
  `telephone_no` int(10) unsigned default NULL,
  `mobile_no` int(10) unsigned NOT NULL,
  `present_address` varchar(500) NOT NULL,
  `permanent_address` varchar(500) default NULL,
  PRIMARY KEY  (`s_id`),
  KEY `FK_student_info_c_id` (`c_id`),
  KEY `FK_student_info_sess_id` (`sess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 7168 kB';

--
-- Dumping data for table `student_info`
--

/*!40000 ALTER TABLE `student_info` DISABLE KEYS */;
INSERT INTO `student_info` (`s_id`,`s_name`,`c_id`,`sess_id`,`roll_no`,`gender`,`dob`,`age`,`f_name`,`l_name`,`telephone_no`,`mobile_no`,`present_address`,`permanent_address`) VALUES 
 (1,'sabelomaope',1,1,6001,'Male','1998-09-23',22,'Sabelo','Maope',1671315561,0634209999,'Ext 11, Evaton','Ext 11, Evaton'),
 (2,'siphiwemaope',1,1,6002,'Male','2000-10-29',20,'Siphiwe','Maope',1671315561,0635551111,'Ext 11, Evaton','Ext 11, Evaton'),
 (3,'thabisolehasa',3,1,8001,'Female','2004-08-20',16,'Thabiso','Lehasa',1811375624,0617207866,'Country View Estate, Midrand','Country View Estate, Midrand'),
 (4,'atlehanglehasa',1,1,6003,'Male','2002-06-13',18,'Atlehang','Lehasa',1811375624,0623601818,'Country View Estate, Midrand','Country View Estate, Midrand');
/*!40000 ALTER TABLE `student_info` ENABLE KEYS */;


--
-- Definition of table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `sub_id` int(10) unsigned NOT NULL auto_increment,
  `sub_name` varchar(45) NOT NULL,
  PRIMARY KEY  (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` (`sub_id`,`sub_name`) VALUES 
 (1,'Forex'),
 (2,'Money Management'),
 (3,'Business Management');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;


--
-- Definition of table `teacher_info`
--

DROP TABLE IF EXISTS `teacher_info`;
CREATE TABLE `teacher_info` (
  `t_id` int(10) unsigned NOT NULL auto_increment,
  `t_name` varchar(405) NOT NULL,
  `t_email` varchar(400) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `phone_number` int(11) unsigned NOT NULL,
  `address` varchar(500) NOT NULL,
  `sub_id` int(10) unsigned NOT NULL,
  `join_date` date NOT NULL,
  PRIMARY KEY  (`t_id`),
  KEY `FK_teacher_info_sub_id` (`sub_id`),
  CONSTRAINT `FK_teacher_info_sub_id` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_info`
--

/*!40000 ALTER TABLE `teacher_info` DISABLE KEYS */;
INSERT INTO `teacher_info` (`t_id`,`t_name`,`t_email`,`gender`,`phone_number`,`address`,`sub_id`,`join_date`) VALUES 
 (3,'Sibusiso Maope','Sibusiso.Maope@gmail.com','Male',0832091789,'63511 Zone 16',1,'2020-01-05'),
 (6,'Phindile Maope','phindimaope@gmail.com','Female',06193331818,'42 Suidrand',2,'2020-01-05'),
 (9,'Mohumi Bofelo','mohumibofelo@gmail.com','Female',0675251080,'47 Vanderbijlpark',3,'2020-01-05');
/*!40000 ALTER TABLE `teacher_info` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `u_id` int(10) unsigned NOT NULL auto_increment,
  `u_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `r_id` int(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY  (`u_id`),
  KEY `FK_users_r_id` (`r_id`),
  CONSTRAINT `FK_users_r_id` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`u_id`,`u_name`,`password`,`r_id`,`email`,`phone`) VALUES 
 (1,'sibusiso','123',1,'',''),
 (2,'phindi','123',2,'',''),
 (3,'ofentse','123',3,'',''),
 (4,'khotso','123',3,'khotso@gmail.com','01625486529'),
 (5,'tumi','123',2,'jamil@gmail.com','01672459968');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
