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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_class_room`
--

LOCK TABLES `tbl_class_room` WRITE;
/*!40000 ALTER TABLE `tbl_class_room` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_course`
--

LOCK TABLES `tbl_course` WRITE;
/*!40000 ALTER TABLE `tbl_course` DISABLE KEYS */;
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
  `TeachID` int(11) DEFAULT NULL,
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
-- Table structure for table `tbl_select_course`
--

DROP TABLE IF EXISTS `tbl_select_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_select_course` (
  `SelectID` int(11) NOT NULL AUTO_INCREMENT,
  `StuID` varchar(10) DEFAULT NULL,
  `CouID` int(11) DEFAULT NULL,
  `Result` double DEFAULT NULL,
  PRIMARY KEY (`SelectID`),
  KEY `FK_Reference_4` (`StuID`),
  KEY `FK_Reference_5` (`CouID`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`StuID`) REFERENCES `tbl_student` (`StuID`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`CouID`) REFERENCES `tbl_course` (`CouID`)
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
  `ID` int(11) DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  PRIMARY KEY (`TeachID`),
  KEY `FK_Reference_2` (`TeaID`),
  KEY `FK_Reference_3` (`CouID`),
  KEY `FK_Reference_6` (`ID`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`ID`) REFERENCES `tbl_class_room` (`ID`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`TeaID`) REFERENCES `tbl_teacher` (`TeaID`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`CouID`) REFERENCES `tbl_course` (`CouID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_teach`
--

LOCK TABLES `tbl_teach` WRITE;
/*!40000 ALTER TABLE `tbl_teach` DISABLE KEYS */;
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
  `StuSex` enum('男','女') DEFAULT NULL,
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

-- Dump completed on 2018-03-31 18:24:45
