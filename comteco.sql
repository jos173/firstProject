-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 29, 2024 at 04:10 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comteco`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `ci_persona_natural` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Nombre` varchar(10) DEFAULT NULL,
  `Direccion` varchar(10) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Croquis` int NOT NULL,
  `NIT_persona_juridica` varchar(25) DEFAULT NULL,
  `Nombre_de_EMP.` varchar(10) DEFAULT NULL,
  `Repr._legal` varchar(10) DEFAULT NULL,
  `Celular` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disponen`
--

CREATE TABLE `disponen` (
  `id` int NOT NULL,
  `trabajador_ci` int NOT NULL,
  `movilidad_placa` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipos`
--

CREATE TABLE `equipos` (
  `Id` int NOT NULL,
  `nombre` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Marca` varchar(20) DEFAULT NULL,
  `Valor_en_Bs` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materiales`
--

CREATE TABLE `materiales` (
  `Código` int NOT NULL,
  `Cantidad` varchar(20) DEFAULT NULL,
  `Nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movilidades`
--

CREATE TABLE `movilidades` (
  `Nro_placa` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `datos_vehiculo` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reciben`
--

CREATE TABLE `reciben` (
  `trabajador_ci` int NOT NULL,
  `equipos_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requiere`
--

CREATE TABLE `requiere` (
  `servicio_id` int NOT NULL,
  `material_codigo` int NOT NULL,
  `cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servicios`
--

CREATE TABLE `servicios` (
  `Id` int NOT NULL,
  `Internet_fibra_optica` varchar(20) DEFAULT NULL,
  `Tv_satelital` varchar(10) DEFAULT NULL,
  `internet_satelital` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tienen`
--

CREATE TABLE `tienen` (
  `servicio_id` int NOT NULL,
  `cliente_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trabajadores`
--

CREATE TABLE `trabajadores` (
  `CI` int NOT NULL,
  `Profesión` varchar(20) DEFAULT NULL,
  `Años_de_experiencia` int NOT NULL,
  `Celular` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trabajan`
--

CREATE TABLE `trabajan` (
  `servicio_id` int NOT NULL,
  `trabajador_ci` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ci-nit-unicos` (`ci_persona_natural`,`NIT_persona_juridica`);

--
-- Indexes for table `disponen`
--
ALTER TABLE `disponen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trabajador_ci` (`trabajador_ci`,`movilidad_placa`),
  ADD KEY `disponen_movilidad` (`movilidad_placa`);

--
-- Indexes for table `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`Código`);

--
-- Indexes for table `movilidades`
--
ALTER TABLE `movilidades`
  ADD PRIMARY KEY (`Nro_placa`);

--
-- Indexes for table `reciben`
--
ALTER TABLE `reciben`
  ADD KEY `reciben_equipo` (`equipos_id`),
  ADD KEY `reciben_trabajador` (`trabajador_ci`);

--
-- Indexes for table `requiere`
--
ALTER TABLE `requiere`
  ADD PRIMARY KEY (`servicio_id`,`material_codigo`),
  ADD KEY `requiere_material` (`material_codigo`);

--
-- Indexes for table `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tienen`
--
ALTER TABLE `tienen`
  ADD PRIMARY KEY (`servicio_id`,`cliente_id`),
  ADD KEY `tiene_cliente` (`cliente_id`);

--
-- Indexes for table `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`CI`);

--
-- Indexes for table `trabajan`
--
ALTER TABLE `trabajan`
  ADD PRIMARY KEY (`servicio_id`,`trabajador_ci`),
  ADD KEY `trabajan_trabajador` (`trabajador_ci`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disponen`
--
ALTER TABLE `disponen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `equipos`
--
ALTER TABLE `equipos`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materiales`
--
ALTER TABLE `materiales`
  MODIFY `Código` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servicios`
--
ALTER TABLE `servicios`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disponen`
--
ALTER TABLE `disponen`
  ADD CONSTRAINT `disponen_movilidad` FOREIGN KEY (`movilidad_placa`) REFERENCES `movilidades` (`Nro_placa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `disponen_trabajador` FOREIGN KEY (`trabajador_ci`) REFERENCES `trabajadores` (`CI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reciben`
--
ALTER TABLE `reciben`
  ADD CONSTRAINT `reciben_equipo` FOREIGN KEY (`equipos_id`) REFERENCES `equipos` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reciben_trabajador` FOREIGN KEY (`trabajador_ci`) REFERENCES `trabajadores` (`CI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `requiere`
--
ALTER TABLE `requiere`
  ADD CONSTRAINT `requiere_material` FOREIGN KEY (`material_codigo`) REFERENCES `materiales` (`Código`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requiere_servicio` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tienen`
--
ALTER TABLE `tienen`
  ADD CONSTRAINT `tiene_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tiene_servicio` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trabajan`
--
ALTER TABLE `trabajan`
  ADD CONSTRAINT `trabajan_servicios` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trabajan_trabajador` FOREIGN KEY (`trabajador_ci`) REFERENCES `trabajadores` (`CI`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
