-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2021 at 09:53 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sporto-programos`
--

-- --------------------------------------------------------

--
-- Table structure for table `klientai`
--

CREATE TABLE `klientai` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) NOT NULL,
  `amzius` int(11) NOT NULL,
  `ugis` int(11) NOT NULL,
  `lytis` enum('Vyras','Moteris') NOT NULL,
  `svoris` int(11) NOT NULL,
  `pasiruosimo_lygis` text NOT NULL,
  `traumosLigos` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `klientai`
--

INSERT INTO `klientai` (`id`, `pav`, `amzius`, `ugis`, `lytis`, `svoris`, `pasiruosimo_lygis`, `traumosLigos`) VALUES
(1, 'Simonas Simonaitis', 27, 190, 'Vyras', 74, '5val/savaitę paskutinius 2m', 'Kelio sąnario trauma'),
(3, 'Jonas Jonaitis', 33, 169, 'Vyras', 88, 'Apie 2val/savaitę paskutinius 2m', 'Stuburo išvarža');

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
-- Table structure for table `pratimai`
--

CREATE TABLE `pratimai` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) NOT NULL,
  `pastabos` text NOT NULL,
  `lygis_sunkumo` int(11) NOT NULL,
  `id_kito_lygio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pratimai_raumenys`
--

CREATE TABLE `pratimai_raumenys` (
  `id` int(11) NOT NULL,
  `id_raumenys` int(11) NOT NULL,
  `id_pratimai` int(11) NOT NULL
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
-- Indexes for table `klientai`
--
ALTER TABLE `klientai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `klientai_treniruociu_planai`
--
ALTER TABLE `klientai_treniruociu_planai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klientai_planai` (`id_treniruotes_plano`);

--
-- Indexes for table `pratimai`
--
ALTER TABLE `pratimai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pratimai_raumenys`
--
ALTER TABLE `pratimai_raumenys`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `klientai`
--
ALTER TABLE `klientai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
