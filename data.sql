-- MariaDB dump 10.19  Distrib 10.9.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	10.9.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `company` varchar(80) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `postalcode` varchar(10) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `fax` varchar(24) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `supportrepid` int(11) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_by` varchar(50) DEFAULT NULL,
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=1570 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES
(1,'Luís','Gonçalves','Embraer - Empresa Brasileira de Aeronáutica S.A.','Av. Brigadeiro Faria Lima, 2170','São José dos Campos','SP','Brazil','12227-000','+55 (12) 3923-5555','+55 (12) 3923-5566','luisg@embraer.com.br',3,NULL,'2022-09-24 18:26:50','chenyh','2022-09-25 16:55:41'),
(2,'Leonie','Köhler','','Theodor-Heuss-Straße 34','Stuttgart','','Germany','70174','+49 0711 2842222','','leonekohler@surfeu.de',5,NULL,'2022-09-24 18:26:50','chenyh','2022-09-24 19:43:49'),
(3,'François','Tremblay','','1498 rue Bélanger','Montréal','QC','Canada','H2G 1A7','+1 (514) 721-4711','','ftremblay@gmail.com',3,NULL,'2022-09-24 18:26:50','chenyh','2022-09-26 08:57:33'),
(4,'Bjørn','Hansen','','Ullevålsveien 14','Oslo','','Norway','0171','+47 22 44 22 22','','bjorn.hansen@yahoo.no',4,NULL,'2022-09-24 18:26:50','chenyh','2022-09-26 08:57:44'),
(5,'František','Wichterlová','JetBrains s.r.o.','Klanova 9/506','Prague','','Czech Republic','14700','+420 2 4172 5555','+420 2 4172 5555','frantisekw@jetbrains.com',4,NULL,'2022-09-24 18:26:50','chenyh','2022-09-27 10:41:33'),
(6,'Helena','Holý','','Rilská 3174/6','Prague','','Czech Republic','14300','+420 2 4177 0449','','hholy@gmail.com',5,NULL,'2022-09-24 18:26:50','chenyh','2022-09-26 10:21:34'),
(7,'Astrid','Gruber','','Rotenturmstraße 4, 1010 Innere Stadt','Vienne','','Austria','1010','+43 01 5134505','','astrid.gruber@apple.at',5,NULL,'2022-09-24 18:26:50','chenyh','2022-09-26 10:21:40'),
(8,'Daan','Peeters','','Grétrystraat 63','Brussels','','Belgium','1000','+32 02 219 03 03','','daan_peeters@apple.be',4,NULL,'2022-09-24 18:26:50','chenyh','2022-09-26 10:49:55'),
(9,'Kara','Nielsen','','Sønder Boulevard 51','Copenhagen','','Denmark','1720','+453 3331 9991','','kara.nielsen@jubii.dk',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(10,'Eduardo','Martins','Woodstock Discos','Rua Dr. Falcão Filho, 155','São Paulo','SP','Brazil','01007-010','+55 (11) 3033-5446','+55 (11) 3033-4564','eduardo@woodstock.com.br',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(11,'Alexandre','Rocha','Banco do Brasil S.A.','Av. Paulista, 2022','São Paulo','SP','Brazil','01310-200','+55 (11) 3055-3278','+55 (11) 3055-8131','alero@uol.com.br',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(12,'Roberto','Almeida','Riotur','Praça Pio X, 119','Rio de Janeiro','RJ','Brazil','20040-020','+55 (21) 2271-7000','+55 (21) 2271-7070','roberto.almeida@riotur.gov.br',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(13,'Fernanda','Ramos','','Qe 7 Bloco G','Brasília','DF','Brazil','71020-677','+55 (61) 3363-5547','+55 (61) 3363-7855','fernadaramos4@uol.com.br',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(14,'Mark','Philips','Telus','8210 111 ST NW','Edmonton','AB','Canada','T6G 2C7','+1 (780) 434-4554','+1 (780) 434-5565','mphilips12@shaw.ca',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(15,'Jennifer','Peterson','Rogers Canada','700 W Pender Street','Vancouver','BC','Canada','V6C 1G8','+1 (604) 688-2255','+1 (604) 688-8756','jenniferp@rogers.ca',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(16,'Frank','Harris','Google Inc.','1600 Amphitheatre Parkway','Mountain View','CA','USA','94043-1351','+1 (650) 253-0000','+1 (650) 253-0000','fharris@google.com',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(17,'Jack','Smith','Microsoft Corporation','1 Microsoft Way','Redmond','WA','USA','98052-8300','+1 (425) 882-8080','+1 (425) 882-8081','jacksmith@microsoft.com',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(18,'Michelle','Brooks','','627 Broadway','New York','NY','USA','10012-2612','+1 (212) 221-3546','+1 (212) 221-4679','michelleb@aol.com',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(19,'Tim','Goyer','Apple Inc.','1 Infinite Loop','Cupertino','CA','USA','95014','+1 (408) 996-1010','+1 (408) 996-1011','tgoyer@apple.com',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(20,'Dan','Miller','','541 Del Medio Avenue','Mountain View','CA','USA','94040-111','+1 (650) 644-3358','','dmiller@comcast.com',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(21,'Kathy','Chase','','801 W 4th Street','Reno','NV','USA','89503','+1 (775) 223-7665','','kachase@hotmail.com',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(22,'Heather','Leacock','','120 S Orange Ave','Orlando','FL','USA','32801','+1 (407) 999-7788','','hleacock@gmail.com',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(23,'John','Gordon','','69 Salem Street','Boston','MA','USA','2113','+1 (617) 522-1333','','johngordon22@yahoo.com',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(24,'Frank','Ralston','','162 E Superior Street','Chicago','IL','USA','60611','+1 (312) 332-3232','','fralston@gmail.com',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(25,'Victor','Stevens','','319 N. Frances Street','Madison','WI','USA','53703','+1 (608) 257-0597','','vstevens@yahoo.com',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(26,'Richard','Cunningham','','2211 W Berry Street','Fort Worth','TX','USA','76110','+1 (817) 924-7272','','ricunningham@hotmail.com',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(27,'Patrick','Gray','','1033 N Park Ave','Tucson','AZ','USA','85719','+1 (520) 622-4200','','patrick.gray@aol.com',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(28,'Julia','Barnett','','302 S 700 E','Salt Lake City','UT','USA','84102','+1 (801) 531-7272','','jubarnett@gmail.com',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(29,'Robert','Brown','','796 Dundas Street West','Toronto','ON','Canada','M6J 1V1','+1 (416) 363-8888','','robbrown@shaw.ca',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(30,'Edward','Francis','','230 Elgin Street','Ottawa','ON','Canada','K2P 1L7','+1 (613) 234-3322','','edfrancis@yachoo.ca',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(31,'Martha','Silk','','194A Chain Lake Drive','Halifax','NS','Canada','B3S 1C5','+1 (902) 450-0450','','marthasilk@gmail.com',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(32,'Aaron','Mitchell','','696 Osborne Street','Winnipeg','MB','Canada','R3L 2B9','+1 (204) 452-6452','','aaronmitchell@yahoo.ca',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(33,'Ellie','Sullivan','','5112 48 Street','Yellowknife','NT','Canada','X1A 1N6','+1 (867) 920-2233','','ellie.sullivan@shaw.ca',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(34,'João','Fernandes','','Rua da Assunção 53','Lisbon','','Portugal','','+351 (213) 466-111','','jfernandes@yahoo.pt',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(35,'Madalena','Sampaio','','Rua dos Campeões Europeus de Viena, 4350','Porto','','Portugal','','+351 (225) 022-448','','masampaio@sapo.pt',4,NULL,'2022-09-24 18:26:50','chenyh','2022-09-26 17:16:50'),
(36,'Hannah','Schneider','','Tauentzienstraße 8','Berlin','','Germany','10789','+49 030 26550280','','hannah.schneider@yahoo.de',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(37,'Fynn','Zimmermann','','Berger Straße 10','Frankfurt','','Germany','60316','+49 069 40598889','','fzimmermann@yahoo.de',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(38,'Niklas','Schröder','','Barbarossastraße 19','Berlin','','Germany','10779','+49 030 2141444','','nschroder@surfeu.de',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(39,'Camille','Bernard','','4, Rue Milton','Paris','','France','75009','+33 01 49 70 65 65','','camille.bernard@yahoo.fr',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(40,'Dominique','Lefebvre','','8, Rue Hanovre','Paris','','France','75002','+33 01 47 42 71 71','','dominiquelefebvre@gmail.com',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(41,'Marc','Dubois','','11, Place Bellecour','Lyon','','France','69002','+33 04 78 30 30 30','','marc.dubois@hotmail.com',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(42,'Wyatt','Girard','','9, Place Louis Barthou','Bordeaux','','France','33000','+33 05 56 96 96 96','','wyatt.girard@yahoo.fr',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(43,'Isabelle','Mercier','','68, Rue Jouvence','Dijon','','France','21000','+33 03 80 73 66 99','','isabelle_mercier@apple.fr',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(44,'Terhi','Hämäläinen','','Porthaninkatu 9','Helsinki','','Finland','00530','+358 09 870 2000','','terhi.hamalainen@apple.fi',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(45,'Ladislav','Kovács','','Erzsébet krt. 58.','Budapest','','Hungary','H-1073','','','ladislav_kovacs@apple.hu',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(46,'Hugh','O\'Reilly','','3 Chatham Street','Dublin','Dublin','Ireland','','+353 01 6792424','','hughoreilly@apple.ie',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(47,'Lucas','Mancini','','Via Degli Scipioni, 43','Rome','RM','Italy','00192','+39 06 39733434','','lucas.mancini@yahoo.it',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(48,'Johannes','Van der Berg','','Lijnbaansgracht 120bg','Amsterdam','VV','Netherlands','1016','+31 020 6223130','','johavanderberg@yahoo.nl',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(49,'Stanisław','Wójcik','','Ordynacka 10','Warsaw','','Poland','00-358','+48 22 828 37 39','','stanisław.wójcik@wp.pl',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(50,'Enrique','Muñoz','','C/ San Bernardo 85','Madrid','','Spain','28015','+34 914 454 454','','enrique_munoz@yahoo.es',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(51,'Joakim','Johansson','','Celsiusg. 9','Stockholm','','Sweden','11230','+46 08-651 52 52','','joakim.johansson@yahoo.se',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(52,'Emma','Jones','','202 Hoxton Street','London','','United Kingdom','N1 5LH','+44 020 7707 0707','','emma_jones@hotmail.com',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(53,'Phil','Hughes','','113 Lupus St','London','','United Kingdom','SW1V 3EN','+44 020 7976 5722','','phil.hughes@gmail.com',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(54,'Steve','Murray','','110 Raeburn Pl','Edinburgh ','','United Kingdom','EH4 1HH','+44 0131 315 3300','','steve.murray@yahoo.uk',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(55,'Mark','Taylor','','421 Bourke Street','Sidney','NSW','Australia','2010','+61 (02) 9332 3633','','mark.taylor@yahoo.au',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(56,'Diego','Gutiérrez','','307 Macacha Güemes','Buenos Aires','','Argentina','1106','+54 (0)11 4311 4333','','diego.gutierrez@yahoo.ar',4,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(57,'Luis','Rojas','','Calle Lira, 198','Santiago','','Chile','','+56 (0)2 635 4444','','luisrojas@yahoo.cl',5,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(58,'Manoj','Pareek','','12,Community Centre','Delhi','','India','110017','+91 0124 39883988','','manoj.pareek@rediff.com',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00'),
(59,'Puja','Srivastava','','3,Raj Bhavan Road','Bangalore','','India','560001','+91 080 22289999','','puja_srivastava@yahoo.in',3,NULL,'2022-09-24 18:26:50',NULL,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_import`
--

DROP TABLE IF EXISTS `customer_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_import` (
  `seqid` bigint(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) DEFAULT NULL,
  `rownum` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `company` varchar(80) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `postalcode` varchar(10) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `fax` varchar(24) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `supportrepid` int(11) DEFAULT NULL,
  `error_message` varchar(500) DEFAULT NULL,
  `dw_create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`seqid`)
) ENGINE=InnoDB AUTO_INCREMENT=128822 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_import`
--

LOCK TABLES `customer_import` WRITE;
/*!40000 ALTER TABLE `customer_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeid` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(20) CHARACTER SET utf8mb3 NOT NULL,
  `firstname` varchar(20) CHARACTER SET utf8mb3 NOT NULL,
  `title` varchar(30) CHARACTER SET utf8mb3 DEFAULT NULL,
  `reportsto` int(11) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `address` varchar(70) CHARACTER SET utf8mb3 DEFAULT NULL,
  `city` varchar(40) CHARACTER SET utf8mb3 DEFAULT NULL,
  `state` varchar(40) CHARACTER SET utf8mb3 DEFAULT NULL,
  `country` varchar(40) CHARACTER SET utf8mb3 DEFAULT NULL,
  `postalcode` varchar(10) CHARACTER SET utf8mb3 DEFAULT NULL,
  `phone` varchar(24) CHARACTER SET utf8mb3 DEFAULT NULL,
  `fax` varchar(24) CHARACTER SET utf8mb3 DEFAULT NULL,
  `email` varchar(60) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES
(1,'Adams','Andrew','General Manager',NULL,'1962-02-18','2002-08-14','11120 Jasper Ave NW','Edmonton','AB','Canada','T5K 2N1','+1 (780) 428-9482','+1 (780) 428-3457','andrew@chinookcorp.com'),
(2,'Edwards','Nancy','Sales Manager',1,'1958-12-08','2002-05-01','825 8 Ave SW','Calgary','AB','Canada','T2P 2T3','+1 (403) 262-3443','+1 (403) 262-3322','nancy@chinookcorp.com'),
(3,'Peacock','Jane','Sales Support Agent',2,'1973-08-29','2002-04-01','1111 6 Ave SW','Calgary','AB','Canada','T2P 5M5','+1 (403) 262-3443','+1 (403) 262-6712','jane@chinookcorp.com'),
(4,'Park','Margaret','Sales Support Agent',2,'1947-09-19','2003-05-03','683 10 Street SW','Calgary','AB','Canada','T2P 5G3','+1 (403) 263-4423','+1 (403) 263-4289','margaret@chinookcorp.com'),
(5,'Johnson','Steve','Sales Support Agent',2,'1965-03-03','2003-10-17','7727B 41 Ave','Calgary','AB','Canada','T3B 1Y7','1 (780) 836-9987','1 (780) 836-9543','steve@chinookcorp.com'),
(6,'Mitchell','Michael','IT Manager',1,'1973-07-01','2003-10-17','5827 Bowness Road NW','Calgary','AB','Canada','T3B 0C5','+1 (403) 246-9887','+1 (403) 246-9899','michael@chinookcorp.com'),
(7,'King','Robert','IT Staff',6,'1970-05-29','2004-01-02','590 Columbia Boulevard West','Lethbridge','AB','Canada','T1K 5N8','+1 (403) 456-9986','+1 (403) 456-8485','robert@chinookcorp.com'),
(8,'Callahan','Laura','IT Staff',6,'1968-01-09','2004-03-04','923 7 ST NW','Lethbridge','AB','Canada','T1H 1Y8','+1 (403) 467-3351','+1 (403) 467-8772','laura@chinookcorp.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_log`
--

DROP TABLE IF EXISTS `sql_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_log` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `sql_str` varchar(2000) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `usercode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`seqid`)
) ENGINE=InnoDB AUTO_INCREMENT=745 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_log`
--

LOCK TABLES `sql_log` WRITE;
/*!40000 ALTER TABLE `sql_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sql_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'test'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_del_customer`(
	IN `p_customerid` int
)
    COMMENT 'Delete customer by customer id'
begin
   delete from test.customer where customerid = p_customerid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_exp_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exp_customer`(
	IN `p_customerid` int,
	IN `p_firstname` varchar(40),
	IN `p_lastname` varchar(20)
)
    COMMENT 'Query customer info for exporting.'
begin
	select a.*,b.lastname as supportrep
	  from test.customer a
	  left join employee b on a.supportrepid =b.employeeid 
	 where 1 = 1
	   and (p_customerid is null or customerid = p_customerid)
	   and (p_firstname is null or a.firstname like concat('%', p_firstname, '%'))
	   and (p_lastname is null or a.lastname like concat('%', p_lastname, '%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_api_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_api_list`(
in p_db varchar(50),
in p_search varchar(50),
in p_get_offset int,
in p_get_num int,
in p_order_column varchar(50),
in p_order_dir varchar(50),
out p_total_records int
)
    COMMENT 'Get API list. p_db should be passed, parameters is in fixed name, do not change the name, they will be passed from front end JQuery DataTable component'
begin
declare sql1 nvarchar(1000);

if p_get_offset is null then
  set p_get_offset = 0;
end if;

select count(1) into p_total_records from mysql.proc 
   where db = p_db and (p_search is null or name like concat('%',p_search,'%'));

set sql1 = 'select `db`,`name`,`comment`,`created`,`modified` from `mysql`.`proc` where `db` =''';
set sql1 = concat(sql1, p_db, '''');

if p_search is not null then
	set sql1 = concat(sql1,' and `name` like ''%', p_search,'%''');
end if;


if p_order_column is not null then
  set sql1 = concat(sql1, ' order by ', p_order_column);
end if;

if p_order_dir is not null then
  set sql1 = concat(sql1, ' ', p_order_dir);
end if;

-- select sql1;
-- insert into sql_log(sql_str,usercode)values(sql1,p_usercode);-- save query sql

set @sql = sql1;
prepare stmt from @sql;
execute stmt;
deallocate prepare stmt;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_api_params` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_api_params`(
in p_db varchar(50), 
in p_name varchar(100)
)
    COMMENT 'Get parameters by api name. p_db/p_name is required'
begin

select specific_name  as api_name,
       parameter_name,
       parameter_mode as parameter_type,
       dtd_identifier as data_type
  from information_schema.parameters
 where specific_schema = p_db
   and specific_name = p_name;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_customer_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_customer_by_id`(
	IN `p_customerid` int
)
    COMMENT 'Get one customer by id'
begin
select
	a.customerid,
	a.firstname,
	a.lastname,
	a.company,
	a.address,
	a.city,
	a.state,
	a.country,
	a.postalcode,
	a.phone,
	a.fax,
	a.email,
	a.supportrepid,
	b.lastname as supportrep,
	a.create_by,
	a.create_date,
	a.update_by,
	a.update_date
from
	test.customer a
left join employee b on
	a.supportrepid = b.employeeid
where
	customerid = p_customerid;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_customer_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_customer_list`(
	IN `p_usercode` varchar(50),
	IN `p_search` varchar(50),
	IN `p_get_offset` int,
	IN `p_get_num` int,
	IN `p_order_column` varchar(50),
	IN `p_order_dir` varchar(50),
	OUT `p_total_records` int
)
    COMMENT 'Get customer list. parameters is in fixed name, do not change the name, they will be passed from front end JQuery DataTable component'
begin
declare
  sql1    nvarchar(1000);
  declare is_num int;

  select p_search REGEXP '[0-9]' into is_num;
  if     p_get_num is null then set p_get_num = 10;
end if;

if p_get_offset is null then
  set p_get_offset = 0;
end if;

select count(1) into p_total_records from test.customer;

set sql1 = 'select 
	a.customerid,
	a.firstname,
	a.lastname,
	a.company,
	a.address ,
	a.city ,
	a.state ,
	a.country ,
	a.postalcode ,
	a.phone ,
	a.fax ,
	a.email,
    a.supportrepid,
	b.lastname as supportrep,
	a.create_by ,
	a.create_date,
	a.update_by ,
	a.update_date 
	from test.customer a
left join employee b on a.supportrepid=b.employeeid
where 1=1 ';

if p_search is not null then
  set sql1 = concat(sql1, ' and (');
  set sql1 = concat(sql1, ' a.firstname like ''%', p_search, '%''');
  set sql1 = concat(sql1, ' or a.lastname like ''%', p_search, '%''');
  if is_num = 1 then
    set sql1 = concat(sql1, ' or a.customerid = ', p_search);
  end if;
  set sql1 = concat(sql1, ')');
end if;

if p_order_column is not null then
  set sql1 = concat(sql1, ' order by ', p_order_column);
end if;

if p_order_dir is not null then
  set sql1 = concat(sql1, ' ', p_order_dir);
end if;

set sql1 = concat(sql1, ' limit ', p_get_offset, ',', p_get_num);
-- select sql1;
-- insert into sql_log(sql_str,usercode)values(sql1,p_usercode);-- save query sql
set @sql = sql1;
prepare stmt from @sql;
execute stmt;
deallocate prepare stmt;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_employee_sel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_employee_sel`(
	IN `p_employeeid` int
)
    COMMENT 'Get all employee id and last name'
begin
	select employeeid,lastname from employee where p_employeeid is null or employeeid =  p_employeeid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_imp_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_imp_customer`(
	IN `p_token` varchar(50),
	IN `p_rownum` int,
	IN `p_customerid` int,
	IN `p_firstname` varchar(40),
	IN `p_lastname` varchar(20),
	IN `p_company` varchar(80),
	IN `p_address` varchar(70),
	IN `p_city` varchar(40),
	IN `p_state` varchar(40),
	IN `p_country` varchar(40),
	IN `p_postalcode` varchar(20),
	IN `p_phone` varchar(20),
	IN `p_fax` varchar(20),
	IN `p_email` varchar(60),
	IN `p_supportrepid` int
)
    COMMENT 'Import customer info into temp table "customer_import", p_token passed from front end, p_rownum(excel row num) passed from middle tier of java framework.'
begin
	-- p_token passed from front end
	-- p_rownum excel row number
insert
	into
	test.customer_import
		  (token,
		   rownum,
		   customerid,
		   firstname,
		   lastname,
		   company,
		   address,
		   city,
		   state,
		   country,
		   postalcode,
		   phone,
		   email,
		   supportrepid)
values
		  (p_token,
		   p_rownum,
		   p_customerid,
		   p_firstname,
		   p_lastname,
		   p_company,
		   p_address,
		   p_city,
		   p_state,
		   p_country,
		   p_postalcode,
		   p_phone,
		   p_email,
		   p_supportrepid);
		  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_imp_customer_verify` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_imp_customer_verify`(
	IN `p_token` varchar(50),
	IN `p_usercode` varchar(50)
)
    COMMENT 'Checking imported data in the team table with specific business rule; record error info; import valid data to formal table "customer", p_token should be passed'
begin
	
update test.customer_import
   set error_message = 'Missing First Name'
 where token = p_token
   and firstname is null;
   
update test.customer_import
   set error_message = 'Missing Last Name'
 where token = p_token
   and lastname is null;

delete from test.customer_import
 where datediff(now(), dw_create_time) > 30;

	
	insert into test.customer
  (firstname,
   lastname,
   company,
   address,
   city,
   state,
   country,
   postalcode,
   phone,
   fax,
   email,
   supportrepid,
   create_by)
  select firstname,
         lastname,
         company,
         address,
         city,
         state,
         country,
         postalcode,
         phone,
         fax,
         email,
         supportrepid,
         p_usercode
    from test.customer_import
   where token = p_token
     and error_message is null;

select *
  from test.customer_import
 where token = p_token
   and error_message is not null;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_upd_customer`(
	IN `p_usercode` varchar(50),
	IN `p_customerid` int,
	IN `p_firstname` varchar(40),
	IN `p_lastname` varchar(20),
	IN `p_company` varchar(80),
	IN `p_address` varchar(70),
	IN `p_city` varchar(40),
	IN `p_state` varchar(40),
	IN `p_country` varchar(40),
	IN `p_postalcode` varchar(20),
	IN `p_phone` varchar(20),
	IN `p_fax` varchar(20),
	IN `p_email` varchar(200),
	IN `p_supportrepid` int
)
    COMMENT 'Update customer info, insert if no customer id, or update if customer id is not null'
begin
 if p_customerid > 0 then
 update test.customer
    set firstname    = p_firstname,
        lastname     = p_lastname,
        company      = p_company,
        address      = p_address,
        city         = p_city,
        state        = p_state,
        country      = p_country,
        postalcode   = p_postalcode,
        phone        = p_phone,
        fax          = p_fax,
        email        = p_email,
        supportrepid = p_supportrepid,
        update_by    = p_usercode,
        update_date  = now()
  where customerid = p_customerid;

   else
    insert into test.customer
      (firstname,
       lastname,
       company,
       address,
       city,
       state,
       country,
       postalcode,
       phone,
       email,
       supportrepid,
       create_by)
    values
      (p_firstname,
       p_lastname,
       p_company,
       p_address,
       p_city,
       p_state,
       p_country,
       p_postalcode,
       p_phone,
       p_email,
       p_supportrepid,
       p_usercode);
   end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-27 10:42:23
