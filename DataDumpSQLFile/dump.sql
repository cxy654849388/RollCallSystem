-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rollcall
-- ------------------------------------------------------
-- Server version	5.7.21

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
/*!40000 ALTER TABLE `qrtz0_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_class`
--

DROP TABLE IF EXISTS `tbl_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_class` (
  `ClassID` varchar(8) NOT NULL,
  `professional` varchar(10) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_class`
--

LOCK TABLES `tbl_class` WRITE;
/*!40000 ALTER TABLE `tbl_class` DISABLE KEYS */;
INSERT INTO `tbl_class` VALUES ('14070101','数学与应用数学',30),('14070102','数学与应用数学',29),('14070103','数学与应用数学',30),('14070201','信息与计算科学',28),('14070202','信息与计算科学',29),('14070203','信息与计算科学',25),('14070204','信息与计算科学',27),('14070301','应用统计学',28),('14070302','应用统计学',26);
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
/*!40000 ALTER TABLE `tbl_manager` ENABLE KEYS */;
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
  PRIMARY KEY (`RecID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_record`
--

LOCK TABLES `tbl_record` WRITE;
/*!40000 ALTER TABLE `tbl_record` DISABLE KEYS */;
INSERT INTO `tbl_record` VALUES (1,1,'2','迟到'),(2,1,'3','正常'),(3,1,'4','缺课');
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
  PRIMARY KEY (`SchID`),
  KEY `FK_Reference_6` (`RoomID`),
  KEY `FK_Reference_7` (`TeachID`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`RoomID`) REFERENCES `tbl_class_room` (`ID`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`TeachID`) REFERENCES `tbl_teach` (`TeachID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_schedule`
--

LOCK TABLES `tbl_schedule` WRITE;
/*!40000 ALTER TABLE `tbl_schedule` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_select_course`
--

LOCK TABLES `tbl_select_course` WRITE;
/*!40000 ALTER TABLE `tbl_select_course` DISABLE KEYS */;
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

-- Dump completed on 2018-04-02 20:17:22
