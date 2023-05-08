-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2023 at 02:34 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `land`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `acc` varchar(32) DEFAULT NULL,
  `branch` varchar(32) DEFAULT NULL,
  `amount` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bet`
--

CREATE TABLE `bet` (
  `id` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `land` varchar(32) DEFAULT NULL,
  `img` varchar(32) DEFAULT NULL,
  `cnum` varchar(32) DEFAULT NULL,
  `snum` varchar(32) DEFAULT NULL,
  `taluk` varchar(32) DEFAULT NULL,
  `district` varchar(32) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `amt` varchar(32) DEFAULT NULL,
  `area` varchar(32) DEFAULT NULL,
  `desc` varchar(32) DEFAULT NULL,
  `bamount` varchar(32) DEFAULT NULL,
  `uname` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bet`
--

INSERT INTO `bet` (`id`, `name`, `land`, `img`, `cnum`, `snum`, `taluk`, `district`, `state`, `amt`, `area`, `desc`, `bamount`, `uname`) VALUES
('5', 'asath', 'Wet land', 'static/file/background_image1.jp', '1234567876', '8934562', 'belur', 'salem', 'tamilnadu', '40000', 'valapaddy', 'accomodation available', '45000', 'mohan'),
('5', 'asath', 'Wet land', 'static/file/background_image1.jp', '1234567876', '8934562', 'belur', 'salem', 'tamilnadu', '40000', 'valapaddy', 'accomodation available', '50000', 'keerthivasan '),
('5', 'asath', 'Wet land', 'static/file/background_image1.jp', '1234567876', '8934562', 'belur', 'salem', 'tamilnadu', '40000', 'valapaddy', 'accomodation available', '', 'madhan'),
('5', 'asath', 'Wet land', 'static/file/background_image1.jp', '1234567876', '8934562', 'belur', 'salem', 'tamilnadu', '40000', 'valapaddy', 'accomodation available', '', 'shivdash'),
('5', 'asath', 'Wet land', 'static/file/background_image1.jp', '1234567876', '8934562', 'belur', 'salem', 'tamilnadu', '40000', 'valapaddy', 'accomodation available', '', 'vengababu'),
('5', 'asath', 'Wet land', 'static/file/background_image1.jp', '1234567876', '8934562', 'belur', 'salem', 'tamilnadu', '40000', 'valapaddy', 'accomodation available', '', 'shivdash'),
('8', 'lakshman', 'Wet land', 'static/file/Screenshot (1).png', '1234565432', 'LS-2343', 'belur', 'Salem', 'tamilnadu', '30000', 'valapaddy', 'accomodation available', '40000', 'shivdash'),
('9', 'lakshman', 'Wet land', 'static/file/WIN_20230425_14_41_2', '9029383901', 'LS-2343', 'belur', 'Salem', 'tamilnadu', '50000', 'belur', 'no accomodation available', '60000', 'shivdash'),
('10', 'lakshman', 'Dry land', 'static/file/background_image2.jp', '9087654532', 'LS-2343', 'belur', 'Salem', 'tamilnadu', '23456789', '500', 'test', '222222222', 'shivdash');

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `gender` varchar(32) DEFAULT NULL,
  `mail` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `acc` varchar(100) DEFAULT NULL,
  `pamt` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`id`, `name`, `gender`, `mail`, `phone`, `password`, `acc`, `pamt`) VALUES
(7, 'babu', 'male', 'vengababu@gmail.com', '1234567898', 'babu', 'no', '0'),
(8, 'mohan', 'male', 'mohan@gmail.com', '3425261123', '1234', 'no', '0'),
(9, 'keerthivasan', 'male', 'keerthi@gmail.com', '1234565432', '12345', 'no', '0'),
(10, 'madhan', 'male', 'mr380@gmail.com', '1234567890', 'man', 'no', '0'),
(11, 'shivdash', 'male', 'shiv12@gmail.com', '9087523415', 'shiv', 'no', '0'),
(12, 'vengababu', 'male', 'babu124@gmail.com', '9005678909', 'babu', 'no', '0'),
(13, 'shivdash', 'male', 'madan@gmail.com', '1234567898', 'shivd', 'no', '0');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `land` varchar(32) DEFAULT NULL,
  `img` varchar(32) DEFAULT NULL,
  `cnum` varchar(32) DEFAULT NULL,
  `snum` varchar(32) DEFAULT NULL,
  `taluk` varchar(32) DEFAULT NULL,
  `district` varchar(32) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `amt` varchar(32) DEFAULT NULL,
  `area` varchar(32) DEFAULT NULL,
  `desc` varchar(312) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `land`, `img`, `cnum`, `snum`, `taluk`, `district`, `state`, `amt`, `area`, `desc`) VALUES
(5, 'asath', 'Wet land', 'static/file/background_image1.jp', '1234567876', '8934562', 'belur', 'salem', 'tamilnadu', '40000', 'valapaddy', 'accomodation available'),
(6, 'nan', 'Dry land', 'static/file/background_image1.jp', '1234567890', '765142342', 'sass', 'sLEM', 'TN', '20000', 'belur', 'accomadation avila'),
(7, 'lakshman', 'Wet land', 'static/file/Screenshot (1).png', '8765463767', '289394', 'arcot', 'vellore', 'Tamilnadu', '50000', 'velacherry', 'accomodation available'),
(8, 'lakshman', 'Wet land', 'static/file/Screenshot (1).png', '1234565432', 'LS-2343', 'belur', 'Salem', 'tamilnadu', '30000', 'valapaddy', 'accomodation available'),
(9, 'lakshman', 'Wet land', 'static/file/WIN_20230425_14_41_2', '9029383901', 'LS-2343', 'belur', 'Salem', 'tamilnadu', '50000', 'belur', 'no accomodation available'),
(10, 'lakshman', 'Dry land', 'static/file/background_image2.jp', '9087654532', 'LS-2343', 'belur', 'Salem', 'tamilnadu', '23456789', '500', 'test'),
(11, 'lakshman', 'Dry land', 'static/file/Screenshot (1).png', '1234567654', 'LS-2786', 'belur', 'Salem', 'tamilnadu', '30000', '900', 'accomodation available'),
(12, '[lakshman]', '[wet]', '[static/img]', '[1122354589]', '[787]', '[slm]', '[slm]', '[tn]', '[88988]', '[787]', '[sffd]'),
(13, '[laksh]', '[dry]', '[static/hghh]', '[78854]', '[787]', '[vil]', '[slm]', '[tn]', '[98988]', '[899]', '[ujgghjg]'),
(14, 'lakshman', 'Dry land', 'static/file/WIN_20230425_14_41_2', '1234512345', '434', 'slm', 'slm', 'tn', '67667', '899', 'fgdggdf'),
(15, 'lakshman', 'Dry land', 'static/file/WIN_20230425_14_41_2', '12345', '45', 'slm', 'slm', 'tn', '45454', '65', 'dfgfdgf'),
(16, 'lakshman', 'Dry land', 'static/file/background_image1.jp', '1234567890', 'LS-2343', 'vpy', 'slm', 'tn', '20000', '900', 'accomodation available');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `seller` varchar(32) DEFAULT NULL,
  `buyer` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `rate` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `gender` varchar(32) DEFAULT NULL,
  `mail` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `accno` varchar(100) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `bal` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `name`, `gender`, `mail`, `phone`, `password`, `accno`, `branch`, `bal`) VALUES
(6, 'madhan', 'male', 'madan@gmail.com', '8939197277', 'mad', '12345678987', 'blr', '0'),
(7, 'madhan', 'male', 'madan@gmail.com', '1234567898', 'madhan', '1234567890', 'blr', '0'),
(8, 'asath', 'male', 'mr360@gmail.com', '1234567787', '123', '1234567898', 'salem', '0'),
(9, 'nan', 'male', 'nan@gmail.com', '1234556544', 'nan', '33443333333', 'salem', '0'),
(10, 'lakshman', 'male', 'akash123@gmail.com', '8976543278', 'akash', '908678543', 'chennai', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
