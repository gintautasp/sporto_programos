-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2021 m. Bal 26 d. 02:54
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Sukurta duomenų struktūra lentelei `programos`
--

CREATE TABLE `programos` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `trukme` int(11) NOT NULL,
  `aprasymas` text COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `programos`
--

INSERT INTO `programos` (`id`, `pav`, `trukme`, `aprasymas`) VALUES
(1, 'Greičio ištvermės', 60, 'Didinama greičio ištvermė'),
(2, 'Bėgimo ištvermės', 90, 'Didinama bėgimo ištvermė'),
(3, 'Bėgimo greičio ištvermės', 60, 'Didinama bėgimo greičio ištvermė');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `programos`
--
ALTER TABLE `programos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `programos`
--
ALTER TABLE `programos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
