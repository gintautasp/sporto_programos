-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2021 at 01:05 PM
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
-- Table structure for table `klientai`
--

CREATE TABLE `klientai` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) NOT NULL,
  `amzius` int(11) NOT NULL,
  `ugis` int(11) NOT NULL,
  `lytis` enum('Vyras','Moteris') NOT NULL,
  `svoris` int(11) NOT NULL,
  `pasiruosimo_lygis` text CHARACTER SET utf8 NOT NULL,
  `traumosLigos` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pratimai`
--

INSERT INTO `pratimai` (`id`, `pav`, `pastabos`, `lygis_sunkumo`, `id_kito_lygio`) VALUES
(1, 'Pritupimai', '', 1, 17),
(3, 'Sprintas', '', 1, 22),
(4, 'Prisitraukimai', '', 1, 23),
(5, 'Atsilenkimai', '', 1, 18),
(6, 'Begimas', '', 1, 19),
(10, 'Lenta', '', 1, 20),
(11, 'Atsispaudimai', '', 1, 21),
(17, 'Pritupimai pazengusiems', '', 2, 24),
(18, 'Atsilenkimai pazengusiems', '', 2, 25),
(19, 'Begimas pazengusiems', '', 2, 26),
(20, 'Lenta pazengusiems', '', 2, 27),
(21, 'Atsispaudimai pazengusiems', '', 2, 28),
(22, 'Sprintas pazengusiems', '', 2, 29),
(23, 'Prisitraukimai pazengusiems', '', 2, 30),
(24, 'Pritupimai sunkiausi', '', 3, 0),
(25, 'Atsilenkimai sunkiausi', '', 3, 0),
(26, 'Begimas sunkiausias', '', 3, 0),
(27, 'Lenta sunkiausia', '', 3, 0),
(28, 'Atsispaudimai sunkiausi', '', 3, 0),
(29, 'Sprintas sunkiausias', '', 3, 0),
(30, 'Prisistraukimai sunkiausi', '', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pratimai_raumenys`
--

CREATE TABLE `pratimai_raumenys` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_raumenys` int(11) NOT NULL,
  `id_pratimai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pratimai_raumenys`
--

INSERT INTO `pratimai_raumenys` (`id`, `id_raumenys`, `id_pratimai`) VALUES
(1, 7, 11),
(2, 10, 1),
(3, 12, 11),
(4, 14, 10),
(5, 3, 11),
(6, 3, 21),
(7, 3, 28),
(8, 3, 4),
(9, 3, 23),
(10, 3, 30),
(11, 10, 1),
(12, 10, 24),
(13, 10, 17),
(14, 14, 10),
(15, 14, 20),
(16, 14, 27),
(17, 14, 5),
(18, 14, 18),
(19, 14, 25),
(20, 11, 6),
(21, 11, 19),
(22, 11, 26);

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
-- Table structure for table `raumenu_grupes`
--

CREATE TABLE `raumenu_grupes` (
  `id` int(11) NOT NULL,
  `raumenu_grupe` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `raumenu_grupes`
--

INSERT INTO `raumenu_grupes` (`id`, `raumenu_grupe`) VALUES
(1, 'Nugara'),
(2, 'Pilvo presas'),
(3, 'Krutine'),
(4, 'Kojos'),
(5, 'Rankos');

-- --------------------------------------------------------

--
-- Table structure for table `raumenys`
--

CREATE TABLE `raumenys` (
  `id_raumens` int(11) NOT NULL,
  `pav` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `id_raumenu_grupes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `raumenys`
--

INSERT INTO `raumenys` (`id_raumens`, `pav`, `id_raumenu_grupes`) VALUES
(3, 'tricepsas', 5),
(4, 'peciai', 5),
(7, 'bicepsas', 5),
(8, 'dvigalvis', 4),
(9, 'keturgalvis', 4),
(10, 'blauzda', 4),
(11, 'sedmenys', 4),
(12, 'Krutine', 3),
(13, 'Nugara', 1),
(14, 'Pilvo presas', 2);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pratimai` (`id_pratimai`),
  ADD KEY `id_raumenys` (`id_raumenys`);

--
-- Indexes for table `pratimai_treniruociu_planai`
--
ALTER TABLE `pratimai_treniruociu_planai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pratimai_planai` (`id_planai`);

--
-- Indexes for table `raumenu_grupes`
--
ALTER TABLE `raumenu_grupes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raumenys`
--
ALTER TABLE `raumenys`
  ADD PRIMARY KEY (`id_raumens`);

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
-- AUTO_INCREMENT for table `pratimai`
--
ALTER TABLE `pratimai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pratimai_raumenys`
--
ALTER TABLE `pratimai_raumenys`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pratimai_treniruociu_planai`
--
ALTER TABLE `pratimai_treniruociu_planai`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raumenu_grupes`
--
ALTER TABLE `raumenu_grupes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `raumenys`
--
ALTER TABLE `raumenys`
  MODIFY `id_raumens` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
-- Constraints for table `pratimai_raumenys`
--
ALTER TABLE `pratimai_raumenys`
  ADD CONSTRAINT `pratimai_raumenys_ibfk_1` FOREIGN KEY (`id_pratimai`) REFERENCES `pratimai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pratimai_raumenys_ibfk_2` FOREIGN KEY (`id_raumenys`) REFERENCES `raumenys` (`id_raumens`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pratimai_treniruociu_planai`
--
ALTER TABLE `pratimai_treniruociu_planai`
  ADD CONSTRAINT `pratimai_planai` FOREIGN KEY (`id_planai`) REFERENCES `treniruociu_planai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
