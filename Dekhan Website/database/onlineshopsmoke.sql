-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2025 at 01:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshopsmoke`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Iget bar'),
(2, 'Ali barbar'),
(3, 'Fakher'),
(4, 'Smoke');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(161, 5, '::1', 26, 1),
(162, 4, '::1', 26, 1),
(163, 6, '::1', 26, 1),
(167, 1, '::1', 26, 1),
(168, 2, '::1', 26, 1),
(171, 6, '::1', 27, 1),
(174, 9, '::1', 27, 1),
(175, 93, '::1', 27, 1),
(177, 95, '::1', 27, 1),
(179, 97, '::1', 27, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Smoke'),
(2, 'Vap');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(6, 'kimointernet5@gmail.com'),
(7, 'sdaswd@gmail.com'),
(8, 'businessdannawi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 26, 'kimo dannawi', 'kimointernet5@gmail.com', 'oij', 'lll', 'north akkar', 0, 'fff', '6357282972639827', '12/22', 5, 165, 342),
(8221, 26, 'kimo dannawi', 'kimointernet5@gmail.com', 'oij', 'lll', 'north akkar', 0, 'sss', '332354532525', '12/22', 0, 0, 2334),
(8222, 26, 'kimo dannawi', 'kimointernet5@gmail.com', 'oij', 'lll', 'north akkar', 0, 'sss', '332354532525', '12/22', 0, 0, 2334);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 2, 2, 'ALI BRBAR 9000 PUFFS', 33, 'ALI BRBAR RIBENA', 'https://i.imgur.com/lNGKd8r.jpeg', 'ALI BRBAR Vap'),
(2, 2, 2, 'ALI BRBAR 9000 PUFFS', 33, 'ALI BRBAR WTF', 'https://i.imgur.com/NU8lCJK.jpeg', 'ALI BARBAR VAP'),
(3, 2, 2, 'ALI BARBAR 9000 PUFFS', 33, 'ALI BRBAR STRAWBERRY LYCHEE', 'https://i.imgur.com/Wl0VtXh.jpeg', 'ALI BARBAR VAP'),
(4, 2, 2, 'ALI BARBAR 9000 PUFFS', 33, 'ALI BRBAR PINK LEMON', 'https://i.imgur.com/4sAYIUE.jpeg', 'ALI BARBAR VAP'),
(5, 2, 2, 'ALI BARBAR 9000 PUFFS', 33, 'ALI BRBAR GRAPE ICE', 'https://i.imgur.com/o2LCmBa.jpeg', 'ALI BARBAR VAP'),
(6, 2, 2, 'ALI BARBAR 9000 PUFFS', 33, 'ALI BRBAR FTP', 'https://i.imgur.com/8Cn3BmF.jpeg', 'ALI BARBAR VAP'),
(7, 2, 2, 'ALI BARBAR 9000 PUFFS', 33, 'ALI BRBAR BLACKBERRY ICE', 'https://i.imgur.com/azwvJLv.jpeg', 'ALI BARBAR VAP'),
(8, 2, 2, 'ALI BARBAR 9000 PUFFS', 33, 'ALI BRBAR DOUBLE APPLE', 'https://i.imgur.com/o4LgHXS.jpeg', 'ALI BARBAR VAP'),
(9, 2, 2, 'ALI BARBAR 9000 PUFFS', 33, 'ALI BRBAR CHUPA CHUPS STRAWBERRY', 'https://i.imgur.com/JgfNAN3.jpeg', 'ALI BARBAR VAP'),
(10, 2, 2, 'ALI BARBAR 9000 PUFFS', 33, 'ALI BRBAR BANANA BUZZ', 'https://i.imgur.com/S1xFlJh.jpeg', 'ALI BARBAR VAP'),
(11, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER MAGIC LOVE', 'https://i.imgur.com/afIdeXw.jpeg', 'AL FAKHER VAP'),
(12, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER LUCID DREAM', 'https://i.imgur.com/ChKU6ys.jpeg', 'AL FAKHER VAP'),
(13, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER GUM MINT', 'https://i.imgur.com/mDUgJRA.jpeg', 'AL FAKHER VAP'),
(14, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER GRAPE MINT', 'https://i.imgur.com/ZaZjOfq.jpeg', 'AL FAKHER VAP'),
(15, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER WHITE FLASH', 'https://i.imgur.com/tjwIirc.jpeg', 'AL FAKHER VAP'),
(16, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER GUM FLAVOUR', 'https://i.imgur.com/JHLj9vC.jpeg', 'AL FAKHER VAP'),
(17, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER BLUEBERRY GUM', 'https://i.imgur.com/UoQsPJ9.jpeg', 'AL FAKHER VAP'),
(19, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER PEACH ICE', 'https://i.imgur.com/prOLkj5.jpeg', 'AL FAKHER VAP'),
(20, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER BLUE RAZZ LEMONADE', 'https://i.imgur.com/taJg8Tv.jpeg', 'AL FAKHER VAP'),
(21, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER BLACK CURRANT ICE', 'https://i.imgur.com/UdYsqtV.jpeg', 'AL FAKHER VAP'),
(22, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER SWEET PASSIONFRUIT', 'https://i.imgur.com/SLscxHM.jpeg', 'AL FAKHER VAP'),
(23, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER LUSH ICE', 'https://i.imgur.com/r4fBynQ.jpeg', 'AL FAKHER VAP'),
(24, 2, 3, 'AL FAKHER 15000 PUFFS', 26, 'AL FAKHER MINT', 'https://i.imgur.com/B3PKoMN.jpeg', 'AL FAKHER VAP'),
(25, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR ORANGE MANGO PINEAPPLE ICE', 'https://i.imgur.com/STPsCFb.jpeg', 'IGET 3500 VAP'),
(26, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR GRAPE ICE', 'https://i.imgur.com/AjWoaXE.jpeg', 'IGET BAR VAP'),
(27, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR STRAWBERRY WATERMELON ICE', 'https://i.imgur.com/JMmSFnG.jpeg', 'IGET BAR VAP'),
(28, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR PINEAPPLE ICE', 'https://i.imgur.com/ajFEbLX.jpeg', 'IGET BAR VAP'),
(29, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR COLA ICE', 'https://i.imgur.com/a1hd07H.jpeg', 'IGET BAR VAP'),
(30, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR PASPBERRY GRAPE', 'https://i.imgur.com/xQM6pep.jpeg', 'IGET BAR VAP'),
(31, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR PASSION FRUIT KIWI GUAVA', 'https://i.imgur.com/ddOXCw6.jpeg', 'IGET BAR VAP'),
(32, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR BLACKBERRY ICE', 'https://i.imgur.com/s8fzpL3.jpeg', 'IGET BAR VAP'),
(33, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR STRAWBERRY RASPBERRY', 'https://i.imgur.com/c9Zc51z.jpeg', 'IGET BAR VAP'),
(34, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR MANGO ICE', 'https://i.imgur.com/OSZSRhr.jpeg', 'IGET BAR VAP'),
(35, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR ORANGE FANTA SODA', 'https://i.imgur.com/Z4QkFSy.jpeg', 'IGET BAR VAP'),
(36, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR STRAWBERRY RASPBERRY', 'https://i.imgur.com/k8FBvog.jpeg', 'IGET BAR VAP'),
(37, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR STRAWBERRY WATERMELON ICE', 'https://i.imgur.com/jZ1EKaF.jpeg', 'IGET BAR VAP'),
(38, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR GRAPEFRUIT GUAVA LEMON ICE', 'https://i.imgur.com/b6jHfqC.jpeg', 'IGET BAR VAP'),
(39, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR BLUEBERRY RASPBERRY', 'https://i.imgur.com/KzVbMbs.jpeg', 'IGET BAR VAP'),
(40, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR STRAWBERRY KIWI ICE', 'https://i.imgur.com/dmpK2dx.jpeg', 'IGET BAR VAP'),
(45, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR MELON ICE', 'https://i.imgur.com/qxO1kRC.jpeg', 'IGET BAR VAP'),
(46, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR BLACKBERRY POMEGRANATE CHERRY ICE', 'https://i.imgur.com/aC6hfX7.jpeg', 'IGET BAR VAP'),
(47, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR BANANA POMEGRANATE CHERRY ICE', 'https://i.imgur.com/q1ic0HA.jpeg', 'IGET BAR VAP'),
(48, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR BANANA ICE', 'https://i.imgur.com/z6Ec6sW.jpeg', 'IGET BAR VAP'),
(49, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR CHERRY POMEGRANATE', 'https://i.imgur.com/nAO5GaY.jpeg', 'IGET BAR VAP'),
(50, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR CHERRY BLUEBERRY', 'https://i.imgur.com/jHRw8Va.jpeg', 'IGET BAR VAP'),
(51, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR BLACKBERRY RASPBERRY LEMON', 'https://i.imgur.com/u7xhRw9.jpeg', 'IGET BAR VAP'),
(52, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR ICE CREAM', 'https://i.imgur.com/F7mAxId.jpeg', 'IGET BAR VAP'),
(57, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR WATERMELON MINT ICE', 'https://i.imgur.com/He7Ctau.jpeg', 'IGET BAR VAP'),
(73, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR PEACH ICE', 'https://i.imgur.com/BRHynRu.jpeg', 'IGET BAR VAP'),
(74, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR BLUEBERRY RASPBERRY', 'https://i.imgur.com/Y4Yzc0E.jpeg', 'IGET BAR VAP'),
(75, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR KIWI PINEAPPLE ICE', 'https://i.imgur.com/uQOe6tb.jpeg', 'IGET BAR VAP'),
(76, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR DYNAMIC MINT', 'https://i.imgur.com/YFZRBtF.jpeg', 'IGET BAR VAP'),
(77, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR LUSH ICE', 'https://i.imgur.com/6NDtBvK.jpeg', 'IGET BAR VAP'),
(78, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR BLUEBERRY ICE', 'https://i.imgur.com/sqe8NUE.jpeg', 'IGET BAR VAP'),
(85, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR MIXED BERRY', 'https://i.imgur.com/eSP206U.jpeg', 'IGET BAR VAP'),
(86, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR PASSION FRUIT WATERMELON JUICE', 'https://i.imgur.com/po7Fxnm.jpeg', 'IGET BAR VAP'),
(87, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR COLA ICE', 'https://i.imgur.com/a1hd07H.jpeg', 'IGET BAR VAP'),
(88, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR RASPBERRY GRAPE', 'https://i.imgur.com/xQM6pep.jpeg', 'IGET BAR VAP'),
(89, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR PASSION FRUIT KIWI GUAVA', 'https://i.imgur.com/ddOXCw6.jpeg', 'IGET BAR VAP'),
(90, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR DOUBLE APPLE', 'https://i.imgur.com/e11KNWZ.jpeg', 'IGET BAR VAP'),
(91, 2, 1, 'IGET BAR 3500 PUFFS', 33, 'IGET BAR PASSION FRUIT MANGO LIME', 'https://i.imgur.com/4uUFEXZ.jpeg', 'IGET BAR VAP'),
(93, 1, 4, 'MANCHESTER', 13, 'MANCHESTER ROYAL RED', 'https://i.imgur.com/awTtVy9.jpeg', 'MANCHESTER SMOKE'),
(94, 1, 4, 'MARLBORO', 13, 'MARLBORO', 'https://i.imgur.com/ctWj2OG.jpeg', 'MARLBORO SMOKE'),
(95, 1, 4, 'MANCHESTER', 13, 'MANCHESTER SPECIAL EDITION', 'https://i.imgur.com/NjYCp7O.jpeg', 'MANCHESTER SMOKE'),
(96, 1, 4, 'ICE', 13, 'ICE COOL BLAST', 'https://i.imgur.com/E8Q9bIB.jpeg', 'ICE SMOKE'),
(97, 1, 4, 'MANCHESTER', 13, 'MANCHESTER SAPPHIER BLUE', 'https://i.imgur.com/wbQ2uZ6.jpeg', 'MANCHESTER SMOKE'),
(98, 1, 4, 'ESSE', 13, 'ESSE MENTHOL', 'https://i.imgur.com/PTi0pJh.jpeg', 'ESSE SMOKE'),
(99, 1, 4, 'MARLBORO ORIGINAL', 13, 'GOLD MARLBORO ORIGINAL', 'https://i.imgur.com/1K8gR17.jpeg', 'MARLBORO SMOKE'),
(100, 1, 4, 'MANCHESTER', 13, 'MANCHESTER RED', 'https://i.imgur.com/NHibELc.jpeg', 'MANCHESTER SMOKE'),
(101, 1, 4, 'MARLBORO', 13, 'MARLBORO ICE BLAST', 'https://i.imgur.com/ovFzCXr.jpeg', 'MARLBORO SMOKE'),
(102, 1, 4, 'DOUBLE HAPPINESSE', 13, 'DOUBLE HAPPINESSE, (KING SIZE, FILTER TIPPED, (CIGARETTES))', 'https://i.imgur.com/VFnVYx7.jpeg', ' SMOKE'),
(103, 1, 4, 'ICE COLD(OSCAR)', 13, 'ICE COLD(OSCAR)\r\nSUPER SLIM (CLICK IT & FEEL FRESH)', 'https://i.imgur.com/lzO14BY.jpeg', ' SMOKE'),
(104, 1, 4, 'MANCHESTER', 13, 'MANCHESTER RESERVE', 'https://i.imgur.com/9r5ldKV.jpeg', 'MANCHESTER SMOKE'),
(105, 1, 4, 'ESSE', 13, 'ESSE LIGHTS', 'https://i.imgur.com/KiJg1B7.jpeg', 'ESSE SMOKE'),
(106, 1, 4, 'MANCHESTER', 13, 'MANCHESTER LIGHTS', 'https://i.imgur.com/QZjxMFQ.jpeg', 'MANCHESTER SMOKE');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(8) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '94481215', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '53648727', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '98776543', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(26, 'kimo', 'dannawi', 'kimointernet5@gmail.com', 'kimoking123@', '81294964', 'oij', 'lll'),
(27, 'kimo', 'dannawi', 'sdaswd@gmail.com', 'kimokimo123', '81294964', 'lkjh', 'hjj'),
(28, 'admin', 'admin', 'admin@gmail.com', 'admin', '', '', '');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'kimo', 'dannawi', 'kimointernet5@gmail.com', 'kimoking123@', '81294964', 'oij', 'lll'),
(27, 'kimo', 'dannawi', 'sdaswd@gmail.com', 'kimokimo123', '81294964', 'lkjh', 'hjj'),
(28, 'admin', 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8223;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
