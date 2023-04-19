-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2023 at 11:00 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astore`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `AddressID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`AddressID`, `UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`) VALUES
(1, 1, 'Admin', 'Vanha Maantie 6', '02650', 'Espoo', 'Finland', '0123456789'),
(2, 2, 'Anh Pham', 'Vanha Maantie 8', '02650', 'Helsinki', 'Finland', '012 345 6787'),
(3, 3, 'adones evangelista', 'Purok1, Brgy.Tan-awan', '6111', 'Kabankalan City', 'Philippines', '09120119912'),
(4, 4, 'Baishakhi Behera', '1263', '75110', 'bbsr', 'india', '8249570678'),
(5, 4, 'Baishakhi Behera', '1263', '75110', 'bbsr', 'india', '8249570678'),
(6, 4, 'Baishakhi Behera', '1263', '75110', 'bbsr', 'india', '8249570678'),
(7, 5, 'chandan', 'test', '123', 'test', 'test', '8249570678'),
(8, 5, 'chandan', 'test', '123', 'test', 'test', '8249570679'),
(9, 5, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(58) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `CategorySlug` varchar(68) NOT NULL,
  `Image` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Description`, `CategorySlug`, `Image`) VALUES
(1, 'LOW END', 'Budget Friendly Watches', 'Casual', 'smartphone.png'),
(2, 'MID END', 'Slight higher in Price but best in comfort', 'Regular', 'tv.png'),
(3, 'HIGH END', 'Luxurious Watches with premium artwork', 'Luxuries', 'computers.png'),
(4, 'GAMERS', 'Game Consoles', 'Gaming', 'game-console.png'),
(5, 'SMART', 'Networks', 'Smart', 'networks.png'),
(6, 'OFFICE', 'Software', 'Office', 'software.png'),
(7, 'PARTY', 'Cameras', 'Party', 'camera.png'),
(8, 'STORE SPECIAL', 'Cables', 'Special', 'cables.png');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `MessageID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Subject` varchar(128) DEFAULT NULL,
  `Content` varchar(158) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`MessageID`, `FullName`, `Email`, `Subject`, `Content`) VALUES
(1, 'chandan', 'chan@gmail.com', 'wdswsw', 'wswsw');

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--

CREATE TABLE `order details` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` smallint(2) NOT NULL DEFAULT 1,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order details`
--

INSERT INTO `order details` (`OrderID`, `ProductID`, `Quantity`, `Total`) VALUES
(1, 1, 1, '850.52'),
(2, 1, 1, '850.52'),
(2, 4, 1, '350.89'),
(3, 3, 1, '600.56'),
(4, 1, 1, '850.52'),
(5, 1, 2, '1701.04');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(10,2) DEFAULT NULL,
  `ShippingFee` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`, `AddressID`, `SubTotal`, `Discount`, `ShippingFee`, `Total`, `OrderDate`, `Status`) VALUES
(1, 3, 3, '850.52', '0.00', '0.00', '850.52', '2022-04-06 16:51:10', 'Order Received'),
(2, 4, 5, '1201.41', '0.00', '0.00', '1201.41', '2023-04-16 12:42:51', 'Order Received'),
(3, 4, 6, '600.56', '0.00', '0.00', '600.56', '2023-04-18 11:53:46', 'Order Received'),
(4, 5, 8, '850.52', '0.00', '0.00', '850.52', '2023-04-19 01:09:41', 'Order Received'),
(5, 5, 8, '1701.04', '0.00', '0.00', '1701.04', '2023-04-19 01:44:37', 'Order Received');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ProductPrice` decimal(10,2) DEFAULT 0.00,
  `UnitsInStock` smallint(5) DEFAULT 0,
  `Description` varchar(255) NOT NULL,
  `ManufactureYear` smallint(5) NOT NULL,
  `Image` varchar(50) NOT NULL,
  `ProductSlug` varchar(50) NOT NULL,
  `Feature` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `CategoryID`, `ProductPrice`, `UnitsInStock`, `Description`, `ManufactureYear`, `Image`, `ProductSlug`, `Feature`) VALUES
(1, 'Rolex', 1, '850.52', 14, 'Lateast', 2015, '1.png', 'rolex', 1),
(2, 'Sonata', 1, '500.22', 15, 'Sonata', 2014, '2.png', 'iphone-5s', 0),
(3, 'Fastrack', 2, '600.56', 9, 'Sony Full HDFastrack', 2013, '3.png', 'sony-40-inches', 1),
(4, 'Fossil', 2, '350.89', 10, 'Fossil', 2012, '4.png', 'samsung-32-inches', 0),
(5, 'Glashutte ', 5, '500.22', 15, 'Glashutte ', 2014, '5.png', 'Glashutte', 0),
(6, 'Ulysse ', 3, '2300.89', 6, 'Ulysse ', 2010, '6.png', 'macbook-pro', 1),
(7, 'Omega', 4, '600.88', 12, 'Omega', 2009, '7.png', 'xbox-five', 0),
(8, 'Jaeger-LeCoultre.\n', 4, '522.99', 15, 'Jaeger-LeCoultre.\n', 2008, '8.png', 'playstation-6', 1),
(9, 'Vacheron', 5, '200.55', 16, 'Vacheron', 2001, '9.png', 'linksys-123', 1),
(10, 'Audemars ', 5, '43.33', 22, 'Audemars ', 2005, '10.png', 'netgear-456', 0),
(11, 'Power', 6, '120.89', 17, 'Power', 2018, '11.png', 'adobe-photoshop-cc', 1),
(12, 'Patek Philippe', 7, '1209.59', 16, 'Patek Philippe', 2019, '12.png', 'canon-2222d', 1),
(13, 'Audemars ', 8, '5.88', 14, 'Audemars ', 2002, '13.png', 'hdmi-5.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`Email`) VALUES
('chan@gmail.com'),
('chan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` varchar(28) DEFAULT NULL,
  `Password` varchar(158) DEFAULT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`, `Email`, `Username`, `Password`, `Admin`) VALUES
(1, 'Admin', 'Purok 1, Brgy.Enclaro', '6107', 'Binalbagan City', 'Phippines', '0912011191', 'admin@gmail.com', 'admin', '$2a$10$mpJCYlSr762SwQVzdLwxR.KgRuWEHA2NzUanxxG/nxEStDRcRBbB6', 1),
(2, 'Jude Suares', 'Brgy.tooy', '6108', 'Himamaylan City', 'Philippines', '09123456732', 'jude@gmail.com', 'jude', '$2a$10$TsD7IW0m1g/57C931nC7R.FjwXw9i0tAbJZk7u4Uk0gDoneR9yBim', 0),
(3, 'adones evangelista', 'Purok1, Brgy.Tan-awan', '6111', 'Kabankalan City', 'Philippines', '09120119912', 'adones@gmail.com', 'adones', '$2a$10$iuJPC5hx2s8DUwvjZAq1ZOmNzBKMO7zFTn7Tq9roUr9HFKGfFGToe', 0),
(4, 'Baishakhi Behera', '1263', '75110', 'bbsr', 'india', '8249570678', 'baishakhib2001@gmail.com', 'baishakhi', '$2a$10$uMuNAGczHjVO0etASWqFjuTog39I2vxMh7lz77L1EYdHDsKQ9TIuy', 0),
(5, 'chandan', 'test', '123', 'test', 'test', '8249570678', 'chan@gmail.com', 'test', '$2a$10$748iDQppDjoT83ovmbApdOU/me2MlrcPHX6M5gD6v6ivqE./YUtbq', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `FK_Users_UserID` (`UserID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `CategoryName` (`CategoryName`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`MessageID`);

--
-- Indexes for table `order details`
--
ALTER TABLE `order details`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `FK_Order_Details_Products` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `FK_Orders_Users` (`UserID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `FK_Products_Categories` (`CategoryID`),
  ADD KEY `ProductName` (`ProductName`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `MessageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `FK_Users_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `order details`
--
ALTER TABLE `order details`
  ADD CONSTRAINT `FK_Order_Details_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Order_Details_Products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_Orders_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_Products_Categories` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
