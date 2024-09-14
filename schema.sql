/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE DATABASE IF NOT EXISTS `kollegium`;
USE `kollegium`;

CREATE TABLE IF NOT EXISTS `auth` (
  `UID` int unsigned NOT NULL,
  `access_token` varchar(32) DEFAULT NULL,
  `refresh_token` varchar(32) DEFAULT NULL,
  `expires` int unsigned DEFAULT NULL,
  `issued` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expired` boolean NOT NULL DEFAULT false,
  FOREIGN KEY (`UID`) REFERENCES user(`UID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `errors` (
  `Keyword` varchar(25) NOT NULL,
  `Code` smallint,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`Keyword`)
);

CREATE TABLE IF NOT EXISTS `crossings` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `UID` int unsigned NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Direction` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`UID`) REFERENCES user(`UID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `login_data` (
  `UID` int unsigned NOT NULL,
  `Username` text DEFAULT NULL,
  `Password` text DEFAULT NULL,
  PRIMARY KEY (`UID`) USING BTREE,
  FOREIGN KEY (`UID`) REFERENCES user(`UID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `mifare_tags` (
  `UID` int unsigned NOT NULL,
  `Issued` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Bytes` tinyblob NOT NULL,
  PRIMARY KEY (`Bytes`(32)),
  FOREIGN KEY (`UID`) REFERENCES user(`UID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `permissions` (
  `Role` tinyint NOT NULL,
  `Table` varchar(64) NOT NULL,
  `Field` varchar(64) NOT NULL,
  `Read` boolean NOT NULL DEFAULT false,
  `Write` boolean NOT NULL DEFAULT false,
  KEY `Table` (`Table`,`Field`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `route_access` (
  `Role` tinyint NOT NULL,
  `Route` varchar(128) NOT NULL,
  `Accessible` boolean NOT NULL DEFAULT false,
  `Hide` boolean NOT NULL DEFAULT false,
  KEY `Access` (`Role`,`Route`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `class` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Class` varchar(4) DEFAULT NULL,
  `Old` boolean NOT NULL DEFAULT false,
  PRIMARY KEY(`ID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `group` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Group` varchar(4) DEFAULT NULL,
  `Old` boolean NOT NULL DEFAULT false,
  `HeadTUID` int unsigned NOT NULL,
  PRIMARY KEY(`ID`),
  FOREIGN KEY (`HeadTUID`) REFERENCES user(`UID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `dorm_room` (
  `RID` smallint unsigned NOT NULL,
  `AID` smallint unsigned NOT NULL,
  `Floor` tinyint unsigned DEFAULT NULL,
  `GroupID` integer unsigned NOT NULL,
  PRIMARY KEY (`RID`),
  FOREIGN KEY (`AID`) REFERENCES `annexe`(`ID`),
  FOREIGN KEY (`GroupID`) REFERENCES `group`(`ID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `annexe` (
  `ID` smallint unsigned NOT NULL AUTO_INCREMENT,
  `Annexe` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `resident` (
  `UID` int unsigned NOT NULL,
  `RID` smallint unsigned NOT NULL,
  `BedNum` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY RoomPosition (`RID`, `BedNum`),
  FOREIGN KEY (`UID`) REFERENCES user(`UID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `role_name` (
  `Role` tinyint unsigned NOT NULL DEFAULT 0,
  `Table` varchar(64) NOT NULL,
  `FullName` text DEFAULT NULL,
  PRIMARY KEY (`Role`),
  KEY `Table` (`Table`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `room_order` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RatingTUID` int unsigned DEFAULT NULL,
  `RID` smallint unsigned NOT NULL,
  `Time` datetime DEFAULT NULL,
  `Floor` tinyint DEFAULT NULL,
  `Windows` boolean DEFAULT NULL,
  `Beds` tinyint unsigned DEFAULT NULL,
  `Depowder` boolean DEFAULT NULL,
  `Table` tinyint unsigned DEFAULT NULL,
  `Fridge` tinyint unsigned DEFAULT NULL,
  `Trash` boolean DEFAULT NULL,
  `Air` tinyint unsigned DEFAULT NULL,
  `Shelves` tinyint unsigned DEFAULT NULL,
  `Tidiness` tinyint unsigned DEFAULT NULL,
  `Unwashed` boolean DEFAULT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`RatingTUID`) REFERENCES user(`UID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `student` (
  `UID` int unsigned NOT NULL,
  `GroupID` int unsigned NOT NULL,
  `ClassID` int unsigned NOT NULL,
  `School` text DEFAULT NULL,
  `Birthplace` text DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `GuardianName` text DEFAULT NULL,
  `GuardianPhone` varchar(50) DEFAULT NULL,
  `RID` smallint unsigned NOT NULL,
  `Country` text DEFAULT NULL,
  `City` text DEFAULT NULL,
  `Street` text DEFAULT NULL,
  `PostCode` int unsigned DEFAULT NULL,
  `Address` int unsigned DEFAULT NULL,
  `Floor` int unsigned DEFAULT NULL,
  `Door` int unsigned DEFAULT NULL,
  `ContactID` int unsigned,
  PRIMARY KEY (`UID`) USING BTREE,
  FOREIGN KEY (`UID`) REFERENCES user(`UID`),
  FOREIGN KEY (`GroupID`) REFERENCES `group`(`ID`),
  FOREIGN KEY (`ClassID`) REFERENCES class(`ID`),
  FOREIGN KEY (`ContactID`) REFERENCES contacts(`ID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `contacts` (
  `ID` int unsigned NOT NULL,
  `Discord` tinytext DEFAULT NULL,
  `Facebook` tinytext DEFAULT NULL,
  `Instagram` tinytext DEFAULT NULL,
  `Email` tinytext DEFAULT NULL,
  PRIMARY KEY (`ID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `professions` (
  `PID` int unsigned NOT NULL,
  `Name` tinytext NOT NULL,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`PID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `user` (
  `UID` int unsigned NOT NULL AUTO_INCREMENT,
  `Role` tinyint unsigned DEFAULT 0,
  `Name` text DEFAULT NULL,
  `OM` varchar(11) DEFAULT NULL,
  `Picture` text DEFAULT NULL,
  `Gender` tinyint unsigned NOT NULL,
  PRIMARY KEY (`UID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `teacher` (
  `UID` int unsigned NOT NULL,
  `PID` int unsigned NOT NULL,
  PRIMARY KEY (`UID`) USING BTREE,
  FOREIGN KEY (`UID`) REFERENCES user(`UID`),
  FOREIGN KEY (`PID`) REFERENCES professions(`PID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `day_type_names` (
  `ID` int unsigned NOT NULL,
  `DayName` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `lessons` (
  `VersionID` int unsigned,
  `LessonNum` tinyint,
  `StartTime` time,
  `EndTime` time,
  KEY (`VersionID`, `LessonNum`)
);

CREATE TABLE IF NOT EXISTS `day_type` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `TypeID` int unsigned NOT NULL,
  `DayStart` time,
  `RoomRating` time,
  `MiddayAttendance` time,
  `DayArrival` time,
  `LessonsVersion` int unsigned,
  `NightArrivalRed` time,
  `NightArrivalYellow` time,
  `NightEnd` time,
  `EveningAttendance` time,
  `BreakfastStart` time,
  `BreakfastEnd` time,
  `DinnerStart` time,
  `DinnerEnd` time,
  `SupperStart` time,
  `SupperEnd` time,
  `ActiveOn` timestamp DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`TypeID`) REFERENCES day_type_names(`ID`),
  FOREIGN KEY (`LessonsVersion`) REFERENCES lessons(`VersionID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `date` (
  `DateID` DATE NOT NULL,
  `DayTypeID` int unsigned NOT NULL,
  PRIMARY KEY (`DateID`),
  FOREIGN KEY (`DayTypeID`) REFERENCES day_type(`ID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `program_types` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Type` tinyint unsigned NOT NULL,
  `Topic` text NOT NULL,
  `RID` smallint unsigned NOT NULL,
  `TUID` int unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`TUID`) REFERENCES user(`UID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `program` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ProgramID` int unsigned NOT NULL,
  `Date` DATE NOT NULL,
  `Lesson` tinyint unsigned NOT NULL,
  `Length` tinyint unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`ProgramID`) REFERENCES program_types(`ID`),
  FOREIGN KEY (`Date`) REFERENCES date(`DateID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `mandatory_program` (
  `ID` int unsigned NOT NULL,
  `ClassID` int unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`ID`) REFERENCES program(`ID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `study_group_program` (
  `ID` int unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`ID`) REFERENCES program(`ID`)
) DEFAULT COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `study_group_attendees` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `UID` int unsigned NOT NULL,
  `GroupID` int unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`UID`) REFERENCES user(`UID`),
  FOREIGN KEY (`GroupID`) REFERENCES program_types(`ID`)
) DEFAULT COLLATE=utf8_bin;


/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
