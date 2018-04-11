-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stroc
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `ambiente`
--

DROP TABLE IF EXISTS `ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ambiente` (
  `idAmbiente` int(11) NOT NULL AUTO_INCREMENT,
  `Dimension` varchar(255) DEFAULT NULL,
  `idPiso` int(11) NOT NULL,
  PRIMARY KEY (`idAmbiente`),
  KEY `fk_Ambiente_Piso1_idx` (`idPiso`),
  CONSTRAINT `fk_Ambiente_Piso1` FOREIGN KEY (`idPiso`) REFERENCES `piso` (`idPiso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambiente`
--

LOCK TABLES `ambiente` WRITE;
/*!40000 ALTER TABLE `ambiente` DISABLE KEYS */;
/*!40000 ALTER TABLE `ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `idDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `Ubicacion_CAD` varchar(255) NOT NULL,
  `Ubicacion_REVIT` varchar(255) NOT NULL,
  `Ubicacion_2D` varchar(255) NOT NULL,
  `Ubicacion_3D` varchar(255) NOT NULL,
  `idAmbiente` int(11) NOT NULL,
  PRIMARY KEY (`idDocumento`),
  KEY `fk_Documento_Ambiente1_idx` (`idAmbiente`),
  CONSTRAINT `fk_Documento_Ambiente1` FOREIGN KEY (`idAmbiente`) REFERENCES `ambiente` (`idAmbiente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento_completo`
--

DROP TABLE IF EXISTS `documento_completo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento_completo` (
  `idDoc_Complet` int(11) NOT NULL AUTO_INCREMENT,
  `idPiso` int(11) DEFAULT NULL,
  `idUbicacion_CAD` int(11) DEFAULT NULL,
  `idUbicacion_REVIT` int(11) DEFAULT NULL,
  `idUbicacion_2D` int(11) DEFAULT NULL,
  `idUbicacion_3D` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDoc_Complet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento_completo`
--

LOCK TABLES `documento_completo` WRITE;
/*!40000 ALTER TABLE `documento_completo` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento_completo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piso`
--

DROP TABLE IF EXISTS `piso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piso` (
  `idPiso` int(11) NOT NULL AUTO_INCREMENT,
  `Numero_Piso` varchar(10) NOT NULL,
  `idProyecto` int(11) NOT NULL,
  `idDoc_Complet` int(11) NOT NULL,
  PRIMARY KEY (`idPiso`),
  KEY `fk_Piso_Proyecto_idx` (`idProyecto`),
  KEY `fk_Piso_Documento_Completo1_idx` (`idDoc_Complet`),
  CONSTRAINT `fk_Piso_Documento_Completo1` FOREIGN KEY (`idDoc_Complet`) REFERENCES `documento_completo` (`idDoc_Complet`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Piso_Proyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piso`
--

LOCK TABLES `piso` WRITE;
/*!40000 ALTER TABLE `piso` DISABLE KEYS */;
/*!40000 ALTER TABLE `piso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `idProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Codigo` varchar(15) NOT NULL,
  PRIMARY KEY (`idProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-10 22:42:31
