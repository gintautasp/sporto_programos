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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
