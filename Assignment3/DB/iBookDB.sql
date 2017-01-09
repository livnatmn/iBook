-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ibook
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `authorID` varchar(10) NOT NULL,
  `authorName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('0','Doron Natan'),('1','Karin Goren'),('2','Ram Oren'),('3','J.K. Rowling'),('4','Paul Bailey'),('5','Virginia Lee');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_of_book`
--

DROP TABLE IF EXISTS `author_of_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_of_book` (
  `authorID` varchar(10) NOT NULL,
  `bookID` int(11) NOT NULL,
  PRIMARY KEY (`authorID`,`bookID`),
  KEY `bookID-book_idx` (`bookID`),
  CONSTRAINT `authorID-author` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_of_book`
--

LOCK TABLES `author_of_book` WRITE;
/*!40000 ALTER TABLE `author_of_book` DISABLE KEYS */;
INSERT INTO `author_of_book` VALUES ('0',1),('1',2),('2',3),('3',4),('4',5),('5',5),('0',6);
/*!40000 ALTER TABLE `author_of_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `bookID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `languageID` int(11) DEFAULT NULL,
  `content` varchar(250) DEFAULT NULL,
  `summary` varchar(250) DEFAULT NULL,
  `keyWords` varchar(45) DEFAULT NULL,
  `formatID` int(11) DEFAULT NULL,
  `visibilityStatus` int(1) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`bookID`),
  UNIQUE KEY `bookID_UNIQUE` (`bookID`),
  KEY `formatID_format_idx` (`formatID`),
  KEY `language_idx` (`languageID`),
  CONSTRAINT `formatID_format` FOREIGN KEY (`formatID`) REFERENCES `format` (`formatID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `language` FOREIGN KEY (`languageID`) REFERENCES `language` (`languageID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Messi',1,'1. argentina days\n2.la masia \n3.barcelona','biography about lionel messi - the G.O.A.T.','messi,barcelona,football',0,1,300),(2,'Sodot Metukim',1,'1. cakes\n2. cookies\n3. deserts','a lot of recipes of the famous konditor karin goren.','baking,cake,cookies,cream',1,1,100),(3,'Little Sister',1,'1. chapter1\n2. chapter2\n3. chapter3','Hedva Rozen, a 15-year-old girl and her 19-year-old brother, both members of an ultra-Orthodox community in Bnei Barak, are involved in a sudden turn of events.','haredim',0,1,60),(4,'Harry Potter ',2,'1. chapter1\n2. chapter2\n3. chapter3','While Harry grapples with a past that refuses to stay where it belongs, his youngest son Albus must struggle with the weight of a family legacy he never wanted.','harry potter,dambeldor',2,0,80),(5,'Java Basics',1,'1. java syntax\n2. oop rules\n3. constructor and interfaces','Two of the  greatest minds in the software industry have joined together and wrote a book about basic java.','class,java,object,gui',1,0,150),(6,'Kobe Bryant',1,'1. early days\n2. joining the first team\n3. championships','biography about the greatest lakers player of all time- kobe bryant.','nba,lakers',0,1,300);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `categoryName_UNIQUE` (`categoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'Children Books'),(2,'Food'),(3,'General Literature'),(5,'Programming'),(1,'Sport');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard_type`
--

DROP TABLE IF EXISTS `creditcard_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcard_type` (
  `creditCardTypeID` int(11) NOT NULL,
  `creditCardTypeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`creditCardTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard_type`
--

LOCK TABLES `creditcard_type` WRITE;
/*!40000 ALTER TABLE `creditcard_type` DISABLE KEYS */;
INSERT INTO `creditcard_type` VALUES (0,'MasterCard'),(1,'IsraCard'),(2,'Visa');
/*!40000 ALTER TABLE `creditcard_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `format`
--

DROP TABLE IF EXISTS `format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `format` (
  `formatID` int(11) NOT NULL,
  `formatName` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`formatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `format`
--

LOCK TABLES `format` WRITE;
/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` VALUES (0,'pdf'),(1,'doc'),(2,'fb2');
/*!40000 ALTER TABLE `format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `languageID` int(11) NOT NULL,
  `languageName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`languageID`),
  UNIQUE KEY `languageName_UNIQUE` (`languageName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (3,'Arabic'),(2,'English'),(1,'Hebrew'),(4,'Russian');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paying_details`
--

DROP TABLE IF EXISTS `paying_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paying_details` (
  `creditcardNum` int(11) NOT NULL,
  `userName` varchar(45) DEFAULT NULL,
  `creditCardValidity` varchar(3) DEFAULT NULL,
  `creditCardDueDate` date DEFAULT NULL,
  `debtAmount` int(11) DEFAULT NULL,
  `creditCardTypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`creditcardNum`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  KEY `userName_idx` (`userName`),
  KEY `creditCardTypeID_creditCardType_idx` (`creditCardTypeID`),
  CONSTRAINT `creditCardTypeID_creditCardType` FOREIGN KEY (`creditCardTypeID`) REFERENCES `creditcard_type` (`creditCardTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userName_user` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paying_details`
--

LOCK TABLES `paying_details` WRITE;
/*!40000 ALTER TABLE `paying_details` DISABLE KEYS */;
INSERT INTO `paying_details` VALUES (390098010,'livni','111','2019-04-01',50,1),(457868011,'yoni1','575','2020-05-01',NULL,0),(458098010,'doronw91','299','2020-04-01',NULL,1),(458098012,'dana91','454','2020-04-01',NULL,1),(518954076,'skip','333','2018-07-01',NULL,2);
/*!40000 ALTER TABLE `paying_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `personID` varchar(10) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('200746980','Moshe','Saban','moshir321@gmail.com'),('302145865','Skip','Cohen','skip@gmail.com'),('304451246','Maor','Saban','m_or@walla.co.il'),('305324816','Lusil','Rogers','Lusil@gmail.com'),('305341745','Doron','Weitzman','doronw91@gmail.com'),('305341752','Dana','Weitzman','dana@gmail.com'),('305341753','Yoni','Shapira','yoni@gmail.com'),('305540568','Hallel','Yaffe','hallel@walla.com'),('305540569','Adi','Eliyahu','adidushet@gmail.com'),('305666789','Yana','Ostrovski','yanasn@gmail.com');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searched_book`
--

DROP TABLE IF EXISTS `searched_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searched_book` (
  `searchID` int(11) NOT NULL,
  `bookID` int(11) DEFAULT NULL,
  `searchDate` date DEFAULT NULL,
  PRIMARY KEY (`searchID`),
  KEY `bookID-book_idx` (`bookID`),
  CONSTRAINT `bookID_book2` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searched_book`
--

LOCK TABLES `searched_book` WRITE;
/*!40000 ALTER TABLE `searched_book` DISABLE KEYS */;
INSERT INTO `searched_book` VALUES (1,2,'2016-12-30'),(2,3,'2016-12-30'),(3,2,'2016-12-31'),(4,2,'2016-12-31'),(5,1,'2017-01-01'),(6,1,'2017-01-01'),(7,3,'2017-01-02'),(8,3,'2017-01-02'),(9,3,'2017-01-02'),(10,6,'2017-01-02'),(11,1,'2017-01-03'),(12,6,'2017-01-03');
/*!40000 ALTER TABLE `searched_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subjectID` int(11) NOT NULL,
  `subjectName` varchar(45) DEFAULT NULL,
  `categoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`subjectID`),
  UNIQUE KEY `subjectName_UNIQUE` (`subjectName`),
  KEY `categoryID_category_idx` (`categoryID`),
  CONSTRAINT `categoryID_category` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Football',1),(2,'Baking',2),(3,'Drama',3),(4,'Fantasy',4),(5,'OOP',1),(6,'Basketball',1);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_of_book`
--

DROP TABLE IF EXISTS `subject_of_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_of_book` (
  `subjectID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  PRIMARY KEY (`subjectID`,`bookID`),
  KEY `bookID-book_idx` (`bookID`),
  CONSTRAINT `bookID_book` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `subjectID_subject` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_of_book`
--

LOCK TABLES `subject_of_book` WRITE;
/*!40000 ALTER TABLE `subject_of_book` DISABLE KEYS */;
INSERT INTO `subject_of_book` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `subject_of_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `subscriptionID` int(1) NOT NULL,
  `SubscriptionName` varchar(45) DEFAULT NULL,
  `SubscriptionPrice` float DEFAULT NULL,
  PRIMARY KEY (`subscriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (0,'none',NULL),(1,'month',500),(2,'year',1300);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userName` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `personID` varchar(10) DEFAULT NULL,
  `isConnect` int(1) DEFAULT NULL,
  `isPaying` int(1) DEFAULT NULL,
  `privilege` int(1) DEFAULT NULL,
  `isApproved` int(1) DEFAULT NULL,
  `subscriptionID` int(11) DEFAULT NULL,
  `subscriptionDueDate` date DEFAULT NULL,
  PRIMARY KEY (`userName`),
  KEY `personID_idx` (`personID`),
  KEY `subscriptionID_subscription_idx` (`subscriptionID`),
  CONSTRAINT `personID_to_Person` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `subscriptionID_subscription` FOREIGN KEY (`subscriptionID`) REFERENCES `subscription` (`subscriptionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('adidushet','123456','305540569',0,0,3,1,NULL,NULL),('dana91','123456','305341752',0,1,1,1,0,NULL),('doronw91','123457','305341745',0,1,1,1,2,'2017-12-27'),('halleli','123456','305540568',0,0,2,1,NULL,NULL),('livni','123456','305324816',0,0,1,1,NULL,NULL),('maor','123456','304451246',0,0,2,1,NULL,NULL),('moshe','123456','200746980',0,0,2,1,NULL,NULL),('skip','123456','302145865',0,1,1,1,1,'2017-01-31'),('yana','123456','305666789',0,0,0,0,NULL,NULL),('yoni1','123456','305341753',0,1,1,1,1,'2017-01-31');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_purched_book`
--

DROP TABLE IF EXISTS `user_purched_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_purched_book` (
  `userName` varchar(45) NOT NULL,
  `bookID` int(11) NOT NULL,
  `purchaseDate` date DEFAULT NULL,
  `reviewContent` varchar(250) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`userName`,`bookID`),
  KEY `bookID_book3_idx` (`bookID`),
  CONSTRAINT `bookID_user3` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userName_user3` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_purched_book`
--

LOCK TABLES `user_purched_book` WRITE;
/*!40000 ALTER TABLE `user_purched_book` DISABLE KEYS */;
INSERT INTO `user_purched_book` VALUES ('dana91',2,'2016-12-31','dont like her at all.  the recipes are basically for children.',3),('dana91',3,'2017-01-02','maybe its very long but i enjoyed every moment.',2),('doronw91',1,'2017-01-01','great book!  messi is the best',1),('doronw91',3,'2017-01-02','really nice story and good written',1),('skip',1,'2017-01-01','',0),('skip',3,'2017-01-02','didnt like it so much.  maybe because its too long',1),('skip',6,'2017-01-03','i am a big fan of kobe but i think the author should replace job.',3),('yoni1',2,'2016-12-31','finally i succed to bake a cake thanks to karin ! really great book',4),('yoni1',3,'2016-12-30','wow!!!!!! the best book i have ever read',1);
/*!40000 ALTER TABLE `user_purched_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker` (
  `workerID` varchar(10) NOT NULL,
  `userName` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`workerID`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  CONSTRAINT `userName-user2` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES ('1','moshe','staff','librarian'),('2','adidushet','management','manager'),('3','halleli','staff','certified editor'),('4','maor','staff','lib worker');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-10  0:36:33
