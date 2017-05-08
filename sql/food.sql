-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2017 at 12:23 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
`id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` VALUES(1, 'Nasi Goreng', 120, 0);
INSERT INTO `items` VALUES(2, 'Ketoprak', 70, 0);
INSERT INTO `items` VALUES(3, 'Ketupat Sayur', 80, 0);
INSERT INTO `items` VALUES(4, 'Item 4', 15, 1);
INSERT INTO `items` VALUES(5, 'Item 5', 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_type` varchar(16) NOT NULL DEFAULT 'Wallet',
  `total` int(11) NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'Yet to be delivered',
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` VALUES(1, 2, 'Address 2', 'Sample Description 1', '2017-03-28 17:32:41', 'Wallet', 150, 'Cancelled by Customer', 1);
INSERT INTO `orders` VALUES(2, 2, 'New address 2', '', '2017-03-28 17:43:05', 'Wallet', 130, 'Cancelled by Customer', 1);
INSERT INTO `orders` VALUES(3, 3, 'Address 3', 'Sample Description 2', '2017-03-28 19:49:33', 'Cash On Delivery', 130, 'Delivered', 0);
INSERT INTO `orders` VALUES(4, 3, 'Address 3', '', '2017-03-28 19:52:01', 'Cash On Delivery', 130, 'Cancelled by Customer', 1);
INSERT INTO `orders` VALUES(5, 3, 'New Address 3', '', '2017-03-28 20:47:28', 'Wallet', 285, 'Paused', 0);
INSERT INTO `orders` VALUES(6, 3, 'New Address 3', '', '2017-03-30 00:43:31', 'Wallet', 325, 'Cancelled by Customer', 1);
INSERT INTO `orders` VALUES(7, 2, 'meja no 2', '', '2017-05-08 14:56:02', 'Cash On Delivery', 65, 'Delivered', 0);
INSERT INTO `orders` VALUES(8, 2, 'meja no 1', '', '2017-05-08 16:36:52', 'Cash On Delivery', 150, 'Cancelled by Customer', 1);
INSERT INTO `orders` VALUES(9, 2, 'meja no 2', '', '2017-05-08 16:44:59', 'Cash On Delivery', 70, 'Delivered', 0);
INSERT INTO `orders` VALUES(10, 2, 'meja no 2', '', '2017-05-08 16:57:56', 'Cash On Delivery', 230, 'Cancelled by Customer', 1);
INSERT INTO `orders` VALUES(11, 2, 'meja no2', '', '2017-05-08 16:59:06', 'Cash On Delivery', 230, 'Delivered', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE IF NOT EXISTS `order_details` (
`id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` VALUES(1, 1, 2, 2, 90);
INSERT INTO `order_details` VALUES(2, 1, 3, 3, 60);
INSERT INTO `order_details` VALUES(3, 2, 2, 2, 90);
INSERT INTO `order_details` VALUES(4, 2, 3, 2, 40);
INSERT INTO `order_details` VALUES(5, 3, 2, 2, 90);
INSERT INTO `order_details` VALUES(6, 3, 3, 2, 40);
INSERT INTO `order_details` VALUES(7, 4, 2, 2, 90);
INSERT INTO `order_details` VALUES(8, 4, 3, 2, 40);
INSERT INTO `order_details` VALUES(9, 5, 2, 5, 225);
INSERT INTO `order_details` VALUES(10, 5, 3, 2, 40);
INSERT INTO `order_details` VALUES(11, 5, 5, 1, 20);
INSERT INTO `order_details` VALUES(12, 6, 2, 5, 225);
INSERT INTO `order_details` VALUES(13, 6, 3, 3, 60);
INSERT INTO `order_details` VALUES(14, 6, 5, 2, 40);
INSERT INTO `order_details` VALUES(15, 7, 2, 1, 45);
INSERT INTO `order_details` VALUES(16, 7, 3, 1, 20);
INSERT INTO `order_details` VALUES(17, 8, 2, 1, 70);
INSERT INTO `order_details` VALUES(18, 8, 3, 1, 80);
INSERT INTO `order_details` VALUES(19, 9, 2, 1, 70);
INSERT INTO `order_details` VALUES(20, 10, 2, 1, 70);
INSERT INTO `order_details` VALUES(21, 10, 3, 2, 160);
INSERT INTO `order_details` VALUES(22, 11, 2, 1, 70);
INSERT INTO `order_details` VALUES(23, 11, 3, 2, 160);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
`id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'Open',
  `type` varchar(30) NOT NULL DEFAULT 'Others',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` VALUES(1, 2, 'Subject 1', 'New Description for Subject 1', 'Answered', 'Support', '2017-03-30 18:08:51', 0);
INSERT INTO `tickets` VALUES(2, 2, 'report', 'fail payment                                                                     ', 'Answered', 'Complaint', '2017-05-08 17:00:08', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE IF NOT EXISTS `ticket_details` (
`id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_details`
--

INSERT INTO `ticket_details` VALUES(1, 1, 2, 'New Description for Subject 1', '2017-03-30 18:08:51');
INSERT INTO `ticket_details` VALUES(2, 1, 2, 'Reply-1 for Subject 1', '2017-03-30 19:59:09');
INSERT INTO `ticket_details` VALUES(3, 1, 1, 'Reply-2 for Subject 1 from Administrator.', '2017-03-30 20:35:39');
INSERT INTO `ticket_details` VALUES(4, 1, 1, 'Reply-3 for Subject 1 from Administrator.', '2017-03-30 20:49:35');
INSERT INTO `ticket_details` VALUES(5, 2, 2, 'fail payment                                                                     ', '2017-05-08 17:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `role` varchar(15) NOT NULL DEFAULT 'Customer',
  `name` varchar(15) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(35) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `contact` bigint(11) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES(1, 'Administrator', 'Admin 1', 'root', 'toor', '', 'Address 1', 9898000000, 1, 0);
INSERT INTO `users` VALUES(2, 'Customer', 'Mohtar Nurwahid', 'mohtar', 'mohtar', 'mohtarnurwahid@gmail.com', '', 82218335930, 1, 0);
INSERT INTO `users` VALUES(3, 'Customer', 'Customer 2', 'user2', 'pass2', 'mail3@example.com', 'Address 3', 9898000002, 1, 0);
INSERT INTO `users` VALUES(4, 'Customer', 'Customer 3', 'user3', 'pass3', '', '', 9898000003, 0, 0);
INSERT INTO `users` VALUES(5, 'Customer', 'Customer 4', 'user4', 'pass4', '', '', 9898000004, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE IF NOT EXISTS `wallet` (
`id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` VALUES(1, 1);
INSERT INTO `wallet` VALUES(2, 2);
INSERT INTO `wallet` VALUES(3, 3);
INSERT INTO `wallet` VALUES(4, 4);
INSERT INTO `wallet` VALUES(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_details`
--

CREATE TABLE IF NOT EXISTS `wallet_details` (
`id` int(11) NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `number` varchar(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  `balance` int(11) NOT NULL DEFAULT '2000'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet_details`
--

INSERT INTO `wallet_details` VALUES(1, 1, '6155247490533921', 983, 3430);
INSERT INTO `wallet_details` VALUES(2, 2, '1887587142382050', 772, 2000);
INSERT INTO `wallet_details` VALUES(3, 3, '4595809639046830', 532, 1585);
INSERT INTO `wallet_details` VALUES(4, 4, '5475856443351234', 521, 2000);
INSERT INTO `wallet_details` VALUES(5, 5, '9076633115663264', 229, 2000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD KEY `item_id` (`item_id`), ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
 ADD PRIMARY KEY (`id`), ADD KEY `poster_id` (`poster_id`);

--
-- Indexes for table `ticket_details`
--
ALTER TABLE `ticket_details`
 ADD PRIMARY KEY (`id`), ADD KEY `ticket_id` (`ticket_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `customer_id` (`customer_id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wallet_details`
--
ALTER TABLE `wallet_details`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `wallet_id` (`wallet_id`), ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ticket_details`
--
ALTER TABLE `ticket_details`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wallet_details`
--
ALTER TABLE `wallet_details`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`poster_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ticket_details`
--
ALTER TABLE `ticket_details`
ADD CONSTRAINT `ticket_details_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet`
--
ALTER TABLE `wallet`
ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet_details`
--
ALTER TABLE `wallet_details`
ADD CONSTRAINT `wallet_details_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
