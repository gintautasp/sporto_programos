-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2021 at 09:04 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pratimai_raumenys`
--
ALTER TABLE `pratimai_raumenys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pratimai` (`id_pratimai`),
  ADD KEY `id_raumenys` (`id_raumenys`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pratimai_raumenys`
--
ALTER TABLE `pratimai_raumenys`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pratimai_raumenys`
--
ALTER TABLE `pratimai_raumenys`
  ADD CONSTRAINT `pratimai_raumenys_ibfk_1` FOREIGN KEY (`id_pratimai`) REFERENCES `pratimai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pratimai_raumenys_ibfk_2` FOREIGN KEY (`id_raumenys`) REFERENCES `raumenys` (`id_raumens`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
