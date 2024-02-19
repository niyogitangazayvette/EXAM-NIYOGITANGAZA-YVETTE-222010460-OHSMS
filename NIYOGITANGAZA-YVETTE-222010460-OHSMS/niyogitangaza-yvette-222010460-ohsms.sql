-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 11:15 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `niyogitangaza-yvette-222010460-ohsms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(2, '222010460', '222010460');

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE `house` (
  `id` int(11) NOT NULL,
  `upiNumber` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `location` varchar(100) NOT NULL,
  `sellerId` int(11) DEFAULT NULL,
  `pic` blob DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`id`, `upiNumber`, `description`, `price`, `location`, `sellerId`, `pic`, `status`) VALUES
(1, '0009-4567-7890-1234-1235', 'Ninzu imwe nini', 12300000.00, 'MUHIMA', 1, NULL, 'Sold'),
(2, '0009-4567-7890-1234-1235', 'It is one house with all requirements like chairs tables chicken and other two small house front of it', 20000000.00, 'musanze muhoza', 3, NULL, 'Sold'),
(4, '0009-4567-7890-1234-1235', 'it has more requirenment like chairs desk and small house', 2400000.00, 'huye', 1, NULL, 'Available'),
(5, '0009-4567-7890-1234-2345', 'it is a big house ', 12300000.00, 'musanze muhoza', 1, NULL, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `houseId` int(11) DEFAULT NULL,
  `buyerId` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `houseId`, `buyerId`, `amount`, `status`) VALUES
(1, 1, 1, 12300000.00, 'Approved'),
(2, 2, 4, 20000000.00, 'Canceled'),
(3, 2, 4, 20000000.00, 'Canceled');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobileNumber` varchar(20) NOT NULL,
  `securityQuestion` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `mobileNumber`, `securityQuestion`, `answer`, `password`, `address`, `city`, `state`, `country`, `status`) VALUES
(1, 'Daniel', 'danieltn@gmail.com', '0781234567', 'What was your first car?', 'benz', '1234567890', 'huye', 'kigali', 'nation', 'RWANDA', 'Active'),
(3, 'yvette niyogitangaza', 'igitangazayvette@gmail.com', '0783629811', 'What is the name first pet?', 'mtrs', '1234567890', 'huye', 'kigali', 'msnz', 'Uganda', 'Active'),
(4, 'Toleny iriza', 'tolenyiriza@gmail.com', '0787275693', 'What was your first car?', '12', '1234567890', 'kicukiro', 'kigali', 'plm', 'USA', 'Active'),
(5, 'celine nziza', 'nzizaceline@gmail.com', '0782526271', 'What is the name first pet?', 'mtrs', '1234567890', 'kibuye', 'kigali', 'nation', 'RWANDA', 'Active'),
(7, 'emely Ishimwe', 'emelyishimwe@gmail.com', '07812356792', 'What was your first car?', 'benz', '1234567890', 'kicukiro', 'kigali', 'plm', 'RWANDA', 'Active'),
(8, 'cece lecy', 'cecelecy@gmail.com', '0783628511', 'What is the name first pet?', 'bingo', '1234567890', 'kicukiro', 'kigali', 'nation', 'USA', 'Active'),
(9, 'omlay Niyomurengezi', 'omlayniyo@gmail.com', '0783436771', 'What was your first car?', 'benz', '1234567890', 'washngton', 'newyork', 'nation', 'USA', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sellerId` (`sellerId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `houseId` (`houseId`),
  ADD KEY `buyerId` (`buyerId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `house`
--
ALTER TABLE `house`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `house`
--
ALTER TABLE `house`
  ADD CONSTRAINT `house_ibfk_1` FOREIGN KEY (`sellerId`) REFERENCES `user` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`houseId`) REFERENCES `house` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`buyerId`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
