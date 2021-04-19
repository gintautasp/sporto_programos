-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2021 at 01:07 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sporto_programos`
--

-- --------------------------------------------------------

--
-- Table structure for table `klientai_treniruociu_planai`
--

CREATE TABLE `klientai_treniruociu_planai` (
  `id` int(255) NOT NULL,
  `id_kliento` int(255) NOT NULL,
  `id_treniruotes_plano` int(255) NOT NULL,
  `data` date NOT NULL,
  `rezultatai` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pratimai_treniruociu_planai`
--

CREATE TABLE `pratimai_treniruociu_planai` (
  `id` int(255) NOT NULL,
  `id_pratimai` int(255) NOT NULL,
  `id_planai` int(255) NOT NULL,
  `skaicius_pakartojimu` int(255) NOT NULL,
  `skaicius_atlikimu` int(255) NOT NULL,
  `poilsio_laikas_tarp_atlikimu` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `treniruociu_planai`
--

CREATE TABLE `treniruociu_planai` (
  `id` int(255) NOT NULL,
  `pav` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `klientai_treniruociu_planai`
--
ALTER TABLE `klientai_treniruociu_planai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klientai_planai` (`id_treniruotes_plano`);

--
-- Indexes for table `pratimai_treniruociu_planai`
--
ALTER TABLE `pratimai_treniruociu_planai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pratimai_planai` (`id_planai`);

--
-- Indexes for table `treniruociu_planai`
--
ALTER TABLE `treniruociu_planai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klientai_treniruociu_planai`
--
ALTER TABLE `klientai_treniruociu_planai`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pratimai_treniruociu_planai`
--
ALTER TABLE `pratimai_treniruociu_planai`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treniruociu_planai`
--
ALTER TABLE `treniruociu_planai`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `klientai_treniruociu_planai`
--
ALTER TABLE `klientai_treniruociu_planai`
  ADD CONSTRAINT `klientai_planai` FOREIGN KEY (`id_treniruotes_plano`) REFERENCES `treniruociu_planai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pratimai_treniruociu_planai`
--
ALTER TABLE `pratimai_treniruociu_planai`
  ADD CONSTRAINT `pratimai_planai` FOREIGN KEY (`id_planai`) REFERENCES `treniruociu_planai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
