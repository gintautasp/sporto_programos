-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2021 at 07:10 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `klientai`
--
ALTER TABLE `klientai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klientai`
--
ALTER TABLE `klientai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
