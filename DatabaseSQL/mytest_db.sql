# Host: localhost  (Version: 5.6.24-log)
# Date: 2015-12-17 11:02:53
# Generator: MySQL-Front 5.3  (Build 4.211)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "student"
#

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_name` varchar(20) NOT NULL,
  PRIMARY KEY (`stu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "student"
#

INSERT INTO `student` VALUES ('浩浩'),('猪猪'),('萌萌');

#
# Structure for table "userinfo"
#

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `username` varchar(10) NOT NULL,
  `password` varchar(18) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `favourite` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `type` varchar(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "userinfo"
#

INSERT INTO `userinfo` VALUES ('傲娇','123456','1','教师','[影视娱乐]','123456','1'),('养的累','123456','1','教师','[电脑网络, 影视娱乐]','哈哈哈哈哈哈','1'),('十大权威的','123456','1','教师','[影视娱乐]','123456','1'),('卡上看到','123456','1','教师','[电脑网络, 影视娱乐]','123456','1'),('帝企鹅','123456','0','程序员','[电脑网络]','12','0'),('我擦','123456','1','程序员','[电脑网络, 影视娱乐]','都去外地去','1'),('斐济企鹅','123456','1','学生','[影视娱乐]','委屈我','0'),('王企鹅','123456','0','程序员','[电脑网络, 影视娱乐]','1123','0'),('王是企鹅','123456','1','教师','[电脑网络, 影视娱乐]','123456','0'),('阿斯顿','123456','0','教师','[电脑网络, 影视娱乐]','123456','1'),('阿斯顿我','123456','0','教师','[电脑网络, 影视娱乐]','123456','1'),('阿斯顿我是','123456','0','教师','[电脑网络, 影视娱乐]','123456','1');

#
# Structure for table "news"
#

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsid` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` tinytext,
  `userid` varchar(10) NOT NULL,
  `pubtime` datetime DEFAULT NULL,
  PRIMARY KEY (`newsid`),
  KEY `userid` (`userid`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Data for table "news"
#

INSERT INTO `news` VALUES (1,'委屈额','哈哈哈哈','傲娇','2015-11-10 16:45:44'),(2,'今天是个好日子','啊哈哈哈哈哈哈哈','傲娇','2015-11-10 16:47:56'),(3,'十大','我修改了！','傲娇','2015-11-12 10:58:45'),(13,'啊大姐死哦期间','2015年12月1日16:59:57','傲娇','2015-12-01 17:00:00'),(15,'白斑病白斑病白斑病白斑病','2015年12月1日17:00:44','傲娇','2015-12-01 17:00:46'),(16,'踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩','2015年12月1日17:00:52','傲娇','2015-12-01 17:00:55'),(17,'顶顶顶顶顶顶顶顶顶顶顶顶顶','2015年12月1日17:01:01','傲娇','2015-12-01 17:01:03'),(18,'噩噩噩噩噩噩噩噩噩噩','2015年12月1日17:01:10','傲娇','2015-12-01 17:01:11'),(19,'烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦','2015年12月1日17:01:19','傲娇','2015-12-01 17:01:21');
