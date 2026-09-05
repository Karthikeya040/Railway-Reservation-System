-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: railway_reservation
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Temporary view structure for view `confirmed_bookings`
--

DROP TABLE IF EXISTS `confirmed_bookings`;
/*!50001 DROP VIEW IF EXISTS `confirmed_bookings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `confirmed_bookings` AS SELECT 
 1 AS `reservation_id`,
 1 AS `passenger_name`,
 1 AS `train_number`,
 1 AS `train_name`,
 1 AS `journey_date`,
 1 AS `seat_number`,
 1 AS `travel_class`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `passenger_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Rahul Sharma','rahul@gmail.com','9876543210',25,'Male'),(2,'Priya Reddy','priya@gmail.com','9876543211',22,'Female'),(3,'Arjun Kumar','arjun@gmail.com','9876543212',30,'Male'),(4,'Sneha Rao','sneha@gmail.com','9876543213',27,'Female'),(5,'Karthik Singh','karthik@gmail.com','9876543214',24,'Male'),(6,'Ananya Patel','ananya@gmail.com','9876543215',21,'Female'),(7,'Vikram Reddy','vikram@gmail.com','9876543216',35,'Male'),(8,'Meghana Das','meghana@gmail.com','9876543217',28,'Female'),(9,'Rohit Verma','rohit@gmail.com','9876543218',32,'Male'),(10,'Divya Sharma','divya@gmail.com','9876543219',26,'Female');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `passenger_ticket_details`
--

DROP TABLE IF EXISTS `passenger_ticket_details`;
/*!50001 DROP VIEW IF EXISTS `passenger_ticket_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `passenger_ticket_details` AS SELECT 
 1 AS `passenger_id`,
 1 AS `passenger_name`,
 1 AS `train_number`,
 1 AS `train_name`,
 1 AS `journey_date`,
 1 AS `seat_number`,
 1 AS `travel_class`,
 1 AS `status`,
 1 AS `ticket_number`,
 1 AS `fare`,
 1 AS `booking_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `passenger_id` int NOT NULL,
  `train_id` int NOT NULL,
  `journey_date` date NOT NULL,
  `seat_number` varchar(10) DEFAULT NULL,
  `travel_class` varchar(30) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `passenger_id` (`passenger_id`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,1,'2026-09-10','A1-01','AC First Class','Confirmed'),(2,2,2,'2026-09-11','B2-15','AC 2 Tier','Confirmed'),(3,3,3,'2026-09-12','C1-20','AC 3 Tier','Confirmed'),(4,4,4,'2026-09-13','S1-10','Sleeper','Confirmed'),(5,5,5,'2026-09-14','A2-05','AC 2 Tier','Pending'),(6,6,6,'2026-09-15','S2-25','Sleeper','Confirmed'),(7,7,7,'2026-09-16','B1-12','AC 2 Tier','Cancelled'),(8,8,8,'2026-09-17','C2-18','AC 3 Tier','Confirmed'),(9,9,9,'2026-09-18','S3-30','Sleeper','Confirmed'),(10,10,10,'2026-09-19','A1-08','AC First Class','Cancelled'),(11,1,1,'2026-09-25','A1-15','AC First Class','Cancelled'),(12,2,2,'2026-09-30','B1-20','AC 2 Tier','Cancelled'),(14,3,3,'2026-10-05','C1-25','AC 3 Tier','Cancelled');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_reservation_cancel` AFTER UPDATE ON `reservation` FOR EACH ROW BEGIN
    IF NEW.status = 'Cancelled' AND OLD.status <> 'Cancelled' THEN
        DELETE FROM TICKET
        WHERE reservation_id = NEW.reservation_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `route_id` int NOT NULL,
  `train_id` int NOT NULL,
  `station_id` int NOT NULL,
  `stop_number` int DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  KEY `train_id` (`train_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`),
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,1,1,1,'06:00:00','06:10:00'),(2,1,4,2,'10:30:00','10:40:00'),(3,2,1,1,'07:00:00','07:10:00'),(4,2,5,2,'09:30:00','09:40:00'),(5,3,2,1,'08:00:00','08:10:00'),(6,3,7,2,'12:00:00','12:10:00'),(7,4,1,1,'09:00:00','09:10:00'),(8,4,8,2,'15:30:00','15:40:00'),(9,5,3,1,'11:00:00','11:10:00'),(10,5,9,2,'17:00:00','17:10:00');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `station_id` int NOT NULL,
  `station_name` varchar(100) NOT NULL,
  `station_code` varchar(10) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'Secunderabad Junction','SC','Hyderabad','Telangana'),(2,'Hyderabad Deccan','HYB','Hyderabad','Telangana'),(3,'Kacheguda','KCG','Hyderabad','Telangana'),(4,'Vijayawada Junction','BZA','Vijayawada','Andhra Pradesh'),(5,'Warangal','WL','Warangal','Telangana'),(6,'Kazipet Junction','KZJ','Kazipet','Telangana'),(7,'Guntur Junction','GNT','Guntur','Andhra Pradesh'),(8,'Visakhapatnam Junction','VSKP','Visakhapatnam','Andhra Pradesh'),(9,'Tirupati','TPTY','Tirupati','Andhra Pradesh'),(10,'Nalgonda','NLDA','Nalgonda','Telangana');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `reservation_id` int NOT NULL,
  `ticket_number` varchar(30) NOT NULL,
  `fare` decimal(10,2) DEFAULT NULL,
  `booking_date` date NOT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `unique_reservation_ticket` (`reservation_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,'TKT10001',850.00,'2026-09-04'),(2,2,'TKT10002',1250.00,'2026-09-04'),(3,3,'TKT10003',950.00,'2026-09-04'),(4,4,'TKT10004',650.00,'2026-09-04'),(5,5,'TKT10005',1400.00,'2026-09-04'),(6,6,'TKT10006',720.00,'2026-09-04'),(8,8,'TKT10008',980.00,'2026-09-04'),(9,9,'TKT10009',600.00,'2026-09-04');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `train_id` int NOT NULL,
  `train_number` varchar(20) NOT NULL,
  `train_name` varchar(100) NOT NULL,
  `total_seats` int NOT NULL,
  `train_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,'12701','Hussain Sagar Express',1200,'Express'),(2,'12702','Godavari Express',1200,'Superfast'),(3,'12603','Charminar Express',1000,'Express'),(4,'12723','Telangana Express',1500,'Superfast'),(5,'17015','Visakha Express',1200,'Express'),(6,'12759','Charminar SF Express',1400,'Superfast'),(7,'12861','Visakhapatnam Express',1300,'Express'),(8,'12727','Godavari SF Express',1400,'Superfast'),(9,'17011','Hyderabad Intercity',1000,'Intercity'),(10,'12785','Kacheguda Express',1200,'Express');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `confirmed_bookings`
--

/*!50001 DROP VIEW IF EXISTS `confirmed_bookings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `confirmed_bookings` AS select `r`.`reservation_id` AS `reservation_id`,`p`.`name` AS `passenger_name`,`t`.`train_number` AS `train_number`,`t`.`train_name` AS `train_name`,`r`.`journey_date` AS `journey_date`,`r`.`seat_number` AS `seat_number`,`r`.`travel_class` AS `travel_class`,`r`.`status` AS `status` from ((`reservation` `r` join `passenger` `p` on((`r`.`passenger_id` = `p`.`passenger_id`))) join `train` `t` on((`r`.`train_id` = `t`.`train_id`))) where (`r`.`status` = 'Confirmed') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `passenger_ticket_details`
--

/*!50001 DROP VIEW IF EXISTS `passenger_ticket_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `passenger_ticket_details` AS select `p`.`passenger_id` AS `passenger_id`,`p`.`name` AS `passenger_name`,`t`.`train_number` AS `train_number`,`t`.`train_name` AS `train_name`,`r`.`journey_date` AS `journey_date`,`r`.`seat_number` AS `seat_number`,`r`.`travel_class` AS `travel_class`,`r`.`status` AS `status`,`tk`.`ticket_number` AS `ticket_number`,`tk`.`fare` AS `fare`,`tk`.`booking_date` AS `booking_date` from (((`passenger` `p` join `reservation` `r` on((`p`.`passenger_id` = `r`.`passenger_id`))) join `train` `t` on((`r`.`train_id` = `t`.`train_id`))) join `ticket` `tk` on((`r`.`reservation_id` = `tk`.`reservation_id`))) */;
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

-- Dump completed on 2026-09-05 10:56:57
