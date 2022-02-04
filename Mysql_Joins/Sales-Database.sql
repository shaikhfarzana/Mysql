/*
@Author: Farzana Shaikh
@Date: 04-02-2022 04:00PM
@Last Modified by: Farzana Shaikh
@Last Modified time: 04-02-2022 04:00PM
@Title : Exported the original Sales Database.
*/


-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: Sales
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `Newyorkstaff`
--

DROP TABLE IF EXISTS `Newyorkstaff`;
/*!50001 DROP VIEW IF EXISTS `Newyorkstaff`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Newyorkstaff` AS SELECT 
 1 AS `salesman_id`,
 1 AS `name`,
 1 AS `city`,
 1 AS `commission`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Persons`
--

DROP TABLE IF EXISTS `Persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Persons` (
  `PersonID` int DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Phone_no` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persons`
--

LOCK TABLES `Persons` WRITE;
/*!40000 ALTER TABLE `Persons` DISABLE KEYS */;
INSERT INTO `Persons` VALUES (1,'Kashaf','Murtuza','7698384320','Mumbai',NULL);
/*!40000 ALTER TABLE `Persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `SalesmanCom`
--

DROP TABLE IF EXISTS `SalesmanCom`;
/*!50001 DROP VIEW IF EXISTS `SalesmanCom`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `SalesmanCom` AS SELECT 
 1 AS `salesman_id`,
 1 AS `name`,
 1 AS `city`,
 1 AS `commission`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `citymatch`
--

DROP TABLE IF EXISTS `citymatch`;
/*!50001 DROP VIEW IF EXISTS `citymatch`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `citymatch` AS SELECT 
 1 AS `custcity`,
 1 AS `salescity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `citynum`
--

DROP TABLE IF EXISTS `citynum`;
/*!50001 DROP VIEW IF EXISTS `citynum`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `citynum` AS SELECT 
 1 AS `city`,
 1 AS `COUNT(DISTINCT salesman_id)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `cust_name` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `salesman_id` int DEFAULT NULL,
  `grade` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `salesman_id` (`salesman_id`),
  KEY `custcity` (`city`),
  KEY `customercity` (`city`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (3001,'BRAD GUZON','LONDON',5005,100),(3002,'NICK RIMANDO','NEW YORK ',5001,200),(3003,'Jozy Altidor','Moscow',5007,300),(3004,'FABIAN JOHNSON','PARIS',5006,200),(3005,'GRAHAM ZUSI','CALIFORNIA',5002,100),(3007,'BRAD DAVIS','NEW YORK',5001,200),(3008,'JULIAN GREEN','LONDON',5002,200),(3009,'GEOFF CAMERON','BERLIN',5003,300),(3010,'JEFF BEZOS','CANADA',5005,100);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dateord`
--

DROP TABLE IF EXISTS `dateord`;
/*!50001 DROP VIEW IF EXISTS `dateord`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dateord` AS SELECT 
 1 AS `ord_date`,
 1 AS `odcount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `elitsalesman`
--

DROP TABLE IF EXISTS `elitsalesman`;
/*!50001 DROP VIEW IF EXISTS `elitsalesman`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `elitsalesman` AS SELECT 
 1 AS `ord_date`,
 1 AS `salesman_id`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `gradecount`
--

DROP TABLE IF EXISTS `gradecount`;
/*!50001 DROP VIEW IF EXISTS `gradecount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gradecount` AS SELECT 
 1 AS `grade`,
 1 AS `number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `highgrade`
--

DROP TABLE IF EXISTS `highgrade`;
/*!50001 DROP VIEW IF EXISTS `highgrade`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `highgrade` AS SELECT 
 1 AS `customer_id`,
 1 AS `cust_name`,
 1 AS `city`,
 1 AS `salesman_id`,
 1 AS `grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `incentive`
--

DROP TABLE IF EXISTS `incentive`;
/*!50001 DROP VIEW IF EXISTS `incentive`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `incentive` AS SELECT 
 1 AS `salesman_id`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mcustomer`
--

DROP TABLE IF EXISTS `mcustomer`;
/*!50001 DROP VIEW IF EXISTS `mcustomer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mcustomer` AS SELECT 
 1 AS `salesman_id`,
 1 AS `name`,
 1 AS `city`,
 1 AS `commission`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `nameorders`
--

DROP TABLE IF EXISTS `nameorders`;
/*!50001 DROP VIEW IF EXISTS `nameorders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nameorders` AS SELECT 
 1 AS `order_id`,
 1 AS `purch_amt`,
 1 AS `salesman_id`,
 1 AS `name`,
 1 AS `cust_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `norders`
--

DROP TABLE IF EXISTS `norders`;
/*!50001 DROP VIEW IF EXISTS `norders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `norders` AS SELECT 
 1 AS `name`,
 1 AS `AVG(purch_amt)`,
 1 AS `SUM(purch_amt)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `purch_amt` int DEFAULT NULL,
  `ord_date` date DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `salesman_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `salesman_id` (`salesman_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (70001,150,'2012-10-05',3005,5002),(70002,65,'2012-10-05',3002,5001),(70003,2480,'2012-10-10',3009,5003),(70004,110,'2012-08-17',3009,5003),(70005,2400,'2012-07-27',3007,5001),(70007,948,'2012-09-10',3005,5002),(70008,5760,'2012-06-27',3002,5001),(70009,270,'2012-10-05',3002,5005),(70010,1983,'2012-10-10',3009,5003),(70011,75,'2012-08-17',3003,5007),(70012,250,'2012-06-27',3008,5002),(70013,3045,'2012-04-25',3002,5001),(70014,2145,'2012-04-25',3001,5002);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesman`
--

DROP TABLE IF EXISTS `salesman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesman` (
  `salesman_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `commission` int DEFAULT NULL,
  PRIMARY KEY (`salesman_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesman`
--

LOCK TABLES `salesman` WRITE;
/*!40000 ALTER TABLE `salesman` DISABLE KEYS */;
INSERT INTO `salesman` VALUES (5001,'JAMES HOOG','Amsterdam',20),(5002,'NAIL KNITE','PARIS',13),(5003,'LAUSON HEN','SAN JOSE',11),(5005,'PIT ALEX','LONDON',14),(5006,'MC LYON','PARIS',13),(5007,'PAUL ADAM','ROME',12);
/*!40000 ALTER TABLE `salesman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `salesmanonoct`
--

DROP TABLE IF EXISTS `salesmanonoct`;
/*!50001 DROP VIEW IF EXISTS `salesmanonoct`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `salesmanonoct` AS SELECT 
 1 AS `salesman_id`,
 1 AS `name`,
 1 AS `city`,
 1 AS `commission`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sorder`
--

DROP TABLE IF EXISTS `sorder`;
/*!50001 DROP VIEW IF EXISTS `sorder`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sorder` AS SELECT 
 1 AS `salesman_id`,
 1 AS `order_id`,
 1 AS `customer_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `standard` varchar(45) DEFAULT NULL,
  `section` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Swati','Jaiswar','10','A'),(2,'Sameer','Shaikh','7','A'),(3,'Ayush','Ray','5','C'),(4,'Fazil','Khan','9','B'),(5,'Tazeen','Chaudhary','10','A'),(6,'Raj','Natraj','8','B');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `totalforday`
--

DROP TABLE IF EXISTS `totalforday`;
/*!50001 DROP VIEW IF EXISTS `totalforday`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `totalforday` AS SELECT 
 1 AS `ord_date`,
 1 AS `COUNT(DISTINCT customer_id)`,
 1 AS `AVG(purch_amt)`,
 1 AS `SUM(purch_amt)`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `Newyorkstaff`
--

/*!50001 DROP VIEW IF EXISTS `Newyorkstaff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Newyorkstaff` AS select `salesman`.`salesman_id` AS `salesman_id`,`salesman`.`name` AS `name`,`salesman`.`city` AS `city`,`salesman`.`commission` AS `commission` from `salesman` where (`salesman`.`city` = 'New York') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SalesmanCom`
--

/*!50001 DROP VIEW IF EXISTS `SalesmanCom`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SalesmanCom` AS select `salesman`.`salesman_id` AS `salesman_id`,`salesman`.`name` AS `name`,`salesman`.`city` AS `city`,`salesman`.`commission` AS `commission` from `salesman` where (`salesman`.`commission` > 13) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `citymatch`
--

/*!50001 DROP VIEW IF EXISTS `citymatch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `citymatch` (`custcity`,`salescity`) AS select distinct `a`.`city` AS `city`,`b`.`city` AS `city` from (`customer` `a` join `salesman` `b`) where (`a`.`salesman_id` = `b`.`salesman_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `citynum`
--

/*!50001 DROP VIEW IF EXISTS `citynum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `citynum` AS select `salesman`.`city` AS `city`,count(distinct `salesman`.`salesman_id`) AS `COUNT(DISTINCT salesman_id)` from `salesman` group by `salesman`.`city` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dateord`
--

/*!50001 DROP VIEW IF EXISTS `dateord`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dateord` (`ord_date`,`odcount`) AS select `orders`.`ord_date` AS `ord_date`,count(0) AS `COUNT(*)` from `orders` group by `orders`.`ord_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `elitsalesman`
--

/*!50001 DROP VIEW IF EXISTS `elitsalesman`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `elitsalesman` AS select `b`.`ord_date` AS `ord_date`,`a`.`salesman_id` AS `salesman_id`,`a`.`name` AS `name` from (`salesman` `a` join `orders` `b`) where ((`a`.`salesman_id` = `b`.`salesman_id`) and (`b`.`purch_amt` = (select max(`c`.`purch_amt`) from `orders` `c` where (`c`.`ord_date` = `b`.`ord_date`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gradecount`
--

/*!50001 DROP VIEW IF EXISTS `gradecount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gradecount` (`grade`,`number`) AS select `customer`.`grade` AS `grade`,count(0) AS `COUNT(*)` from `customer` group by `customer`.`grade` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `highgrade`
--

/*!50001 DROP VIEW IF EXISTS `highgrade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `highgrade` AS select `customer`.`customer_id` AS `customer_id`,`customer`.`cust_name` AS `cust_name`,`customer`.`city` AS `city`,`customer`.`salesman_id` AS `salesman_id`,`customer`.`grade` AS `grade` from `customer` where (`customer`.`grade` = (select max(`customer`.`grade`) from `customer`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `incentive`
--

/*!50001 DROP VIEW IF EXISTS `incentive`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `incentive` AS select distinct `a`.`salesman_id` AS `salesman_id`,`a`.`name` AS `name` from `elitsalesman` `a` where (3 <= (select count(0) from `elitsalesman` `b` where (`a`.`salesman_id` = `b`.`salesman_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mcustomer`
--

/*!50001 DROP VIEW IF EXISTS `mcustomer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mcustomer` AS select `a`.`salesman_id` AS `salesman_id`,`a`.`name` AS `name`,`a`.`city` AS `city`,`a`.`commission` AS `commission` from `salesman` `a` where (1 < (select count(0) from `customer` `b` where (`a`.`salesman_id` = `b`.`salesman_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nameorders`
--

/*!50001 DROP VIEW IF EXISTS `nameorders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nameorders` AS select `a`.`order_id` AS `order_id`,`a`.`purch_amt` AS `purch_amt`,`a`.`salesman_id` AS `salesman_id`,`c`.`name` AS `name`,`b`.`cust_name` AS `cust_name` from ((`orders` `a` join `customer` `b`) join `salesman` `c`) where ((`a`.`customer_id` = `b`.`customer_id`) and (`a`.`salesman_id` = `c`.`salesman_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `norders`
--

/*!50001 DROP VIEW IF EXISTS `norders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `norders` AS select `salesman`.`name` AS `name`,avg(`orders`.`purch_amt`) AS `AVG(purch_amt)`,sum(`orders`.`purch_amt`) AS `SUM(purch_amt)` from (`salesman` join `orders`) where (`salesman`.`salesman_id` = `orders`.`salesman_id`) group by `salesman`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salesmanonoct`
--

/*!50001 DROP VIEW IF EXISTS `salesmanonoct`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salesmanonoct` AS select `salesman`.`salesman_id` AS `salesman_id`,`salesman`.`name` AS `name`,`salesman`.`city` AS `city`,`salesman`.`commission` AS `commission` from `salesman` where `salesman`.`salesman_id` in (select `orders`.`salesman_id` from `orders` where (`orders`.`ord_date` = '2012-10-10')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sorder`
--

/*!50001 DROP VIEW IF EXISTS `sorder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sorder` AS select `orders`.`salesman_id` AS `salesman_id`,`orders`.`order_id` AS `order_id`,`orders`.`customer_id` AS `customer_id` from `orders` where (`orders`.`ord_date` in ('2012-08-17','2012-10-10')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalforday`
--

/*!50001 DROP VIEW IF EXISTS `totalforday`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalforday` AS select `orders`.`ord_date` AS `ord_date`,count(distinct `orders`.`customer_id`) AS `COUNT(DISTINCT customer_id)`,avg(`orders`.`purch_amt`) AS `AVG(purch_amt)`,sum(`orders`.`purch_amt`) AS `SUM(purch_amt)` from `orders` group by `orders`.`ord_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-05  1:54:46
