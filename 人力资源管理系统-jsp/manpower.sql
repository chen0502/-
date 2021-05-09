# Host: localhost  (Version 5.7.31-log)
# Date: 2021-03-03 22:01:19
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "bmtable"
#

CREATE TABLE `bmtable` (
  `bmnum` int(11) NOT NULL AUTO_INCREMENT,
  `bmname` varchar(255) NOT NULL DEFAULT '',
  `bmboss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`bmnum`),
  KEY `bm_name` (`bmname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "bmtable"
#

INSERT INTO `bmtable` VALUES (1,'秘书部','李七'),(4,'外交部','王五'),(5,'财务部','小李'),(9,'董事会','李四'),(10,'人事部','李八');

#
# Structure for table "gwtable"
#

CREATE TABLE `gwtable` (
  `gwnum` int(11) NOT NULL AUTO_INCREMENT,
  `gwname` varchar(255) NOT NULL DEFAULT '',
  `gwlevel` varchar(255) NOT NULL DEFAULT '',
  `gwmoney` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`gwnum`),
  UNIQUE KEY `gw_ygwork` (`gwname`)
) ENGINE=InnoDB AUTO_INCREMENT=12309 DEFAULT CHARSET=utf8;

#
# Data for table "gwtable"
#

INSERT INTO `gwtable` VALUES (1,'董事长','10','50w-100w'),(123,'部长','2','1w以下'),(12307,'经理','9','8000000');

#
# Structure for table "rstable"
#

CREATE TABLE `rstable` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "rstable"
#

INSERT INTO `rstable` VALUES (5,'新增陈一'),(6,'新增陈三');

#
# Structure for table "users"
#

CREATE TABLE `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL DEFAULT '',
  `password` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'123456','123456');

#
# Structure for table "ygtable"
#

CREATE TABLE `ygtable` (
  `ygnum` int(11) NOT NULL AUTO_INCREMENT,
  `ygname` varchar(255) NOT NULL DEFAULT '',
  `ygbday` varchar(255) NOT NULL DEFAULT '',
  `ygage` varchar(255) NOT NULL DEFAULT '',
  `ygface` varchar(255) NOT NULL DEFAULT '',
  `ygbody` varchar(255) NOT NULL DEFAULT '',
  `ygwork` varchar(255) NOT NULL DEFAULT '',
  `ygbm` varchar(255) NOT NULL,
  `ygmonmoney` varchar(255) NOT NULL DEFAULT '',
  `ygyearmoney` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ygnum`),
  KEY `yg_bm_idx` (`ygbm`),
  KEY `yg_money` (`ygnum`,`ygname`),
  KEY `yg_gwwork` (`ygwork`),
  CONSTRAINT `yg_bm` FOREIGN KEY (`ygbm`) REFERENCES `bmtable` (`bmname`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `yg_gw` FOREIGN KEY (`ygwork`) REFERENCES `gwtable` (`gwname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Data for table "ygtable"
#

INSERT INTO `ygtable` VALUES (1,'陈2','2001.03.20','19','党员','优秀','经理','秘书部','12000','200000'),(3,'陈三','1996.12.13','24','群众','良好','经理','外交部','6000','100000'),(6,'陈一','2000.12.06','23','党员','良好','经理','财务部','12000','2000000'),(8,'王五','2000.12.06','28','团员','良好','经理','财务部','32000','200000');

#
# Structure for table "kqtable"
#

CREATE TABLE `kqtable` (
  `kqid` int(11) NOT NULL AUTO_INCREMENT,
  `ygnum` int(11) NOT NULL,
  `kqdate` varchar(255) NOT NULL DEFAULT '',
  `kqstate` varchar(255) NOT NULL DEFAULT '',
  `kqtime` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`kqid`),
  KEY `yg_num` (`ygnum`),
  CONSTRAINT `yg_num` FOREIGN KEY (`ygnum`) REFERENCES `ygtable` (`ygnum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "kqtable"
#

INSERT INTO `kqtable` VALUES (4,8,'2021.01.09','迟到','2min'),(5,1,'2020.12.03','请假','1day');
