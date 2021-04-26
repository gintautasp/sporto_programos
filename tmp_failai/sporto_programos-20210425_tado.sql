-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 25, 2021 at 09:19 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

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

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
