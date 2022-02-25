/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.28 : Database - pm-n-am
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pm-n-am` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pm-n-am`;

/*Table structure for table `tbladmin` */

DROP TABLE IF EXISTS `tbladmin`;

CREATE TABLE `tbladmin` (
  `adminId` int NOT NULL DEFAULT '0',
  `adminName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `adminFullName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `adminAddress` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `adminPhoneNo` decimal(10,0) DEFAULT NULL,
  `adminEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `adminPassword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `adminCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tbladmin` */

insert  into `tbladmin`(`adminId`,`adminName`,`adminFullName`,`adminAddress`,`adminPhoneNo`,`adminEmail`,`adminPassword`,`adminCreated`) values 
(1,'Shruti','shruti Kathiriya','Ahmedabad',9898560033,'sk@test.com','shru01','2022-02-15 16:44:42'),
(5,'Sakshi12','sakshiThakker122','Ahmedabadjjj',9898980033,'st@test.com','sakshi34','2022-02-24 10:22:01');

/*Table structure for table `tblappointment` */

DROP TABLE IF EXISTS `tblappointment`;

CREATE TABLE `tblappointment` (
  `apoId` int NOT NULL AUTO_INCREMENT,
  `apoUserId` int DEFAULT NULL,
  `apoGarageId` int DEFAULT NULL,
  `apoGTSId` json DEFAULT NULL,
  `apoMTSId` int DEFAULT NULL,
  `apoDate` datetime DEFAULT NULL,
  `apoStatus` enum('Pending','Booked','Canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Pending',
  `apoAmount` int DEFAULT NULL,
  PRIMARY KEY (`apoId`),
  KEY `apoUserId` (`apoUserId`),
  KEY `apoMTSId` (`apoMTSId`),
  KEY `apoGarageId` (`apoGarageId`),
  CONSTRAINT `apoGarageId` FOREIGN KEY (`apoGarageId`) REFERENCES `tblgarage` (`garageId`),
  CONSTRAINT `apoMTSId` FOREIGN KEY (`apoMTSId`) REFERENCES `tblmileagetoservice` (`mtsId`),
  CONSTRAINT `apoUserId` FOREIGN KEY (`apoUserId`) REFERENCES `tblcustomer` (`custId`)
) ENGINE=InnoDB AUTO_INCREMENT=6003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblappointment` */

insert  into `tblappointment`(`apoId`,`apoUserId`,`apoGarageId`,`apoGTSId`,`apoMTSId`,`apoDate`,`apoStatus`,`apoAmount`) values 
(6001,2,3,'[\"2001\", \"2002\", \"2003\", \"2004\", \"2005\"]',5001,'2022-02-17 15:46:19','Pending',1200),
(6002,4,3,'[\"2002\", \"2003\"]',5001,'2022-02-17 16:00:41','Pending',1000);

/*Table structure for table `tblcar` */

DROP TABLE IF EXISTS `tblcar`;

CREATE TABLE `tblcar` (
  `carId` int NOT NULL AUTO_INCREMENT,
  `carCompanyName` varchar(50) DEFAULT NULL,
  `carModelName` varchar(50) DEFAULT NULL,
  `carModelNumber` varchar(50) DEFAULT NULL,
  `carColor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`carId`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblcar` */

insert  into `tblcar`(`carId`,`carCompanyName`,`carModelName`,`carModelNumber`,`carColor`) values 
(1001,'skoda','rapid','sx','black');

/*Table structure for table `tblcustomer` */

DROP TABLE IF EXISTS `tblcustomer`;

CREATE TABLE `tblcustomer` (
  `custId` int NOT NULL DEFAULT '1',
  `custName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `custFullName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `custAddress` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `custPhoneNo` decimal(10,0) DEFAULT NULL,
  `custEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `custPassword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `custCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`custId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblcustomer` */

insert  into `tblcustomer`(`custId`,`custName`,`custFullName`,`custAddress`,`custPhoneNo`,`custEmail`,`custPassword`,`custCreated`) values 
(2,'Sakshi','sakshiThakker','Ahmedabad',9898980033,'st@test.com','sakshi','2022-02-18 13:44:41'),
(4,'yash','yash','yash',1234567890,'yash','yash','2022-02-23 14:34:50');

/*Table structure for table `tblgarage` */

DROP TABLE IF EXISTS `tblgarage`;

CREATE TABLE `tblgarage` (
  `garageId` int NOT NULL DEFAULT '1',
  `garageName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `garageOwnerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `garageAddress` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `garagePhoneNo` decimal(10,0) DEFAULT NULL,
  `garageEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `garagePassword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `garageCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`garageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblgarage` */

insert  into `tblgarage`(`garageId`,`garageName`,`garageOwnerName`,`garageAddress`,`garagePhoneNo`,`garageEmail`,`garagePassword`,`garageCreated`) values 
(3,'arth','arth','arth',1234563527,'arth','arth','2022-02-18 16:45:47'),
(6,'meet','meet patel ','USA',9090997865,'meer@test.com','meet12','2022-02-25 12:05:15');

/*Table structure for table `tblgarageservicestatus` */

DROP TABLE IF EXISTS `tblgarageservicestatus`;

CREATE TABLE `tblgarageservicestatus` (
  `gssId` int NOT NULL AUTO_INCREMENT,
  `gssGTCId` int DEFAULT NULL,
  `gssStatus` enum('Working','Pending','Completed') DEFAULT 'Pending',
  PRIMARY KEY (`gssId`),
  KEY `gssGTCId` (`gssGTCId`),
  CONSTRAINT `gssGTCId` FOREIGN KEY (`gssGTCId`) REFERENCES `tblgaragetocar` (`gtcId`)
) ENGINE=InnoDB AUTO_INCREMENT=8003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblgarageservicestatus` */

insert  into `tblgarageservicestatus`(`gssId`,`gssGTCId`,`gssStatus`) values 
(8001,7001,'Completed'),
(8002,7002,'Completed');

/*Table structure for table `tblgaragetocar` */

DROP TABLE IF EXISTS `tblgaragetocar`;

CREATE TABLE `tblgaragetocar` (
  `gtcId` int NOT NULL AUTO_INCREMENT,
  `gtcAPOId` int DEFAULT NULL,
  `gtcStatus` enum('Pending','Accept','Decline') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Pending',
  PRIMARY KEY (`gtcId`),
  KEY `gtcAPOId` (`gtcAPOId`),
  CONSTRAINT `gtcAPOId` FOREIGN KEY (`gtcAPOId`) REFERENCES `tblappointment` (`apoId`)
) ENGINE=InnoDB AUTO_INCREMENT=7003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblgaragetocar` */

insert  into `tblgaragetocar`(`gtcId`,`gtcAPOId`,`gtcStatus`) values 
(7001,6001,'Pending'),
(7002,6002,'Accept');

/*Table structure for table `tblgaragetoservice` */

DROP TABLE IF EXISTS `tblgaragetoservice`;

CREATE TABLE `tblgaragetoservice` (
  `gtsId` int NOT NULL AUTO_INCREMENT,
  `gtsSerId` int DEFAULT NULL,
  `gtsGarageId` int DEFAULT NULL,
  `gtsCost` int DEFAULT NULL,
  `gtsTime` time DEFAULT NULL,
  PRIMARY KEY (`gtsId`),
  KEY `gtsGarageId` (`gtsGarageId`),
  KEY `gtsSerId` (`gtsSerId`),
  CONSTRAINT `gtsGarageId` FOREIGN KEY (`gtsGarageId`) REFERENCES `tblgarage` (`garageId`),
  CONSTRAINT `gtsSerId` FOREIGN KEY (`gtsSerId`) REFERENCES `tblservice` (`serId`)
) ENGINE=InnoDB AUTO_INCREMENT=2006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblgaragetoservice` */

insert  into `tblgaragetoservice`(`gtsId`,`gtsSerId`,`gtsGarageId`,`gtsCost`,`gtsTime`) values 
(2001,1,3,200,'01:30:00'),
(2002,2,3,300,'01:00:00'),
(2003,3,3,400,'02:30:00'),
(2004,4,3,500,'00:00:03'),
(2005,5,3,600,'03:30:00');

/*Table structure for table `tblinvoice` */

DROP TABLE IF EXISTS `tblinvoice`;

CREATE TABLE `tblinvoice` (
  `invcID` int NOT NULL AUTO_INCREMENT,
  `invcApoId` int DEFAULT NULL,
  `invcCustId` int DEFAULT NULL,
  `invcGarageId` int DEFAULT NULL,
  `invcGTSId` json DEFAULT NULL,
  `invcTotalCost` int DEFAULT NULL,
  `invcDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`invcID`),
  KEY `invcApoId` (`invcApoId`),
  KEY `invcCustId` (`invcCustId`),
  KEY `invcGarageId` (`invcGarageId`),
  CONSTRAINT `invcApoId` FOREIGN KEY (`invcApoId`) REFERENCES `tblappointment` (`apoId`),
  CONSTRAINT `invcCustId` FOREIGN KEY (`invcCustId`) REFERENCES `tblcustomer` (`custId`),
  CONSTRAINT `invcGarageId` FOREIGN KEY (`invcGarageId`) REFERENCES `tblgarage` (`garageId`)
) ENGINE=InnoDB AUTO_INCREMENT=9011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblinvoice` */

insert  into `tblinvoice`(`invcID`,`invcApoId`,`invcCustId`,`invcGarageId`,`invcGTSId`,`invcTotalCost`,`invcDateTime`) values 
(9004,6002,4,3,'[\"2002\", \"2003\"]',700,'2022-02-17 12:23:27'),
(9009,6002,4,3,'[\"2002\", \"2003\"]',700,'2022-02-18 12:23:34'),
(9010,6001,2,3,'[\"2001\", \"2002\", \"2003\", \"2004\", \"2005\"]',2000,'2022-02-20 12:23:37');

/*Table structure for table `tblmileagetoservice` */

DROP TABLE IF EXISTS `tblmileagetoservice`;

CREATE TABLE `tblmileagetoservice` (
  `mtsId` int NOT NULL AUTO_INCREMENT,
  `mtsServiceId` int DEFAULT NULL,
  `mtsCarId` int DEFAULT NULL,
  `mtsMileage` int DEFAULT NULL,
  PRIMARY KEY (`mtsId`),
  KEY `mtsServiceId` (`mtsServiceId`),
  KEY `mtsCarId` (`mtsCarId`),
  CONSTRAINT `mtsCarId` FOREIGN KEY (`mtsCarId`) REFERENCES `tblcar` (`carId`),
  CONSTRAINT `mtsServiceId` FOREIGN KEY (`mtsServiceId`) REFERENCES `tblservice` (`serId`)
) ENGINE=InnoDB AUTO_INCREMENT=5003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblmileagetoservice` */

insert  into `tblmileagetoservice`(`mtsId`,`mtsServiceId`,`mtsCarId`,`mtsMileage`) values 
(5001,1,1001,500),
(5002,2,1001,500);

/*Table structure for table `tblservice` */

DROP TABLE IF EXISTS `tblservice`;

CREATE TABLE `tblservice` (
  `serId` int NOT NULL AUTO_INCREMENT,
  `serName` varchar(100) DEFAULT NULL,
  `serDescription` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`serId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblservice` */

insert  into `tblservice`(`serId`,`serName`,`serDescription`) values 
(1,'ser1','serdes1'),
(2,'ser2','serviceDisc2'),
(3,'ser3','serdes3'),
(4,'ser4','serdes4'),
(5,'ser5','serdes5'),
(6,'ser6','serdes6'),
(9,'service7','serviceDesc7');

/*Table structure for table `tblusers` */

DROP TABLE IF EXISTS `tblusers`;

CREATE TABLE `tblusers` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) DEFAULT NULL,
  `userFullName` varchar(100) DEFAULT NULL,
  `userAddress` varchar(200) DEFAULT NULL,
  `userPhoneNo` decimal(10,0) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `userPassword` varchar(50) DEFAULT NULL,
  `Role` enum('Customer','Admin','Garage') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userCreated` datetime DEFAULT NULL,
  `Status` enum('pending','Accept','Decline') DEFAULT 'pending',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblusers` */

insert  into `tblusers`(`userId`,`userName`,`userFullName`,`userAddress`,`userPhoneNo`,`userEmail`,`userPassword`,`Role`,`userCreated`,`Status`) values 
(1,'shruti','shruti','shruti',1234567890,'shruti','shruti','Admin','2022-02-15 16:44:42','pending'),
(2,'sakshi','sakshi','sakshi',987654321,'sakshi','sakshi','Customer','2022-02-25 16:45:13','pending'),
(3,'arth','arth','arth',1234563527,'arth','arth','Garage','2022-02-18 16:45:47','pending'),
(4,'yash','yash','yash',1234567890,'yash','yash','Customer','2022-02-23 14:34:50','pending'),
(5,'Sakshi12','sakshiThakker122','Ahmedabadjjj',9898980033,'st@test.com','sakshi34','Admin','2022-02-24 10:22:01','pending'),
(6,'meet','meet patel ','USA',9090997865,'meer@test.com','meet12','Garage','2022-02-25 12:05:15','Accept');

/*Table structure for table `tblusertocar` */

DROP TABLE IF EXISTS `tblusertocar`;

CREATE TABLE `tblusertocar` (
  `utcId` int NOT NULL AUTO_INCREMENT,
  `utcUserId` int DEFAULT NULL,
  `utcVINNumber` varchar(50) DEFAULT NULL,
  `utcMileage` int DEFAULT NULL,
  PRIMARY KEY (`utcId`),
  KEY `utcUserId` (`utcUserId`),
  CONSTRAINT `utcUserId` FOREIGN KEY (`utcUserId`) REFERENCES `tblcustomer` (`custId`)
) ENGINE=InnoDB AUTO_INCREMENT=4003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblusertocar` */

insert  into `tblusertocar`(`utcId`,`utcUserId`,`utcVINNumber`,`utcMileage`) values 
(4001,2,'789456123',400);

/* Trigger structure for table `tblgarageservicestatus` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trgGTS_Status` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trgGTS_Status` AFTER UPDATE ON `tblgarageservicestatus` FOR EACH ROW BEGIN
    DECLARE id INT DEFAULT 0;
	if new.gssStatus like 'Completed' then 
		select gtcAPOID from `tblgaragetocar` where gtcId like new.gssGTCId into id;
		CALL spTotalServiceCostCal(id,@list,@total);
		insert into `tblinvoice`(invcApoId,invcCustId,invcGarageId,invcGTSId,invcTotalCost)(	
			SELECT  tab2.gtcAPOId,tab3.apoUserId,tab3.apoGarageId,tab3.apoGTSId,@total
			FROM `tblgarageservicestatus` AS tab1 
			INNER JOIN `tblgaragetocar` AS tab2 ON tab1.gssGTCId= tab2.gtcId
			INNER JOIN `tblappointment` AS tab3 ON tab2.gtcAPOId=tab3.apoId
			WHERE tab3.apoId LIKE id);
	end if;
	
    END */$$


DELIMITER ;

/* Trigger structure for table `tblusers` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trgAfterUserInsert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trgAfterUserInsert` AFTER INSERT ON `tblusers` FOR EACH ROW BEGIN
    if (new.Role = 1 ) then begin
	INSERT INTO `tblcustomer`(custId , custName , custFullName , custAddress , custPhoneNo , custEmail , custPassword , custCreated)
	VALUES(new.userId,new.userName,new.userFullName,new.userAddress,new.userPhoneNo,new.userEmail,new.userPassword,new.userCreated);
	end;
    elseif (new.Role=2 )then
	INSERT INTO `tbladmin` (adminId , adminName , adminFullName , adminAddress  ,adminPhoneNo  ,adminEmail , adminPassword , adminCreated)
	VALUES(new.userId,new.userName,new.userFullName,new.userAddress,new.userPhoneNo,new.userEmail,new.userPassword,new.userCreated);
--  elseif (new.role=3) then
--	INSERT INTO `tblgarage` (garageId , garageName , garageOwnerName , garageAddress, garagePhoneNo  ,garageEmail , garagePassword , garageCreated )
--	VALUES(new.userId,new.userName,new.userFullName,new.userAddress,new.userPhoneNo,new.userEmail,new.userPassword,new.userCreated);
    end if;
    END */$$


DELIMITER ;

/* Trigger structure for table `tblusers` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trgUpdateGrageStatus` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trgUpdateGrageStatus` AFTER UPDATE ON `tblusers` FOR EACH ROW BEGIN
	If (old.role = 3 AND new.Status = 2) then 
	begin
		INSERT INTO `tblgarage` (garageId , garageName , garageOwnerName , garageAddress, garagePhoneNo  ,garageEmail , garagePassword , garageCreated )
		VALUES(new.userId,new.userName,new.userFullName,new.userAddress,new.userPhoneNo,new.userEmail,new.userPassword,new.userCreated);
	end;
	end if;
    END */$$


DELIMITER ;

/* Procedure structure for procedure `spTotalServiceCostCal` */

/*!50003 DROP PROCEDURE IF EXISTS  `spTotalServiceCostCal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spTotalServiceCostCal`(
	in tmpapoId int,
	out serviceList json,
	out totalCost int
	)
BEGIN
		DECLARE i INT DEFAULT 0;
		DECLARE ttcost INT DEFAULT 0;
		declare tmpSId int default 0;
		DECLARE tmpSCost INT DEFAULT 0;
		declare len int default 0;
		select apoGTSId from tblappointment where apoId=tmpapoId into serviceList;
		SELECT JSON_LENGTH(apoGTSId) FROM tblappointment WHERE apoId=tmpapoId into len;
		SET i=0;
		myloop:WHILE i<len DO 
		  set tmpSId =JSON_EXTRACT(servicelist,CONCAT('$[',i,']'));	  
		  SELECT gtsCost FROM `tblgaragetoservice` WHERE gtsId like tmpSId into tmpSCost;
		  set ttcost = ttcost + tmpSCost;
		  SET i = i + 1;
		END WHILE myloop;
		set totalCost = ttcost;
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
