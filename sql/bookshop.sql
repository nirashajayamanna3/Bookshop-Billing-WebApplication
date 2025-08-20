CREATE DATABASE  IF NOT EXISTS `bookstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bookstore`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookstore
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `bill_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'Hiruni Jayamanna','0710441728','2025-08-13 16:23:02',1697.50),(2,'Thathsarani Navodya','0784947386','2025-08-13 16:31:02',5202.00),(3,'Nirasha Jayamanna','0712231124','2025-08-13 16:46:58',1697.50),(4,'Hiruni Jayamanna','0710441728','2025-08-17 07:42:38',3055.00),(5,'Hiruni Jayamanna','0710441728','2025-08-17 07:48:26',2247.50),(6,'John Doe','0771234567','2025-08-18 13:40:00',1697.50);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `accountNumber` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`accountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('1230987','Thathsarani Navodya','Kegalle','0784947386','thathsara@gmail.com'),('234567809','Kaveesha Dewmini','Kaluthara','0713456789','kaveesha@gmail.com'),('23456789','Madushani Ruvanthika','Kegalle','0724567893','madu@ggmail.com'),('3456786','Nethmini Dilshara','Kottapola , Hakahinna.','0712435465','jayamannanethmi@gmail.com'),('345678611','Sasini Karunarathna','Kotiyakubura , Kegalle','071345678','sasini@gmail.com'),('34567863','Nehara Perera','Kottapola , Hakahinna.','0712435465','perera@gmail.com'),('345678789','Sasini Karunarathna','Kotiyakubura , Kegalle','07546356781','sasini@gmail.com'),('678911111','Nirasha Jayasooriya','Kotiyakubura , Kegalle','0751234567','nirasha@gmail.com'),('6789453677','Nirasha Jayamanna','Kottapola , Hakahinna.','0712231124','jayamannanirasha8@gmail.com'),('6789453678','Hiruni Jayamanna','Kottapola , Hakahinna.','0710441728','jayamannhiru@gmail.com'),('CUST001','John Doe','123 Street','0771234567','John567@gmail.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `product_code` varchar(20) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `tax` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('BK001','Maths Grade 10','School syllabus textbook',580.00,5.00,8.00),('BK002','Oxford Dictionary','English language reference book',1200.00,10.00,8.00),('BK003','Science Workbook','Practical exercises for O/L students',550.00,0.00,8.00),('BK004','English Literature Guide','Notes for A/L syllabus',850.00,5.00,8.00),('BK005','Past Papers 2021 O/L','Exam preparation material',600.00,0.00,8.00),('BK006','History Grade 11','School textbook for history',700.00,3.00,8.00),('BK007','ICT Workbook','Practical computer studies workbook',520.00,5.00,8.00),('BK1010','Harry Potter and the Sorcerer’s Stone','It is the first book in J.K. Rowling’s beloved fantasy series.',1800.00,10.00,8.00),('SK001','Ballpoint Pen (Blue)','A smooth-writing, quick-drying pen perfect for everyday use. Ideal for school, office, or personal writing, with a comfortable grip and consistent ink flow for neat handwriting',60.00,5.00,5.00),('ST101','A4 Notebook','200-page ruled notebook',240.00,0.00,5.00),('ST102','Gel Pen Pack','Pack of 5 assorted color pens',180.00,5.00,5.00),('ST103','HB Pencil Box','Box of 12 HB pencils',300.00,0.00,5.00),('ST104','Highlighter Set','Pack of 4 neon color highlighters',290.00,3.00,5.00),('ST105','School Bag','Durable backpack with compartments',2400.00,10.00,8.00),('ST106','Water Bottle','1L BPA-free school water bottle',950.00,5.00,5.00),('ST107','Eraser Pack','Pack of 3 non-smudge erasers',120.00,0.00,5.00),('ST108','Stapler Set','Mini stapler with extra pins',350.00,2.00,5.00);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (2,'Ceylon Paper Traders','Samanthi Fernando','071-9876543','samanthi@ceylonpaper.com','13 Kandy Road, Kurunegala'),(4,'QuickPrint Services','Ruwan Jayasinghe','075-5557788','ruwan@quickprint.lk','No. 5, Temple Road, Gampaha'),(5,'Techno Office Supplies','Hasini Wickramasinghe','078-3456789','hasini@technooffice.lk','34 Matara Road, Galle'),(6,'Island Packaging Solutions','Kasun Wijesuriya','077-1122334','kasun@islandpack.lk','23 Main Street, Negombo'),(7,'Pearl Office Equipment','Dilani Perera','071-7788990','dilani@pearloffice.com','456 Galle Road, Mount Lavinia'),(8,'Sunrise Stationery Mart','Manoj Senanayake','072-6677889','manoj@sunrisemart.lk','78 Station Road, Kandy'),(9,'Elite Paper House','Chathuri Ranasinghe','0751122426','chathuri@elitepaper.lk','19 Church Street, Matara'),(10,'Metro Print & Supplies','Janaka Abeywardena','076-9988776','janaka@metroprint.lk','67 Baseline Road, Colombo 09'),(11,'ABC Stationery Supplies','Sasini Karunarathna','0710441728','sasini@gmail.com','Kotiyakubura , Kegalle'),(12,'Rathna Bookstore','Rathnayaka','0753456789','rathnayaka@gmail.com','128 Main Street, Colombo, Western Province, Sri Lanka, Near Central Park, Apartment No. 45B, Building Sunshine Residency, Landmark: Opposite ABC Mall, Postal Code 00100, ExtraInfoXYZ12345');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_new`
--

DROP TABLE IF EXISTS `user_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_new`
--

LOCK TABLES `user_new` WRITE;
/*!40000 ALTER TABLE `user_new` DISABLE KEYS */;
INSERT INTO `user_new` VALUES (2,'Kasun Perera','kasunp','pass123','cashier'),(3,'Samanthi Fernando','samanthi','abc123','Cashier'),(4,'Tharindu Silva','tharindu','pwd456','Manager'),(5,'Ruwan Jayasinghe','ruwan','qwerty','Cashier'),(6,'Rahula','manager1','manager123','manager'),(9,'Malith','cashier1','123','cashier');
/*!40000 ALTER TABLE `user_new` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-21  1:00:34
