-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2021 at 12:55 PM
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
(1, 'Pritupimai', '', 0, 0),
(5, 'Atsilenkimai', '', 1, 1),
(6, 'Begimas', '', 1, 1),
(9, 'sedejimas', '', 1, 1),
(10, 'lenta', '', 1, 1),
(11, 'atsispaudimai', '', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pratimai`
--
ALTER TABLE `pratimai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pratimai`
--
ALTER TABLE `pratimai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
