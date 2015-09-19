CREATE DATABASE  IF NOT EXISTS `accounting` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci */;
/*USE `accounting`;*/
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: accounting
-- ------------------------------------------------------
-- Server version	5.5.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `afakulcsok`
--

DROP TABLE IF EXISTS `afakulcsok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afakulcsok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipus` enum('L','F') COLLATE utf8_hungarian_ci NOT NULL,
  `kulcs` int(11) NOT NULL,
  `fokszam` varchar(10) COLLATE utf8_hungarian_ci NOT NULL,
  `megnevezes` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_afakulcsok_szamlatukor_idx` (`fokszam`),
  CONSTRAINT `fk_afakulcsok_szamlatukor` FOREIGN KEY (`fokszam`) REFERENCES `szamlatukor` (`fokszam`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afakulcsok`
--

INSERT INTO `afakulcsok` (`id`, `tipus`, `kulcs`, `fokszam`, `megnevezes`) VALUES (1,'L',0,'4661','0%-os levonható ÁFA');
INSERT INTO `afakulcsok` (`id`, `tipus`, `kulcs`, `fokszam`, `megnevezes`) VALUES (2,'L',18,'4661','18%-os levonható ÁFA');
INSERT INTO `afakulcsok` (`id`, `tipus`, `kulcs`, `fokszam`, `megnevezes`) VALUES (3,'L',27,'4661','27%-os levonható ÁFA');
INSERT INTO `afakulcsok` (`id`, `tipus`, `kulcs`, `fokszam`, `megnevezes`) VALUES (4,'F',0,'4671','0%-os fizetendő ÁFA');
INSERT INTO `afakulcsok` (`id`, `tipus`, `kulcs`, `fokszam`, `megnevezes`) VALUES (5,'F',18,'4671','18%-os fizetendő ÁFA');
INSERT INTO `afakulcsok` (`id`, `tipus`, `kulcs`, `fokszam`, `megnevezes`) VALUES (6,'F',27,'4671','27%-os fizetendő ÁFA');
INSERT INTO `afakulcsok` (`id`, `tipus`, `kulcs`, `fokszam`, `megnevezes`) VALUES (7,'F',15,'4671','15%-os fizetend? ÁFA');
INSERT INTO `afakulcsok` (`id`, `tipus`, `kulcs`, `fokszam`, `megnevezes`) VALUES (9,'L',0,'46691','EU-s 27%-os ÁFA');

--
-- Table structure for table `afasor`
--

DROP TABLE IF EXISTS `afasor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afasor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `afakulcsid` int(11) NOT NULL,
  `naplokod` varchar(45) COLLATE utf8_hungarian_ci NOT NULL,
  `naplotipus` enum('S','V','P','B','E') COLLATE utf8_hungarian_ci NOT NULL,
  `naplosorszam` int(11) NOT NULL,
  `bizszam` varchar(45) COLLATE utf8_hungarian_ci NOT NULL,
  `partnerid` int(11) NOT NULL,
  `megnevezes` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `fizmodid` int(11) NOT NULL,
  `teljdatum` date NOT NULL,
  `bruttoosszeg` int(11) NOT NULL,
  `nettoosszeg` int(11) NOT NULL,
  `afaosszeg` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_naplo_afa_idx` (`naplokod`),
  KEY `fk_partner_afa_idx` (`partnerid`),
  CONSTRAINT `fk_naplo_afa` FOREIGN KEY (`naplokod`) REFERENCES `naplosor` (`naplokod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partner_afa` FOREIGN KEY (`partnerid`) REFERENCES `partnerek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afasor`
--

INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (1,3,'S00001','S',1,'S1',1,'Anyag',1,'2015-08-27',1270,1000,270);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (2,3,'S00002','S',2,'S2',2,'Könyvelés',1,'2015-08-26',25400,20000,5400);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (3,3,'S00003','S',3,'S3',5,'Étk. anyagok',3,'2015-08-26',12700,10000,2700);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (4,2,'S00003','S',3,'S3',5,'Étk. anyagok',3,'2015-08-26',10000,8475,1525);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (5,4,'V00001','V',1,'V1',3,'Árbevétel',1,'2015-08-27',45000,45000,0);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (6,5,'V00001','V',1,'V1',3,'Árbevétel',1,'2015-08-27',61800,52373,9427);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (7,6,'V00002','V',2,'V2',3,'Árbevétel',1,'2015-08-27',12000,9449,2551);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (8,5,'V00002','V',2,'V2',3,'Árbevétel',1,'2015-08-27',25000,21186,3814);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (9,4,'V00002','V',2,'V2',3,'Árbevétel',1,'2015-08-27',50000,50000,0);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (10,3,'P00001','P',1,'P1',5,'Étk. anyagok',4,'2015-08-27',6800,5354,1446);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (11,2,'P00001','P',1,'P1',5,'Étk. anyagok',4,'2015-08-27',8000,6780,1220);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (12,3,'S00004','S',4,'S5',1,'Megnevezés',1,'2015-08-27',12300,9685,2615);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (13,6,'P00004','P',4,'P12',5,'KKKK',4,'2015-08-27',23445,18461,4984);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (14,3,'S00009','S',9,'S12',1,'Anyag',1,'2015-09-03',126000,99213,26787);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (16,3,'S00010','S',10,'2015-1',1,'Értékbecslés',1,'2015-08-30',19050,15000,4050);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (17,3,'S00011','S',11,'GDF-1',2,'Gáz',1,'2015-09-06',5212,4104,1108);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (18,6,'V00004','V',4,'2015-1',3,'Árbevétel',1,'2015-08-30',50800,40000,10800);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (19,6,'V00005','V',5,'2015-2',4,'Árbevétel',1,'2015-08-30',19050,15000,4050);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (20,3,'S00012','S',12,'117890',2,'Telefon',1,'2015-08-26',4207,3313,894);
INSERT INTO `afasor` (`id`, `afakulcsid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `partnerid`, `megnevezes`, `fizmodid`, `teljdatum`, `bruttoosszeg`, `nettoosszeg`, `afaosszeg`) VALUES (21,6,'V00006','V',6,'117890',3,'Árbevétel',1,'2015-08-23',4207,3313,894);

--
-- Table structure for table `cegadatok`
--

DROP TABLE IF EXISTS `cegadatok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cegadatok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cegnev` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `cim` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `adoszam` varchar(45) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `cegjegyzekszam` varchar(45) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `bankszamlaszam` varchar(45) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `kshszam` varchar(45) COLLATE utf8_hungarian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegadatok`
--

INSERT INTO `cegadatok` (`id`, `cegnev`, `cim`, `adoszam`, `cegjegyzekszam`, `bankszamlaszam`, `kshszam`) VALUES (1,'Cégnév','9400 Sopron, Frankenburg u. 2/h.','12345678-2-08','08-09-012345','11111111-22222222-33333333','12345678-6810-113-08');

--
-- Table structure for table `fizmodok`
--

DROP TABLE IF EXISTS `fizmodok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fizmodok` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `megnevezes` varchar(255) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '',
  `fizhatarido` int(11) NOT NULL,
  `torolheto` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fizmodok`
--

INSERT INTO `fizmodok` (`id`, `megnevezes`, `fizhatarido`, `torolheto`) VALUES (1,'átutalás - 8 nap',8,'\0');
INSERT INTO `fizmodok` (`id`, `megnevezes`, `fizhatarido`, `torolheto`) VALUES (2,'utánvét',0,'\0');
INSERT INTO `fizmodok` (`id`, `megnevezes`, `fizhatarido`, `torolheto`) VALUES (3,'átutalás - 10 nap',10,'');
INSERT INTO `fizmodok` (`id`, `megnevezes`, `fizhatarido`, `torolheto`) VALUES (4,'készpénz',0,'\0');

--
-- Table structure for table `kontir`
--

DROP TABLE IF EXISTS `kontir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kontir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fokszam` varchar(45) COLLATE utf8_hungarian_ci NOT NULL,
  `naplokod` varchar(45) COLLATE utf8_hungarian_ci NOT NULL,
  `naplotipus` varchar(45) COLLATE utf8_hungarian_ci NOT NULL,
  `naplosorszam` int(11) NOT NULL,
  `teljdatum` date NOT NULL,
  `bizszam` varchar(45) COLLATE utf8_hungarian_ci NOT NULL,
  `megnevezes` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `tkjelleg` enum('T','K') COLLATE utf8_hungarian_ci NOT NULL,
  `osszeg` int(11) NOT NULL,
  `partnerid` int(11) NOT NULL,
  `afatetel` bit(1) DEFAULT NULL,
  `torolt` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `naplo_kontir_idx` (`naplokod`),
  KEY `fk_naplo_kontir_idx` (`naplokod`),
  KEY `fk_fok_kontir_idx` (`fokszam`),
  CONSTRAINT `fk_fok_kontir` FOREIGN KEY (`fokszam`) REFERENCES `szamlatukor` (`fokszam`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_naplo_kontir` FOREIGN KEY (`naplokod`) REFERENCES `naplosor` (`naplokod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontir`
--

INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (1,'4541','S00001','S',1,'2015-08-27','S1','Anyag','K',1270,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (2,'5115','S00001','S',1,'2015-08-27','S1','Anyag','T',1000,1,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (3,'4661','S00001','S',1,'2015-08-27','S1','Anyag','T',270,1,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (4,'4541','S00002','S',2,'2015-08-26','S2','Könyvelés','K',25400,2,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (5,'5271','S00002','S',2,'2015-08-26','S2','Könyvelés','T',20000,2,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (6,'4661','S00002','S',2,'2015-08-26','S2','Könyvelés','T',5400,2,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (7,'4541','S00003','S',3,'2015-08-26','S3','Étk. anyagok','K',30000,5,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (8,'5114','S00003','S',3,'2015-08-26','S3','Étk. anyagok','T',10000,5,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (9,'4661','S00003','S',3,'2015-08-26','S3','Étk. anyagok','T',2700,5,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (10,'5114','S00003','S',3,'2015-08-26','S3','Étk. anyagok','T',8475,5,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (11,'4661','S00003','S',3,'2015-08-26','S3','Étk. anyagok','T',1525,5,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (12,'5114','S00003','S',3,'2015-08-26','S3','Étk. anyagok','T',7300,5,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (13,'311','V00001','V',1,'2015-08-27','V1','Árbevétel','T',106800,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (14,'911','V00001','V',1,'2015-08-27','V1','Árbevétel','K',45000,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (15,'4671','V00001','V',1,'2015-08-27','V1','Árbevétel','K',0,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (16,'912','V00001','V',1,'2015-08-27','V1','Árbevétel','K',52373,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (17,'4671','V00001','V',1,'2015-08-27','V1','Árbevétel','K',9427,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (18,'311','V00002','V',2,'2015-08-27','V2','Árbevétel','T',120000,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (19,'921','V00002','V',2,'2015-08-27','V2','Árbevétel','K',9449,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (20,'4671','V00002','V',2,'2015-08-27','V2','Árbevétel','K',2551,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (21,'921','V00002','V',2,'2015-08-27','V2','Árbevétel','K',21186,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (22,'4671','V00002','V',2,'2015-08-27','V2','Árbevétel','K',3814,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (23,'921','V00002','V',2,'2015-08-27','V2','Árbevétel','K',50000,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (24,'4671','V00002','V',2,'2015-08-27','V2','Árbevétel','K',0,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (25,'921','V00002','V',2,'2015-08-27','V2','Árbevétel','K',33000,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (26,'3811','P00001','P',1,'2015-08-27','P1','Étk. anyagok','K',15600,5,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (27,'5114','P00001','P',1,'2015-08-27','P1','Étk. anyagok','T',5354,5,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (28,'4661','P00001','P',1,'2015-08-27','P1','Étk. anyagok','T',1446,5,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (29,'5114','P00001','P',1,'2015-08-27','P1','Étk. anyagok','T',6780,5,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (30,'4661','P00001','P',1,'2015-08-27','P1','Étk. anyagok','T',1220,5,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (31,'5114','P00001','P',1,'2015-08-27','P1','Étk. anyagok','T',800,5,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (50,'3811','P00002','P',2,'2015-08-27','P2','Bér','K',47000,5,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (51,'4711','P00002','P',2,'2015-08-27','P2','Bér','T',47000,5,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (56,'3811','P00003','P',3,'2015-08-27','P3','Kiegy','K',1270,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (57,'4541','P00003','P',3,'2015-08-27','P3','Kiegy','T',1270,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (58,'4711','E00001','E',1,'2015-08-27','V1','Bér','K',125000,0,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (59,'541','E00001','E',1,'2015-08-27','V1','Bér','T',150000,0,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (60,'4731','E00001','E',1,'2015-08-27','V1','Nyugdíj','K',10000,0,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (61,'4732','E00001','E',1,'2015-08-27','V1','Egészségbizt.','K',5000,0,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (62,'4621','E00001','E',1,'2015-08-27','V1','Szja','K',10000,0,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (63,'3841','B00001','B',1,'2015-08-27','B1','Utalás','K',25400,2,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (64,'4541','B00001','B',1,'2015-08-27','B1','Kiegyenlítés','T',25400,2,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (65,'3841','B00002','B',2,'2015-08-27','B2','Utalás','K',47000,5,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (66,'4711','B00002','B',2,'2015-08-27','B2','Bér','T',47000,5,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (67,'3841','B00003','B',3,'2015-08-27','B3','Utalás','K',12000,0,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (68,'5321','B00003','B',3,'2015-08-27','B3','Kiegyenlítés','T',10000,0,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (69,'8722','B00003','B',3,'2015-08-27','B3','Utalás','T',2000,0,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (70,'4541','S00004','S',4,'2015-08-27','S5','Megnevezés','K',12300,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (71,'5113','S00004','S',4,'2015-08-27','S5','Megnevezés','T',9685,1,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (72,'4661','S00004','S',4,'2015-08-27','S5','Megnevezés','T',2615,1,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (73,'4541','S00005','S',5,'2015-08-27','S1','mm','K',122222,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (74,'5511','S00005','S',5,'2015-08-27','S1','mm','T',122222,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (75,'4541','S00006','S',6,'2015-08-27','S11','Szall','K',1200,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (76,'5115','S00006','S',6,'2015-08-27','S11','Szall','T',1200,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (77,'3841','B00004','B',4,'2015-08-27','BA','Kie','T',1200,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (78,'4541','B00004','B',4,'2015-08-27','BA','Kiegyenlítés','K',1200,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (79,'4541','S00007','S',7,'2015-08-27','S11','Miuk','K',1200,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (80,'5111','S00007','S',7,'2015-08-27','S11','Miuk','T',1200,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (81,'3841','B00005','B',5,'2015-08-27','B77','kk','K',1200,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (82,'4541','B00005','B',5,'2015-08-27','B77','Kiegyenlítés','T',1200,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (83,'311','V00003','V',3,'2015-08-27','V1','MMM','T',12340,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (84,'911','V00003','V',3,'2015-08-27','V1','MMM','K',12340,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (85,'3841','B00006','B',6,'2015-08-27','BB','kk','T',12345,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (86,'311','B00006','B',6,'2015-08-27','BB','kk','K',12345,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (87,'4541','S00008','S',8,'2015-08-27','WW','Mmm','K',1200,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (88,'5111','S00008','S',8,'2015-08-27','WW','Mmm','T',1200,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (89,'3811','P00004','P',4,'2015-08-27','P12','KKKK','T',23445,5,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (90,'911','P00004','P',4,'2015-08-27','P12','KKKK','K',18461,5,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (91,'4671','P00004','P',4,'2015-08-27','P12','KKKK','K',4984,5,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (92,'4541','S00009','S',9,'2015-09-03','S12','Anyag','K',126000,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (93,'5115','S00009','S',9,'2015-09-03','S12','Anyag','T',99213,1,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (94,'4661','S00009','S',9,'2015-09-03','S12','Anyag','T',26787,1,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (98,'4541','S00010','S',10,'2015-08-30','2015-1','Értékbecslés','K',19050,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (99,'5273','S00010','S',10,'2015-08-30','2015-1','Értékbecslés','T',15000,1,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (100,'4661','S00010','S',10,'2015-08-30','2015-1','Értékbecslés','T',4050,1,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (101,'4541','S00011','S',11,'2015-09-06','GDF-1','Gáz','K',6212,2,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (102,'5118','S00011','S',11,'2015-09-06','GDF-1','Gáz','T',1000,2,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (103,'5118','S00011','S',11,'2015-09-06','GDF-1','Gáz','T',4104,2,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (104,'4661','S00011','S',11,'2015-09-06','GDF-1','Gáz','T',1108,2,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (105,'311','V00004','V',4,'2015-08-30','2015-1','Árbevétel','T',50800,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (106,'921','V00004','V',4,'2015-08-30','2015-1','Árbevétel','K',40000,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (107,'4671','V00004','V',4,'2015-08-30','2015-1','Árbevétel','K',10800,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (108,'311','V00005','V',5,'2015-08-30','2015-2','Árbevétel','K',29050,4,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (109,'911','V00005','V',5,'2015-08-30','2015-2','Árbevétel','T',10000,4,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (110,'911','V00005','V',5,'2015-08-30','2015-2','Árbevétel','T',15000,4,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (111,'4671','V00005','V',5,'2015-08-30','2015-2','Árbevétel','T',4050,4,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (114,'3841','B00007','B',7,'2015-09-06','123','Kiegyenlítés','K',19050,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (115,'4541','B00007','B',7,'2015-09-06','123','Kiegyenlítés','T',19050,1,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (116,'3811','P00005','P',5,'2015-09-06','GDF-1','Kiegyenlítés','K',6212,2,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (117,'4541','P00005','P',5,'2015-09-06','GDF-1','Kiegyenlítés','T',6212,2,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (118,'3841','B00008','B',8,'2015-09-06','K12','Kiegyenlítés','T',25400,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (119,'311','B00008','B',8,'2015-09-06','K12','Kiegyenlítés','K',25400,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (120,'4541','S00012','S',12,'2015-08-26','117890','Telefon','K',6010,2,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (121,'5242','S00012','S',12,'2015-08-26','117890','Telefon','T',3313,2,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (122,'4661','S00012','S',12,'2015-08-26','117890','Telefon','T',894,2,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (123,'5242','S00012','S',12,'2015-08-26','117890','Telefon','T',1803,2,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (124,'311','V00006','V',6,'2015-08-23','117890','Árbevétel','T',6010,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (125,'921','V00006','V',6,'2015-08-23','117890','Árbevétel','K',3313,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (126,'4671','V00006','V',6,'2015-08-23','117890','Árbevétel','K',894,3,'','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (127,'921','V00006','V',6,'2015-08-23','117890','Árbevétel','K',1803,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (128,'3841','B00009','B',9,'2015-09-06','B1','Kiegyenlítés','T',6010,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (129,'311','B00009','B',9,'2015-09-06','B1','Kiegyenlítés','K',6010,3,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (130,'3811','P00006','P',6,'2015-09-06','P1','Kiegyenlítés','K',6010,2,'\0','\0');
INSERT INTO `kontir` (`id`, `fokszam`, `naplokod`, `naplotipus`, `naplosorszam`, `teljdatum`, `bizszam`, `megnevezes`, `tkjelleg`, `osszeg`, `partnerid`, `afatetel`, `torolt`) VALUES (131,'4541','P00006','P',6,'2015-09-06','P1','Kiegyenlítés','T',6010,2,'\0','\0');

--
-- Table structure for table `naplok`
--

DROP TABLE IF EXISTS `naplok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `naplok` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `megnevezes` varchar(100) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '',
  `jel` char(1) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '',
  `fokszam` varchar(45) COLLATE utf8_hungarian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naplok`
--

INSERT INTO `naplok` (`id`, `megnevezes`, `jel`, `fokszam`) VALUES (1,'Szállító','S','454');
INSERT INTO `naplok` (`id`, `megnevezes`, `jel`, `fokszam`) VALUES (2,'Vevő','V','31');
INSERT INTO `naplok` (`id`, `megnevezes`, `jel`, `fokszam`) VALUES (3,'Pénztár','P','381');
INSERT INTO `naplok` (`id`, `megnevezes`, `jel`, `fokszam`) VALUES (4,'Bank','B','384');
INSERT INTO `naplok` (`id`, `megnevezes`, `jel`, `fokszam`) VALUES (5,'Vegyes','E','');

--
-- Table structure for table `naplosor`
--

DROP TABLE IF EXISTS `naplosor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `naplosor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naplotipus` enum('S','V','B','P','E') COLLATE utf8_hungarian_ci NOT NULL,
  `naplosorszam` int(11) NOT NULL,
  `naplokod` varchar(45) COLLATE utf8_hungarian_ci NOT NULL,
  `teljdatum` date NOT NULL,
  `tkjelleg` enum('T','K') COLLATE utf8_hungarian_ci NOT NULL,
  `fokszam` varchar(45) COLLATE utf8_hungarian_ci NOT NULL,
  `bizszam` varchar(45) COLLATE utf8_hungarian_ci NOT NULL,
  `megnevezes` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `osszeg` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `naplokod` (`naplokod`),
  KEY `fk_fok_naplo_idx` (`fokszam`),
  CONSTRAINT `fk_fok_naplo` FOREIGN KEY (`fokszam`) REFERENCES `szamlatukor` (`fokszam`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naplosor`
--

INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (1,'S',1,'S00001','2015-08-27','K','4541','S1','Anyag',1270);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (2,'S',2,'S00002','2015-08-26','K','4541','S2','Könyvelés',25400);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (3,'S',3,'S00003','2015-08-26','K','4541','S3','Étk. anyagok',30000);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (4,'V',1,'V00001','2015-08-27','T','311','V1','Árbevétel',106800);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (5,'V',2,'V00002','2015-08-27','T','311','V2','Árbevétel',120000);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (6,'P',1,'P00001','2015-08-27','K','3811','P1','Étk. anyagok',15600);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (16,'P',2,'P00002','2015-08-27','K','3811','P2','Bér',47000);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (19,'P',3,'P00003','2015-08-27','K','3811','P3','Kiegy',1270);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (20,'E',1,'E00001','2015-08-27','K','4711','V1','Bér',125000);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (21,'B',1,'B00001','2015-08-27','K','3841','B1','Utalás',25400);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (22,'B',2,'B00002','2015-08-27','K','3841','B2','Utalás',47000);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (23,'B',3,'B00003','2015-08-27','K','3841','B3','Utalás',12000);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (24,'S',4,'S00004','2015-08-27','K','4541','S5','Megnevezés',12300);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (25,'S',5,'S00005','2015-08-27','K','4541','S1','mm',122222);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (26,'S',6,'S00006','2015-08-27','K','4541','S11','Szall',1200);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (27,'B',4,'B00004','2015-08-27','T','3841','BA','Kie',1200);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (28,'S',7,'S00007','2015-08-27','K','4541','S11','Miuk',1200);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (29,'B',5,'B00005','2015-08-27','K','3841','B77','kk',1200);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (30,'V',3,'V00003','2015-08-27','T','311','V1','MMM',12340);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (31,'B',6,'B00006','2015-08-27','T','3841','BB','kk',12345);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (32,'S',8,'S00008','2015-08-27','K','4541','WW','Mmm',1200);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (33,'P',4,'P00004','2015-08-27','T','3811','P12','KKKK',23445);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (34,'S',9,'S00009','2015-09-03','K','4541','S12','Anyag',126000);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (36,'S',10,'S00010','2015-08-30','K','4541','2015-1','Értékbecslés',19050);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (37,'S',11,'S00011','2015-09-06','K','4541','GDF-1','Gáz',6212);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (38,'V',4,'V00004','2015-08-30','T','311','2015-1','Árbevétel',50800);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (39,'V',5,'V00005','2015-08-30','K','311','2015-2','Árbevétel',29050);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (41,'B',7,'B00007','2015-09-06','K','3841','123','Kiegyenlítés',19050);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (42,'P',5,'P00005','2015-09-06','K','3811','GDF-1','Kiegyenlítés',6212);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (43,'B',8,'B00008','2015-09-06','T','3841','K12','Kiegyenlítés',25400);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (44,'S',12,'S00012','2015-08-26','K','4541','117890','Telefon',6010);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (45,'V',6,'V00006','2015-08-23','T','311','117890','Árbevétel',6010);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (46,'B',9,'B00009','2015-09-06','T','3841','B1','Kiegyenlítés',6010);
INSERT INTO `naplosor` (`id`, `naplotipus`, `naplosorszam`, `naplokod`, `teljdatum`, `tkjelleg`, `fokszam`, `bizszam`, `megnevezes`, `osszeg`) VALUES (47,'P',6,'P00006','2015-09-06','K','3811','P1','Kiegyenlítés',6010);

--
-- Table structure for table `partnerek`
--

DROP TABLE IF EXISTS `partnerek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partnerek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `adoszam` varchar(45) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `cim` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `szallito` bit(1) NOT NULL,
  `vevo` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partnerek`
--

INSERT INTO `partnerek` (`id`, `nev`, `adoszam`, `cim`, `szallito`, `vevo`) VALUES (1,'Szállító 1 Kft','33333333-2-08',NULL,'','\0');
INSERT INTO `partnerek` (`id`, `nev`, `adoszam`, `cim`, `szallito`, `vevo`) VALUES (2,'Szállító 2 Rt',NULL,NULL,'','\0');
INSERT INTO `partnerek` (`id`, `nev`, `adoszam`, `cim`, `szallito`, `vevo`) VALUES (3,'Vevő 1 Kft',NULL,NULL,'\0','');
INSERT INTO `partnerek` (`id`, `nev`, `adoszam`, `cim`, `szallito`, `vevo`) VALUES (4,'Vevő 2 Rt',NULL,NULL,'\0','');
INSERT INTO `partnerek` (`id`, `nev`, `adoszam`, `cim`, `szallito`, `vevo`) VALUES (5,'Partner 1','12345678-2-08',NULL,'','');

--
-- Table structure for table `partnersor`
--

DROP TABLE IF EXISTS `partnersor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partnersor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partnerid` int(11) NOT NULL,
  `naplokod` varchar(45) COLLATE utf8_hungarian_ci NOT NULL,
  `naplotipus` enum('S','V','B','P','E') COLLATE utf8_hungarian_ci NOT NULL,
  `naplosorszam` int(11) NOT NULL,
  `bizszam` varchar(45) COLLATE utf8_hungarian_ci NOT NULL,
  `megnevezes` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `teljdatum` date NOT NULL,
  `kialldatum` date NOT NULL,
  `eseddatum` date NOT NULL,
  `kifizdatum` date DEFAULT NULL,
  `fizmodid` int(11) NOT NULL,
  `tkjelleg` enum('T','K') COLLATE utf8_hungarian_ci NOT NULL,
  `osszeg` int(11) NOT NULL,
  `kifizosszeg` int(11) NOT NULL,
  `kipontozott` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_partner_partnersor_idx` (`partnerid`),
  KEY `fk_naplo_partnersor_idx` (`naplokod`),
  CONSTRAINT `fk_naplo_partnersor` FOREIGN KEY (`naplokod`) REFERENCES `naplosor` (`naplokod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partner_partnersor` FOREIGN KEY (`partnerid`) REFERENCES `partnerek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partnersor`
--

INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (1,1,'S00001','S',1,'S1','Anyag','2015-08-27','2015-08-27','2015-08-27',NULL,1,'K',1270,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (2,2,'S00002','S',2,'S2','Könyvelés','2015-08-26','2015-08-27','2015-08-27',NULL,1,'K',25400,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (3,5,'S00003','S',3,'S3','Étk. anyagok','2015-08-26','2015-08-27','2015-08-27',NULL,3,'K',30000,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (4,3,'V00001','V',1,'V1','Árbevétel','2015-08-27','2015-08-27','2015-08-27',NULL,1,'T',106800,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (5,3,'V00002','V',2,'V2','Árbevétel','2015-08-27','2015-08-27','2015-08-27',NULL,1,'T',120000,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (7,1,'P00003','P',3,'S1','Kiegy','2015-08-27','2015-08-27','2015-08-27','2015-08-27',1,'K',0,1270,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (8,2,'B00001','B',1,'S2','Utalás','2015-08-26','2015-08-27','2015-08-27','2015-08-27',1,'K',0,25400,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (9,1,'S00004','S',4,'S5','Megnevezés','2015-08-27','2015-08-27','2015-08-27',NULL,1,'K',12300,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (10,1,'S00005','S',5,'S1','mm','2015-08-27','2015-08-27','2015-08-27',NULL,1,'K',122222,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (11,1,'S00006','S',6,'S11','Szall','2015-08-27','2015-08-27','2015-08-27',NULL,1,'K',1200,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (12,1,'B00004','B',4,'S11','Kie','2015-08-27','2015-08-27','2015-08-27','2015-08-27',1,'K',0,1200,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (13,1,'S00007','S',7,'S11','Miuk','2015-08-27','2015-08-27','2015-08-27',NULL,1,'K',1200,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (14,1,'B00005','B',5,'S11','kk','2015-08-27','2015-08-27','2015-08-27','2015-08-27',1,'K',0,1200,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (15,3,'V00003','V',3,'V1','MMM','2015-08-27','2015-08-27','2015-08-27',NULL,1,'T',12340,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (16,3,'B00006','B',6,'V1','kk','2015-08-27','2015-08-27','2015-08-27','2015-08-27',1,'T',0,12345,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (17,1,'S00008','S',8,'WW','Mmm','2015-08-27','2015-08-27','2015-08-27',NULL,1,'K',1200,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (18,1,'S00009','S',9,'S12','Anyag','2015-09-03','2015-09-03','2015-09-03',NULL,1,'K',126000,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (19,1,'S00010','S',10,'2015-1','Értékbecslés','2015-08-30','2015-09-06','2015-09-06',NULL,1,'K',19050,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (20,2,'S00011','S',11,'GDF-1','Gáz','2015-09-06','2015-09-06','2015-09-06',NULL,1,'K',6212,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (21,3,'V00004','V',4,'2015-1','Árbevétel','2015-08-30','2015-09-06','2015-09-06',NULL,1,'T',50800,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (22,4,'V00005','V',5,'2015-2','Árbevétel','2015-08-30','2015-09-06','2015-09-06',NULL,1,'K',29050,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (23,1,'B00007','B',7,'2015-1','Értékbecslés','2015-08-30','2015-09-06','2015-09-06','2015-09-06',1,'K',0,19050,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (24,2,'P00005','P',5,'GDF-1','Gáz','2015-09-06','2015-09-06','2015-09-06','2015-09-06',1,'K',0,6212,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (25,3,'B00008','B',8,'2015-1','Árbevétel','2015-08-30','2015-09-06','2015-09-06','2015-09-06',1,'T',0,25400,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (26,2,'S00012','S',12,'117890','Telefon','2015-08-26','2015-09-06','2015-09-06',NULL,1,'K',6010,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (27,3,'V00006','V',6,'117890','Árbevétel','2015-08-23','2015-09-06','2015-09-06',NULL,1,'T',6010,0,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (28,3,'B00009','B',9,'117890','Árbevétel','2015-08-23','2015-09-06','2015-09-06','2015-09-06',1,'T',0,6010,'\0');
INSERT INTO `partnersor` (`id`, `partnerid`, `naplokod`, `naplotipus`, `naplosorszam`, `bizszam`, `megnevezes`, `teljdatum`, `kialldatum`, `eseddatum`, `kifizdatum`, `fizmodid`, `tkjelleg`, `osszeg`, `kifizosszeg`, `kipontozott`) VALUES (29,2,'P00006','P',6,'117890','Telefon','2015-08-26','2015-09-06','2015-09-06','2015-09-06',1,'K',0,6010,'\0');

--
-- Table structure for table `szamlatukor`
--

DROP TABLE IF EXISTS `szamlatukor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `szamlatukor` (
  `fokszam` varchar(10) COLLATE utf8_hungarian_ci NOT NULL,
  `megnevezes` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `osszesito` bit(1) NOT NULL,
  PRIMARY KEY (`fokszam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `szamlatukor`
--

INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1','BEFEKTETETT ESZKÖZÖK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('11','IMMATERIÁLIS JAVAK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('111','Alapítás-átszervezés aktivált értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('112','Kísérleti fejlesztés aktivált értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('113','Vagyoni értékû jogok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('114','Szellemi termékek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('115','Üzleti vagy cégérték','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('117','Immateriális javak értékhelyesbítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('118','Immateriális javak terven felüli értékcsökkenése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('119','Immateriális javak terv szerinti értékcsökkenése','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1191','Alapítás-átszervezés aktivált értékének értékcsökkenése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1192','Kísérleti fejlesztés aktivált értékének értékcsökkenése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1193','Vagyoni értékû jogok értékcsökkenése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1194','Szellemi termékek értékcsökkenése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('12','INGATLANOK ÉS KAPCSOLÓDÓ VAGYONI ÉRTÉKÛ JOGOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('121','Földterület','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('122','Telek, telkesítés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('123','Épületek, épületrészek, tulajdoni hányadok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('124','Egyéb építmények','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('125','Üzemkörön kívüli ingatlanok, épületek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('126','Ingatlanokhoz kapcsolódó vagyoni értékû jogok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('127','Ingatlanok értékhelyesbítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('128','Ingatlanok terven felüli értékcsökkenése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('129','Ingatlanok terv szerinti értékcsökkenése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('13','MÛSZAKI BERENDEZÉSEK, GÉPEK, JÁRMÛVEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('131','Termelõ gépek, berendezések, szerszámok, gyártóeszközök','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('132','Termelésben közvetlenül részt vevõ jármûvek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('137','Mûszaki berendezések, gépek, jármûvek értékhelyesbítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('138','Mûszaki berend., gépek, jármûvek terv. f. értékcsökk. és visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('139','Mûszaki berendezések, gépek, jármûvek terv szerinti értékcsökkenése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('14','EGYÉB BERENDEZÉSEK, FELSZERELÉSEK, JÁRMÛVEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('141','Üzemi (üzleti) gépek, berendezések, felszerelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('142','Egyéb jármûvek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('143','Irodai, igazgatási berendezések és felszerelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('144','Üzemkörön kívüli berendezések, felszerelések, jármûvek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('147','Egyéb berendezések, felszerelések, jármûvek értékhelyesbítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('148','Egyéb berend., felsz., jármûvek terv. f. értékcsökk. és visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('149','Egyéb berendezések, felszerelések, jármûvek terv szerinti értékcsökk.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('15','TENYÉSZÁLLATOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('151','Tenyészállatok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('152','Igásállatok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('153','Egyéb állatok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('157','Tenyészállatok értékhelyesbítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('158','Tenyészállatok terven felüli értékcsökkenése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('159','Tenyészállatok terv szerinti értékcsökkenése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('16','BERUHÁZÁSOK, FELÚJÍTÁSOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('161','Befejezetlen beruházások','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('162','Felújítások','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('168','Beruházások terven felüli értékcsökkenése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('17','TULAJDONI RÉSZESEDÉST JELENTÕ BEFEKTETÉSEK (RÉSZESEDÉSEK)','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('171','Tartós részesedés kapcsolt vállalkozásban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('172','Egyéb tartós részesedés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('177','Részesedések értékhelyesbítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('179','Részesedések értékvesztése és annak visszaírása','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1791','Tartós részesedés értékvesztése és visszaírása kapcsolt vállalkozásban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1792','Egyéb tartós részesedés értékvesztése és visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('18','HITELVISZONYT MEGTESTESÍTÕ ÉRTÉKPAPÍROK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('181','Államkötvények','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('182','Kapcsolt vállalkozások értékpapírjai','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('183','Egyéb vállalkozások értékpapírjai','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('184','Tartós diszkontértékpapírok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('189','Értékpapírok értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('19','TARTÓSAN ADOTT KÖLCSÖNÖK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('191','Tartósan adott kölcsönök kapcsolt vállalkozásban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('192','Tartósan adott kölcsönök egyéb részesedési viszonyban álló vállalk.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('193','Egyéb tartósan adott kölcsönök','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1931','Pénzügyi lízing miatti tartós követelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('195','Tartós bankbetétek kapcsolt vállalkozásban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('196','Tartós bankbetétek egyéb részesedési viszonyban álló vállalkozásban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('197','Egyéb tartós bankbetétek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('198','Pénzügyi lízing miatti tartós követelés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('199','Tartósan adott kölcsönök, bankbetétek értékvesztése és visszaírása','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1991','Tartósan adott kölcsönök értékvesztése és visszaírása kapcsoltváll-ban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1992','Tart. adott kölcs-k év-e és visszaí-a egyéb rész-i visz-ban álló váll.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1993','Egyéb tartósan adott kölcsönök értékvesztése és visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1995','Tartós bankbet-k év-e és visszaí-a kapcsolt vállalkozásban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1996','Tartós bankbetétek év-e és visszaí-a egyéb rész-i visz-ban álló v-ban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('1997','Egyéb tartós bankbetétek értékvesztése és visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('2','KÉSZLETEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('21','Nyers- és alapanyagok','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('211','Alapanyagok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('22','Anyagok','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('221','Segédanyagok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('222','Üzem- és fûtõanyagok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('223','Fenntartási anyagok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('224','Építési anyagok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('225','Egy éven belül elhasználódó anyagi eszközök','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('226','Tárgyi eszközök közül átsorolt anyagok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('227','Egyéb anyagok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('228','Anyagok árkülönbözete','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('229','Anyagok értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('23','BEFEJEZETLEN TERMELÉS ÉS FÉLKÉSZ TERMÉKEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('231','Befejezetlen termelés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('235','Félkész termékek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('238','Félkész termékek készletérték-különbözete','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('239','Befejezetlen termelés, félkész termékek értékvesztése és visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('24','NÖVENDÉK, HÍZÓ- ÉS EGYÉB ÁLLATOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('241','Növendék állatok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('242','Hízóállatok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('243','Egyéb állatok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('246','Bérbe vett állatok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('248','Állatok készletérték-különbözete','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('249','Állatok értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('25','KÉSZTERMÉKEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('251','Késztermékek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('258','Késztermékek készletérték-különbözete','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('259','Késztermékek értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('26','KERESKEDELMI ÁRUK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('261','Áruk beszerzési áron','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('262','Áruk elszámolóáron','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('263','Áruk árkülönbözete','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('264','Áruk eladási áron','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('265','Áruk árrése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('266','Idegen helyen tárolt, bizományba átadott áruk','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('267','Tárgyi eszközök közül átsorolt áruk','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('268','Belsõ (egységek, tevékenységek közötti) átadás-átvétel ütközõszámla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('269','Kereskedelmi áruk értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('27','KÖZVETÍTETT SZOLGÁLTATÁSOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('271','Közvetített szolgáltatások','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('279','Közvetített szolgáltatások értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('28','BETÉTDÍJAS GÖNGYÖLEGEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('281','Betétdíjas göngyölegek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('288','Betétdíjas göngyölegek árkülönbözete','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('289','Betétdíjas göngyölegek értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3','KÖVETELÉSEK, PÉNZÜGYI ESZKÖZÖK ÉS AKTÍV IDÕBELI ELHATÁROLÁSOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('31','KÖVETELÉSEK ÁRUSZÁLLÍTÁSBÓL ÉS SZOLGÁLTATÁSBÓL (VEVÕK)','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('311','Belföldi követelések (forintban)','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('312','Belföldi követelések (devizában)','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('315','Belföldi követelések értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('316','Külföldi követelések (forintban)','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('317','Külföldi követelések (devizában)','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('319','Külföldi követelések értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('32','KÖVETELÉSEK KAPCSOLT VÁLLALKOZÁSSAL SZEMBEN','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('321','Követelések az anyavállalattal szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('322','Követelések a leányvállalattal szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('323','Követelések a közös vezetésû vállalkozással szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('324','Követelések a társult vállalkozással szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('325','Jegyzett, de még be nem fizetett tõke az anyavállalattól','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('326','Jegyzett, de még be nem fizetett tõke a leányvállalattól','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('327','Jegyzett, de még be nem fizetett tõke a közös vezetésû vállalkozástól','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('328','Jegyzett, de még be nem fizetett tõke a társult vállalkozástól','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('329','Kapcsolt vállalk. szembeni követelések értékvesztése és visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('33','KÖVETELÉSEK EGYÉB RÉSZESEDÉSI VISZONYBAN LÉVÕ VÁLLALKOZÁSSAL SZEMBEN','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('331','Követelések egyéb részesedési viszonyban lévõ vállalkozással szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('332','Jegyzett, be nem fiz. tõke az egyéb részesedési visz. vállalkozástól','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('339','Egyéb rész. visz. lévõ vállalk. szemben köv. értékveszt., visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('34','VÁLTÓKÖVETELÉSEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('341','Belföldi váltókövetelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('345','Belföldi váltókövetelések értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('346','Külföldi váltókövetelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('349','Külföldi váltókövetelések értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('35','ADOTT ELÕLEGEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('351','Immateriális javakra adott elõlegek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('352','Beruházásokra adott elõlegek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('353','Készletekre adott elõlegek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('358','Jegyzett, be nem fiz. tõke részesedési visz. nem lévõ vállalkozástól','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('359','Adott elõlegek értékvesztése és visszaírása','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3591','Immat.javakra adott elõlegek értékvesztése és visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3592','Beruházásra adott elõleg értékvsztése és visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3593','Készletekre adott elõlegek értékvesztése és visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('36','EGYÉB KÖVETELÉSEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('361','Munkavállalókkal szembeni követelések','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3611','Munkavállalóknak folyósított elõlegek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3612','Elõírt tartozások','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3613','Egyéb elszámolások a munkavállalókkal','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('362','Költségvetési kiutalási igények','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3621','Fogyasztói árkiegészítés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3622','Termelési árkiegészítés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3623','Importtámogatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3624','Exporttámogatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3625','Mezõgazdasági és élelmiszer-ipari exporttámogatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3626','Dotáció','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3627','Reorganizációs támogatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3628','Meliorációs és öntözésfejlesztési beruházási támogatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3629','Egyéb támogatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('363','Költségvetési kiutalási igények teljesítése','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3631','Fogyasztói árkiegészítés teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3632','Termelési árkiegészítés teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3633','Importtámogatás teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3634','Exporttámogatás teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3635','Mezõgazdaásgi és élelmiszer-ipari exporttámogatás teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3636','Dotáció teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3637','Reorganizációs támogatás teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3638','Meliorációs és öntözésfejlesztési beruházási támogatás teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3639','Egyéb támogatás teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('364','Rövid lejáratú kölcsönadott pénzeszközök','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3641','Rövid lejáratú kölcsönök','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3642','Tartósan adott kölcsönökbõl átsorolt követelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('365','Vásárolt és kapott követelések','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3651','Vásárolt belföldi követelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3652','Vásárolt külföldi útján átvett követelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3653','Követelés fejében, csere követelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3654','Nem pénzbeli hozzájárulásként kapott (átvett) követelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3655','Térítés nélkül átvett követelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3658','Egyéb címen kapott követelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('366','Részesedésekkel, értékpapírokkal kapcsolatos követelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('367','Határidõs, opciós és swapügyletekkel kapcsolatos követelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('368','Különféle egyéb követelések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('369','Egyéb követelések értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('37','ÉRTÉKPAPÍROK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('371','Részesedés kapcsolt vállalkozásban','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3711','Részesedés anyavállalatban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3712','Részesedés leányvállalatban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3713','Részesedés közös vezetésû vállalkozásban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3714','Részesedés társult vállalkozásban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3719','Kapcsolt vállalk. lévõ részesedések értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('372','Egyéb részesedés','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3721','Eladásra vásárolt egyéb részesedések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3729','Egyéb részesedések értékvesztése és annak visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('373','Saját részvények, saját üzletrészek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3731','Visszavásárolt saját részvények, saját üzletrészek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3739','Saját részvények, saját üzletrészek értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('374','Forgatási célú hitelviszonyt megtestesítõ értékpapírok','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3741','Eladásra vásárolt hitelviszonyt megtestesítõ értékpapírok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3742','Eladásra vásárolt diszkontértékpapírok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3749','Forgatási célú hitelvisz. megtest. értékp. értékveszt. és visszaírása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('38','PÉNZESZKÖZÖK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('381','Pénztár','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3811','Pénztárszámla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3812','Elektronikus pénzeszközök','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('382','Valutapénztár','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3821','Valutapénztár-számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3829','Valutaárfolyam-különbözeti számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('383','Csekkek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('384','Elszámolási betétszámla','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3841','Elszámolási betétszámla 1.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3842','Elszámolási betétszámla 2.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('385','Elkülönített betétszámlák','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3851','Kamatozó betétszámlák','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3852','Elkülönített pénzeszközök kötvénykibocsátásból','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3853','Fejlesztési célra elkülönített pénzeszközök','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3854','Egyéb célra elkülönített pénzeszközök','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3855','Lakásépítési betétszámla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3856','Elkülönített lakásépítési célú pénzeszközök','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3857','Lakásépítés úton lévõ pénzeszközei','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('386','Deviza-betétszámla','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3861','Deviza-betétszámla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3862','Külföldön vezetett deviza-betétszámla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3863','Deviza-törzsbetétszámla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3868','Egyéb deviza-betétszámla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3869','Devizabetétárfolyam-különbözeti számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('389','Átvezetési számla','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3891','Pénztár-bank átvezetési számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3892','Bank-bank átvezetési számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3893','Pénztár-pénztár átvezetési számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('39','AKTÍV IDÕBELI ELHATÁROLÁSOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('391','Bevételek aktív idõbeli elhatárolása','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3911','Diszkontértékpapírok idõarányos kamatának elhatárolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3912','Értékpapír besz. kapcs. különbözetbõl az idõarányos árfolyamny. elhat.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3913','Árbevétel, egyéb kamatbevétel, egyéb bevétel elhatárolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('392','Költségek, ráfordítások aktív idõbeli elhatárolása','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3921','Értékpapír, részesedés besz. kapcs. biz. díj, vételi opció díj elhat.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3922','Többletkötelezettségek elhatárolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3923','Költségek, egyéb fizetett kamatok, egyéb ráfordítások elhatárolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('393','Halasztott ráfordítások','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3931','Tartozásátvállalások miatti ráfordítások elhatárolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3932','Devizakötelezettségek árfolyamveszteségének elhatárolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('399','A követelésjellegû aktív idõbeli elhat. értékveszt. és visszaírása','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3991','Bevételek aktív idõbeli elhat-nak értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3992','Ktg-ek, ráf-k aktív idõbeli elhatárolásának értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('3993','Halasztott ráfordítások értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4','FORRÁSOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('41','SAJÁT TÕKE','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('411','Jegyzett tõke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('412','Tõketartalék','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('413','Eredménytartalék','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('414','Lekötött tartalék','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4141','Lekötött tartalék tõketartalékból','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4142','Lekötött tartalék eredménytartalékból','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4143','Lekötött tartalék pótbefizetésbõl','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('417','Értékelési tartalék','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('419','Mérleg szerinti eredmény','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('42','CÉLTARTALÉKOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('421','Céltartalék a várható kötelezettségekre','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('422','Céltartalék a jövõbeni költségekre','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('424','Árfolyamveszteség idõbeli elhatárolása alapján képzett céltartalék','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('429','Egyéb céltartalék','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('43','HÁTRASOROLT KÖTELEZETTSÉGEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('431','Hátrasorolt kötelezettségek kapcsolt vállalkozással szemben','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4311','Hátrasorolt kötelezettségek anyavállalattal szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4312','Hátrasorolt kötelezettségek leányvállalattal szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4313','Hátrasorolt kötelezettségek közös vezetésû vállalkozással szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4314','Hátrasorolt kötelezettségek társult vállalkozással szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('432','Hátrasorolt kötelezetts. egyéb részes. viszonyban lévõ vállalk.szemb.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('433','Hátrasorolt kötelezettségek egyéb gazdálkodóval szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('44','HOSSZÚ LEJÁRATÚ KÖTELEZETTSÉGEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('441','Hosszú lejáratra kapott kölcsönök','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('442','Átváltoztatható kötvények','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('443','Tartozások kötvénykibocsátásból','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4431','Tartozások kötvénykibocsátásból forintban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4432','Tartozások kötvénykibocsátásból devizában','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('444','Beruházási és fejlesztési hitelek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4441','Beruházási és fejlesztési hitelek forintban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4442','Beruházási és fejlesztési hitelek devizában','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('445','Egyéb hosszú lejáratú hitelek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4451','Egyéb hosszú lejáratú hitelek forintban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4452','Egyéb hosszú lejáratú hitelek devizában','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('446','Tartós kötelezettségek kapcsolt vállalkozással szemben','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4461','Tartós kötelezettségek anyavállalattal szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4462','Tartós kötelezettségek leányvállalattal szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4463','Tartós kötelezettségek közös vezetésû vállalkozással szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4464','Tartós kötelezettségek társult vállalkozással szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('447','Tartós kötelezettség egyéb részes. viszonyban lévõ vállalk. szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('448','Pénzügyi lízing miatti kötelezettségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('449','Egyéb hosszú lejáratú kötelezettségek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4491','Kincstári vagyon részét képezõ eszközök kezelésbevét. kapcs. kötel.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4492','Alapítókkal szemben hosszú lejáratú kötelezettségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4499','Hosszú lejáratú egyéb kötelezettségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('45','RÖVID LEJÁRATÚ KÖTELEZETTSÉGEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('451','Rövid lejáratú kölcsönök','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4511','Rövid lejáratú átváltoztatható kötvények','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4512','Egyéb rövid lejáratú kölcsönök','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('452','Rövid lejáratú hitelek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4521','Rövid lejáratú hitelek forintban','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4522','Rövid lejáratú hitelek devizában','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('453','Vevõktõl kapott elõlegek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('454','Szállítók','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4541','Belföldi anyag- és áruszállítók','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4542','Külföldi anyag- és áruszállítók','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4543','Belföldi szolgáltatók','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4544','Külföldi szolgáltatók','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4549','Nem számlázott szállítások, szolgáltatások','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('455','Beruházási szállítók','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4551','Belföldi beruházási szállítók','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4552','Külföldi beruházási szállítók','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4559','Nem számlázott beruházási szállítók','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('456','Faktoringtartozások','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('457','Váltótartozások','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('458','Rövid lejáratú kötelezettségek kapcsolt vállalkozással szemben','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4581','Rövid lejáratú kötelezettségek anyavállalattal szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4582','Rövid lejáratú kötelezettségek leányvállalattal szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4583','Rövid lejáratú kötelezettségek közös vezetésû vállalkozással szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4584','Rövid lejáratú kötelezettségek társult vállalkozással szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('459','Rövid lejáratú kötelez. egyéb részes. visz. lévõ vállalk. szemben','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('46','RÖVID LEJ. KÖTELEZETTSÉGEK, ADÓK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('461','Társasági adó elszámolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('462','Személyi jövedelemadó elszámolása','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4621','Szja munkáltatói','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4622','Egyéb összevon.jöv szja','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4623','Lineáris adózású kif szja','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4624','Bérbe vett ingatlan szja','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('463','Költségvetési befizetési kötelezettségek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('46310','Egészségügyi hozzájárulás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('46311','Külön fel nem sorolt befizetési kötelezettségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4632','Külker. áruforg. és különleges természeti tényezõkkel kapcs. árkül.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4633','Kül. helyzet, természeti, termelési, keresk. szárm. jöv. befiz. köt.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4634','Fogyasztási adó','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4635','Rehabilitációs foglalkoztatási hozzájárulás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4636','Sertésállomány-mentesítési hozzájárulás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4637','Jövedéki adó','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4638','Munkaadói járulék','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4639','Szociális hozzájárulás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('464','Költségvetési befizetési kötelezettségek teljesítése','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('46410','Egészségügyi hozzájárulás teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('46411','Külön fel nem sorolt befizetési kötelezettségek teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4642','Külker. áruforg., különleges term. tényezõkkel kapcs. árkül. telj.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4643','Kül. Helyzet, természeti, termelési, keresk. szárm. jöv. befiz. köt.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4644','Fogyasztási adó teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4645','Rehabilitációs foglalkoztatási hozzájárulás teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4646','Sertésállomány-mentesítési hozzájárulás teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4647','Jövedéki adó teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4648','Munkaadói járulék teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4649','Munkavállalói járulék teljesítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('465','Vám- és pénzügyõrség elszámolási számla','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4651','Vámköltségek és egyéb vámterhek elszámolási számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4652','Importbeszerzés után fizetendõ általánosforgalmiadó-elszámolási számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4653','Vám- és pénzügyõrséggel kapcsolatos egyéb elszámolások','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('466','Elõzetesen felszámított általános forgalmi adó','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4661','Általános levonható ÁFA','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4665','Import szolgáltatás ÁFA','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4669','Különleges ÁFA','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('46691','Közösségi levonható ÁFA','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('46692','Fordított ÁFA','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('46693','Elõleg ÁFA','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('467','Fizetendõ általános forgalmi adó','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4671','Általános fizetendõ ÁFA','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4675','Import szolgáltatás fizetendõ ÁFA','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4679','Különleges ÁFA','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('46791','Közösségi ÁFA','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('46792','Fordított ÁFA','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('46793','Elõleg ÁFA','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('468','Általánosforgalmiadó-elszámolási számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('469','Helyi adók elszámolási számla','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4691','Építményadó-elszámolási számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4692','Telekadó-elszámolási számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4693','Kommunálisadó-elszámolási számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4694','Idegenforgalmiadó-elszámolási számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4695','Helyi iparûzésiadó-elszámolási számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4696','Gépjármûadó-elszámolási számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4697','Külföldi gépjármûadó-elszámolási számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4699','Egyéb helyiadó-elszámolási számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('47','EGYÉB RÖVID LEJ. KÖTELEZETTSÉGEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('471','Jövedelemelszámolási számla','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4711','Keresetelszámolási számla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4712','Társadalombiztosítási ellátás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4713','Egyéb kifizetések elszámolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('472','Fel nem vett járandóságok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('473','Társadalombiztosítási kötelezettség','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4731','Nyugdíjbiztosítási kötelezettség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4732','Egészségbiztosítási kötelezettség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('474','Elkülönített alapokkal kapcsolatos fizetési kötelezettségek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4742','Szakképzési hozzájárulás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4743','Elszámolásra kapott pénzeszközök','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4744','Környezetvédelmi termékdíj-fizetési kötelezettség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4749','Egyéb befizetések az elkülönített alapokba','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('475','Vagyonkezelõ szervezetekkel szembeni kötelezettségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('476','Rövid lejáratú egyéb kötelezettségek munkavállalókkal, tagokkal szemb.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('477','Határidõs, opciós és swapügyletekkel kapcsolatos kötelezettségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('478','Részesedésekkel, értékpapírokkal kapcsolatos kötelezettségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('479','Különféle rövid lejáratú egyéb kötelezettségek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4791','Átvállalt kötelezettségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4792','Alapítókkal szembeni rövid lejáratú kötelezettségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4793','Beszerzési árba beletartozó elõírt egyéb kötelezettségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4799','Rövid lejáratú különféle egyéb kötelezettségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('48','PASSZÍV IDÕBELI ELHATÁROLÁSOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('481','Bevételek passzív idõbeli elhatárolása','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4811','Befolyt, elszámolt bevételek elhatárolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4812','Költségek ellentételezésére kapott támogatások elhatárolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4813','Devizaeszk., devizaköt. mérleg-ford.nap értékel. árfolyamnyer. elhat.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('482','Költségek, ráfordítások passzív idõbeli elhatárolása','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4821','Mérlegfordulónap elõtti idõszakot terhelõ költségek, ráford. elhat.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4822','Értékpapír besz. kapcs. különbözetbõl idõarányos árfolyamnyer. elhat.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4823','Fizetendõ kamatok elhatárolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('483','Halasztott bevételek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4831','Elengedett kötelezettségek miatti elhatárolás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4832','Fejlesztési célra kapott támogatások elhatárolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4833','Térítés nélkül átvett (ajándékba kapott, fellelt) eszk. érték elhat.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('4834','Negatív üzleti vagy cégérték elhatárolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('49','ÉVI MÉRLEGSZÁMLÁK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('491','Nyitómérlegszámla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('492','Zárómérlegszámla','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('493','Adózott eredményelszámolása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5','KÖLTSÉGNEMEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('51','ANYAGKÖLTSÉG','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('511','Vásárolt anyagok költségei','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5111','Üzemanyag költség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5112','Villamosenergia és vízfelhasználás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5113','Nyomtatvány irodaszer','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5114','Alapanyag, fõanyag','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5115','Fogyóanyag, tisztitószer','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5118','Fûtõanyagok költsége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('512','Egy éven belül elhasználódó anyagi eszközök költségei','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5121','Szerszámfelhasználás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5122','Munkaruha, védõruha','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5123','Kisértékü tárgyieszköz','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('513','Egyéb anyagköltség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('519','Anyagköltség-megtérülés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('52','IGÉNYBE VETT SZOLGÁLTATÁSOK KÖLTSÉGEI','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('521','Szállítás-rakodás, raktározás költségei','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5211','Belföldi utazás kiküldetés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5212','Külföldi utazás kiküldetés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5213','Fuvarozási, szállítási költség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5214','Szemétszállítás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5215','Taxiköltség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('522','Bérleti díjak','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5221','Ingatlan bérleti díjak','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5222','Eszközök bérleti díja','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5223','Gépkocsi bérleti díjak','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('523','Tagsági díjak','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5231','Kamarai tagsági díj','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5232','Jogi személynek fizetett tagsági díj','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('524','Posta, telefon, fax, internet','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5241','Posta, fax kts.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5242','Vezetékes telefon','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5243','Mobiltelefon költségei','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5244','Internet szolg.díjai','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('525','Szakkönyv, folyóirat, on-line tartalom','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('526','Javítás, karbantartás,  szoftverfrissítés','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5261','Javítás, karbantartás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5262','Szoftverfrissítés költségei','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('527','Könyvviteli, szakértõi, jogi költségek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5271','Könyvelési díj','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5272','Ügyvéd, közjegyzõ, egyéb jogi díjak','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5273','Szakértõi, pályázati díjak','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('528','Bérmunka költségei','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('529','Egyéb igénybe vett szolgáltatások költségei','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5291','Fénymásolás költségei','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5292','Saját term.klt.bérmunkadíja','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5293','Vagyonvédelem, õrzõ-védõ szolgáltatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5294','Hirdetés, kiállítás, bemutató, vásár','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5295','Takaritási díj, távfûtés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5296','Fénykép elõhívás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5297','Mosoda, vegytisztítás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5298','Oktatás, továbbképzés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5299','Egyéb igénybe vett szolgáltatások','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('53','EGYÉB SZOLGÁLTATÁSOK KÖLTSÉGEI','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('531','Hatósági igazgatási, szolgáltatási díjak, illetékek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5311','Hatósági dijak','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5312','Cégautók vizsgadíja','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5313','Illetékek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('532','Pénzügyi, befektetési szolgáltatási díjak','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5321','Bankköltség *kivéve bankkamat*','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5322','Bankgarancia költsége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('533','Biztosítási díj','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('534','Költségként elszámolandó adók, járulékok, termékdíj','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('539','Különféle egyéb költségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('54','BÉRKÖLTSÉG','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('541','Bérköltség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('55','SZEMÉLYI JELLEGÛ EGYÉB KIFIZETÉSEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('551','Munkavállalóknak, tagoknak fizetett személyi jellegû kifizetések','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5511','Üzemorvosi szolgálat','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5512','Kiküldetés napidíja','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5513','Reprezentációs költség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5514','Munkába járásl költségtérítése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5515','Étkezési hozzájárulás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5516','Munkaváll. kapcs biztosítási díjak','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('552','Jóléti és kulturális költségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('554','Munkáltatói táppénzhozzájárulás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('559','Egyéb személyi jellegû kifizetések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('56','BÉRJÁRULÉKOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('561','Nyugdíj-biztosítási és egészségbiztosítási járulék','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5611','Nyugdijbiztositási járulék','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('5612','Egészségbiztositási járulék','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('562','Egészségügyi hozzájárulás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('563','Szociális hozzájárulás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('564','Szakképzési hozzájárulás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('569','Egyéb bérjárulék','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('57','ÉRTÉKCSÖKKENÉSI LEÍRÁS','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('571','Terv szerinti értékcsökkenési leírás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('572','Használatbavételkor egy összegben elszámolt értékcsökkenési leírás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('58','AKTIVÁLT SAJÁT TELJESÍTMÉNYEK ÉRTÉKE','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('581','Saját termelésû készletek állományváltozása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('582','Saját elõállítású eszközök aktivált értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('59','KÖLTSÉGNEM-ÁTVEZETÉSI SZÁMLA','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8','ÉRTÉKESÍTÉS ELSZÁMOLT ÖNKÖLTSÉGE ÉS RÁFORDÍTÁSOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('81','ANYAGJELLEGÛ RÁFORDÍTÁSOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('811','Anyagköltség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('812','Igénybe vett szolgáltatások értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('813','Egyéb szolgáltatások értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('814','Eladott áruk beszerzési értéke','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8141','Elábé belföldi','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8142','Elábé külföldi','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8143','Adómentes dohányáru elábé','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('815','Eladott (közvetített) szolgáltatások értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('82','SZEMÉLYI JELLEGÛ RÁFORDÍTÁSOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('821','Bérköltség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('822','Személyi jellegû egyéb kifizetések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('823','Bérjárulékok','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('83','ÉRTÉKCSÖKKENÉSI LEÍRÁS','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('85','ÉRTÉKESÍTÉS KÖZVETETT KÖLTSÉGEI','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('851','Értékesítési, forgalmazási költségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('852','Igazgatási költségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('853','Egyéb általános költségek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('86','EGYÉB RÁFORDÍTÁSOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('861','Értékesített immateriális javak, tárgyi eszközök könyv szerinti értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('862','Értékesített, átruházott (engedményezett) követelések könyv sz. értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('863','Mérlegfordulónap elõtt beköv. események üzleti évhez kapcs. ráford.','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8631','Káreseménnyel kapcsolatos fizetések, fizetendõ összegek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8632','Bírságok, kötbérek, fekbérek, késedelmi kamatok, kártérítések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8633','Külföldön, külföldi telephelyen fizetett, fizetendõ nyereségadó','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8634','Költségek (ráfordítások) ellentételezésére adott támogatás, juttatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8635','Termékpálya-szabályozáshoz kapcsolódó fizetések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('864','Utólag adott – közvetve kapcsolódó – pénzügyileg rendezett engedmény','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('865','Céltartalék képzése','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8651','Céltartalékképzés a várható kötelezettségekre','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8652','Céltartalékképzés a jövõbeni költségekre','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8653','Céltartalékképzés egyéb címen','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('866','Értékvesztés, terven felüli értékcsökkenés','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8661','Készletek elszámolt értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8662','Követelések elszámolt értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8663','Immateriális javak elszámolt terven felüli értékcsökkenése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8664','Tárgyi eszközök elszámolt terven felüli értékcsökkenése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('867','Adók, illetékek, hozzájárulások','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8671','Költségvetéssel elszámolt adók, illetékek, hozzájárulások','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8672','Önkormányzatokkal elszámolt adók, illetékek, hozzájárulások','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8673','Elkülönített alapokkal elszámolt adók, illetékek, hozzájárulások','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8674','Ráfordításként elszámolt fogyasztási adó, jövedéki adó','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('869','Különféle egyéb ráfordítások','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8691','Behajthatatlan követelés leírt összege','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8692','Hiányzó, kivez. immat. javak, tárgyi eszk. könyv szerinti értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8693','Hiányzó, kivez. immat. javak, tárgyi eszk. könyv szerinti értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8694','Kereskedelmi áruk veszteségjellegû leltárértékelési különbözete','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('87','PÉNZÜGYI MÛVELETEK RÁFORDÍTÁSAI','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('871','Befektetett pénzügyi eszközök árfolyamvesztesége','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8711','Kapcsolt vállalk. eladott (beváltott) értékpapírok árfolyamvesztesége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8712','Egyéb eladott (beváltott) értékpapírok árfolyamvesztesége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8713','Kapcsolt vállalkozásnak értékesített részesedés árfolyamvesztesége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8714','Egyéb értékesített részesedés árfolyamvesztesége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('872','Fizetendõ kamatok és kamatjellegû ráfordítások','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8721','Kölcsönök, hitelek kapcsolt vállalkozásnak fizetendõ kamata','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8722','Kölcsönök, hitelek egyéb fizetendõ kamata','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8723','Értékpapírok után kapcsolt vállalkozásnak fizetendõ kamat','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8724','Értékpapírok után egyéb fizetendõ kamat','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8725','Hátrasorolt kötelezettségek után kapcsolt vállalk. fizetendõ kamat','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8726','Hátrasorolt kötelezettségek után egyéb fizetendõ kamat','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8727','Befektetési jegyek eladásakor, beváltásakor realizált veszteség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('873','Fizetendõ kamatok és kamatjellegû ráfordítások','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8731','Kapcsolt vállalkozásnál valódi penziós ügyletek kamatráfordítása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8732','Egyéb valódi penziós ügyletek kamatráfordítása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8733','Kapcsolt vállalkozásnál kamatfedezeti ügyletek vesztesége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8734','Egyéb kamatfedezeti ügyletek vesztesége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('874','Részesedések, értékpapírok, bankbetétek értékvesztése','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8741','Tulajdoni részesedést jelentõ befektetések értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8742','Hitelviszonyt megtestesítõ értékpapírok értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8743','Tartós bankbetétek értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8746','Tulajdoni részesedést jelentõ befektetések visszaírt értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8747','Hitelviszonyt megtestesítõ értékpapírok visszaírt értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8748','Tartós bankbetétek visszaírt értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('875','Forgóeszközök között kimutatott','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8751','Tulajdoni részesedést jelentõ befektetés értékesítés árfolyamveszt.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8752','Hitelviszonyt megtest. értékp. értékesítés, bevált. árfolyamveszt.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8753','Diszkontértékpapír értékesítésének, beváltásának árfolyamvesztesége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8754','Hitelviszonyt megtest. értékp. törlesztésekor real. árfolyamveszt.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('876','Átváltáskori, értékeléskori árfolyamveszteség','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8761','Deviza- és valutkészletek forintra átváltásának árfolyamvesztesége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8762','Külf. pénzértékre szóló eszk., kötel. pénzügy. rend. árf. veszt.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8763','Külf. pénzértékre szóló eszk., kötel. mérleg-fordulónapi árf. veszt.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('877','Egyéb árfolyamveszteségek, opciós díjak','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8771','Névérték f. vás. értékp. bek. érték és névérték különb. elhat. veszt.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8772','Nem fedezeti célú elszámolási ügyletek elszámolt vesztesége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8773','Nem kamatfedezeti célú, egyéb fedezeti ügyletek elszámolt vesztesége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8774','Vásárolt eladási opcióért fizetett opciós díj','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8775','Le nem hívott vételi opcióért fizetett opciós díj','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8776','Bekerül. értékben figyelembe nem vett lehívott vételi opció opciós díj','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('878','Vásárolt követelésekkel kapcsolatos ráfordítások','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8781','Behajthatatlan vásárolt követelés leírt összege','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8782','Vásárolt követelés be nem folyt összege','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8783','Vásárolt követelés értékesítésének vesztesége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('879','Egyéb pénzügyi ráfordítások','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8791','Pénzügyi rendezéshez kapcsolódó adott árengedmény','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8792','Közös üzemeltetés megtérítendõ közös költsége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8793','Közös üzemeltetés átadott nyeresége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8794','Egyesülés mûködési költségeinek megtérített összege','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('88','RENDKÍVÜLI RÁFORDÍTÁSOK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('881','Társaságba bevitt eszközök nyilvántartás szerinti értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('882','Jogelõd gazdasági társaságban lévõ megszûnt részesedés nyilv. értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('883','Megszûnt részes. ellenében kapott eszk., átvett köt. értékkülönb.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('884','Tõkekiv. történõ tõkeleszállítás bevont részes. nyilv. szerinti értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('885','Átalakul. az átalakult társaságban lévõ megszûnt részes. nyilv. érték','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('886','Beolvad. a jogelõd gazd. társ. lévõ megszûnt részes. nyilv. érték','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('887','Visszavásárolt saját részvény, saját üzletrész bevon. a nyilv. érték','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('888','Tartozásátvállalás szerzõdés szerinti összege','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('889','Egyéb vagyoncsökkenéssel járó rendkívüli ráfordítások','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8891','Térítés nélkül átadott eszközök nyilvántartás szerinti értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8892','Térítés nélkül nyújtott szolgáltatások bekerülési értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8893','Elengedett követelés könyv szerinti értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8894','Véglegesen fejlesztési célra adott támogatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8895','Véglegesen nem fejlesztési célra átadott pénzeszközök','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('8899','Egyéb kerekítések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('89','NYERESÉGET TERHELÕ ADÓK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('891','Társasági adó','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9','ÉRTÉKESÍTÉS ÁRBEVÉTELE ÉS BEVÉTELEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('91','BELFÖLDI TERMÉKÉRTÉKESÍTÉS ÁRBEVÉTELE','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('911','Értékesítés bevételei 1.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('912','Értékesítés bevételei 2.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('92','BELFÖLDI SZOLGÁLTATÁSNYÚJTÁS ÁRBEVÉTELE','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('921','Értékesítés bevételei 1.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('922','Értékesítés bevételei 2.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('929','Értékesítés bevételei 3.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('93','EXPORTÉRTÉKESÍTÉS ÁRBEVÉTELE','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('931','Értékesítés bevételei 1.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('932','Értékesítés bevételei 2.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('933','Értékesítés bevételei 3.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('949','Export árbevételt csökkentõ külföldi szállítási-rakodási költség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('96','EGYÉB BEVÉTELEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('961','Értékesített immateriális javak, tárgyi eszközök bevétele','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('962','Értékesített, átruházott (engedményezett) követelések elismert értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('963','A mérlegkészítés idõpontjáig pénzügyileg rendezett egyéb bevételek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9631','Káreseményekkel kapcsolatosan kapott bevételek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9632','Kapott bírságok, kötbérek, fekbérek, késedelmi kamatok, kártérítések','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9633','Behajthatatlannak minõsített és leírt követelésekre kapott összegek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9634','Költségek, ráfordítások ellentételezésére kapott támogatás, juttatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9635','Termékpálya-szabályozáshoz kapcsolódóan kapott összegek','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('964','Utólag kapott – közvetve kapcsolódó – pénzügyileg rendezett engedmény','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('965','Céltartalék felhasználása (csökkenése, megszûnése)','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9651','Várható kötelezettségekre képzett céltartalék felhasználása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9652','Jövõbeni költségekre képzett céltartalék felhasználása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9653','Egyéb címen képzett céltartalék felhasználása','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('966','Visszaírt értékvesztés, terven felüli értékcsökkenés','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9661','Készletek visszaírt értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9662','Követelések visszaírt értékvesztése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9663','Immateriális javak visszaírt terven felüli értékcsökkenése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9664','Tárgyi eszközök visszaírt terven felüli értékcsökkenése','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('967','Visszafizetési kötelezettség nélkül kapott támogatás, juttatás','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9671','Költségvetésbõl kapott támogatás, juttatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9672','Önkormányzattól kapott támogatás, juttatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9673','Elkülönített alapoktól kapott támogatás, juttatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('968','Biztosító által visszaigazolt kártérítés összege','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('969','Különféle egyéb bevételek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9694','Kereskedelmi áruk nyereségjellegû leltárértékelési különbözete','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9695','Negatív üzleti vagy cégértékbõl az üzleti évben leírt összeg','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('97','PÉNZÜGYI MÛVELETEK BEVÉTELEI','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('971','Kapott (járó) osztalék és részesedés','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9711','Kapcsolt vállalkozástól kapott (járó) osztalék és részesedés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9712','Egyéb kapott (járó) osztalék és részesedés','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('972','Részesedések értékesítésének árfolyamnyeresége','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9721','Kapcsolt vállalkozásnak értékesített részesedés árfolyamnyeresége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9722','Egyéb értékesített részesedés árfolyamnyeresége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('973','Befektetett pénzügyi eszközök kamatai, árfolyamnyeresége','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9731','Tartósan adott kölcsön (bankbetét) kapott (járó) kamata','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9732','Kamatozó értékpapír kapott (járó) kamata','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9733','Kamatozó értékpapír értékesítésekor az eladási árban lévõ kamat','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9734','Kamatozó értékpapír vételárában lévõ kamat (csökkentõ tétel)','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9735','Befekt. jegyek kapott hozama, eladásakor, bevált. realizált nyereség','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9736','Lízingdíjban lévõ kapott (járó) kamat','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9737','Diszkontértékpapírnál idõarányosan elszámolt összeg','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9738','Eladott (beváltott) értékpapír árfolyamnyeresége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('974','Egyéb kapott (járó) kamatok és kamatjellegû bevételek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9741','Forgóeszk. között kimutatott kölcsön, váltókövetel., pénzeszköz kamata','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9742','Forgóeszközök között kimutatott kamatozó értékpapír kamata','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9743','Kamatozó értékpapír vételárában lévõ kamat (csökkentõ tétel)','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9744','Forgóeszk. között kimutatott diszkontértékp. idõarányos elszám. össz.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9745','Forgóeszk. között kimut. értékp. értékesít. az eladási árban kamat','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9746','Valódi penziós ügyletek kamatbevétele','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9747','Kamatfedzeti ügyletek nyeresége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('975','Pénzügyi mûveletek egyéb bevételei','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9751','Tulajdoni részesedést jelentõ befektetés értékesítésének árfolyamnyer.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9752','Hitelviszonyt megtestesítõ értékpapír értékesít., bevált. árfolyamny.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9753','Diszkontértékpapír értékesítésének, beváltásának árfolyamnyeresége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9754','Hitelviszonyt megtestesítõ értékpapír törleszt. realizált árfolyamny.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('976','Átváltási, értékeléskori árfolyamnyereség','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9761','Deviza- és valutakészletek forintra átváltásának árfolyamnyeresége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9762','Külföldi pénzértékre szóló eszközök és kötelez. pü. rend. árfolyamny.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9763','Külf. pénzért. szóló eszk., köt. mérleg-fordulónapi összev. árf.nyer.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('977','Egyéb árfolyamnyereségek, opciós díjbevételek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9771','Névért. alatt vás. értékp. bek. érték és névérték között elhat. nyer.','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9772','Nem fedezeti célú elszámolási ügyletek elszámolt nyeresége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9773','Nem kamatfedezeti célú, egyéb fedezeti ügyletek elszámolt nyeresége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9774','Kiírt opcióért kapott opciós díj','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('978','Vásárolt követelésekkel kapcsolatos bevételek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9781','Könyv szerinti értéket meghaladó összegben befolyt bevétel','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9782','Vásárolt követelés értékesítésének nyeresége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('979','Egyéb pénzügyi bevételek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9791','Pénzügyi rendezéshez kapcsolódó kapott árengedmény','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9792','Közös üzemeltetés költségeinek átterhelt összege','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9793','Közös üzemeltetés átvett nyeresége','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9794','Egyesülés mûködési költségeinek átterhelt összege','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('98','RENDKÍVÜLI BEVÉTELEK','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('981','Társaságba bevitt eszközök létesítõ okiratban meghatározott értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('983','Megszûnt részes. ellenében kapott eszk., átvett köt. értékkülönbözete','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('984','Tõkekiv. tõkeleszáll. bev. részes. névérték fejében átvett eszk. érték','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('985','Átalakuláskor a megszûnt részes. jutó-végl.vm.sz.- saját tõke összege','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('986','Beolvadáskor a megszûnt részes. jutó –végl.vm.sz.– saját tõke összege','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('987','Visszavásárolt saját részvény, saját üzletrész bevonásakor a névérték','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('988','Tartozásátvállalás során –ellentételezés nélkül– átváll. köt. összege','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('989','Egyéb vagyonnövekedéssel járó rendkívüli bevételek','');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9891','Térítés nélkül átvett eszközök forgalmi, piaci értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9892','Ajándékként, hagyatékként kapott, fellelt eszközök piaci értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9893','Hitelezõ által elengedett kötelezettség értéke','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9894','Véglegesen fejlesztési célra kapott támogatás','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9895','Véglegesen átvett (kapott) nem fejlesztési célú pénzeszközök','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9896','Elévült kötelezettség összege','\0');
INSERT INTO `szamlatukor` (`fokszam`, `megnevezes`, `osszesito`) VALUES ('9899','Egyéb kerekítések','\0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
