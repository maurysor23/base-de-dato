CREATE DATABASE  IF NOT EXISTS `concesionaria-de-autos-ms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `concesionaria-de-autos-ms`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: concesionaria-de-autos-ms
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_Clientes` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Direccion` varchar(30) NOT NULL,
  `Localidad` varchar(30) NOT NULL,
  `Telefono` int DEFAULT NULL,
  `Correo_Eletronico` varchar(50) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Clientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `ID_Empleados` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Direccion` varchar(30) NOT NULL,
  `Localidad` varchar(30) NOT NULL,
  `Telefono` int NOT NULL,
  `Correo_Electronico` varchar(30) NOT NULL,
  `Fecha_Contratacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Empleados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llamadas`
--

DROP TABLE IF EXISTS `llamadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `llamadas` (
  `ID_Llamadas` int NOT NULL AUTO_INCREMENT,
  `ID_Clientes` int NOT NULL,
  `Fecha_llamada` datetime NOT NULL,
  `Razon_Llamada` varchar(50) NOT NULL,
  `Calificacion_Llamada` int NOT NULL,
  PRIMARY KEY (`ID_Llamadas`),
  KEY `ID_Clientes` (`ID_Clientes`),
  CONSTRAINT `llamadas_ibfk_1` FOREIGN KEY (`ID_Clientes`) REFERENCES `clientes` (`ID_Clientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llamadas`
--

LOCK TABLES `llamadas` WRITE;
/*!40000 ALTER TABLE `llamadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `llamadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `ID_Poveedor` int NOT NULL AUTO_INCREMENT,
  `ID_Vehiculo` int NOT NULL,
  `Nombre_Empresa` varchar(50) NOT NULL,
  `Direccion` varchar(30) NOT NULL,
  `Localidad` varchar(30) NOT NULL,
  `Correo_Electronico` varchar(30) NOT NULL,
  `Telefono` int DEFAULT NULL,
  PRIMARY KEY (`ID_Poveedor`),
  KEY `ID_Vehiculo` (`ID_Vehiculo`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `vehiculos` (`ID_Vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguros`
--

DROP TABLE IF EXISTS `seguros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguros` (
  `ID_Seguro` int NOT NULL AUTO_INCREMENT,
  `ID_Vehiculo` int NOT NULL,
  `Compania_Seguro` varchar(30) NOT NULL,
  `Cobertura` varchar(30) NOT NULL,
  `Fecha_Inicio` datetime NOT NULL,
  `Fecha_Vencimiento` datetime NOT NULL,
  PRIMARY KEY (`ID_Seguro`),
  KEY `ID_Vehiculo` (`ID_Vehiculo`),
  CONSTRAINT `seguros_ibfk_1` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `vehiculos` (`ID_Vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguros`
--

LOCK TABLES `seguros` WRITE;
/*!40000 ALTER TABLE `seguros` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion_web`
--

DROP TABLE IF EXISTS `sesion_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesion_web` (
  `ID_Sesion_Web` int NOT NULL AUTO_INCREMENT,
  `ID_Clientes` int NOT NULL,
  `Fecha_Inicio` datetime NOT NULL,
  `Tipo_Dispositivo` enum('movil','desktop') NOT NULL,
  `Fuente_Trafico` varchar(30) NOT NULL,
  `Correo_Electronico` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Sesion_Web`),
  KEY `ID_Clientes` (`ID_Clientes`),
  CONSTRAINT `sesion_web_ibfk_1` FOREIGN KEY (`ID_Clientes`) REFERENCES `clientes` (`ID_Clientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion_web`
--

LOCK TABLES `sesion_web` WRITE;
/*!40000 ALTER TABLE `sesion_web` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesion_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion_concesionaria`
--

DROP TABLE IF EXISTS `ubicacion_concesionaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion_concesionaria` (
  `ID_Ubicacion` int NOT NULL AUTO_INCREMENT,
  `ID_Ventas` int NOT NULL,
  `Direccion` varchar(30) NOT NULL,
  `Localidad` varchar(30) NOT NULL,
  `Codigo_postal` int NOT NULL,
  `Telefono` int NOT NULL,
  `Correo_Electronico` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Ubicacion`),
  KEY `ID_Ventas` (`ID_Ventas`),
  CONSTRAINT `ubicacion_concesionaria_ibfk_1` FOREIGN KEY (`ID_Ventas`) REFERENCES `ventas` (`ID_Ventas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion_concesionaria`
--

LOCK TABLES `ubicacion_concesionaria` WRITE;
/*!40000 ALTER TABLE `ubicacion_concesionaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicacion_concesionaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `ID_Vehiculo` int NOT NULL AUTO_INCREMENT,
  `Marca` varchar(50) NOT NULL,
  `Modelo` varchar(50) NOT NULL,
  `Año_fabricacion` datetime DEFAULT NULL,
  `Color` varchar(20) NOT NULL,
  `Precio_Venta` decimal(9,2) NOT NULL,
  `Estado` enum('nuevo','usado') NOT NULL,
  `Stock` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `ID_Ventas` int NOT NULL AUTO_INCREMENT,
  `ID_Clientes` int NOT NULL,
  `ID_Vehiculo` int NOT NULL,
  `ID_Empleados` int NOT NULL,
  `Fecha_venta` datetime DEFAULT NULL,
  `Precio_venta` decimal(9,2) DEFAULT NULL,
  `Forma_Pago` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Ventas`),
  KEY `ID_Clientes` (`ID_Clientes`),
  KEY `ID_Vehiculo` (`ID_Vehiculo`),
  KEY `ID_Empleados` (`ID_Empleados`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`ID_Clientes`) REFERENCES `clientes` (`ID_Clientes`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `vehiculos` (`ID_Vehiculo`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`ID_Empleados`) REFERENCES `empleados` (`ID_Empleados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-18 20:06:52
