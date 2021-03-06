-- MySQL dump 10.13  Distrib 5.5.58, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: rollcall
-- ------------------------------------------------------
-- Server version	5.5.58

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `qrtz0_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz0_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz0_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz0_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz0_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz0_blob_triggers`
--

LOCK TABLES `qrtz0_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz0_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz0_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz0_calendars`
--

DROP TABLE IF EXISTS `qrtz0_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz0_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz0_calendars`
--

LOCK TABLES `qrtz0_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz0_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz0_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz0_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz0_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz0_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz0_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz0_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz0_cron_triggers`
--

LOCK TABLES `qrtz0_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz0_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz0_cron_triggers` VALUES ('schedulerFactory','1','group1','0 0 1 ? * SAT','Asia/Shanghai');
/*!40000 ALTER TABLE `qrtz0_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz0_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz0_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz0_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz0_fired_triggers`
--

LOCK TABLES `qrtz0_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz0_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz0_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz0_job_details`
--

DROP TABLE IF EXISTS `qrtz0_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz0_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz0_job_details`
--

LOCK TABLES `qrtz0_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz0_job_details` DISABLE KEYS */;
INSERT INTO `qrtz0_job_details` VALUES ('schedulerFactory','1','group1',NULL,'com.chm.task.TrainTask','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0');
/*!40000 ALTER TABLE `qrtz0_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz0_locks`
--

DROP TABLE IF EXISTS `qrtz0_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz0_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz0_locks`
--

LOCK TABLES `qrtz0_locks` WRITE;
/*!40000 ALTER TABLE `qrtz0_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz0_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz0_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz0_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz0_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz0_paused_trigger_grps`
--

LOCK TABLES `qrtz0_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz0_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz0_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz0_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz0_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz0_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz0_scheduler_state`
--

LOCK TABLES `qrtz0_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz0_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz0_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz0_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz0_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz0_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz0_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz0_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz0_simple_triggers`
--

LOCK TABLES `qrtz0_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz0_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz0_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz0_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz0_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz0_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz0_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz0_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz0_simprop_triggers`
--

LOCK TABLES `qrtz0_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz0_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz0_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz0_triggers`
--

DROP TABLE IF EXISTS `qrtz0_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz0_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz0_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz0_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz0_triggers`
--

LOCK TABLES `qrtz0_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz0_triggers` DISABLE KEYS */;
INSERT INTO `qrtz0_triggers` VALUES ('schedulerFactory','1','group1','1','group1',NULL,1528477200000,1528094322838,5,'WAITING','CRON',1525359633000,0,NULL,0,'');
/*!40000 ALTER TABLE `qrtz0_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_academy`
--

DROP TABLE IF EXISTS `tbl_academy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_academy` (
  `AcaID` varchar(10) NOT NULL COMMENT '学院编号',
  `AcaName` varchar(20) DEFAULT NULL COMMENT '学院名称',
  PRIMARY KEY (`AcaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_academy`
--

LOCK TABLES `tbl_academy` WRITE;
/*!40000 ALTER TABLE `tbl_academy` DISABLE KEYS */;
INSERT INTO `tbl_academy` VALUES ('07','数学与计算科学学院');
/*!40000 ALTER TABLE `tbl_academy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_class`
--

DROP TABLE IF EXISTS `tbl_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_class` (
  `ClassID` varchar(8) NOT NULL,
  `ClassName` varchar(20) DEFAULT NULL,
  `ProID` varchar(10) DEFAULT NULL,
  `Count` int(11) DEFAULT NULL,
  PRIMARY KEY (`ClassID`),
  KEY `FK_Reference_10` (`ProID`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`ProID`) REFERENCES `tbl_professional` (`ProID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_class`
--

LOCK TABLES `tbl_class` WRITE;
/*!40000 ALTER TABLE `tbl_class` DISABLE KEYS */;
INSERT INTO `tbl_class` VALUES ('14070101','14数学一班','0701',30),('14070102','14数学二班','0701',29),('14070103','14数学三班','0701',30),('14070201','14信计一班','0702',28),('14070202','14信计二班','0702',29),('14070203','14信计三班','0702',25),('14070204','14信计四班','0702',27),('14070301','14统计一班','0703',28),('14070302','14统计二班','0703',26);
/*!40000 ALTER TABLE `tbl_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_class_room`
--

DROP TABLE IF EXISTS `tbl_class_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_class_room` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_class_room`
--

LOCK TABLES `tbl_class_room` WRITE;
/*!40000 ALTER TABLE `tbl_class_room` DISABLE KEYS */;
INSERT INTO `tbl_class_room` VALUES (1,'第一教学楼205'),(2,'第八教学楼1-1'),(3,'第八教学楼1-4'),(4,'第八教学楼1-6'),(5,'第八教学楼2-1'),(6,'第八教学楼2-2'),(7,'第八教学楼2-3'),(8,'第八教学楼3-1'),(9,'第八教学楼3-2'),(10,'第八教学楼4-1'),(11,'第八教学楼4-2'),(12,'第八教学楼4-3'),(13,'第八教学楼402'),(14,'第九教学楼105'),(15,'第九教学楼109'),(16,'第九教学楼203'),(17,'第九教学楼205'),(18,'第九教学楼206'),(19,'第九教学楼210'),(20,'第九教学楼311'),(21,'第九教学楼412'),(22,'第九教学楼605'),(23,'第九教学楼612');
/*!40000 ALTER TABLE `tbl_class_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_course`
--

DROP TABLE IF EXISTS `tbl_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_course` (
  `CouID` int(11) NOT NULL AUTO_INCREMENT,
  `CouName` varchar(20) DEFAULT NULL,
  `Credit` int(11) DEFAULT NULL,
  PRIMARY KEY (`CouID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_course`
--

LOCK TABLES `tbl_course` WRITE;
/*!40000 ALTER TABLE `tbl_course` DISABLE KEYS */;
INSERT INTO `tbl_course` VALUES (1,'教育心理学B',2),(2,'初等数学研究',2),(3,'中学数学案例分析',2),(4,'数值分析',2),(5,'多媒体课件制作',3),(6,'形势与政策',3),(7,'数学方法论与解题技巧',3),(8,'现代教育学',3),(9,'数据结构(2)',2),(10,'计算方法',3),(11,'现代密码学A',2),(12,'信息隐藏技术A',3),(13,'计算机网络',2),(14,'数据库系统',2),(15,'金融数学',3),(16,'应用回归分析',3),(17,'计量经济学',2),(18,'应用时间序列分析',3),(19,'利息理论',3),(20,'市场调查与抽样技术',3);
/*!40000 ALTER TABLE `tbl_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_facedata`
--

DROP TABLE IF EXISTS `tbl_facedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_facedata` (
  `FaceID` int(11) NOT NULL AUTO_INCREMENT,
  `StuID` varchar(10) DEFAULT NULL,
  `FaceDate` blob,
  PRIMARY KEY (`FaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_facedata`
--

LOCK TABLES `tbl_facedata` WRITE;
/*!40000 ALTER TABLE `tbl_facedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_facedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_facedata_train_status`
--

DROP TABLE IF EXISTS `tbl_facedata_train_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_facedata_train_status` (
  `StuID` varchar(10) NOT NULL,
  `Status` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`StuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_facedata_train_status`
--

LOCK TABLES `tbl_facedata_train_status` WRITE;
/*!40000 ALTER TABLE `tbl_facedata_train_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_facedata_train_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_manager`
--

DROP TABLE IF EXISTS `tbl_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_manager` (
  `Account` varchar(10) NOT NULL,
  `Password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_manager`
--

LOCK TABLES `tbl_manager` WRITE;
/*!40000 ALTER TABLE `tbl_manager` DISABLE KEYS */;
INSERT INTO `tbl_manager` VALUES ('admin1','123456');
/*!40000 ALTER TABLE `tbl_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_professional`
--

DROP TABLE IF EXISTS `tbl_professional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_professional` (
  `ProID` varchar(10) NOT NULL COMMENT '专业编号',
  `AcaID` varchar(10) DEFAULT NULL COMMENT '学院编号',
  `ProName` varchar(20) DEFAULT NULL COMMENT '专业名称',
  PRIMARY KEY (`ProID`),
  KEY `FK_Reference_9` (`AcaID`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`AcaID`) REFERENCES `tbl_academy` (`AcaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_professional`
--

LOCK TABLES `tbl_professional` WRITE;
/*!40000 ALTER TABLE `tbl_professional` DISABLE KEYS */;
INSERT INTO `tbl_professional` VALUES ('0701','07','数学与应用数学'),('0702','07','信息与计算科学'),('0703','07','应用统计学');
/*!40000 ALTER TABLE `tbl_professional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_quartz_task`
--

DROP TABLE IF EXISTS `tbl_quartz_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_quartz_task` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cron` varchar(20) DEFAULT NULL,
  `Status` enum('0','1') DEFAULT NULL,
  `JobName` varchar(40) DEFAULT NULL,
  `JobGroup` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_quartz_task`
--

LOCK TABLES `tbl_quartz_task` WRITE;
/*!40000 ALTER TABLE `tbl_quartz_task` DISABLE KEYS */;
INSERT INTO `tbl_quartz_task` VALUES (1,'0 0 1 ? * SAT','1','com.chm.task.TrainTask','group1');
/*!40000 ALTER TABLE `tbl_quartz_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_record`
--

DROP TABLE IF EXISTS `tbl_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_record` (
  `RecID` int(11) NOT NULL AUTO_INCREMENT,
  `SchID` int(11) DEFAULT NULL,
  `StuID` varchar(10) DEFAULT NULL,
  `Status` enum('正常','迟到','缺课','请假') DEFAULT NULL,
  `WeekOfSemester` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22') DEFAULT NULL,
  `SignedTime` time DEFAULT NULL,
  `Semester` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`RecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_record`
--

LOCK TABLES `tbl_record` WRITE;
/*!40000 ALTER TABLE `tbl_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_schedule`
--

DROP TABLE IF EXISTS `tbl_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_schedule` (
  `SchID` int(11) NOT NULL AUTO_INCREMENT,
  `RoomID` int(11) DEFAULT NULL,
  `TeachID` int(11) DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `WeekOfSemester` set('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22') DEFAULT NULL,
  `DayOfWeek` int(11) DEFAULT NULL,
  PRIMARY KEY (`SchID`),
  KEY `FK_Reference_6` (`RoomID`),
  KEY `FK_Reference_7` (`TeachID`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`RoomID`) REFERENCES `tbl_class_room` (`ID`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`TeachID`) REFERENCES `tbl_teach` (`TeachID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_schedule`
--

LOCK TABLES `tbl_schedule` WRITE;
/*!40000 ALTER TABLE `tbl_schedule` DISABLE KEYS */;
INSERT INTO `tbl_schedule` VALUES (1,11,1,'08:00:00','09:40:00','1,2,3,4,5,6,7,9,11,12,13,14,15,16,17',1),(2,17,2,'10:00:00','11:40:00','6,7,8,9,10,11,12,13,14,15,16,17',1),(3,12,3,'14:00:00','15:40:00','1,2,3,4,6,7,8',1),(4,9,3,'14:00:00','15:40:00','9',1),(5,10,4,'08:00:00','09:40:00','4,5,6,7,8,9,10,11,12,13,14,15,16,17',2),(6,13,5,'10:00:00','11:40:00','1,2',2),(7,13,5,'16:00:00','17:40:00','3,4,5,6',2),(8,7,6,'16:00:00','17:40:00','17',2),(9,22,7,'08:00:00','09:40:00','1,2,3,4,5,6,7,8',3),(10,6,2,'10:00:00','11:40:00','9,10,11,12,13,14,15,16,17',3),(11,10,3,'14:00:00','15:40:00','1,2,3,4,5,6,7,8',3),(12,13,5,'08:00:00','09:40:00','1,2,3,4,5,6',4),(13,11,1,'08:00:00','09:40:00','17',4),(14,22,2,'10:00:00','11:40:00','1,2,3,4,5,6,7',4),(15,10,4,'14:00:00','15:40:00','4,5,6,7,8,9,10,11,12,13,14,15,16,17',4),(16,22,7,'10:00:00','11:40:00','1,2,3,4,5,6,7,8',5),(17,5,8,'14:00:00','15:40:00','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',5),(18,8,9,'08:00:00','09:40:00','11,12,13,14,15,16,17',1),(19,9,10,'10:00:00','11:40:00','1,2,4,5,6,7,8,9',1),(20,6,11,'14:00:00','15:40:00','5,6,7,8,9,11,15',1),(21,12,10,'16:00:00','17:40:00','10',1),(22,8,11,'10:00:00','11:40:00','11,12,13,14,15,16,17',2),(23,8,12,'10:00:00','11:40:00','1,2,3,4,5,6,7,8,9,10',2),(24,16,13,'14:00:00','15:40:00','1,2,3,4,5,6,7,8,9,10,11,12',2),(25,4,14,'14:00:00','15:40:00','16',2),(26,16,14,'08:00:00','09:40:00','6,7,8,9,10,11,12,13,14,15,16,17',3),(27,2,9,'14:00:00','15:40:00','5,6',3),(28,11,9,'14:00:00','15:40:00','7,8',3),(29,10,9,'14:00:00','15:40:00','9,10,11,12,13,14,15,16,17',3),(30,11,11,'10:00:00','11:40:00','11,12,13,14,16,17',4),(31,18,12,'10:00:00','11:40:00','1,2,3,4,5,6,7,8,9,10',4),(32,9,10,'14:00:00','15:40:00','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15',4),(33,16,13,'19:00:00','20:40:00','16',4),(34,23,13,'08:00:00','09:40:00','1,2,3,4,5,6,7,8,9,10',5),(35,16,13,'08:00:00','09:40:00','11,12,13,14,16',5),(36,21,14,'10:00:00','11:40:00','6,7,8,9,10',5),(37,17,14,'10:00:00','11:40:00','11,12,13,14,16,17',5),(38,22,15,'08:00:00','09:40:00','7,8,9,10,11,12,13,14,15,16,17,18',1),(39,21,16,'14:00:00','15:40:00','1,2,3,4,5,6,7,8',1),(40,1,17,'19:00:00','20:40:00','1,2,3,4,5,6,7,9',1),(41,17,18,'08:00:00','09:40:00','11,12,13,14,15,16,17,18',2),(42,16,19,'10:00:00','11:40:00','1,2,3,4',2),(43,15,20,'10:00:00','11:40:00','7,8,9,10',2),(44,20,20,'10:00:00','11:40:00','11,12,13,14,15',2),(45,1,17,'19:00:00','20:40:00','1,2,3,4,5,6,7,9',2),(46,18,16,'08:00:00','09:40:00','1,2,3,4,5,6,7,8',3),(47,18,15,'10:00:00','11:40:00','7,8,9,10,11,12,13,14,15,16,17,18',3),(48,18,19,'14:00:00','15:40:00','1,2,3,4,5,6,7,8,9,10',3),(49,21,18,'08:00:00','09:40:00','11,12,13,14,15,16,17,18',4),(50,14,20,'10:00:00','11:40:00','11,12,13,14,15',4),(51,21,20,'10:00:00','11:40:00','1,2,3,4,5,6,7,8,9,10',4),(52,18,16,'14:00:00','15:40:00','1,2,3,5,6,7,8',4),(53,17,17,'19:00:00','20:40:00','1,2,3,4,5,6,7,9',4),(54,18,19,'08:00:00','09:40:00','1,2,3,4,5,6,7,8,9,10',5),(55,19,16,'14:00:00','15:40:00','4',5),(56,17,18,'14:00:00','15:40:00','11,12,13,14,15,16,17,18',5);
/*!40000 ALTER TABLE `tbl_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_select_course`
--

DROP TABLE IF EXISTS `tbl_select_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_select_course` (
  `SelectID` int(11) NOT NULL AUTO_INCREMENT,
  `StuID` varchar(10) DEFAULT NULL,
  `TeachID` int(11) DEFAULT NULL,
  `Result` double DEFAULT NULL,
  PRIMARY KEY (`SelectID`),
  KEY `FK_Reference_4` (`StuID`),
  KEY `FK_Reference_8` (`TeachID`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`StuID`) REFERENCES `tbl_student` (`StuID`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`TeachID`) REFERENCES `tbl_teach` (`TeachID`)
) ENGINE=InnoDB AUTO_INCREMENT=2347 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_select_course`
--

LOCK TABLES `tbl_select_course` WRITE;
/*!40000 ALTER TABLE `tbl_select_course` DISABLE KEYS */;
INSERT INTO `tbl_select_course` VALUES (1,'1407010102',1,NULL),(2,'1407010103',1,NULL),(3,'1407010104',1,NULL),(4,'1407010105',1,NULL),(5,'1407010106',1,NULL),(6,'1407010107',1,NULL),(7,'1407010108',1,NULL),(8,'1407010109',1,NULL),(9,'1407010110',1,NULL),(10,'1407010111',1,NULL),(11,'1407010112',1,NULL),(12,'1407010113',1,NULL),(13,'1407010114',1,NULL),(14,'1407010115',1,NULL),(15,'1407010116',1,NULL),(16,'1407010117',1,NULL),(17,'1407010118',1,NULL),(18,'1407010119',1,NULL),(19,'1407010120',1,NULL),(20,'1407010121',1,NULL),(21,'1407010122',1,NULL),(22,'1407010123',1,NULL),(23,'1407010124',1,NULL),(24,'1407010125',1,NULL),(25,'1407010126',1,NULL),(26,'1407010127',1,NULL),(27,'1407010128',1,NULL),(28,'1407010129',1,NULL),(29,'1407010130',1,NULL),(30,'1407020110',1,NULL),(31,'1307010108',1,NULL),(32,'1307010204',1,NULL),(33,'1406070125',1,NULL),(34,'1407010201',1,NULL),(35,'1407010202',1,NULL),(36,'1407010203',1,NULL),(37,'1407010206',1,NULL),(38,'1407010207',1,NULL),(39,'1407010209',1,NULL),(40,'1407010210',1,NULL),(41,'1407010212',1,NULL),(42,'1407010213',1,NULL),(43,'1407010214',1,NULL),(44,'1407010215',1,NULL),(45,'1407010216',1,NULL),(46,'1407010217',1,NULL),(47,'1407010219',1,NULL),(48,'1407010220',1,NULL),(49,'1407010222',1,NULL),(50,'1407010223',1,NULL),(51,'1407010224',1,NULL),(52,'1407010225',1,NULL),(53,'1407010226',1,NULL),(54,'1407010227',1,NULL),(55,'1407010228',1,NULL),(56,'1407010229',1,NULL),(57,'1407010230',1,NULL),(58,'1409010122',1,NULL),(59,'1409010128',1,NULL),(60,'1407010301',1,NULL),(61,'1407010302',1,NULL),(62,'1407010303',1,NULL),(63,'1407010304',1,NULL),(64,'1407010305',1,NULL),(65,'1407010306',1,NULL),(66,'1407010307',1,NULL),(67,'1407010308',1,NULL),(68,'1407010309',1,NULL),(69,'1407010310',1,NULL),(70,'1407010311',1,NULL),(71,'1407010312',1,NULL),(72,'1407010313',1,NULL),(73,'1407010314',1,NULL),(74,'1407010315',1,NULL),(75,'1407010316',1,NULL),(76,'1407010317',1,NULL),(77,'1407010318',1,NULL),(78,'1407010319',1,NULL),(79,'1407010320',1,NULL),(80,'1407010321',1,NULL),(81,'1407010322',1,NULL),(82,'1407010323',1,NULL),(83,'1407010324',1,NULL),(84,'1407010325',1,NULL),(85,'1407010326',1,NULL),(86,'1407010327',1,NULL),(87,'1407010328',1,NULL),(88,'1407010329',1,NULL),(89,'1407010330',1,NULL),(90,'1407010102',2,NULL),(91,'1407010103',2,NULL),(92,'1407010104',2,NULL),(93,'1407010105',2,NULL),(94,'1407010106',2,NULL),(95,'1407010107',2,NULL),(96,'1407010108',2,NULL),(97,'1407010109',2,NULL),(98,'1407010110',2,NULL),(99,'1407010111',2,NULL),(100,'1407010112',2,NULL),(101,'1407010113',2,NULL),(102,'1407010114',2,NULL),(103,'1407010115',2,NULL),(104,'1407010116',2,NULL),(105,'1407010117',2,NULL),(106,'1407010118',2,NULL),(107,'1407010119',2,NULL),(108,'1407010120',2,NULL),(109,'1407010121',2,NULL),(110,'1407010122',2,NULL),(111,'1407010123',2,NULL),(112,'1407010124',2,NULL),(113,'1407010125',2,NULL),(114,'1407010126',2,NULL),(115,'1407010127',2,NULL),(116,'1407010128',2,NULL),(117,'1407010129',2,NULL),(118,'1407010130',2,NULL),(119,'1407020110',2,NULL),(120,'1307010108',2,NULL),(121,'1307010204',2,NULL),(122,'1406070125',2,NULL),(123,'1407010201',2,NULL),(124,'1407010202',2,NULL),(125,'1407010203',2,NULL),(126,'1407010206',2,NULL),(127,'1407010207',2,NULL),(128,'1407010209',2,NULL),(129,'1407010210',2,NULL),(130,'1407010212',2,NULL),(131,'1407010213',2,NULL),(132,'1407010214',2,NULL),(133,'1407010215',2,NULL),(134,'1407010216',2,NULL),(135,'1407010217',2,NULL),(136,'1407010219',2,NULL),(137,'1407010220',2,NULL),(138,'1407010222',2,NULL),(139,'1407010223',2,NULL),(140,'1407010224',2,NULL),(141,'1407010225',2,NULL),(142,'1407010226',2,NULL),(143,'1407010227',2,NULL),(144,'1407010228',2,NULL),(145,'1407010229',2,NULL),(146,'1407010230',2,NULL),(147,'1409010122',2,NULL),(148,'1409010128',2,NULL),(149,'1407010301',2,NULL),(150,'1407010302',2,NULL),(151,'1407010303',2,NULL),(152,'1407010304',2,NULL),(153,'1407010305',2,NULL),(154,'1407010306',2,NULL),(155,'1407010307',2,NULL),(156,'1407010308',2,NULL),(157,'1407010309',2,NULL),(158,'1407010310',2,NULL),(159,'1407010311',2,NULL),(160,'1407010312',2,NULL),(161,'1407010313',2,NULL),(162,'1407010314',2,NULL),(163,'1407010315',2,NULL),(164,'1407010316',2,NULL),(165,'1407010317',2,NULL),(166,'1407010318',2,NULL),(167,'1407010319',2,NULL),(168,'1407010320',2,NULL),(169,'1407010321',2,NULL),(170,'1407010322',2,NULL),(171,'1407010323',2,NULL),(172,'1407010324',2,NULL),(173,'1407010325',2,NULL),(174,'1407010326',2,NULL),(175,'1407010327',2,NULL),(176,'1407010328',2,NULL),(177,'1407010329',2,NULL),(178,'1407010330',2,NULL),(179,'1407010102',3,NULL),(180,'1407010103',3,NULL),(181,'1407010104',3,NULL),(182,'1407010105',3,NULL),(183,'1407010106',3,NULL),(184,'1407010107',3,NULL),(185,'1407010108',3,NULL),(186,'1407010109',3,NULL),(187,'1407010110',3,NULL),(188,'1407010111',3,NULL),(189,'1407010112',3,NULL),(190,'1407010113',3,NULL),(191,'1407010114',3,NULL),(192,'1407010115',3,NULL),(193,'1407010116',3,NULL),(194,'1407010117',3,NULL),(195,'1407010118',3,NULL),(196,'1407010119',3,NULL),(197,'1407010120',3,NULL),(198,'1407010121',3,NULL),(199,'1407010122',3,NULL),(200,'1407010123',3,NULL),(201,'1407010124',3,NULL),(202,'1407010125',3,NULL),(203,'1407010126',3,NULL),(204,'1407010127',3,NULL),(205,'1407010128',3,NULL),(206,'1407010129',3,NULL),(207,'1407010130',3,NULL),(208,'1407020110',3,NULL),(209,'1307010108',3,NULL),(210,'1307010204',3,NULL),(211,'1406070125',3,NULL),(212,'1407010201',3,NULL),(213,'1407010202',3,NULL),(214,'1407010203',3,NULL),(215,'1407010206',3,NULL),(216,'1407010207',3,NULL),(217,'1407010209',3,NULL),(218,'1407010210',3,NULL),(219,'1407010212',3,NULL),(220,'1407010213',3,NULL),(221,'1407010214',3,NULL),(222,'1407010215',3,NULL),(223,'1407010216',3,NULL),(224,'1407010217',3,NULL),(225,'1407010219',3,NULL),(226,'1407010220',3,NULL),(227,'1407010222',3,NULL),(228,'1407010223',3,NULL),(229,'1407010224',3,NULL),(230,'1407010225',3,NULL),(231,'1407010226',3,NULL),(232,'1407010227',3,NULL),(233,'1407010228',3,NULL),(234,'1407010229',3,NULL),(235,'1407010230',3,NULL),(236,'1409010122',3,NULL),(237,'1409010128',3,NULL),(238,'1407010301',3,NULL),(239,'1407010302',3,NULL),(240,'1407010303',3,NULL),(241,'1407010304',3,NULL),(242,'1407010305',3,NULL),(243,'1407010306',3,NULL),(244,'1407010307',3,NULL),(245,'1407010308',3,NULL),(246,'1407010309',3,NULL),(247,'1407010310',3,NULL),(248,'1407010311',3,NULL),(249,'1407010312',3,NULL),(250,'1407010313',3,NULL),(251,'1407010314',3,NULL),(252,'1407010315',3,NULL),(253,'1407010316',3,NULL),(254,'1407010317',3,NULL),(255,'1407010318',3,NULL),(256,'1407010319',3,NULL),(257,'1407010320',3,NULL),(258,'1407010321',3,NULL),(259,'1407010322',3,NULL),(260,'1407010323',3,NULL),(261,'1407010324',3,NULL),(262,'1407010325',3,NULL),(263,'1407010326',3,NULL),(264,'1407010327',3,NULL),(265,'1407010328',3,NULL),(266,'1407010329',3,NULL),(267,'1407010330',3,NULL),(268,'1407010102',4,NULL),(269,'1407010103',4,NULL),(270,'1407010104',4,NULL),(271,'1407010105',4,NULL),(272,'1407010106',4,NULL),(273,'1407010107',4,NULL),(274,'1407010108',4,NULL),(275,'1407010109',4,NULL),(276,'1407010110',4,NULL),(277,'1407010111',4,NULL),(278,'1407010112',4,NULL),(279,'1407010113',4,NULL),(280,'1407010114',4,NULL),(281,'1407010115',4,NULL),(282,'1407010116',4,NULL),(283,'1407010117',4,NULL),(284,'1407010118',4,NULL),(285,'1407010119',4,NULL),(286,'1407010120',4,NULL),(287,'1407010121',4,NULL),(288,'1407010122',4,NULL),(289,'1407010123',4,NULL),(290,'1407010124',4,NULL),(291,'1407010125',4,NULL),(292,'1407010126',4,NULL),(293,'1407010127',4,NULL),(294,'1407010128',4,NULL),(295,'1407010129',4,NULL),(296,'1407010130',4,NULL),(297,'1407020110',4,NULL),(298,'1307010108',4,NULL),(299,'1307010204',4,NULL),(300,'1406070125',4,NULL),(301,'1407010201',4,NULL),(302,'1407010202',4,NULL),(303,'1407010203',4,NULL),(304,'1407010206',4,NULL),(305,'1407010207',4,NULL),(306,'1407010209',4,NULL),(307,'1407010210',4,NULL),(308,'1407010212',4,NULL),(309,'1407010213',4,NULL),(310,'1407010214',4,NULL),(311,'1407010215',4,NULL),(312,'1407010216',4,NULL),(313,'1407010217',4,NULL),(314,'1407010219',4,NULL),(315,'1407010220',4,NULL),(316,'1407010222',4,NULL),(317,'1407010223',4,NULL),(318,'1407010224',4,NULL),(319,'1407010225',4,NULL),(320,'1407010226',4,NULL),(321,'1407010227',4,NULL),(322,'1407010228',4,NULL),(323,'1407010229',4,NULL),(324,'1407010230',4,NULL),(325,'1409010122',4,NULL),(326,'1409010128',4,NULL),(327,'1407010301',4,NULL),(328,'1407010302',4,NULL),(329,'1407010303',4,NULL),(330,'1407010304',4,NULL),(331,'1407010305',4,NULL),(332,'1407010306',4,NULL),(333,'1407010307',4,NULL),(334,'1407010308',4,NULL),(335,'1407010309',4,NULL),(336,'1407010310',4,NULL),(337,'1407010311',4,NULL),(338,'1407010312',4,NULL),(339,'1407010313',4,NULL),(340,'1407010314',4,NULL),(341,'1407010315',4,NULL),(342,'1407010316',4,NULL),(343,'1407010317',4,NULL),(344,'1407010318',4,NULL),(345,'1407010319',4,NULL),(346,'1407010320',4,NULL),(347,'1407010321',4,NULL),(348,'1407010322',4,NULL),(349,'1407010323',4,NULL),(350,'1407010324',4,NULL),(351,'1407010325',4,NULL),(352,'1407010326',4,NULL),(353,'1407010327',4,NULL),(354,'1407010328',4,NULL),(355,'1407010329',4,NULL),(356,'1407010330',4,NULL),(357,'1407010102',5,NULL),(358,'1407010103',5,NULL),(359,'1407010104',5,NULL),(360,'1407010105',5,NULL),(361,'1407010106',5,NULL),(362,'1407010107',5,NULL),(363,'1407010108',5,NULL),(364,'1407010109',5,NULL),(365,'1407010110',5,NULL),(366,'1407010111',5,NULL),(367,'1407010112',5,NULL),(368,'1407010113',5,NULL),(369,'1407010114',5,NULL),(370,'1407010115',5,NULL),(371,'1407010116',5,NULL),(372,'1407010117',5,NULL),(373,'1407010118',5,NULL),(374,'1407010119',5,NULL),(375,'1407010120',5,NULL),(376,'1407010121',5,NULL),(377,'1407010122',5,NULL),(378,'1407010123',5,NULL),(379,'1407010124',5,NULL),(380,'1407010125',5,NULL),(381,'1407010126',5,NULL),(382,'1407010127',5,NULL),(383,'1407010128',5,NULL),(384,'1407010129',5,NULL),(385,'1407010130',5,NULL),(386,'1407020110',5,NULL),(387,'1307010108',5,NULL),(388,'1307010204',5,NULL),(389,'1406070125',5,NULL),(390,'1407010201',5,NULL),(391,'1407010202',5,NULL),(392,'1407010203',5,NULL),(393,'1407010206',5,NULL),(394,'1407010207',5,NULL),(395,'1407010209',5,NULL),(396,'1407010210',5,NULL),(397,'1407010212',5,NULL),(398,'1407010213',5,NULL),(399,'1407010214',5,NULL),(400,'1407010215',5,NULL),(401,'1407010216',5,NULL),(402,'1407010217',5,NULL),(403,'1407010219',5,NULL),(404,'1407010220',5,NULL),(405,'1407010222',5,NULL),(406,'1407010223',5,NULL),(407,'1407010224',5,NULL),(408,'1407010225',5,NULL),(409,'1407010226',5,NULL),(410,'1407010227',5,NULL),(411,'1407010228',5,NULL),(412,'1407010229',5,NULL),(413,'1407010230',5,NULL),(414,'1409010122',5,NULL),(415,'1409010128',5,NULL),(416,'1407010301',5,NULL),(417,'1407010302',5,NULL),(418,'1407010303',5,NULL),(419,'1407010304',5,NULL),(420,'1407010305',5,NULL),(421,'1407010306',5,NULL),(422,'1407010307',5,NULL),(423,'1407010308',5,NULL),(424,'1407010309',5,NULL),(425,'1407010310',5,NULL),(426,'1407010311',5,NULL),(427,'1407010312',5,NULL),(428,'1407010313',5,NULL),(429,'1407010314',5,NULL),(430,'1407010315',5,NULL),(431,'1407010316',5,NULL),(432,'1407010317',5,NULL),(433,'1407010318',5,NULL),(434,'1407010319',5,NULL),(435,'1407010320',5,NULL),(436,'1407010321',5,NULL),(437,'1407010322',5,NULL),(438,'1407010323',5,NULL),(439,'1407010324',5,NULL),(440,'1407010325',5,NULL),(441,'1407010326',5,NULL),(442,'1407010327',5,NULL),(443,'1407010328',5,NULL),(444,'1407010329',5,NULL),(445,'1407010330',5,NULL),(446,'1407010102',6,NULL),(447,'1407010103',6,NULL),(448,'1407010104',6,NULL),(449,'1407010105',6,NULL),(450,'1407010106',6,NULL),(451,'1407010107',6,NULL),(452,'1407010108',6,NULL),(453,'1407010109',6,NULL),(454,'1407010110',6,NULL),(455,'1407010111',6,NULL),(456,'1407010112',6,NULL),(457,'1407010113',6,NULL),(458,'1407010114',6,NULL),(459,'1407010115',6,NULL),(460,'1407010116',6,NULL),(461,'1407010117',6,NULL),(462,'1407010118',6,NULL),(463,'1407010119',6,NULL),(464,'1407010120',6,NULL),(465,'1407010121',6,NULL),(466,'1407010122',6,NULL),(467,'1407010123',6,NULL),(468,'1407010124',6,NULL),(469,'1407010125',6,NULL),(470,'1407010126',6,NULL),(471,'1407010127',6,NULL),(472,'1407010128',6,NULL),(473,'1407010129',6,NULL),(474,'1407010130',6,NULL),(475,'1407020110',6,NULL),(476,'1307010108',6,NULL),(477,'1307010204',6,NULL),(478,'1406070125',6,NULL),(479,'1407010201',6,NULL),(480,'1407010202',6,NULL),(481,'1407010203',6,NULL),(482,'1407010206',6,NULL),(483,'1407010207',6,NULL),(484,'1407010209',6,NULL),(485,'1407010210',6,NULL),(486,'1407010212',6,NULL),(487,'1407010213',6,NULL),(488,'1407010214',6,NULL),(489,'1407010215',6,NULL),(490,'1407010216',6,NULL),(491,'1407010217',6,NULL),(492,'1407010219',6,NULL),(493,'1407010220',6,NULL),(494,'1407010222',6,NULL),(495,'1407010223',6,NULL),(496,'1407010224',6,NULL),(497,'1407010225',6,NULL),(498,'1407010226',6,NULL),(499,'1407010227',6,NULL),(500,'1407010228',6,NULL),(501,'1407010229',6,NULL),(502,'1407010230',6,NULL),(503,'1409010122',6,NULL),(504,'1409010128',6,NULL),(505,'1407010301',6,NULL),(506,'1407010302',6,NULL),(507,'1407010303',6,NULL),(508,'1407010304',6,NULL),(509,'1407010305',6,NULL),(510,'1407010306',6,NULL),(511,'1407010307',6,NULL),(512,'1407010308',6,NULL),(513,'1407010309',6,NULL),(514,'1407010310',6,NULL),(515,'1407010311',6,NULL),(516,'1407010312',6,NULL),(517,'1407010313',6,NULL),(518,'1407010314',6,NULL),(519,'1407010315',6,NULL),(520,'1407010316',6,NULL),(521,'1407010317',6,NULL),(522,'1407010318',6,NULL),(523,'1407010319',6,NULL),(524,'1407010320',6,NULL),(525,'1407010321',6,NULL),(526,'1407010322',6,NULL),(527,'1407010323',6,NULL),(528,'1407010324',6,NULL),(529,'1407010325',6,NULL),(530,'1407010326',6,NULL),(531,'1407010327',6,NULL),(532,'1407010328',6,NULL),(533,'1407010329',6,NULL),(534,'1407010330',6,NULL),(535,'1407010102',7,NULL),(536,'1407010103',7,NULL),(537,'1407010104',7,NULL),(538,'1407010105',7,NULL),(539,'1407010106',7,NULL),(540,'1407010107',7,NULL),(541,'1407010108',7,NULL),(542,'1407010109',7,NULL),(543,'1407010110',7,NULL),(544,'1407010111',7,NULL),(545,'1407010112',7,NULL),(546,'1407010113',7,NULL),(547,'1407010114',7,NULL),(548,'1407010115',7,NULL),(549,'1407010116',7,NULL),(550,'1407010117',7,NULL),(551,'1407010118',7,NULL),(552,'1407010119',7,NULL),(553,'1407010120',7,NULL),(554,'1407010121',7,NULL),(555,'1407010122',7,NULL),(556,'1407010123',7,NULL),(557,'1407010124',7,NULL),(558,'1407010125',7,NULL),(559,'1407010126',7,NULL),(560,'1407010127',7,NULL),(561,'1407010128',7,NULL),(562,'1407010129',7,NULL),(563,'1407010130',7,NULL),(564,'1407020110',7,NULL),(565,'1307010108',7,NULL),(566,'1307010204',7,NULL),(567,'1406070125',7,NULL),(568,'1407010201',7,NULL),(569,'1407010202',7,NULL),(570,'1407010203',7,NULL),(571,'1407010206',7,NULL),(572,'1407010207',7,NULL),(573,'1407010209',7,NULL),(574,'1407010210',7,NULL),(575,'1407010212',7,NULL),(576,'1407010213',7,NULL),(577,'1407010214',7,NULL),(578,'1407010215',7,NULL),(579,'1407010216',7,NULL),(580,'1407010217',7,NULL),(581,'1407010219',7,NULL),(582,'1407010220',7,NULL),(583,'1407010222',7,NULL),(584,'1407010223',7,NULL),(585,'1407010224',7,NULL),(586,'1407010225',7,NULL),(587,'1407010226',7,NULL),(588,'1407010227',7,NULL),(589,'1407010228',7,NULL),(590,'1407010229',7,NULL),(591,'1407010230',7,NULL),(592,'1409010122',7,NULL),(593,'1409010128',7,NULL),(594,'1407010301',7,NULL),(595,'1407010302',7,NULL),(596,'1407010303',7,NULL),(597,'1407010304',7,NULL),(598,'1407010305',7,NULL),(599,'1407010306',7,NULL),(600,'1407010307',7,NULL),(601,'1407010308',7,NULL),(602,'1407010309',7,NULL),(603,'1407010310',7,NULL),(604,'1407010311',7,NULL),(605,'1407010312',7,NULL),(606,'1407010313',7,NULL),(607,'1407010314',7,NULL),(608,'1407010315',7,NULL),(609,'1407010316',7,NULL),(610,'1407010317',7,NULL),(611,'1407010318',7,NULL),(612,'1407010319',7,NULL),(613,'1407010320',7,NULL),(614,'1407010321',7,NULL),(615,'1407010322',7,NULL),(616,'1407010323',7,NULL),(617,'1407010324',7,NULL),(618,'1407010325',7,NULL),(619,'1407010326',7,NULL),(620,'1407010327',7,NULL),(621,'1407010328',7,NULL),(622,'1407010329',7,NULL),(623,'1407010330',7,NULL),(624,'1407010102',8,NULL),(625,'1407010103',8,NULL),(626,'1407010104',8,NULL),(627,'1407010105',8,NULL),(628,'1407010106',8,NULL),(629,'1407010107',8,NULL),(630,'1407010108',8,NULL),(631,'1407010109',8,NULL),(632,'1407010110',8,NULL),(633,'1407010111',8,NULL),(634,'1407010112',8,NULL),(635,'1407010113',8,NULL),(636,'1407010114',8,NULL),(637,'1407010115',8,NULL),(638,'1407010116',8,NULL),(639,'1407010117',8,NULL),(640,'1407010118',8,NULL),(641,'1407010119',8,NULL),(642,'1407010120',8,NULL),(643,'1407010121',8,NULL),(644,'1407010122',8,NULL),(645,'1407010123',8,NULL),(646,'1407010124',8,NULL),(647,'1407010125',8,NULL),(648,'1407010126',8,NULL),(649,'1407010127',8,NULL),(650,'1407010128',8,NULL),(651,'1407010129',8,NULL),(652,'1407010130',8,NULL),(653,'1407020110',8,NULL),(654,'1307010108',8,NULL),(655,'1307010204',8,NULL),(656,'1406070125',8,NULL),(657,'1407010201',8,NULL),(658,'1407010202',8,NULL),(659,'1407010203',8,NULL),(660,'1407010206',8,NULL),(661,'1407010207',8,NULL),(662,'1407010209',8,NULL),(663,'1407010210',8,NULL),(664,'1407010212',8,NULL),(665,'1407010213',8,NULL),(666,'1407010214',8,NULL),(667,'1407010215',8,NULL),(668,'1407010216',8,NULL),(669,'1407010217',8,NULL),(670,'1407010219',8,NULL),(671,'1407010220',8,NULL),(672,'1407010222',8,NULL),(673,'1407010223',8,NULL),(674,'1407010224',8,NULL),(675,'1407010225',8,NULL),(676,'1407010226',8,NULL),(677,'1407010227',8,NULL),(678,'1407010228',8,NULL),(679,'1407010229',8,NULL),(680,'1407010230',8,NULL),(681,'1409010122',8,NULL),(682,'1409010128',8,NULL),(683,'1407010301',8,NULL),(684,'1407010302',8,NULL),(685,'1407010303',8,NULL),(686,'1407010304',8,NULL),(687,'1407010305',8,NULL),(688,'1407010306',8,NULL),(689,'1407010307',8,NULL),(690,'1407010308',8,NULL),(691,'1407010309',8,NULL),(692,'1407010310',8,NULL),(693,'1407010311',8,NULL),(694,'1407010312',8,NULL),(695,'1407010313',8,NULL),(696,'1407010314',8,NULL),(697,'1407010315',8,NULL),(698,'1407010316',8,NULL),(699,'1407010317',8,NULL),(700,'1407010318',8,NULL),(701,'1407010319',8,NULL),(702,'1407010320',8,NULL),(703,'1407010321',8,NULL),(704,'1407010322',8,NULL),(705,'1407010323',8,NULL),(706,'1407010324',8,NULL),(707,'1407010325',8,NULL),(708,'1407010326',8,NULL),(709,'1407010327',8,NULL),(710,'1407010328',8,NULL),(711,'1407010329',8,NULL),(712,'1407010330',8,NULL),(713,'1307020416',9,NULL),(714,'1407020101',9,NULL),(715,'1407020102',9,NULL),(716,'1407020103',9,NULL),(717,'1407020105',9,NULL),(718,'1407020106',9,NULL),(719,'1407020107',9,NULL),(720,'1407020108',9,NULL),(721,'1407020109',9,NULL),(722,'1407020111',9,NULL),(723,'1407020112',9,NULL),(724,'1407020113',9,NULL),(725,'1407020115',9,NULL),(726,'1407020116',9,NULL),(727,'1407020117',9,NULL),(728,'1407020118',9,NULL),(729,'1407020119',9,NULL),(730,'1407020120',9,NULL),(731,'1407020121',9,NULL),(732,'1407020122',9,NULL),(733,'1407020123',9,NULL),(734,'1407020124',9,NULL),(735,'1407020125',9,NULL),(736,'1407020126',9,NULL),(737,'1407020127',9,NULL),(738,'1407020128',9,NULL),(739,'1407020129',9,NULL),(740,'1407020130',9,NULL),(741,'1407020201',9,NULL),(742,'1407020202',9,NULL),(743,'1407020204',9,NULL),(744,'1407020205',9,NULL),(745,'1407020206',9,NULL),(746,'1407020207',9,NULL),(747,'1407020208',9,NULL),(748,'1407020209',9,NULL),(749,'1407020210',9,NULL),(750,'1407020211',9,NULL),(751,'1407020212',9,NULL),(752,'1407020213',9,NULL),(753,'1407020214',9,NULL),(754,'1407020215',9,NULL),(755,'1407020216',9,NULL),(756,'1407020217',9,NULL),(757,'1407020218',9,NULL),(758,'1407020219',9,NULL),(759,'1407020220',9,NULL),(760,'1407020221',9,NULL),(761,'1407020222',9,NULL),(762,'1407020223',9,NULL),(763,'1407020224',9,NULL),(764,'1407020225',9,NULL),(765,'1407020226',9,NULL),(766,'1407020227',9,NULL),(767,'1407020228',9,NULL),(768,'1407020229',9,NULL),(769,'1407020230',9,NULL),(770,'1407020301',9,NULL),(771,'1407020303',9,NULL),(772,'1407020304',9,NULL),(773,'1407020306',9,NULL),(774,'1407020308',9,NULL),(775,'1407020309',9,NULL),(776,'1407020310',9,NULL),(777,'1407020311',9,NULL),(778,'1407020312',9,NULL),(779,'1407020313',9,NULL),(780,'1407020315',9,NULL),(781,'1407020316',9,NULL),(782,'1407020317',9,NULL),(783,'1407020318',9,NULL),(784,'1407020319',9,NULL),(785,'1407020320',9,NULL),(786,'1407020321',9,NULL),(787,'1407020322',9,NULL),(788,'1407020323',9,NULL),(789,'1407020324',9,NULL),(790,'1407020326',9,NULL),(791,'1407020327',9,NULL),(792,'1407020328',9,NULL),(793,'1407020329',9,NULL),(794,'1407020330',9,NULL),(795,'1307020115',9,NULL),(796,'1407020401',9,NULL),(797,'1407020403',9,NULL),(798,'1407020405',9,NULL),(799,'1407020406',9,NULL),(800,'1407020407',9,NULL),(801,'1407020408',9,NULL),(802,'1407020409',9,NULL),(803,'1407020410',9,NULL),(804,'1407020411',9,NULL),(805,'1407020412',9,NULL),(806,'1407020413',9,NULL),(807,'1407020414',9,NULL),(808,'1407020415',9,NULL),(809,'1407020416',9,NULL),(810,'1407020417',9,NULL),(811,'1407020418',9,NULL),(812,'1407020419',9,NULL),(813,'1407020420',9,NULL),(814,'1407020421',9,NULL),(815,'1407020422',9,NULL),(816,'1407020423',9,NULL),(817,'1407020424',9,NULL),(818,'1407020425',9,NULL),(819,'1407020426',9,NULL),(820,'1407020427',9,NULL),(821,'1407020428',9,NULL),(822,'1407020429',9,NULL),(823,'1307020416',10,NULL),(824,'1407020101',10,NULL),(825,'1407020102',10,NULL),(826,'1407020103',10,NULL),(827,'1407020105',10,NULL),(828,'1407020106',10,NULL),(829,'1407020107',10,NULL),(830,'1407020108',10,NULL),(831,'1407020109',10,NULL),(832,'1407020111',10,NULL),(833,'1407020112',10,NULL),(834,'1407020113',10,NULL),(835,'1407020115',10,NULL),(836,'1407020116',10,NULL),(837,'1407020117',10,NULL),(838,'1407020118',10,NULL),(839,'1407020119',10,NULL),(840,'1407020120',10,NULL),(841,'1407020121',10,NULL),(842,'1407020122',10,NULL),(843,'1407020123',10,NULL),(844,'1407020124',10,NULL),(845,'1407020125',10,NULL),(846,'1407020126',10,NULL),(847,'1407020127',10,NULL),(848,'1407020128',10,NULL),(849,'1407020129',10,NULL),(850,'1407020130',10,NULL),(851,'1407020201',10,NULL),(852,'1407020202',10,NULL),(853,'1407020204',10,NULL),(854,'1407020205',10,NULL),(855,'1407020206',10,NULL),(856,'1407020207',10,NULL),(857,'1407020208',10,NULL),(858,'1407020209',10,NULL),(859,'1407020210',10,NULL),(860,'1407020211',10,NULL),(861,'1407020212',10,NULL),(862,'1407020213',10,NULL),(863,'1407020214',10,NULL),(864,'1407020215',10,NULL),(865,'1407020216',10,NULL),(866,'1407020217',10,NULL),(867,'1407020218',10,NULL),(868,'1407020219',10,NULL),(869,'1407020220',10,NULL),(870,'1407020221',10,NULL),(871,'1407020222',10,NULL),(872,'1407020223',10,NULL),(873,'1407020224',10,NULL),(874,'1407020225',10,NULL),(875,'1407020226',10,NULL),(876,'1407020227',10,NULL),(877,'1407020228',10,NULL),(878,'1407020229',10,NULL),(879,'1407020230',10,NULL),(880,'1407020301',10,NULL),(881,'1407020303',10,NULL),(882,'1407020304',10,NULL),(883,'1407020306',10,NULL),(884,'1407020308',10,NULL),(885,'1407020309',10,NULL),(886,'1407020310',10,NULL),(887,'1407020311',10,NULL),(888,'1407020312',10,NULL),(889,'1407020313',10,NULL),(890,'1407020315',10,NULL),(891,'1407020316',10,NULL),(892,'1407020317',10,NULL),(893,'1407020318',10,NULL),(894,'1407020319',10,NULL),(895,'1407020320',10,NULL),(896,'1407020321',10,NULL),(897,'1407020322',10,NULL),(898,'1407020323',10,NULL),(899,'1407020324',10,NULL),(900,'1407020326',10,NULL),(901,'1407020327',10,NULL),(902,'1407020328',10,NULL),(903,'1407020329',10,NULL),(904,'1407020330',10,NULL),(905,'1307020115',10,NULL),(906,'1407020401',10,NULL),(907,'1407020403',10,NULL),(908,'1407020405',10,NULL),(909,'1407020406',10,NULL),(910,'1407020407',10,NULL),(911,'1407020408',10,NULL),(912,'1407020409',10,NULL),(913,'1407020410',10,NULL),(914,'1407020411',10,NULL),(915,'1407020412',10,NULL),(916,'1407020413',10,NULL),(917,'1407020414',10,NULL),(918,'1407020415',10,NULL),(919,'1407020416',10,NULL),(920,'1407020417',10,NULL),(921,'1407020418',10,NULL),(922,'1407020419',10,NULL),(923,'1407020420',10,NULL),(924,'1407020421',10,NULL),(925,'1407020422',10,NULL),(926,'1407020423',10,NULL),(927,'1407020424',10,NULL),(928,'1407020425',10,NULL),(929,'1407020426',10,NULL),(930,'1407020427',10,NULL),(931,'1407020428',10,NULL),(932,'1407020429',10,NULL),(933,'1307020416',11,NULL),(934,'1407020101',11,NULL),(935,'1407020102',11,NULL),(936,'1407020103',11,NULL),(937,'1407020105',11,NULL),(938,'1407020106',11,NULL),(939,'1407020107',11,NULL),(940,'1407020108',11,NULL),(941,'1407020109',11,NULL),(942,'1407020111',11,NULL),(943,'1407020112',11,NULL),(944,'1407020113',11,NULL),(945,'1407020115',11,NULL),(946,'1407020116',11,NULL),(947,'1407020117',11,NULL),(948,'1407020118',11,NULL),(949,'1407020119',11,NULL),(950,'1407020120',11,NULL),(951,'1407020121',11,NULL),(952,'1407020122',11,NULL),(953,'1407020123',11,NULL),(954,'1407020124',11,NULL),(955,'1407020125',11,NULL),(956,'1407020126',11,NULL),(957,'1407020127',11,NULL),(958,'1407020128',11,NULL),(959,'1407020129',11,NULL),(960,'1407020130',11,NULL),(961,'1407020201',11,NULL),(962,'1407020202',11,NULL),(963,'1407020204',11,NULL),(964,'1407020205',11,NULL),(965,'1407020206',11,NULL),(966,'1407020207',11,NULL),(967,'1407020208',11,NULL),(968,'1407020209',11,NULL),(969,'1407020210',11,NULL),(970,'1407020211',11,NULL),(971,'1407020212',11,NULL),(972,'1407020213',11,NULL),(973,'1407020214',11,NULL),(974,'1407020215',11,NULL),(975,'1407020216',11,NULL),(976,'1407020217',11,NULL),(977,'1407020218',11,NULL),(978,'1407020219',11,NULL),(979,'1407020220',11,NULL),(980,'1407020221',11,NULL),(981,'1407020222',11,NULL),(982,'1407020223',11,NULL),(983,'1407020224',11,NULL),(984,'1407020225',11,NULL),(985,'1407020226',11,NULL),(986,'1407020227',11,NULL),(987,'1407020228',11,NULL),(988,'1407020229',11,NULL),(989,'1407020230',11,NULL),(990,'1407020301',11,NULL),(991,'1407020303',11,NULL),(992,'1407020304',11,NULL),(993,'1407020306',11,NULL),(994,'1407020308',11,NULL),(995,'1407020309',11,NULL),(996,'1407020310',11,NULL),(997,'1407020311',11,NULL),(998,'1407020312',11,NULL),(999,'1407020313',11,NULL),(1000,'1407020315',11,NULL),(1001,'1407020316',11,NULL),(1002,'1407020317',11,NULL),(1003,'1407020318',11,NULL),(1004,'1407020319',11,NULL),(1005,'1407020320',11,NULL),(1006,'1407020321',11,NULL),(1007,'1407020322',11,NULL),(1008,'1407020323',11,NULL),(1009,'1407020324',11,NULL),(1010,'1407020326',11,NULL),(1011,'1407020327',11,NULL),(1012,'1407020328',11,NULL),(1013,'1407020329',11,NULL),(1014,'1407020330',11,NULL),(1015,'1307020115',11,NULL),(1016,'1407020401',11,NULL),(1017,'1407020403',11,NULL),(1018,'1407020405',11,NULL),(1019,'1407020406',11,NULL),(1020,'1407020407',11,NULL),(1021,'1407020408',11,NULL),(1022,'1407020409',11,NULL),(1023,'1407020410',11,NULL),(1024,'1407020411',11,NULL),(1025,'1407020412',11,NULL),(1026,'1407020413',11,NULL),(1027,'1407020414',11,NULL),(1028,'1407020415',11,NULL),(1029,'1407020416',11,NULL),(1030,'1407020417',11,NULL),(1031,'1407020418',11,NULL),(1032,'1407020419',11,NULL),(1033,'1407020420',11,NULL),(1034,'1407020421',11,NULL),(1035,'1407020422',11,NULL),(1036,'1407020423',11,NULL),(1037,'1407020424',11,NULL),(1038,'1407020425',11,NULL),(1039,'1407020426',11,NULL),(1040,'1407020427',11,NULL),(1041,'1407020428',11,NULL),(1042,'1407020429',11,NULL),(1043,'1307020416',12,NULL),(1044,'1407020101',12,NULL),(1045,'1407020102',12,NULL),(1046,'1407020103',12,NULL),(1047,'1407020105',12,NULL),(1048,'1407020106',12,NULL),(1049,'1407020107',12,NULL),(1050,'1407020108',12,NULL),(1051,'1407020109',12,NULL),(1052,'1407020111',12,NULL),(1053,'1407020112',12,NULL),(1054,'1407020113',12,NULL),(1055,'1407020115',12,NULL),(1056,'1407020116',12,NULL),(1057,'1407020117',12,NULL),(1058,'1407020118',12,NULL),(1059,'1407020119',12,NULL),(1060,'1407020120',12,NULL),(1061,'1407020121',12,NULL),(1062,'1407020122',12,NULL),(1063,'1407020123',12,NULL),(1064,'1407020124',12,NULL),(1065,'1407020125',12,NULL),(1066,'1407020126',12,NULL),(1067,'1407020127',12,NULL),(1068,'1407020128',12,NULL),(1069,'1407020129',12,NULL),(1070,'1407020130',12,NULL),(1071,'1407020201',12,NULL),(1072,'1407020202',12,NULL),(1073,'1407020204',12,NULL),(1074,'1407020205',12,NULL),(1075,'1407020206',12,NULL),(1076,'1407020207',12,NULL),(1077,'1407020208',12,NULL),(1078,'1407020209',12,NULL),(1079,'1407020210',12,NULL),(1080,'1407020211',12,NULL),(1081,'1407020212',12,NULL),(1082,'1407020213',12,NULL),(1083,'1407020214',12,NULL),(1084,'1407020215',12,NULL),(1085,'1407020216',12,NULL),(1086,'1407020217',12,NULL),(1087,'1407020218',12,NULL),(1088,'1407020219',12,NULL),(1089,'1407020220',12,NULL),(1090,'1407020221',12,NULL),(1091,'1407020222',12,NULL),(1092,'1407020223',12,NULL),(1093,'1407020224',12,NULL),(1094,'1407020225',12,NULL),(1095,'1407020226',12,NULL),(1096,'1407020227',12,NULL),(1097,'1407020228',12,NULL),(1098,'1407020229',12,NULL),(1099,'1407020230',12,NULL),(1100,'1407020301',12,NULL),(1101,'1407020303',12,NULL),(1102,'1407020304',12,NULL),(1103,'1407020306',12,NULL),(1104,'1407020308',12,NULL),(1105,'1407020309',12,NULL),(1106,'1407020310',12,NULL),(1107,'1407020311',12,NULL),(1108,'1407020312',12,NULL),(1109,'1407020313',12,NULL),(1110,'1407020315',12,NULL),(1111,'1407020316',12,NULL),(1112,'1407020317',12,NULL),(1113,'1407020318',12,NULL),(1114,'1407020319',12,NULL),(1115,'1407020320',12,NULL),(1116,'1407020321',12,NULL),(1117,'1407020322',12,NULL),(1118,'1407020323',12,NULL),(1119,'1407020324',12,NULL),(1120,'1407020326',12,NULL),(1121,'1407020327',12,NULL),(1122,'1407020328',12,NULL),(1123,'1407020329',12,NULL),(1124,'1407020330',12,NULL),(1125,'1307020115',12,NULL),(1126,'1407020401',12,NULL),(1127,'1407020403',12,NULL),(1128,'1407020405',12,NULL),(1129,'1407020406',12,NULL),(1130,'1407020407',12,NULL),(1131,'1407020408',12,NULL),(1132,'1407020409',12,NULL),(1133,'1407020410',12,NULL),(1134,'1407020411',12,NULL),(1135,'1407020412',12,NULL),(1136,'1407020413',12,NULL),(1137,'1407020414',12,NULL),(1138,'1407020415',12,NULL),(1139,'1407020416',12,NULL),(1140,'1407020417',12,NULL),(1141,'1407020418',12,NULL),(1142,'1407020419',12,NULL),(1143,'1407020420',12,NULL),(1144,'1407020421',12,NULL),(1145,'1407020422',12,NULL),(1146,'1407020423',12,NULL),(1147,'1407020424',12,NULL),(1148,'1407020425',12,NULL),(1149,'1407020426',12,NULL),(1150,'1407020427',12,NULL),(1151,'1407020428',12,NULL),(1152,'1407020429',12,NULL),(1153,'1307020416',13,NULL),(1154,'1407020101',13,NULL),(1155,'1407020102',13,NULL),(1156,'1407020103',13,NULL),(1157,'1407020105',13,NULL),(1158,'1407020106',13,NULL),(1159,'1407020107',13,NULL),(1160,'1407020108',13,NULL),(1161,'1407020109',13,NULL),(1162,'1407020111',13,NULL),(1163,'1407020112',13,NULL),(1164,'1407020113',13,NULL),(1165,'1407020115',13,NULL),(1166,'1407020116',13,NULL),(1167,'1407020117',13,NULL),(1168,'1407020118',13,NULL),(1169,'1407020119',13,NULL),(1170,'1407020120',13,NULL),(1171,'1407020121',13,NULL),(1172,'1407020122',13,NULL),(1173,'1407020123',13,NULL),(1174,'1407020124',13,NULL),(1175,'1407020125',13,NULL),(1176,'1407020126',13,NULL),(1177,'1407020127',13,NULL),(1178,'1407020128',13,NULL),(1179,'1407020129',13,NULL),(1180,'1407020130',13,NULL),(1181,'1407020201',13,NULL),(1182,'1407020202',13,NULL),(1183,'1407020204',13,NULL),(1184,'1407020205',13,NULL),(1185,'1407020206',13,NULL),(1186,'1407020207',13,NULL),(1187,'1407020208',13,NULL),(1188,'1407020209',13,NULL),(1189,'1407020210',13,NULL),(1190,'1407020211',13,NULL),(1191,'1407020212',13,NULL),(1192,'1407020213',13,NULL),(1193,'1407020214',13,NULL),(1194,'1407020215',13,NULL),(1195,'1407020216',13,NULL),(1196,'1407020217',13,NULL),(1197,'1407020218',13,NULL),(1198,'1407020219',13,NULL),(1199,'1407020220',13,NULL),(1200,'1407020221',13,NULL),(1201,'1407020222',13,NULL),(1202,'1407020223',13,NULL),(1203,'1407020224',13,NULL),(1204,'1407020225',13,NULL),(1205,'1407020226',13,NULL),(1206,'1407020227',13,NULL),(1207,'1407020228',13,NULL),(1208,'1407020229',13,NULL),(1209,'1407020230',13,NULL),(1210,'1407020301',13,NULL),(1211,'1407020303',13,NULL),(1212,'1407020304',13,NULL),(1213,'1407020306',13,NULL),(1214,'1407020308',13,NULL),(1215,'1407020309',13,NULL),(1216,'1407020310',13,NULL),(1217,'1407020311',13,NULL),(1218,'1407020312',13,NULL),(1219,'1407020313',13,NULL),(1220,'1407020315',13,NULL),(1221,'1407020316',13,NULL),(1222,'1407020317',13,NULL),(1223,'1407020318',13,NULL),(1224,'1407020319',13,NULL),(1225,'1407020320',13,NULL),(1226,'1407020321',13,NULL),(1227,'1407020322',13,NULL),(1228,'1407020323',13,NULL),(1229,'1407020324',13,NULL),(1230,'1407020326',13,NULL),(1231,'1407020327',13,NULL),(1232,'1407020328',13,NULL),(1233,'1407020329',13,NULL),(1234,'1407020330',13,NULL),(1235,'1307020115',13,NULL),(1236,'1407020401',13,NULL),(1237,'1407020403',13,NULL),(1238,'1407020405',13,NULL),(1239,'1407020406',13,NULL),(1240,'1407020407',13,NULL),(1241,'1407020408',13,NULL),(1242,'1407020409',13,NULL),(1243,'1407020410',13,NULL),(1244,'1407020411',13,NULL),(1245,'1407020412',13,NULL),(1246,'1407020413',13,NULL),(1247,'1407020414',13,NULL),(1248,'1407020415',13,NULL),(1249,'1407020416',13,NULL),(1250,'1407020417',13,NULL),(1251,'1407020418',13,NULL),(1252,'1407020419',13,NULL),(1253,'1407020420',13,NULL),(1254,'1407020421',13,NULL),(1255,'1407020422',13,NULL),(1256,'1407020423',13,NULL),(1257,'1407020424',13,NULL),(1258,'1407020425',13,NULL),(1259,'1407020426',13,NULL),(1260,'1407020427',13,NULL),(1261,'1407020428',13,NULL),(1262,'1407020429',13,NULL),(1263,'1307020416',14,NULL),(1264,'1407020101',14,NULL),(1265,'1407020102',14,NULL),(1266,'1407020103',14,NULL),(1267,'1407020105',14,NULL),(1268,'1407020106',14,NULL),(1269,'1407020107',14,NULL),(1270,'1407020108',14,NULL),(1271,'1407020109',14,NULL),(1272,'1407020111',14,NULL),(1273,'1407020112',14,NULL),(1274,'1407020113',14,NULL),(1275,'1407020115',14,NULL),(1276,'1407020116',14,NULL),(1277,'1407020117',14,NULL),(1278,'1407020118',14,NULL),(1279,'1407020119',14,NULL),(1280,'1407020120',14,NULL),(1281,'1407020121',14,NULL),(1282,'1407020122',14,NULL),(1283,'1407020123',14,NULL),(1284,'1407020124',14,NULL),(1285,'1407020125',14,NULL),(1286,'1407020126',14,NULL),(1287,'1407020127',14,NULL),(1288,'1407020128',14,NULL),(1289,'1407020129',14,NULL),(1290,'1407020130',14,NULL),(1291,'1407020201',14,NULL),(1292,'1407020202',14,NULL),(1293,'1407020204',14,NULL),(1294,'1407020205',14,NULL),(1295,'1407020206',14,NULL),(1296,'1407020207',14,NULL),(1297,'1407020208',14,NULL),(1298,'1407020209',14,NULL),(1299,'1407020210',14,NULL),(1300,'1407020211',14,NULL),(1301,'1407020212',14,NULL),(1302,'1407020213',14,NULL),(1303,'1407020214',14,NULL),(1304,'1407020215',14,NULL),(1305,'1407020216',14,NULL),(1306,'1407020217',14,NULL),(1307,'1407020218',14,NULL),(1308,'1407020219',14,NULL),(1309,'1407020220',14,NULL),(1310,'1407020221',14,NULL),(1311,'1407020222',14,NULL),(1312,'1407020223',14,NULL),(1313,'1407020224',14,NULL),(1314,'1407020225',14,NULL),(1315,'1407020226',14,NULL),(1316,'1407020227',14,NULL),(1317,'1407020228',14,NULL),(1318,'1407020229',14,NULL),(1319,'1407020230',14,NULL),(1320,'1407020301',14,NULL),(1321,'1407020303',14,NULL),(1322,'1407020304',14,NULL),(1323,'1407020306',14,NULL),(1324,'1407020308',14,NULL),(1325,'1407020309',14,NULL),(1326,'1407020310',14,NULL),(1327,'1407020311',14,NULL),(1328,'1407020312',14,NULL),(1329,'1407020313',14,NULL),(1330,'1407020315',14,NULL),(1331,'1407020316',14,NULL),(1332,'1407020317',14,NULL),(1333,'1407020318',14,NULL),(1334,'1407020319',14,NULL),(1335,'1407020320',14,NULL),(1336,'1407020321',14,NULL),(1337,'1407020322',14,NULL),(1338,'1407020323',14,NULL),(1339,'1407020324',14,NULL),(1340,'1407020326',14,NULL),(1341,'1407020327',14,NULL),(1342,'1407020328',14,NULL),(1343,'1407020329',14,NULL),(1344,'1407020330',14,NULL),(1345,'1307020115',14,NULL),(1346,'1407020401',14,NULL),(1347,'1407020403',14,NULL),(1348,'1407020405',14,NULL),(1349,'1407020406',14,NULL),(1350,'1407020407',14,NULL),(1351,'1407020408',14,NULL),(1352,'1407020409',14,NULL),(1353,'1407020410',14,NULL),(1354,'1407020411',14,NULL),(1355,'1407020412',14,NULL),(1356,'1407020413',14,NULL),(1357,'1407020414',14,NULL),(1358,'1407020415',14,NULL),(1359,'1407020416',14,NULL),(1360,'1407020417',14,NULL),(1361,'1407020418',14,NULL),(1362,'1407020419',14,NULL),(1363,'1407020420',14,NULL),(1364,'1407020421',14,NULL),(1365,'1407020422',14,NULL),(1366,'1407020423',14,NULL),(1367,'1407020424',14,NULL),(1368,'1407020425',14,NULL),(1369,'1407020426',14,NULL),(1370,'1407020427',14,NULL),(1371,'1407020428',14,NULL),(1372,'1407020429',14,NULL),(1373,'1307020416',6,NULL),(1374,'1407020101',6,NULL),(1375,'1407020102',6,NULL),(1376,'1407020103',6,NULL),(1377,'1407020105',6,NULL),(1378,'1407020106',6,NULL),(1379,'1407020107',6,NULL),(1380,'1407020108',6,NULL),(1381,'1407020109',6,NULL),(1382,'1407020111',6,NULL),(1383,'1407020112',6,NULL),(1384,'1407020113',6,NULL),(1385,'1407020115',6,NULL),(1386,'1407020116',6,NULL),(1387,'1407020117',6,NULL),(1388,'1407020118',6,NULL),(1389,'1407020119',6,NULL),(1390,'1407020120',6,NULL),(1391,'1407020121',6,NULL),(1392,'1407020122',6,NULL),(1393,'1407020123',6,NULL),(1394,'1407020124',6,NULL),(1395,'1407020125',6,NULL),(1396,'1407020126',6,NULL),(1397,'1407020127',6,NULL),(1398,'1407020128',6,NULL),(1399,'1407020129',6,NULL),(1400,'1407020130',6,NULL),(1401,'1407020201',6,NULL),(1402,'1407020202',6,NULL),(1403,'1407020204',6,NULL),(1404,'1407020205',6,NULL),(1405,'1407020206',6,NULL),(1406,'1407020207',6,NULL),(1407,'1407020208',6,NULL),(1408,'1407020209',6,NULL),(1409,'1407020210',6,NULL),(1410,'1407020211',6,NULL),(1411,'1407020212',6,NULL),(1412,'1407020213',6,NULL),(1413,'1407020214',6,NULL),(1414,'1407020215',6,NULL),(1415,'1407020216',6,NULL),(1416,'1407020217',6,NULL),(1417,'1407020218',6,NULL),(1418,'1407020219',6,NULL),(1419,'1407020220',6,NULL),(1420,'1407020221',6,NULL),(1421,'1407020222',6,NULL),(1422,'1407020223',6,NULL),(1423,'1407020224',6,NULL),(1424,'1407020225',6,NULL),(1425,'1407020226',6,NULL),(1426,'1407020227',6,NULL),(1427,'1407020228',6,NULL),(1428,'1407020229',6,NULL),(1429,'1407020230',6,NULL),(1430,'1407020301',6,NULL),(1431,'1407020303',6,NULL),(1432,'1407020304',6,NULL),(1433,'1407020306',6,NULL),(1434,'1407020308',6,NULL),(1435,'1407020309',6,NULL),(1436,'1407020310',6,NULL),(1437,'1407020311',6,NULL),(1438,'1407020312',6,NULL),(1439,'1407020313',6,NULL),(1440,'1407020315',6,NULL),(1441,'1407020316',6,NULL),(1442,'1407020317',6,NULL),(1443,'1407020318',6,NULL),(1444,'1407020319',6,NULL),(1445,'1407020320',6,NULL),(1446,'1407020321',6,NULL),(1447,'1407020322',6,NULL),(1448,'1407020323',6,NULL),(1449,'1407020324',6,NULL),(1450,'1407020326',6,NULL),(1451,'1407020327',6,NULL),(1452,'1407020328',6,NULL),(1453,'1407020329',6,NULL),(1454,'1407020330',6,NULL),(1455,'1307020115',6,NULL),(1456,'1407020401',6,NULL),(1457,'1407020403',6,NULL),(1458,'1407020405',6,NULL),(1459,'1407020406',6,NULL),(1460,'1407020407',6,NULL),(1461,'1407020408',6,NULL),(1462,'1407020409',6,NULL),(1463,'1407020410',6,NULL),(1464,'1407020411',6,NULL),(1465,'1407020412',6,NULL),(1466,'1407020413',6,NULL),(1467,'1407020414',6,NULL),(1468,'1407020415',6,NULL),(1469,'1407020416',6,NULL),(1470,'1407020417',6,NULL),(1471,'1407020418',6,NULL),(1472,'1407020419',6,NULL),(1473,'1407020420',6,NULL),(1474,'1407020421',6,NULL),(1475,'1407020422',6,NULL),(1476,'1407020423',6,NULL),(1477,'1407020424',6,NULL),(1478,'1407020425',6,NULL),(1479,'1407020426',6,NULL),(1480,'1407020427',6,NULL),(1481,'1407020428',6,NULL),(1482,'1407020429',6,NULL),(1483,'1407030101',15,NULL),(1484,'1407030102',15,NULL),(1485,'1407030103',15,NULL),(1486,'1407030104',15,NULL),(1487,'1407030105',15,NULL),(1488,'1407030106',15,NULL),(1489,'1407030107',15,NULL),(1490,'1407030108',15,NULL),(1491,'1407030109',15,NULL),(1492,'1407030110',15,NULL),(1493,'1407030111',15,NULL),(1494,'1407030113',15,NULL),(1495,'1407030114',15,NULL),(1496,'1407030115',15,NULL),(1497,'1407030116',15,NULL),(1498,'1407030117',15,NULL),(1499,'1407030118',15,NULL),(1500,'1407030119',15,NULL),(1501,'1407030121',15,NULL),(1502,'1407030122',15,NULL),(1503,'1407030123',15,NULL),(1504,'1407030124',15,NULL),(1505,'1407030125',15,NULL),(1506,'1407030126',15,NULL),(1507,'1407030127',15,NULL),(1508,'1407030128',15,NULL),(1509,'1407030129',15,NULL),(1510,'1407030130',15,NULL),(1511,'1407030202',15,NULL),(1512,'1407030203',15,NULL),(1513,'1407030204',15,NULL),(1514,'1407030205',15,NULL),(1515,'1407030206',15,NULL),(1516,'1407030207',15,NULL),(1517,'1407030208',15,NULL),(1518,'1407030209',15,NULL),(1519,'1407030210',15,NULL),(1520,'1407030211',15,NULL),(1521,'1407030212',15,NULL),(1522,'1407030213',15,NULL),(1523,'1407030215',15,NULL),(1524,'1407030217',15,NULL),(1525,'1407030218',15,NULL),(1526,'1407030219',15,NULL),(1527,'1407030220',15,NULL),(1528,'1407030221',15,NULL),(1529,'1407030222',15,NULL),(1530,'1407030224',15,NULL),(1531,'1407030225',15,NULL),(1532,'1407030226',15,NULL),(1533,'1407030227',15,NULL),(1534,'1407030228',15,NULL),(1535,'1407030229',15,NULL),(1536,'1407030230',15,NULL),(1537,'1407030101',16,NULL),(1538,'1407030102',16,NULL),(1539,'1407030103',16,NULL),(1540,'1407030104',16,NULL),(1541,'1407030105',16,NULL),(1542,'1407030106',16,NULL),(1543,'1407030107',16,NULL),(1544,'1407030108',16,NULL),(1545,'1407030109',16,NULL),(1546,'1407030110',16,NULL),(1547,'1407030111',16,NULL),(1548,'1407030113',16,NULL),(1549,'1407030114',16,NULL),(1550,'1407030115',16,NULL),(1551,'1407030116',16,NULL),(1552,'1407030117',16,NULL),(1553,'1407030118',16,NULL),(1554,'1407030119',16,NULL),(1555,'1407030121',16,NULL),(1556,'1407030122',16,NULL),(1557,'1407030123',16,NULL),(1558,'1407030124',16,NULL),(1559,'1407030125',16,NULL),(1560,'1407030126',16,NULL),(1561,'1407030127',16,NULL),(1562,'1407030128',16,NULL),(1563,'1407030129',16,NULL),(1564,'1407030130',16,NULL),(1565,'1407030202',16,NULL),(1566,'1407030203',16,NULL),(1567,'1407030204',16,NULL),(1568,'1407030205',16,NULL),(1569,'1407030206',16,NULL),(1570,'1407030207',16,NULL),(1571,'1407030208',16,NULL),(1572,'1407030209',16,NULL),(1573,'1407030210',16,NULL),(1574,'1407030211',16,NULL),(1575,'1407030212',16,NULL),(1576,'1407030213',16,NULL),(1577,'1407030215',16,NULL),(1578,'1407030217',16,NULL),(1579,'1407030218',16,NULL),(1580,'1407030219',16,NULL),(1581,'1407030220',16,NULL),(1582,'1407030221',16,NULL),(1583,'1407030222',16,NULL),(1584,'1407030224',16,NULL),(1585,'1407030225',16,NULL),(1586,'1407030226',16,NULL),(1587,'1407030227',16,NULL),(1588,'1407030228',16,NULL),(1589,'1407030229',16,NULL),(1590,'1407030230',16,NULL),(1591,'1407030101',17,NULL),(1592,'1407030102',17,NULL),(1593,'1407030103',17,NULL),(1594,'1407030104',17,NULL),(1595,'1407030105',17,NULL),(1596,'1407030106',17,NULL),(1597,'1407030107',17,NULL),(1598,'1407030108',17,NULL),(1599,'1407030109',17,NULL),(1600,'1407030110',17,NULL),(1601,'1407030111',17,NULL),(1602,'1407030113',17,NULL),(1603,'1407030114',17,NULL),(1604,'1407030115',17,NULL),(1605,'1407030116',17,NULL),(1606,'1407030117',17,NULL),(1607,'1407030118',17,NULL),(1608,'1407030119',17,NULL),(1609,'1407030121',17,NULL),(1610,'1407030122',17,NULL),(1611,'1407030123',17,NULL),(1612,'1407030124',17,NULL),(1613,'1407030125',17,NULL),(1614,'1407030126',17,NULL),(1615,'1407030127',17,NULL),(1616,'1407030128',17,NULL),(1617,'1407030129',17,NULL),(1618,'1407030130',17,NULL),(1619,'1407030202',17,NULL),(1620,'1407030203',17,NULL),(1621,'1407030204',17,NULL),(1622,'1407030205',17,NULL),(1623,'1407030206',17,NULL),(1624,'1407030207',17,NULL),(1625,'1407030208',17,NULL),(1626,'1407030209',17,NULL),(1627,'1407030210',17,NULL),(1628,'1407030211',17,NULL),(1629,'1407030212',17,NULL),(1630,'1407030213',17,NULL),(1631,'1407030215',17,NULL),(1632,'1407030217',17,NULL),(1633,'1407030218',17,NULL),(1634,'1407030219',17,NULL),(1635,'1407030220',17,NULL),(1636,'1407030221',17,NULL),(1637,'1407030222',17,NULL),(1638,'1407030224',17,NULL),(1639,'1407030225',17,NULL),(1640,'1407030226',17,NULL),(1641,'1407030227',17,NULL),(1642,'1407030228',17,NULL),(1643,'1407030229',17,NULL),(1644,'1407030230',17,NULL),(1645,'1407030101',18,NULL),(1646,'1407030102',18,NULL),(1647,'1407030103',18,NULL),(1648,'1407030104',18,NULL),(1649,'1407030105',18,NULL),(1650,'1407030106',18,NULL),(1651,'1407030107',18,NULL),(1652,'1407030108',18,NULL),(1653,'1407030109',18,NULL),(1654,'1407030110',18,NULL),(1655,'1407030111',18,NULL),(1656,'1407030113',18,NULL),(1657,'1407030114',18,NULL),(1658,'1407030115',18,NULL),(1659,'1407030116',18,NULL),(1660,'1407030117',18,NULL),(1661,'1407030118',18,NULL),(1662,'1407030119',18,NULL),(1663,'1407030121',18,NULL),(1664,'1407030122',18,NULL),(1665,'1407030123',18,NULL),(1666,'1407030124',18,NULL),(1667,'1407030125',18,NULL),(1668,'1407030126',18,NULL),(1669,'1407030127',18,NULL),(1670,'1407030128',18,NULL),(1671,'1407030129',18,NULL),(1672,'1407030130',18,NULL),(1673,'1407030202',18,NULL),(1674,'1407030203',18,NULL),(1675,'1407030204',18,NULL),(1676,'1407030205',18,NULL),(1677,'1407030206',18,NULL),(1678,'1407030207',18,NULL),(1679,'1407030208',18,NULL),(1680,'1407030209',18,NULL),(1681,'1407030210',18,NULL),(1682,'1407030211',18,NULL),(1683,'1407030212',18,NULL),(1684,'1407030213',18,NULL),(1685,'1407030215',18,NULL),(1686,'1407030217',18,NULL),(1687,'1407030218',18,NULL),(1688,'1407030219',18,NULL),(1689,'1407030220',18,NULL),(1690,'1407030221',18,NULL),(1691,'1407030222',18,NULL),(1692,'1407030224',18,NULL),(1693,'1407030225',18,NULL),(1694,'1407030226',18,NULL),(1695,'1407030227',18,NULL),(1696,'1407030228',18,NULL),(1697,'1407030229',18,NULL),(1698,'1407030230',18,NULL),(1699,'1407030101',19,NULL),(1700,'1407030102',19,NULL),(1701,'1407030103',19,NULL),(1702,'1407030104',19,NULL),(1703,'1407030105',19,NULL),(1704,'1407030106',19,NULL),(1705,'1407030107',19,NULL),(1706,'1407030108',19,NULL),(1707,'1407030109',19,NULL),(1708,'1407030110',19,NULL),(1709,'1407030111',19,NULL),(1710,'1407030113',19,NULL),(1711,'1407030114',19,NULL),(1712,'1407030115',19,NULL),(1713,'1407030116',19,NULL),(1714,'1407030117',19,NULL),(1715,'1407030118',19,NULL),(1716,'1407030119',19,NULL),(1717,'1407030121',19,NULL),(1718,'1407030122',19,NULL),(1719,'1407030123',19,NULL),(1720,'1407030124',19,NULL),(1721,'1407030125',19,NULL),(1722,'1407030126',19,NULL),(1723,'1407030127',19,NULL),(1724,'1407030128',19,NULL),(1725,'1407030129',19,NULL),(1726,'1407030130',19,NULL),(1727,'1407030202',19,NULL),(1728,'1407030203',19,NULL),(1729,'1407030204',19,NULL),(1730,'1407030205',19,NULL),(1731,'1407030206',19,NULL),(1732,'1407030207',19,NULL),(1733,'1407030208',19,NULL),(1734,'1407030209',19,NULL),(1735,'1407030210',19,NULL),(1736,'1407030211',19,NULL),(1737,'1407030212',19,NULL),(1738,'1407030213',19,NULL),(1739,'1407030215',19,NULL),(1740,'1407030217',19,NULL),(1741,'1407030218',19,NULL),(1742,'1407030219',19,NULL),(1743,'1407030220',19,NULL),(1744,'1407030221',19,NULL),(1745,'1407030222',19,NULL),(1746,'1407030224',19,NULL),(1747,'1407030225',19,NULL),(1748,'1407030226',19,NULL),(1749,'1407030227',19,NULL),(1750,'1407030228',19,NULL),(1751,'1407030229',19,NULL),(1752,'1407030230',19,NULL),(1753,'1407030101',20,NULL),(1754,'1407030102',20,NULL),(1755,'1407030103',20,NULL),(1756,'1407030104',20,NULL),(1757,'1407030105',20,NULL),(1758,'1407030106',20,NULL),(1759,'1407030107',20,NULL),(1760,'1407030108',20,NULL),(1761,'1407030109',20,NULL),(1762,'1407030110',20,NULL),(1763,'1407030111',20,NULL),(1764,'1407030113',20,NULL),(1765,'1407030114',20,NULL),(1766,'1407030115',20,NULL),(1767,'1407030116',20,NULL),(1768,'1407030117',20,NULL),(1769,'1407030118',20,NULL),(1770,'1407030119',20,NULL),(1771,'1407030121',20,NULL),(1772,'1407030122',20,NULL),(1773,'1407030123',20,NULL),(1774,'1407030124',20,NULL),(1775,'1407030125',20,NULL),(1776,'1407030126',20,NULL),(1777,'1407030127',20,NULL),(1778,'1407030128',20,NULL),(1779,'1407030129',20,NULL),(1780,'1407030130',20,NULL),(1781,'1407030202',20,NULL),(1782,'1407030203',20,NULL),(1783,'1407030204',20,NULL),(1784,'1407030205',20,NULL),(1785,'1407030206',20,NULL),(1786,'1407030207',20,NULL),(1787,'1407030208',20,NULL),(1788,'1407030209',20,NULL),(1789,'1407030210',20,NULL),(1790,'1407030211',20,NULL),(1791,'1407030212',20,NULL),(1792,'1407030213',20,NULL),(1793,'1407030215',20,NULL),(1794,'1407030217',20,NULL),(1795,'1407030218',20,NULL),(1796,'1407030219',20,NULL),(1797,'1407030220',20,NULL),(1798,'1407030221',20,NULL),(1799,'1407030222',20,NULL),(1800,'1407030224',20,NULL),(1801,'1407030225',20,NULL),(1802,'1407030226',20,NULL),(1803,'1407030227',20,NULL),(1804,'1407030228',20,NULL),(1805,'1407030229',20,NULL),(1806,'1407030230',20,NULL),(2293,'1407030101',6,NULL),(2294,'1407030102',6,NULL),(2295,'1407030103',6,NULL),(2296,'1407030104',6,NULL),(2297,'1407030105',6,NULL),(2298,'1407030106',6,NULL),(2299,'1407030107',6,NULL),(2300,'1407030108',6,NULL),(2301,'1407030109',6,NULL),(2302,'1407030110',6,NULL),(2303,'1407030111',6,NULL),(2304,'1407030113',6,NULL),(2305,'1407030114',6,NULL),(2306,'1407030115',6,NULL),(2307,'1407030116',6,NULL),(2308,'1407030117',6,NULL),(2309,'1407030118',6,NULL),(2310,'1407030119',6,NULL),(2311,'1407030121',6,NULL),(2312,'1407030122',6,NULL),(2313,'1407030123',6,NULL),(2314,'1407030124',6,NULL),(2315,'1407030125',6,NULL),(2316,'1407030126',6,NULL),(2317,'1407030127',6,NULL),(2318,'1407030128',6,NULL),(2319,'1407030129',6,NULL),(2320,'1407030130',6,NULL),(2321,'1407030202',6,NULL),(2322,'1407030203',6,NULL),(2323,'1407030204',6,NULL),(2324,'1407030205',6,NULL),(2325,'1407030206',6,NULL),(2326,'1407030207',6,NULL),(2327,'1407030208',6,NULL),(2328,'1407030209',6,NULL),(2329,'1407030210',6,NULL),(2330,'1407030211',6,NULL),(2331,'1407030212',6,NULL),(2332,'1407030213',6,NULL),(2333,'1407030215',6,NULL),(2334,'1407030217',6,NULL),(2335,'1407030218',6,NULL),(2336,'1407030219',6,NULL),(2337,'1407030220',6,NULL),(2338,'1407030221',6,NULL),(2339,'1407030222',6,NULL),(2340,'1407030224',6,NULL),(2341,'1407030225',6,NULL),(2342,'1407030226',6,NULL),(2343,'1407030227',6,NULL),(2344,'1407030228',6,NULL),(2345,'1407030229',6,NULL),(2346,'1407030230',6,NULL);
/*!40000 ALTER TABLE `tbl_select_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_student`
--

DROP TABLE IF EXISTS `tbl_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_student` (
  `StuID` varchar(10) NOT NULL,
  `ClassID` varchar(8) DEFAULT NULL,
  `StuName` varchar(10) DEFAULT NULL,
  `StuSex` enum('男','女') DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`StuID`),
  KEY `FK_Reference_1` (`ClassID`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`ClassID`) REFERENCES `tbl_class` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_student`
--

LOCK TABLES `tbl_student` WRITE;
/*!40000 ALTER TABLE `tbl_student` DISABLE KEYS */;
INSERT INTO `tbl_student` VALUES ('1307010108','14070102','梅宇晨','男','2018-04-02','123456'),('1307010204','14070102','黄明昊','男','2018-04-02','123456'),('1307020115','14070204','李越','男','2018-04-02','123456'),('1307020416','14070201','邱忠将','男','2018-04-02','123456'),('1406070125','14070102','黄薇','女','2018-04-02','123456'),('1407010102','14070101','谭志鹏','男','2018-04-02','123456'),('1407010103','14070101','朱岩彬','男','2018-04-02','123456'),('1407010104','14070101','李富帅','男','2018-04-02','123456'),('1407010105','14070101','徐政','男','2018-04-02','123456'),('1407010106','14070101','王贺龙','男','2018-04-02','123456'),('1407010107','14070101','李崟','男','2018-04-02','123456'),('1407010108','14070101','王子鹏','男','2018-04-02','123456'),('1407010109','14070101','袁维坤','男','2018-04-02','123456'),('1407010110','14070101','吴盛霞','女','2018-04-02','123456'),('1407010111','14070101','肖金艳','女','2018-04-02','123456'),('1407010112','14070101','汪爱玲','女','2018-04-02','123456'),('1407010113','14070101','曾秀','女','2018-04-02','123456'),('1407010114','14070101','王红丽','女','2018-04-02','123456'),('1407010115','14070101','冯冲','女','2018-04-02','123456'),('1407010116','14070101','王瑶','女','2018-04-02','123456'),('1407010117','14070101','何雅绮','女','2018-04-02','123456'),('1407010118','14070101','杨芳','女','2018-04-02','123456'),('1407010119','14070101','谭静','女','2018-04-02','123456'),('1407010120','14070101','彭慧','女','2018-04-02','123456'),('1407010121','14070101','杨静','女','2018-04-02','123456'),('1407010122','14070101','罗文娟','女','2018-04-02','123456'),('1407010123','14070101','杨欣虹','女','2018-04-02','123456'),('1407010124','14070101','杨晓玉','女','2018-04-02','123456'),('1407010125','14070101','翟路鸣','女','2018-04-02','123456'),('1407010126','14070101','杨欣怡','女','2018-04-02','123456'),('1407010127','14070101','解晓莉','女','2018-04-02','123456'),('1407010128','14070101','张赢友','女','2018-04-02','123456'),('1407010129','14070101','阿曼古丽·斯迪克','女','2018-04-02','123456'),('1407010130','14070101','宋碧雯','女','2018-04-02','123456'),('1407010201','14070102','赵晨阳','男','2018-04-02','123456'),('1407010202','14070102','蔡国荣','男','2018-04-02','123456'),('1407010203','14070102','刘家和','男','2018-04-02','123456'),('1407010206','14070102','刘金弘','男','2018-04-02','123456'),('1407010207','14070102','龙华金','男','2018-04-02','123456'),('1407010209','14070102','白嘉琦','男','2018-04-02','123456'),('1407010210','14070102','谢成玲','女','2018-04-02','123456'),('1407010212','14070102','王蕾','女','2018-04-02','123456'),('1407010213','14070102','杨依婷','女','2018-04-02','123456'),('1407010214','14070102','郭珊','女','2018-04-02','123456'),('1407010215','14070102','方小平','女','2018-04-02','123456'),('1407010216','14070102','邹梦林','女','2018-04-02','123456'),('1407010217','14070102','雷毅','女','2018-04-02','123456'),('1407010219','14070102','赵楠','女','2018-04-02','123456'),('1407010220','14070102','杨美红','女','2018-04-02','123456'),('1407010222','14070102','吴依依','女','2018-04-02','123456'),('1407010223','14070102','李庆芳','女','2018-04-02','123456'),('1407010224','14070102','陈香','女','2018-04-02','123456'),('1407010225','14070102','李秋玲','女','2018-04-02','123456'),('1407010226','14070102','张文珍','女','2018-04-02','123456'),('1407010227','14070102','王娜','女','2018-04-02','123456'),('1407010228','14070102','刘潇','女','2018-04-02','123456'),('1407010229','14070102','李志星','女','2018-04-02','123456'),('1407010230','14070102','古丽努尔·拜合提','女','2018-04-02','123456'),('1407010301','14070103','昝植韬','男','2018-04-02','123456'),('1407010302','14070103','庄书楷','男','2018-04-02','123456'),('1407010303','14070103','吴佳明','男','2018-04-02','123456'),('1407010304','14070103','张永志','男','2018-04-02','123456'),('1407010305','14070103','钟文虎','男','2018-04-02','123456'),('1407010306','14070103','张荣浩','男','2018-04-02','123456'),('1407010307','14070103','陈恒昭','男','2018-04-02','123456'),('1407010308','14070103','莫明贻','男','2018-04-02','123456'),('1407010309','14070103','江斌铖','男','2018-04-02','123456'),('1407010310','14070103','秦玲第','女','2018-04-02','123456'),('1407010311','14070103','吴梅皎','女','2018-04-02','123456'),('1407010312','14070103','杨思奇','女','2018-04-02','123456'),('1407010313','14070103','田昊','女','2018-04-02','123456'),('1407010314','14070103','夏娟娟','女','2018-04-02','123456'),('1407010315','14070103','余乐诗','女','2018-04-02','123456'),('1407010316','14070103','蒋菊芳','女','2018-04-02','123456'),('1407010317','14070103','谢露','女','2018-04-02','123456'),('1407010318','14070103','杨萍','女','2018-04-02','123456'),('1407010319','14070103','刘菁','女','2018-04-02','123456'),('1407010320','14070103','杨娅','女','2018-04-02','123456'),('1407010321','14070103','黄雪梅','女','2018-04-02','123456'),('1407010322','14070103','马丽频','女','2018-04-02','123456'),('1407010323','14070103','许璐','女','2018-04-02','123456'),('1407010324','14070103','谭利盈','女','2018-04-02','123456'),('1407010325','14070103','刘晓艺','女','2018-04-02','123456'),('1407010326','14070103','黄爱诗','女','2018-04-02','123456'),('1407010327','14070103','魏铭','女','2018-04-02','123456'),('1407010328','14070103','张祺祺','女','2018-04-02','123456'),('1407010329','14070103','夏扎代古丽·艾尔肯','女','2018-04-02','123456'),('1407010330','14070103','张嫣峰','女','2018-04-02','123456'),('1407020101','14070201','陈俊宏','男','2018-04-02','123456'),('1407020102','14070201','黄俊杰','男','2018-04-02','123456'),('1407020103','14070201','黄玉星','男','2018-04-02','123456'),('1407020105','14070201','旷名科','男','2018-04-02','123456'),('1407020106','14070201','杜何哲','男','2018-04-02','123456'),('1407020107','14070201','蔡挺','男','2018-04-02','123456'),('1407020108','14070201','张杰','男','2018-04-02','123456'),('1407020109','14070201','王文昕','男','2018-04-02','123456'),('1407020110','14070101','罗军','男','2018-04-02','123456'),('1407020111','14070201','占振武','男','2018-04-02','123456'),('1407020112','14070201','伍磊','男','2018-04-02','123456'),('1407020113','14070201','王滔','男','2018-04-02','123456'),('1407020115','14070201','唐升国','男','2018-04-02','123456'),('1407020116','14070201','伍美俊','男','2018-04-02','123456'),('1407020117','14070201','张泽坤','男','2018-04-02','123456'),('1407020118','14070201','吕昊飞','男','2018-04-02','123456'),('1407020119','14070201','严琨铭','男','2018-04-02','123456'),('1407020120','14070201','陈曦','男','2018-04-02','123456'),('1407020121','14070201','佟瑶','女','2018-04-02','123456'),('1407020122','14070201','周明欣','女','2018-04-02','123456'),('1407020123','14070201','赵玉','女','2018-04-02','123456'),('1407020124','14070201','上官壬清','女','2018-04-02','123456'),('1407020125','14070201','冯申望','女','2018-04-02','123456'),('1407020126','14070201','邹苇佩','女','2018-04-02','123456'),('1407020127','14070201','徐慧敏','女','2018-04-02','123456'),('1407020128','14070201','向宝','女','2018-04-02','123456'),('1407020129','14070201','赵红伟','女','2018-04-02','123456'),('1407020130','14070201','张佳莹','女','2018-04-02','123456'),('1407020201','14070202','庄博仁','男','2018-04-02','123456'),('1407020202','14070202','吴明方','男','2018-04-02','123456'),('1407020204','14070202','陈昉','男','2018-04-02','123456'),('1407020205','14070202','王超','男','2018-04-02','123456'),('1407020206','14070202','彭豁富','男','2018-04-02','123456'),('1407020207','14070202','林鸿洪','男','2018-04-02','123456'),('1407020208','14070202','王均吉','男','2018-04-02','123456'),('1407020209','14070202','徐强','男','2018-04-02','123456'),('1407020210','14070202','隆轩','男','2018-04-02','123456'),('1407020211','14070202','李志昊','男','2018-04-02','123456'),('1407020212','14070202','欧阳洋','男','2018-04-02','123456'),('1407020213','14070202','黄景韬','男','2018-04-02','123456'),('1407020214','14070202','刘同','男','2018-04-02','123456'),('1407020215','14070202','张一驰','男','2018-04-02','123456'),('1407020216','14070202','侯翔','男','2018-04-02','123456'),('1407020217','14070202','孙长明','男','2018-04-02','123456'),('1407020218','14070202','佟明徽','男','2018-04-02','123456'),('1407020219','14070202','张光普','男','2018-04-02','123456'),('1407020220','14070202','陈越','男','2018-04-02','123456'),('1407020221','14070202','张语桐','女','2018-04-02','123456'),('1407020222','14070202','韩鑫','女','2018-04-02','123456'),('1407020223','14070202','何莎','女','2018-04-02','123456'),('1407020224','14070202','彭晨','女','2018-04-02','123456'),('1407020225','14070202','周明燕','女','2018-04-02','123456'),('1407020226','14070202','何光红','女','2018-04-02','123456'),('1407020227','14070202','余琼','女','2018-04-02','123456'),('1407020228','14070202','谢东梅','女','2018-04-02','123456'),('1407020229','14070202','王雨红','女','2018-04-02','123456'),('1407020230','14070202','袁丹星','女','2018-04-02','123456'),('1407020301','14070203','路毅恒','男','2018-04-02','123456'),('1407020303','14070203','侯冬冬','男','2018-04-02','123456'),('1407020304','14070203','曾军辉','男','2018-04-02','123456'),('1407020306','14070203','骆作锐','男','2018-04-02','123456'),('1407020308','14070203','陈罡','男','2018-04-02','123456'),('1407020309','14070203','余晓龙','男','2018-04-02','123456'),('1407020310','14070203','汪学龙','男','2018-04-02','123456'),('1407020311','14070203','邓德鸣','男','2018-04-02','123456'),('1407020312','14070203','陈姣龙','男','2018-04-02','123456'),('1407020313','14070203','吴荣月','男','2018-04-02','123456'),('1407020315','14070203','何源','男','2018-04-02','123456'),('1407020316','14070203','陈佳','男','2018-04-02','123456'),('1407020317','14070203','李茄豪','男','2018-04-02','123456'),('1407020318','14070203','隋文鹏','男','2018-04-02','123456'),('1407020319','14070203','王志伟','男','2018-04-02','123456'),('1407020320','14070203','邹亚明','男','2018-04-02','123456'),('1407020321','14070203','焦石云','女','2018-04-02','123456'),('1407020322','14070203','王彩雅','女','2018-04-02','123456'),('1407020323','14070203','黄蓉','女','2018-04-02','123456'),('1407020324','14070203','洪彩霞','女','2018-04-02','123456'),('1407020326','14070203','沈建霞','女','2018-04-02','123456'),('1407020327','14070203','尹慧仪','女','2018-04-02','123456'),('1407020328','14070203','魏霞','女','2018-04-02','123456'),('1407020329','14070203','蔡素','女','2018-04-02','123456'),('1407020330','14070203','孙余','女','2018-04-02','123456'),('1407020401','14070204','蔡鸿铭','男','2018-04-02','123456'),('1407020403','14070204','李鑫','男','2018-04-02','123456'),('1407020405','14070204','苏练辰','男','2018-04-02','123456'),('1407020406','14070204','周鹏','男','2018-04-02','123456'),('1407020407','14070204','蒋松','男','2018-04-02','123456'),('1407020408','14070204','柳祚发','男','2018-04-02','123456'),('1407020409','14070204','宋祥','男','2018-04-02','123456'),('1407020410','14070204','钟强','男','2018-04-02','123456'),('1407020411','14070204','王兢喆','男','2018-04-02','123456'),('1407020412','14070204','陈益峰','男','2018-04-02','123456'),('1407020413','14070204','谢一骥','男','2018-04-02','123456'),('1407020414','14070204','李林泽','男','2018-04-02','123456'),('1407020415','14070204','黎德文','男','2018-04-02','123456'),('1407020416','14070204','薛宏成','男','2018-04-02','123456'),('1407020417','14070204','金桐','男','2018-04-02','123456'),('1407020418','14070204','胡永祺','男','2018-04-02','123456'),('1407020419','14070204','沈胜杰','男','2018-04-02','123456'),('1407020420','14070204','郭方方','女','2018-04-02','123456'),('1407020421','14070204','王夏川','女','2018-04-02','123456'),('1407020422','14070204','吴雅琴','女','2018-04-02','123456'),('1407020423','14070204','李婷','女','2018-04-02','123456'),('1407020424','14070204','程欣','女','2018-04-02','123456'),('1407020425','14070204','黄昕悦','女','2018-04-02','123456'),('1407020426','14070204','李芳','女','2018-04-02','123456'),('1407020427','14070204','赵灵博','女','2018-04-02','123456'),('1407020428','14070204','窦铭','女','2018-04-02','123456'),('1407020429','14070204','朱华华','女','2018-04-02','123456'),('1407030101','14070301','周志男','男','2018-04-02','123456'),('1407030102','14070301','王卓然','男','2018-04-02','123456'),('1407030103','14070301','唐勇','男','2018-04-02','123456'),('1407030104','14070301','李坤亮','男','2018-04-02','123456'),('1407030105','14070301','邹安康','男','2018-04-02','123456'),('1407030106','14070301','胡正龙','男','2018-04-02','123456'),('1407030107','14070301','杨希特','男','2018-04-02','123456'),('1407030108','14070301','朱伟业成','男','2018-04-02','123456'),('1407030109','14070301','朱世存','男','2018-04-02','123456'),('1407030110','14070301','陈永新','女','2018-04-02','123456'),('1407030111','14070301','王蝶','女','2018-04-02','123456'),('1407030113','14070301','孔祥宇','女','2018-04-02','123456'),('1407030114','14070301','周希红','女','2018-04-02','123456'),('1407030115','14070301','张玉琪','女','2018-04-02','123456'),('1407030116','14070301','谭可星','女','2018-04-02','123456'),('1407030117','14070301','陈礼帆','女','2018-04-02','123456'),('1407030118','14070301','吴思洁','女','2018-04-02','123456'),('1407030119','14070301','杨玲','女','2018-04-02','123456'),('1407030121','14070301','黄益辉','女','2018-04-02','123456'),('1407030122','14070301','曾艳艳','女','2018-04-02','123456'),('1407030123','14070301','肖可可','女','2018-04-02','123456'),('1407030124','14070301','欧阳津','女','2018-04-02','123456'),('1407030125','14070301','肖瑶','女','2018-04-02','123456'),('1407030126','14070301','谢云','女','2018-04-02','123456'),('1407030127','14070301','刘会萍','女','2018-04-02','123456'),('1407030128','14070301','傅咏凤','女','2018-04-02','123456'),('1407030129','14070301','龚淑惠','女','2018-04-02','123456'),('1407030130','14070301','谭燕丽','女','2018-04-02','123456'),('1407030202','14070302','罗艺赞','男','2018-04-02','123456'),('1407030203','14070302','周健','男','2018-04-02','123456'),('1407030204','14070302','黄昊明','男','2018-04-02','123456'),('1407030205','14070302','陈鑫焱','男','2018-04-02','123456'),('1407030206','14070302','孟思民','男','2018-04-02','123456'),('1407030207','14070302','蒋小勇','男','2018-04-02','123456'),('1407030208','14070302','陈鹏宇','男','2018-04-02','123456'),('1407030209','14070302','吴诤','男','2018-04-02','123456'),('1407030210','14070302','杨文文','女','2018-04-02','123456'),('1407030211','14070302','程亚文','女','2018-04-02','123456'),('1407030212','14070302','赵骁雅','女','2018-04-02','123456'),('1407030213','14070302','杜可欣','女','2018-04-02','123456'),('1407030215','14070302','吴其臻','女','2018-04-02','123456'),('1407030217','14070302','武慧群','女','2018-04-02','123456'),('1407030218','14070302','王茜','女','2018-04-02','123456'),('1407030219','14070302','龙鑫灿','女','2018-04-02','123456'),('1407030220','14070302','肖璇','女','2018-04-02','123456'),('1407030221','14070302','方琪','女','2018-04-02','123456'),('1407030222','14070302','李婕','女','2018-04-02','123456'),('1407030224','14070302','李崇','女','2018-04-02','123456'),('1407030225','14070302','李丽霞','女','2018-04-02','123456'),('1407030226','14070302','陈旭华','女','2018-04-02','123456'),('1407030227','14070302','钟滨滨','女','2018-04-02','123456'),('1407030228','14070302','闭艳梅','女','2018-04-02','123456'),('1407030229','14070302','齐晓丹','女','2018-04-02','123456'),('1407030230','14070302','朱丽红','女','2018-04-02','123456'),('1409010122','14070102','黄文怡','女','2018-04-02','123456'),('1409010128','14070102','刘玉娇','女','2018-04-02','123456');
/*!40000 ALTER TABLE `tbl_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_teach`
--

DROP TABLE IF EXISTS `tbl_teach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_teach` (
  `TeachID` int(11) NOT NULL AUTO_INCREMENT,
  `TeaID` varchar(10) DEFAULT NULL,
  `CouID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TeachID`),
  KEY `FK_Reference_2` (`TeaID`),
  KEY `FK_Reference_3` (`CouID`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`TeaID`) REFERENCES `tbl_teacher` (`TeaID`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`CouID`) REFERENCES `tbl_course` (`CouID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_teach`
--

LOCK TABLES `tbl_teach` WRITE;
/*!40000 ALTER TABLE `tbl_teach` DISABLE KEYS */;
INSERT INTO `tbl_teach` VALUES (1,'0007',1),(2,'0008',2),(3,'0009',3),(4,'0010',4),(5,'0011',5),(6,'0006',6),(7,'0009',7),(8,'0012',8),(9,'0001',9),(10,'0002',10),(11,'0001',11),(12,'0003',12),(13,'0004',13),(14,'0005',14),(15,'0013',15),(16,'0014',16),(17,'0015',17),(18,'0013',18),(19,'0016',19),(20,'0017',20);
/*!40000 ALTER TABLE `tbl_teach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_teacher`
--

DROP TABLE IF EXISTS `tbl_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_teacher` (
  `TeaID` varchar(10) NOT NULL,
  `TeaName` varchar(10) DEFAULT NULL,
  `TeaSex` enum('男','女') DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Title` varchar(10) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TeaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_teacher`
--

LOCK TABLES `tbl_teacher` WRITE;
/*!40000 ALTER TABLE `tbl_teacher` DISABLE KEYS */;
INSERT INTO `tbl_teacher` VALUES ('0001','胡杏','女','2018-04-02','博士','123456'),('0002','谭敏','女','2018-04-02','博士','123456'),('0003','刘新武','男','2018-04-02','博士','123456'),('0004','陈龙','男','2018-04-02','博士','123456'),('0005','刘缅芳','女','2018-04-02','博士','123456'),('0006','肖亦农','男','2018-04-02','博士','123456'),('0007','谭千保','男','2018-04-02','博士','123456'),('0008','刘赛玉','女','2018-04-02','博士','123456'),('0009','邓海燕','女','2018-04-02','博士','123456'),('0010','彭卓华','女','2018-04-02','博士','123456'),('0011','袁梓瀚','男','2018-04-02','博士','123456'),('0012','周荣秀','男','2018-04-02','博士','123456'),('0013','尹湘锋','男','2018-04-02','博士','123456'),('0014','匡能晖','男','2018-04-02','博士','123456'),('0015','李宾','男','2018-04-02','博士','123456'),('0016','肖碧海','男','2018-04-02','博士','123456'),('0017','余君武','男','2018-04-02','博士','123456');
/*!40000 ALTER TABLE `tbl_teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-11 23:26:22
