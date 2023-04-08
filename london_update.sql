-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 30, 2019 at 05:48 PM
-- Server version: 5.7.26
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `london_steel`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

DROP TABLE IF EXISTS `tbl_account`;
CREATE TABLE IF NOT EXISTS `tbl_account` (
  `Acc_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `Acc_Code` varchar(50) NOT NULL,
  `Acc_Tr_Type` varchar(25) DEFAULT NULL,
  `Acc_Name` varchar(200) NOT NULL,
  `Acc_Type` varchar(50) NOT NULL,
  `Acc_Description` varchar(255) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Acc_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`Acc_SlNo`, `branch_id`, `Acc_Code`, `Acc_Tr_Type`, `Acc_Name`, `Acc_Type`, `Acc_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 1, 'A0001', '', 'Home. (BAZAR)', '', '', 'a', 'London ', '2019-11-20 12:04:09', 'London ', '2019-11-24 19:41:16'),
(2, 1, 'A0002', '', 'Baby shop', '', '', 'a', 'London ', '2019-11-24 19:41:41', NULL, NULL),
(3, 1, 'A0003', '', 'Wife', '', '', 'a', 'London ', '2019-11-24 19:42:02', NULL, NULL),
(4, 1, 'A0004', '', 'Salf.', '', '', 'a', 'London ', '2019-11-24 19:43:15', NULL, NULL),
(5, 1, 'A0005', '', 'Honda', '', '', 'a', 'London ', '2019-11-24 19:43:28', NULL, NULL),
(6, 1, 'A0006', '', 'Cosmatic & Confactionary', '', '', 'a', 'London ', '2019-11-24 19:44:52', NULL, NULL),
(7, 1, 'A0007', '', 'Shoping Markete', '', '', 'a', 'London ', '2019-11-24 19:45:36', NULL, NULL),
(8, 1, 'A0008', '', 'Laber Bill, (ROAD)', '', '', 'a', 'London ', '2019-11-24 19:47:23', 'London ', '2019-11-25 11:15:08'),
(9, 1, 'A0009', '', 'Laber Bill, (CEMENT)', '', '', 'a', 'London ', '2019-11-24 19:47:51', 'London ', '2019-11-25 11:14:07'),
(10, 1, 'A0010', '', 'Bare, (Dhakatia)', '', '', 'a', 'London ', '2019-11-25 11:30:56', NULL, NULL),
(11, 1, 'A0011', '', 'Medicin', '', '', 'a', 'London ', '2019-11-26 14:20:05', NULL, NULL),
(12, 1, 'A0012', '', 'Dokan khoros.', '', '', 'a', 'London ', '2019-11-26 16:27:10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assets`
--

DROP TABLE IF EXISTS `tbl_assets`;
CREATE TABLE IF NOT EXISTS `tbl_assets` (
  `as_id` int(11) NOT NULL AUTO_INCREMENT,
  `as_date` date DEFAULT NULL,
  `as_name` varchar(50) DEFAULT NULL,
  `as_qty` int(11) DEFAULT NULL,
  `as_rate` decimal(10,2) DEFAULT NULL,
  `as_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `branchid` int(11) DEFAULT NULL,
  PRIMARY KEY (`as_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_accounts`
--

DROP TABLE IF EXISTS `tbl_bank_accounts`;
CREATE TABLE IF NOT EXISTS `tbl_bank_accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(500) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `initial_balance` float NOT NULL,
  `description` varchar(2000) NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_transactions`
--

DROP TABLE IF EXISTS `tbl_bank_transactions`;
CREATE TABLE IF NOT EXISTS `tbl_bank_transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

DROP TABLE IF EXISTS `tbl_brand`;
CREATE TABLE IF NOT EXISTS `tbl_brand` (
  `brand_SiNo` int(11) NOT NULL AUTO_INCREMENT,
  `ProductCategory_SlNo` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `status` char(2) NOT NULL,
  `brand_branchid` int(11) NOT NULL,
  PRIMARY KEY (`brand_SiNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brunch`
--

DROP TABLE IF EXISTS `tbl_brunch`;
CREATE TABLE IF NOT EXISTS `tbl_brunch` (
  `brunch_id` int(11) NOT NULL AUTO_INCREMENT,
  `Brunch_name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `Brunch_title` varchar(250) CHARACTER SET utf8 NOT NULL,
  `Brunch_address` text CHARACTER SET utf8 NOT NULL,
  `Brunch_sales` varchar(1) NOT NULL COMMENT 'Wholesales = 1, Retail = 2',
  `add_date` date NOT NULL,
  `add_time` datetime NOT NULL,
  `add_by` char(50) NOT NULL,
  `update_by` char(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`brunch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brunch`
--

INSERT INTO `tbl_brunch` (`brunch_id`, `Brunch_name`, `Brunch_title`, `Brunch_address`, `Brunch_sales`, `add_date`, `add_time`, `add_by`, `update_by`, `status`) VALUES
(1, 'Main Branch', '95/1, Rahima Plaza,(1st Floor) Nawabpur Road,Dhaka', '95/1, Rahima Plaza, (1st Floor)\nNawabpur Road,\nDhaka', '2', '2019-08-07', '2019-08-07 23:09:25', '', 'London', 'a'),
(2, 'Branch-3', '95/1, Rahima Plaza(1st Floor) ,Nawabpur Road,Dhaka-1100', '95/1, Rahima Plaza(1st Floor) ,Nawabpur Road,Dhaka-1100', '2', '2019-08-07', '2019-08-07 23:09:25', '', '', 'a'),
(3, 'Branch-2', '95/1, Rahima Plaza(1st Floor), Nawabpur Road,Dhaka', '95/1, Rahima Plaza(1st Floor), Nawabpur Road,Dhaka', '2', '2019-08-07', '2019-08-07 23:09:25', '', '', 'a'),
(4, 'Branch-4', 'Retail Sales', 'Mirpur, Dhaka', '2', '2019-08-07', '2019-08-07 23:09:25', '', '', 'a'),
(5, 'Branch-5', 'test 123', 'Dhaka, Bangladesh', '2', '2019-08-07', '2019-08-07 23:09:25', 'Admin', 'Admin', 'd'),
(6, 'নতুন ব্রাঞ্চ', 'নতুন ব্রাঞ্চ', 'নতুন ব্রাঞ্চ', '2', '0000-00-00', '2019-08-07 23:11:18', 'Admin', '', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cashregister`
--

DROP TABLE IF EXISTS `tbl_cashregister`;
CREATE TABLE IF NOT EXISTS `tbl_cashregister` (
  `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Transaction_Date` varchar(20) NOT NULL,
  `IdentityNo` varchar(50) DEFAULT NULL,
  `Narration` varchar(100) NOT NULL,
  `InAmount` decimal(18,2) NOT NULL,
  `OutAmount` decimal(18,2) NOT NULL,
  `Description` longtext NOT NULL,
  `Status` char(1) DEFAULT NULL,
  `Saved_By` varchar(50) DEFAULT NULL,
  `Saved_Time` datetime DEFAULT NULL,
  `Edited_By` varchar(50) DEFAULT NULL,
  `Edited_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`Transaction_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cashtransaction`
--

DROP TABLE IF EXISTS `tbl_cashtransaction`;
CREATE TABLE IF NOT EXISTS `tbl_cashtransaction` (
  `Tr_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `Tr_Id` varchar(50) NOT NULL,
  `Tr_date` date NOT NULL,
  `Tr_Type` varchar(20) NOT NULL,
  `Tr_account_Type` varchar(50) NOT NULL,
  `Acc_SlID` int(11) NOT NULL,
  `Tr_Description` varchar(255) NOT NULL,
  `In_Amount` decimal(18,2) NOT NULL,
  `Out_Amount` decimal(18,2) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(100) NOT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Tr_branchid` int(11) NOT NULL,
  PRIMARY KEY (`Tr_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_cashtransaction`
--

INSERT INTO `tbl_cashtransaction` (`Tr_SlNo`, `Tr_Id`, `Tr_date`, `Tr_Type`, `Tr_account_Type`, `Acc_SlID`, `Tr_Description`, `In_Amount`, `Out_Amount`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Tr_branchid`) VALUES
(1, 'TR00001', '2019-10-15', 'In Cash', '', 1, 'SCAN Sales Commision Sept', '1250.00', '0.00', 'd', 'London ', '2019-11-20 12:05:08', NULL, NULL, 1),
(2, 'TR00002', '2019-10-19', 'Out Cash', '', 8, '13 ton ', '0.00', '2600.00', 'a', 'London ', '2019-11-24 19:48:49', NULL, NULL, 1),
(3, 'TR00003', '2019-10-19', 'Out Cash', '', 2, 'bread,badem,fidre bot.', '0.00', '190.00', 'a', 'London ', '2019-11-24 19:49:46', NULL, NULL, 1),
(4, 'TR00004', '2019-10-20', 'Out Cash', '', 4, 'break fist.', '0.00', '40.00', 'a', 'London ', '2019-11-24 19:51:44', NULL, NULL, 1),
(5, 'TR00005', '2019-10-20', 'Out Cash', '', 9, 'holl cmt (laber bill)', '0.00', '600.00', 'a', 'London ', '2019-11-24 19:52:45', NULL, NULL, 1),
(6, 'TR00006', '2019-10-21', 'Out Cash', '', 1, 'fish, veg, etc.', '0.00', '430.00', 'a', 'London ', '2019-11-25 11:11:14', NULL, NULL, 1),
(7, 'TR00007', '2019-10-21', 'Out Cash', '', 9, 'sha (sp)-199, popur-100.', '0.00', '900.00', 'a', 'London ', '2019-11-25 11:18:22', NULL, NULL, 1),
(8, 'TR00008', '2019-10-22', 'Out Cash', '', 1, 'mug dall, daros, gr chelli.', '0.00', '95.00', 'a', 'London ', '2019-11-25 11:20:33', NULL, NULL, 1),
(9, 'TR00009', '2019-10-22', 'Out Cash', '', 3, '', '0.00', '100.00', 'a', 'London ', '2019-11-25 11:20:51', NULL, NULL, 1),
(10, 'TR00010', '2019-10-23', 'Out Cash', '', 10, 'kamla 2 jon.', '0.00', '700.00', 'a', 'London ', '2019-11-25 11:33:10', NULL, NULL, 1),
(11, 'TR00011', '2019-10-23', 'Out Cash', '', 3, '', '0.00', '100.00', 'a', 'London ', '2019-11-25 11:33:25', NULL, NULL, 1),
(12, 'TR00012', '2019-10-23', 'Out Cash', '', 4, 'etc...', '0.00', '200.00', 'a', 'London ', '2019-11-25 11:33:58', NULL, NULL, 1),
(13, 'TR00013', '2019-10-24', 'Out Cash', '', 2, 'Dyper 1pac.', '0.00', '90.00', 'a', 'London ', '2019-11-25 11:35:18', NULL, NULL, 1),
(14, 'TR00014', '2019-10-24', 'Out Cash', '', 2, 'moja', '0.00', '10.00', 'a', 'London ', '2019-11-25 11:35:41', NULL, NULL, 1),
(15, 'TR00015', '2019-10-25', 'Out Cash', '', 4, 'cng sp', '0.00', '50.00', 'a', 'London ', '2019-11-25 11:36:27', NULL, NULL, 1),
(16, 'TR00016', '2019-10-25', 'Out Cash', '', 9, 'megcem dlx cmt.', '0.00', '600.00', 'a', 'London ', '2019-11-25 11:40:09', NULL, NULL, 1),
(17, 'TR00017', '2019-10-25', 'Out Cash', '', 4, 'softr bill, (bkash) said bi.', '0.00', '5000.00', 'a', 'London ', '2019-11-25 11:44:55', NULL, NULL, 1),
(18, 'TR00018', '2019-11-14', 'Out Cash', '', 4, 'softr bill, (cash). onik.', '0.00', '10000.00', 'a', 'London ', '2019-11-25 11:46:35', NULL, NULL, 1),
(19, 'TR00019', '2019-10-26', 'Out Cash', '', 2, 'prima 2, nidoo, ', '0.00', '790.00', 'a', 'London ', '2019-11-25 11:48:36', NULL, NULL, 1),
(20, 'TR00020', '2019-10-26', 'Out Cash', '', 10, 'solar (battere)', '0.00', '17000.00', 'a', 'London ', '2019-11-25 11:50:36', NULL, NULL, 1),
(21, 'TR00021', '2019-10-26', 'Out Cash', '', 4, 'cng sp', '0.00', '50.00', 'a', 'London ', '2019-11-25 11:51:04', NULL, NULL, 1),
(22, 'TR00022', '2019-11-14', 'Out Cash', '', 4, 'soft  2nd pay to onik.', '0.00', '10000.00', 'd', 'London ', '2019-11-26 14:01:54', NULL, NULL, 1),
(23, 'TR00023', '2019-10-27', 'Out Cash', '', 10, 'gas ar chola (rak banano)', '0.00', '2000.00', 'a', 'London ', '2019-11-26 14:12:57', NULL, NULL, 1),
(24, 'TR00024', '2019-10-27', 'Out Cash', '', 1, 'dall 1kg, onion, cng sp. ', '0.00', '241.00', 'a', 'London ', '2019-11-26 14:15:01', NULL, NULL, 1),
(25, 'TR00025', '2019-10-28', 'Out Cash', '', 1, 'fish 3 item, ', '0.00', '2000.00', 'a', 'London ', '2019-11-26 14:17:09', NULL, NULL, 1),
(26, 'TR00026', '2019-10-28', 'Out Cash', '', 2, 'serelac, bread, etc.', '0.00', '1000.00', 'a', 'London ', '2019-11-26 14:18:30', NULL, NULL, 1),
(27, 'TR00027', '2019-10-28', 'Out Cash', '', 4, 'top-up mob.', '0.00', '133.00', 'a', 'London ', '2019-11-26 14:19:16', NULL, NULL, 1),
(28, 'TR00028', '2019-10-29', 'Out Cash', '', 11, 'me & arine, (homio)', '0.00', '500.00', 'a', 'London ', '2019-11-26 14:23:59', NULL, NULL, 1),
(29, 'TR00029', '2019-10-29', 'Out Cash', '', 4, 'shop (sater grees)', '0.00', '70.00', 'a', 'London ', '2019-11-26 14:25:10', NULL, NULL, 1),
(30, 'TR00030', '2019-10-29', 'Out Cash', '', 2, 'banana,loods,sarf axl,ball.', '0.00', '470.00', 'd', 'London ', '2019-11-26 14:27:27', NULL, NULL, 1),
(31, 'TR00031', '2019-10-29', 'Out Cash', '', 10, 'tabill clott 1ps', '0.00', '180.00', 'a', 'London ', '2019-11-26 14:28:22', NULL, NULL, 1),
(32, 'TR00032', '2019-10-29', 'Out Cash', '', 2, 'banana, sarf exl, noodls, ball', '0.00', '470.00', 'a', 'London ', '2019-11-26 14:29:55', NULL, NULL, 1),
(33, 'TR00033', '2019-10-29', 'Out Cash', '', 1, 'smll orang, kachoua bazar.', '0.00', '120.00', 'a', 'London ', '2019-11-26 14:39:01', NULL, NULL, 1),
(34, 'TR00034', '2019-10-30', 'Out Cash', '', 1, 'Drop soup 1ps', '0.00', '85.00', 'a', 'London ', '2019-11-26 14:40:05', NULL, NULL, 1),
(35, 'TR00035', '2019-10-30', 'Out Cash', '', 1, 'full copy, mola sake.', '0.00', '75.00', 'a', 'London ', '2019-11-26 14:40:57', NULL, NULL, 1),
(36, 'TR00036', '2019-10-31', 'Out Cash', '', 10, 'laber sp', '0.00', '500.00', 'a', 'London ', '2019-11-26 14:42:03', NULL, NULL, 1),
(37, 'TR00037', '2019-10-31', 'Out Cash', '', 4, 'tea bill (thando)', '0.00', '200.00', 'a', 'London ', '2019-11-26 14:43:31', NULL, NULL, 1),
(38, 'TR00038', '2019-10-31', 'Out Cash', '', 5, 'patrol', '0.00', '700.00', 'a', 'London ', '2019-11-26 14:44:04', NULL, NULL, 1),
(39, 'TR00039', '2019-10-31', 'Out Cash', '', 2, 'serelac, bread, sendel 2 jora', '0.00', '800.00', 'a', 'London ', '2019-11-26 14:48:52', NULL, NULL, 1),
(40, 'TR00040', '2019-11-01', 'Out Cash', '', 7, 'samsung (DUOS)1ps.', '0.00', '2050.00', 'a', 'London ', '2019-11-26 14:57:09', 'London ', '2019-11-26 14:59:32', 1),
(41, 'TR00041', '2019-11-01', 'Out Cash', '', 2, 'serelac, oushod.', '0.00', '555.00', 'a', 'London ', '2019-11-26 14:58:22', 'London ', '2019-11-26 14:59:09', 1),
(42, 'TR00042', '2019-11-02', 'Out Cash', '', 4, 'moglai.', '0.00', '70.00', 'a', 'London ', '2019-11-26 15:00:49', NULL, NULL, 1),
(43, 'TR00043', '2019-11-02', 'Out Cash', '', 11, 'baby seek, (jor, sordi)', '0.00', '130.00', 'a', 'London ', '2019-11-26 15:02:00', NULL, NULL, 1),
(44, 'TR00044', '2019-11-02', 'Out Cash', '', 9, 'fresh cmt -400bg.', '0.00', '1200.00', 'a', 'London ', '2019-11-26 15:03:08', 'London ', '2019-11-26 15:04:27', 1),
(45, 'TR00045', '2019-11-02', 'Out Cash', '', 8, '13 ton.', '0.00', '2600.00', 'a', 'London ', '2019-11-26 15:03:47', NULL, NULL, 1),
(46, 'TR00046', '2019-11-02', 'Out Cash', '', 4, 'speed 4ps.', '0.00', '100.00', 'a', 'London ', '2019-11-26 15:05:48', NULL, NULL, 1),
(47, 'TR00047', '2019-11-03', 'Out Cash', '', 5, 'Back Break Sho 1set.', '0.00', '1550.00', 'a', 'London ', '2019-11-26 15:12:55', NULL, NULL, 1),
(48, 'TR00048', '2019-11-03', 'Out Cash', '', 5, 'Electic censor 1ps,', '0.00', '1050.00', 'a', 'London ', '2019-11-26 15:33:35', NULL, NULL, 1),
(49, 'TR00049', '2019-11-03', 'Out Cash', '', 5, 'back chaka bearing 1ps, (japan)', '0.00', '200.00', 'a', 'London ', '2019-11-26 15:35:01', NULL, NULL, 1),
(50, 'TR00050', '2019-11-03', 'Out Cash', '', 5, 'selender steel prot coper.', '0.00', '350.00', 'a', 'London ', '2019-11-26 16:12:17', NULL, NULL, 1),
(51, 'TR00051', '2019-11-03', 'Out Cash', '', 5, 'serv bill', '0.00', '250.00', 'a', 'London ', '2019-11-26 16:13:15', NULL, NULL, 1),
(52, 'TR00052', '2019-11-03', 'Out Cash', '', 4, 'etc...', '0.00', '20.00', 'a', 'London ', '2019-11-26 16:14:08', NULL, NULL, 1),
(53, 'TR00053', '2019-11-03', 'Out Cash', '', 2, 'prima, Bread. etc,,,,', '0.00', '700.00', 'a', 'London ', '2019-11-26 16:15:39', NULL, NULL, 1),
(54, 'TR00054', '2019-11-03', 'Out Cash', '', 1, 'M\'oill, follcopy,bagun,lota,alo,kola,etc,,', '0.00', '700.00', 'a', 'London ', '2019-11-26 16:17:49', NULL, NULL, 1),
(55, 'TR00055', '2019-11-04', 'Out Cash', '', 12, 'Bisket', '0.00', '10.00', 'a', 'London ', '2019-11-26 16:28:20', NULL, NULL, 1),
(56, 'TR00056', '2019-11-05', 'Out Cash', '', 1, 'Tang thaka- Elish 2 ta', '0.00', '2100.00', 'a', 'London ', '2019-11-26 16:29:51', 'London ', '2019-11-26 16:31:41', 1),
(57, 'TR00057', '2019-11-05', 'Out Cash', '', 1, 'Tng thaka- Baush fish 1ps.', '0.00', '1240.00', 'a', 'London ', '2019-11-26 16:31:12', NULL, NULL, 1),
(58, 'TR00058', '2019-11-06', 'Out Cash', '', 5, 'petrol. ( full tnk) tng.', '0.00', '850.00', 'a', 'London ', '2019-11-28 16:49:32', NULL, NULL, 1),
(59, 'TR00059', '2019-11-06', 'Out Cash', '', 2, 'nido, onion, etc...', '0.00', '1150.00', 'a', 'London ', '2019-11-28 16:50:21', NULL, NULL, 1),
(60, 'TR00060', '2019-11-06', 'Out Cash', '', 2, 'baby past, medcin.', '0.00', '165.00', 'a', 'London ', '2019-11-28 16:54:49', NULL, NULL, 1),
(61, 'TR00061', '2019-11-06', 'Out Cash', '', 1, 'gangi 2ta, g-chill, veg, etc....', '0.00', '295.00', 'a', 'London ', '2019-11-28 16:56:29', NULL, NULL, 1),
(62, 'TR00062', '2019-11-06', 'Out Cash', '', 9, 'scn cmt laver bill.', '0.00', '600.00', 'a', 'London ', '2019-11-28 16:58:11', NULL, NULL, 1),
(63, 'TR00063', '2019-11-07', 'Out Cash', '', 12, 'Internet bill.', '0.00', '1000.00', 'a', 'London ', '2019-11-28 17:05:20', NULL, NULL, 1),
(64, 'TR00064', '2019-11-07', 'Out Cash', '', 12, 'thndo tea bill.', '0.00', '150.00', 'a', 'London ', '2019-11-28 17:05:53', NULL, NULL, 1),
(65, 'TR00065', '2019-11-07', 'Out Cash', '', 6, 'oliv oil,sampo,bread,crim,soji,ceralac,solt,onion.', '0.00', '1980.00', 'a', 'London ', '2019-11-28 17:15:37', NULL, NULL, 1),
(66, 'TR00066', '2019-11-08', 'Out Cash', '', 12, 'sano bi, Dokan bara.', '0.00', '6500.00', 'a', 'London ', '2019-11-28 17:17:31', NULL, NULL, 1),
(67, 'TR00067', '2019-11-08', 'Out Cash', '', 2, 'Dear Ball 1ps,', '0.00', '130.00', 'a', 'London ', '2019-11-28 17:18:33', NULL, NULL, 1),
(68, 'TR00068', '2019-11-08', 'Out Cash', '', 6, 'bread, coile, sugur,', '0.00', '195.00', 'a', 'London ', '2019-11-28 17:20:02', NULL, NULL, 1),
(69, 'TR00069', '2019-11-09', 'Out Cash', '', 1, 'Dish Bill.', '0.00', '200.00', 'a', 'London ', '2019-11-28 17:20:56', NULL, NULL, 1),
(70, 'TR00070', '2019-11-09', 'Out Cash', '', 12, 'Basa Bara Bill.', '0.00', '4100.00', 'a', 'London ', '2019-11-28 17:22:05', NULL, NULL, 1),
(71, 'TR00071', '2019-11-09', 'Out Cash', '', 9, 'shah cmt laber bill.', '0.00', '450.00', 'a', 'London ', '2019-11-28 17:22:53', NULL, NULL, 1),
(72, 'TR00072', '2019-11-10', 'Out Cash', '', 7, 'Hafiz Madrasha exim gift.', '0.00', '1380.00', 'a', 'London ', '2019-11-28 17:24:29', 'London ', '2019-11-28 17:28:40', 1),
(73, 'TR00073', '2019-11-10', 'Out Cash', '', 2, 'Prima, Banana, small Baby 2ps pant. ', '0.00', '680.00', 'a', 'London ', '2019-11-28 17:26:32', 'London ', '2019-11-28 17:28:55', 1),
(74, 'TR00074', '2019-11-10', 'Out Cash', '', 1, 'Garlick, Deshilou.', '0.00', '135.00', 'a', 'London ', '2019-11-28 17:27:46', 'London ', '2019-11-28 17:29:07', 1),
(75, 'TR00075', '2019-11-11', 'Out Cash', '', 3, 'etc....', '0.00', '500.00', 'a', 'London ', '2019-11-28 17:30:16', NULL, NULL, 1),
(76, 'TR00076', '2019-11-11', 'Out Cash', '', 1, 'follcopy, poty fish 3kg.', '0.00', '870.00', 'a', 'London ', '2019-11-28 17:31:21', NULL, NULL, 1),
(77, 'TR00077', '2019-11-11', 'Out Cash', '', 5, 'wash', '0.00', '70.00', 'a', 'London ', '2019-11-28 17:31:55', NULL, NULL, 1),
(78, 'TR00078', '2019-11-12', 'Out Cash', '', 4, 'top up', '0.00', '133.00', 'a', 'London ', '2019-11-28 17:33:07', NULL, NULL, 1),
(79, 'TR00079', '2019-11-13', 'Out Cash', '', 5, 'BRTA Tng- (Dr Licence). ALAMIN.', '0.00', '7000.00', 'a', 'London ', '2019-11-28 17:34:55', NULL, NULL, 1),
(80, 'TR00080', '2019-11-14', 'Out Cash', '', 12, 'Tea bill, (walton)', '0.00', '65.00', 'a', 'London ', '2019-11-28 17:37:45', NULL, NULL, 1),
(81, 'TR00081', '2019-11-14', 'Out Cash', '', 12, 'Elictic bill. (Doken)', '0.00', '280.00', 'a', 'London ', '2019-11-28 17:38:22', 'London ', '2019-11-28 17:48:11', 1),
(82, 'TR00082', '2019-11-14', 'Out Cash', '', 12, 'cng bill.', '0.00', '40.00', 'a', 'London ', '2019-11-28 17:39:05', NULL, NULL, 1),
(83, 'TR00083', '2019-11-14', 'Out Cash', '', 12, 'lunch bill.', '0.00', '480.00', 'a', 'London ', '2019-11-28 18:01:53', NULL, NULL, 1),
(84, 'TR00084', '2019-11-14', 'Out Cash', '', 12, 'thando tea bill.', '0.00', '120.00', 'a', 'London ', '2019-11-28 18:35:32', NULL, NULL, 1),
(85, 'TR00085', '2019-11-15', 'Out Cash', '', 2, 'Nidoo, banana, etc....', '0.00', '510.00', 'a', 'London ', '2019-11-28 18:36:32', NULL, NULL, 1),
(86, 'TR00086', '2019-11-16', 'Out Cash', '', 2, 'cerlac,soji.', '0.00', '400.00', 'a', 'London ', '2019-11-28 18:38:16', NULL, NULL, 1),
(87, 'TR00087', '2019-11-16', 'Out Cash', '', 1, 'fullcopy.', '0.00', '70.00', 'a', 'London ', '2019-11-28 18:38:49', NULL, NULL, 1),
(88, 'TR00088', '2019-11-17', 'Out Cash', '', 12, 'Basa meter top-up.', '0.00', '500.00', 'a', 'London ', '2019-11-28 18:40:19', NULL, NULL, 1),
(89, 'TR00089', '2019-11-17', 'Out Cash', '', 12, 'cng sp.', '0.00', '65.00', 'a', 'London ', '2019-11-28 18:40:45', NULL, NULL, 1),
(90, 'TR00090', '2019-11-17', 'Out Cash', '', 2, 'prima 1ps.', '0.00', '525.00', 'a', 'London ', '2019-11-28 18:41:33', NULL, NULL, 1),
(91, 'TR00091', '2019-11-17', 'Out Cash', '', 1, 'Bazar.', '0.00', '315.00', 'a', 'London ', '2019-11-28 18:41:57', NULL, NULL, 1),
(92, 'TR00092', '2019-11-18', 'Out Cash', '', 1, 'Bare (LP GAS)', '0.00', '1000.00', 'a', 'London ', '2019-11-28 18:42:53', NULL, NULL, 1),
(93, 'TR00093', '2019-11-18', 'Out Cash', '', 1, 'Milk bill.', '0.00', '200.00', 'a', 'London ', '2019-11-28 18:44:43', NULL, NULL, 1),
(94, 'TR00094', '2019-11-18', 'Out Cash', '', 3, 'etc....', '0.00', '300.00', 'a', 'London ', '2019-11-28 18:47:29', NULL, NULL, 1),
(95, 'TR00095', '2019-11-19', 'Out Cash', '', 8, '13 ton, speed 3ps.', '0.00', '2675.00', 'a', 'London ', '2019-11-28 18:49:55', NULL, NULL, 1),
(96, 'TR00096', '2019-11-19', 'Out Cash', '', 9, 'scn cmt-399 bg.', '0.00', '1200.00', 'a', 'London ', '2019-11-28 18:50:58', NULL, NULL, 1),
(97, 'TR00097', '2019-11-19', 'Out Cash', '', 1, 'dall,salt,suger,donga,dore,donga.', '0.00', '280.00', 'a', 'London ', '2019-11-28 18:53:17', NULL, NULL, 1),
(98, 'TR00098', '2019-11-20', 'Out Cash', '', 12, 'cng bill.', '0.00', '80.00', 'a', 'London ', '2019-11-28 18:54:17', NULL, NULL, 1),
(99, 'TR00099', '2019-11-20', 'Out Cash', '', 12, 'onik boksish, lunch 2pr.', '0.00', '875.00', 'a', 'London ', '2019-11-28 18:55:36', NULL, NULL, 1),
(100, 'TR00100', '2019-11-20', 'Out Cash', '', 1, 'morgi, lou, etc....', '0.00', '500.00', 'a', 'London ', '2019-11-28 18:56:42', NULL, NULL, 1),
(101, 'TR00101', '2019-11-20', 'Out Cash', '', 9, 'Insee cmt bill.', '0.00', '600.00', 'a', 'London ', '2019-11-28 18:57:34', NULL, NULL, 1),
(102, 'TR00102', '2019-11-21', 'Out Cash', '', 12, 'jomi mouza map, etc....', '0.00', '210.00', 'a', 'London ', '2019-11-28 18:59:39', NULL, NULL, 1),
(103, 'TR00103', '2019-11-21', 'Out Cash', '', 6, 'Bread, M\'oil, Egg 1kes.', '0.00', '390.00', 'a', 'London ', '2019-11-28 19:01:10', NULL, NULL, 1),
(104, 'TR00104', '2019-11-22', 'Out Cash', '', 12, 'cng sp, Coff bill.', '0.00', '115.00', 'a', 'London ', '2019-11-28 19:02:01', 'London ', '2019-11-28 19:03:20', 1),
(105, 'TR00105', '2019-11-22', 'Out Cash', '', 2, 'Prim, Ceralec, small baby Jaket.', '0.00', '1385.00', 'a', 'London ', '2019-11-28 19:05:19', NULL, NULL, 1),
(106, 'TR00106', '2019-11-22', 'Out Cash', '', 9, 'megna dlx laber bill.', '0.00', '600.00', 'a', 'London ', '2019-11-28 19:06:37', NULL, NULL, 1),
(107, 'TR00107', '2019-11-23', 'Out Cash', '', 10, 'jomi babod koroch.', '0.00', '250.00', 'a', 'London ', '2019-11-28 19:08:21', 'London ', '2019-11-28 19:08:44', 1),
(108, 'TR00108', '2019-11-23', 'Out Cash', '', 4, 'Lunch', '0.00', '190.00', 'a', 'London ', '2019-11-28 19:09:40', NULL, NULL, 1),
(109, 'TR00109', '2019-11-24', 'Out Cash', '', 4, 'dinr ', '0.00', '180.00', 'a', 'London ', '2019-11-28 19:10:44', NULL, NULL, 1),
(110, 'TR00110', '2019-11-25', 'Out Cash', '', 4, 'Ariyen, me. ( houmeo) ktupor.', '0.00', '500.00', 'a', 'London ', '2019-11-28 19:12:29', NULL, NULL, 1),
(111, 'TR00111', '2019-11-25', 'Out Cash', '', 12, 'b\'fast, cctv bill, cng, sosor bare miste bill.', '0.00', '410.00', 'a', 'London ', '2019-11-28 19:14:12', NULL, NULL, 1),
(112, 'TR00112', '2019-11-26', 'Out Cash', '', 3, 'cng ', '0.00', '200.00', 'a', 'London ', '2019-11-28 19:15:17', NULL, NULL, 1),
(113, 'TR00113', '2019-11-26', 'Out Cash', '', 5, '2ps tyre,', '0.00', '7500.00', 'a', 'London ', '2019-11-28 19:16:15', NULL, NULL, 1),
(114, 'TR00114', '2019-11-26', 'Out Cash', '', 2, 'Nidoo, lunch, ', '0.00', '350.00', 'a', 'London ', '2019-11-28 19:17:10', NULL, NULL, 1),
(115, 'TR00115', '2019-11-26', 'Out Cash', '', 1, 'Tomato,g\'chill,etc,,,,,,,', '0.00', '180.00', 'a', 'London ', '2019-11-28 19:18:08', NULL, NULL, 1),
(116, 'TR00116', '2019-11-27', 'Out Cash', '', 3, 'cng arif.', '0.00', '200.00', 'a', 'London ', '2019-11-28 19:19:12', 'London ', '2019-11-30 10:06:59', 1),
(117, 'TR00117', '2019-11-27', 'Out Cash', '', 5, 'Tyre fiting bill.', '0.00', '200.00', 'a', 'London ', '2019-11-28 19:19:49', NULL, NULL, 1),
(118, 'TR00118', '2019-11-27', 'Out Cash', '', 1, '3kg sorpoty, onion, follcopy, kocho,data.', '0.00', '820.00', 'a', 'London ', '2019-11-28 19:21:28', NULL, NULL, 1),
(119, 'TR00119', '2019-11-27', 'Out Cash', '', 10, 'Motre  bill, (Bare mother)', '0.00', '200.00', 'a', 'London ', '2019-11-28 19:22:27', NULL, NULL, 1),
(120, 'TR00120', '2019-11-29', 'Out Cash', '', 2, 'Medcin', '0.00', '150.00', 'a', 'London ', '2019-11-30 10:03:48', NULL, NULL, 1),
(121, 'TR00121', '2019-11-29', 'Out Cash', '', 3, 'Max fair-2ps, Handwash.', '0.00', '300.00', 'a', 'London ', '2019-11-30 10:04:59', NULL, NULL, 1),
(122, 'TR00122', '2019-11-28', 'Out Cash', '', 12, 'Thando tea bill.', '0.00', '100.00', 'a', 'London ', '2019-11-30 10:07:54', NULL, NULL, 1),
(123, 'TR00123', '2019-11-28', 'Out Cash', '', 5, 'sopna filing stc. (petrole)', '0.00', '100.00', 'a', 'London ', '2019-11-30 10:08:49', NULL, NULL, 1),
(124, 'TR00124', '2019-11-28', 'Out Cash', '', 1, 'suger 1kg', '0.00', '60.00', 'a', 'London ', '2019-11-30 10:09:21', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checks`
--

DROP TABLE IF EXISTS `tbl_checks`;
CREATE TABLE IF NOT EXISTS `tbl_checks` (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cus_id` int(20) DEFAULT NULL,
  `SM_id` int(20) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(250) DEFAULT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `check_no` varchar(250) DEFAULT NULL,
  `check_amount` decimal(18,2) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `check_date` timestamp NULL DEFAULT NULL,
  `remid_date` timestamp NULL DEFAULT NULL,
  `sub_date` timestamp NULL DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `check_status` char(5) DEFAULT 'Pe' COMMENT 'Pe =Pending, Pa = Paid',
  `status` char(5) NOT NULL DEFAULT 'a',
  `created_by` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `branch_id` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_color`
--

DROP TABLE IF EXISTS `tbl_color`;
CREATE TABLE IF NOT EXISTS `tbl_color` (
  `color_SiNo` int(11) NOT NULL AUTO_INCREMENT,
  `color_name` varchar(100) NOT NULL,
  `status` char(2) NOT NULL,
  PRIMARY KEY (`color_SiNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

DROP TABLE IF EXISTS `tbl_company`;
CREATE TABLE IF NOT EXISTS `tbl_company` (
  `Company_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `Company_Name` varchar(150) NOT NULL,
  `Repot_Heading` text NOT NULL,
  `Company_Logo_org` varchar(250) NOT NULL,
  `Company_Logo_thum` varchar(250) NOT NULL,
  `Invoice_Type` int(11) NOT NULL,
  `Currency_Name` varchar(50) DEFAULT NULL,
  `Currency_Symbol` varchar(10) DEFAULT NULL,
  `SubCurrency_Name` varchar(50) DEFAULT NULL,
  `print_type` int(11) NOT NULL,
  `company_BrunchId` int(11) NOT NULL,
  PRIMARY KEY (`Company_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`Company_SlNo`, `Company_Name`, `Repot_Heading`, `Company_Logo_org`, `Company_Logo_thum`, `Invoice_Type`, `Currency_Name`, `Currency_Symbol`, `SubCurrency_Name`, `print_type`, `company_BrunchId`) VALUES
(1, 'M/S London Steel Corporation', 'Kachoua Road, Shakipor. Tangail.\r\nmobile : 01670050888, \r\nbkash : 01912915230 (Personal)', 'Screenshot_1.png', 'Screenshot_1.png', 1, NULL, NULL, NULL, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

DROP TABLE IF EXISTS `tbl_country`;
CREATE TABLE IF NOT EXISTS `tbl_country` (
  `Country_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Country_SlNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currentinventory`
--

DROP TABLE IF EXISTS `tbl_currentinventory`;
CREATE TABLE IF NOT EXISTS `tbl_currentinventory` (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `purchase_quantity` float NOT NULL,
  `purchase_return_quantity` float NOT NULL,
  `sales_quantity` float NOT NULL,
  `sales_return_quantity` float NOT NULL,
  `damage_quantity` float NOT NULL,
  `transfer_from_quantity` float NOT NULL,
  `transfer_to_quantity` float NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`inventory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_currentinventory`
--

INSERT INTO `tbl_currentinventory` (`inventory_id`, `product_id`, `purchase_quantity`, `purchase_return_quantity`, `sales_quantity`, `sales_return_quantity`, `damage_quantity`, `transfer_from_quantity`, `transfer_to_quantity`, `branch_id`) VALUES
(1, 7, 200, 0, -10, 0, 0, 0, 0, 1),
(2, 6, 1399, 828, 0, 0, 0, 0, 0, 1),
(3, 1, 5000, 0, 0, 0, 0, 0, 0, 1),
(4, 2, 15000, 0, 0, 0, 0, 0, 0, 1),
(5, 3, 3000, 0, 0, 0, 0, 0, 0, 1),
(6, 4, 14000, 0, -225.7, 0, 0, 0, 0, 1),
(7, 5, 2000, 0, -75.8, 0, 0, 0, 0, 1),
(8, 8, 350, 0, 0, 0, 0, 0, 0, 1),
(9, 9, 100, 0, 0, 0, 0, 0, 0, 1),
(10, 11, 600, 0, -1, 0, 0, 0, 0, 1),
(11, 12, 419, 0, -1, 0, 0, 0, 0, 1),
(12, 13, 120, 0, 0, 0, 0, 0, 0, 1),
(13, 0, 200, 0, 0, 0, 0, 0, 0, 1),
(14, 10, 200, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE IF NOT EXISTS `tbl_customer` (
  `Customer_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_Code` varchar(50) NOT NULL,
  `Customer_Name` varchar(150) NOT NULL,
  `Customer_Type` varchar(50) NOT NULL,
  `Customer_Phone` varchar(50) NOT NULL,
  `Customer_Mobile` varchar(15) NOT NULL,
  `Customer_Email` varchar(50) NOT NULL,
  `Customer_OfficePhone` varchar(50) NOT NULL,
  `Customer_Address` varchar(300) NOT NULL,
  `owner_name` varchar(250) DEFAULT NULL,
  `Country_SlNo` int(11) NOT NULL,
  `area_ID` int(11) NOT NULL,
  `Customer_Web` varchar(50) NOT NULL,
  `Customer_Credit_Limit` decimal(18,2) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Customer_brunchid` int(11) NOT NULL,
  PRIMARY KEY (`Customer_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`Customer_SlNo`, `Customer_Code`, `Customer_Name`, `Customer_Type`, `Customer_Phone`, `Customer_Mobile`, `Customer_Email`, `Customer_OfficePhone`, `Customer_Address`, `owner_name`, `Country_SlNo`, `area_ID`, `Customer_Web`, `Customer_Credit_Limit`, `previous_due`, `image_name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Customer_brunchid`) VALUES
(1, 'C00001', 'General Customar', 'retail', '', '0', '', '', '', '', 0, 4, '', '0.00', '0.00', NULL, 'd', 'London ', '2019-11-15 09:27:30', NULL, NULL, 1),
(60, 'C00002', 'Md. Samad', 'retail', '', '01731562016', '', '', 'sikder Road, Sakhipur', 'Prof. Joynal', 0, 1, '', '10000000.00', '0.00', NULL, 'a', 'London ', '2019-11-20 13:33:42', NULL, NULL, 1),
(61, 'C00061', 'Md. Taijul ( Raz )', 'retail', '', '01705605673', '', '', 'hazi chowrasta,sakhipur', 'Ms. Morzina', 0, 2, '', '1000000.00', '0.00', NULL, 'a', 'London ', '2019-11-20 14:47:06', 'London ', '2019-11-20 14:47:23', 1),
(62, 'C00062', 'Md Salauddin', 'G', '', '', '', '', 'Walton plaza', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 14:49:30', NULL, NULL, 1),
(63, 'C00063', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 14:49:57', NULL, NULL, 1),
(64, 'C00064', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 14:50:29', NULL, NULL, 1),
(65, 'C00065', 'Md. Israfel ( poultry )', 'retail', '', '01814250330', '', '', 'Kochua Road, Sakhipur', 'Taijul', 0, 2, '', '1000000.00', '0.00', NULL, 'a', 'London ', '2019-11-20 14:55:07', 'London ', '2019-11-21 13:49:26', 1),
(66, 'C00066', 'Md. Lokman (mamo)', 'retail', '', '01708990312', '', '', 'Alfa Road, shakipur.', 'Md. Lokman', 0, 2, '', '1000000.00', '43123.00', NULL, 'a', 'London ', '2019-11-20 14:58:34', 'London ', '2019-11-21 12:08:48', 1),
(67, 'C00067', 'Md.Rozob Ali (bira)', 'retail', '', '01818766470', '', '', 'sikder Road', 'Rozob Ali', 0, 2, '', '1000000.00', '549017.00', NULL, 'a', 'London ', '2019-11-20 15:07:39', 'London ', '2019-11-21 12:07:46', 1),
(68, 'C00068', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 15:12:36', NULL, NULL, 1),
(69, 'C00069', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 15:15:43', NULL, NULL, 1),
(70, 'C00070', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 15:16:32', NULL, NULL, 1),
(71, 'C00071', 'Md. Rezaul Islam', 'retail', '', '01777702140', '', '', 'sikde Road, sakhipur', 'Hazi Abdul Bari', 0, 2, '', '1000000.00', '0.00', NULL, 'a', 'London ', '2019-11-20 15:19:14', NULL, NULL, 1),
(72, 'C00072', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 15:27:09', NULL, NULL, 1),
(73, 'C00073', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 15:32:10', NULL, NULL, 1),
(74, 'C00074', 'Md. Salauddin', 'G', '', '', '', '', 'Walton showroom', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 15:35:26', 'London ', '2019-11-20 15:35:51', 1),
(75, 'C00075', 'Al-Haz Akabbor Ali', 'retail', '', '01733979880', '', '', 'Bhai Bhai Hall', 'Bhai Bhai Hall', 0, 2, '', '1000000.00', '69122.00', NULL, 'a', 'London ', '2019-11-20 15:38:27', 'London ', '2019-11-21 17:56:49', 1),
(76, 'C00076', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 15:39:33', 'London ', '2019-11-20 15:40:11', 1),
(77, 'C00077', 'Hazi Abdur Rashid ( Adv: Monjil )', 'retail', '', '01716531413', '', '', 'Adibari Road, sakhipur', 'Hazi Abdur Rashid', 0, 2, '', '1000000.00', '151830.00', NULL, 'a', 'London ', '2019-11-20 15:54:57', 'London ', '2019-11-21 13:08:33', 1),
(78, 'C00078', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 15:59:10', NULL, NULL, 1),
(79, 'C00079', 'Hazi Siraz', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 15:59:56', NULL, NULL, 1),
(80, 'C00080', 'siful. (owman)', 'G', '', '', '', '', 'bibi hall, skp.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 18:04:02', NULL, NULL, 1),
(81, 'C00081', 'shop sale', 'G', '', '', '', '', 'dokan', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 18:12:38', NULL, NULL, 1),
(82, 'C00082', 'salaudd', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 18:32:24', NULL, NULL, 1),
(83, 'C00083', 'md', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 18:33:43', NULL, NULL, 1),
(84, 'C00084', 'aziz bander', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 18:35:26', NULL, NULL, 1),
(85, 'C00085', 'Md. sgjk', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 18:47:50', NULL, NULL, 1),
(86, 'C00086', 'aziz bander', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-20 18:51:50', NULL, NULL, 1),
(87, 'C00087', 'salauddin', 'G', '', '', '', '', 'walton', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 11:16:33', NULL, NULL, 1),
(88, 'C00088', 'salauddin', 'G', '', '', '', '', 'walton', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 11:19:13', NULL, NULL, 1),
(89, 'C00089', 'md', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 11:20:17', NULL, NULL, 1),
(90, 'C00090', 'md jolil bi', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 11:54:32', NULL, NULL, 1),
(91, 'C00091', 'Md. jalil bi (LGD).', 'retail', '', '01716373959', '', '', 'rofiqrazo goli.', 'md. jalil', 0, 2, '', '10000000.00', '50890.00', NULL, 'a', 'London ', '2019-11-21 12:54:32', NULL, NULL, 1),
(92, 'C00092', 'siful (bibi hall)', 'G', '', '', '', '', 'owman', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 12:59:07', NULL, NULL, 1),
(93, 'C00093', 'salauddin', 'G', '', '', '', '', 'walton', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 13:01:27', NULL, NULL, 1),
(94, 'C00094', 'hazi mozibor', 'G', '', '', '', '', 'mosq, (donat)', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 13:13:15', NULL, NULL, 1),
(95, 'C00095', 'mosaref bi.', 'G', '', '', '', '', 'kca rod.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 13:15:39', NULL, NULL, 1),
(96, 'C00096', 'Md. (Tigr) Nazrul islam.', 'retail', '', '01716555900', '', '', 'sikder road, shakipur,', 'Hazi sorafot ali.', 0, 2, '', '10000000.00', '193799.00', NULL, 'a', 'London ', '2019-11-21 13:48:41', NULL, NULL, 1),
(97, 'C00097', 'md', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 13:56:48', NULL, NULL, 1),
(98, 'C00098', 'md niz', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 13:58:15', NULL, NULL, 1),
(99, 'C00099', 'mofi', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 15:53:23', NULL, NULL, 1),
(100, 'C00100', 'salf.', 'G', '', '', '', '', 'shop sale.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 16:38:13', NULL, NULL, 1),
(101, 'C00101', 'nizam bi', 'G', '', '', '', '', 'b comm', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 16:45:30', NULL, NULL, 1),
(102, 'C00102', 'salauddin', 'G', '', '', '', '', 'walton', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 16:51:00', NULL, NULL, 1),
(103, 'C00103', 'Md. Alamin bi (sir)', 'retail', '', '01716423793', '', '', 'mill par. shakipor.', 'md. almin.', 0, 2, '', '1000000.00', '32759.00', NULL, 'a', 'London ', '2019-11-21 17:45:57', NULL, NULL, 1),
(104, 'C00104', 'md,ffui', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 17:51:20', NULL, NULL, 1),
(105, 'C00105', 'md.mamon', 'G', '', '', '', '', 'b;commm', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 18:44:53', NULL, NULL, 1),
(106, 'C00106', 'md', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-21 18:45:36', NULL, NULL, 1),
(107, 'C00107', 'md.gu', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-22 11:22:36', NULL, NULL, 1),
(108, 'C00108', 'md.si', 'G', '', '', '', '', 'mill par.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-22 11:31:33', NULL, NULL, 1),
(109, 'C00109', 'md,jhi', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-22 11:36:36', NULL, NULL, 1),
(110, 'C00110', 'saqat', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-22 11:37:31', NULL, NULL, 1),
(111, 'C00111', 'hayete', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-22 11:39:48', NULL, NULL, 1),
(112, 'C00112', 'md', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-22 11:41:07', NULL, NULL, 1),
(113, 'C00113', 'baitol asla mosq.', 'G', '', '', '', '', 'mill par.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-22 11:53:59', NULL, NULL, 1),
(114, 'C00114', 'siful (woman)', 'G', '', '', '', '', 'bibi hall.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-22 11:56:15', NULL, NULL, 1),
(115, 'C00115', 'Hazi Abdus Sabur (bander)', 'retail', '', '01740642078', '', '01724418453', 'Batazor road, Shakipur.', 'Md. jamal (sir)', 0, 2, '', '10000000000.00', '0.00', NULL, 'a', 'London ', '2019-11-22 12:23:58', NULL, NULL, 1),
(116, 'C00116', 'nanoo', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-23 10:12:01', NULL, NULL, 1),
(117, 'C00117', 'sajol', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-23 10:22:37', NULL, NULL, 1),
(118, 'C00118', 'salf', 'G', '', '', '', '', 'shop sall.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-23 10:24:52', NULL, NULL, 1),
(119, 'C00119', 'sabus', 'G', '', '', '', '', 'captin more.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-23 10:43:34', NULL, NULL, 1),
(120, 'C00120', 'motire sir', 'G', '', '', '', '', 'k road.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-23 11:23:36', NULL, NULL, 1),
(121, 'C00121', 'shan mia', 'G', '', '', '', '', 'mojib colag road.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-23 11:26:00', NULL, NULL, 1),
(122, 'C00122', 'md', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-23 11:33:43', NULL, NULL, 1),
(123, 'C00123', 'nizam bi', 'G', '', '', '', '', 'b, commis', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-23 11:37:50', NULL, NULL, 1),
(124, 'C00124', 'sabus', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-23 12:32:15', NULL, NULL, 1),
(125, 'C00125', 'md', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-23 12:35:37', NULL, NULL, 1),
(126, 'C00126', 'Md. Shajahan ', 'G', '', '', '', '', 'dauigi.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-23 13:35:49', NULL, NULL, 1),
(127, 'C00127', 'Dr. Moshraf Hossain.', 'retail', '', '01716956140', '', '', 'Sikder road, shakipur.', 'md. hobbi D\'bi', 0, 2, '', '1000000000.00', '0.00', NULL, 'a', 'London ', '2019-11-23 14:19:06', NULL, NULL, 1),
(128, 'C00128', 'sodus', 'G', '', '', '', '', 'mill par, captin mor.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-24 14:16:43', NULL, NULL, 1),
(129, 'C00129', 'abdul hai.', 'G', '', '', '', '', 'kirton kola.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-24 19:05:01', NULL, NULL, 1),
(130, 'C00130', 'Md. Jahid bi', 'G', '', '', '', '', 'cow farm, s, road.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-24 19:06:42', NULL, NULL, 1),
(131, 'C00131', 'Md. salauddin', 'G', '', '', '', '', 'woltan', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-24 19:16:20', NULL, NULL, 1),
(132, 'C00132', 'md', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-24 19:20:20', 'London ', '2019-11-24 19:25:19', 1),
(133, 'C00133', 'nizam bi', 'G', '', '', '', '', 'b,commision.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-24 19:22:37', NULL, NULL, 1),
(134, 'C00134', 'Miss: Lovly akter.', 'G', '', '01720212257', '', '', 'bibi hall.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-24 19:33:37', NULL, NULL, 1),
(135, 'C00135', 'Md. lotif bi', 'G', '', '', '', '', 'm/s laya cycel stor,\nkachoua rod', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-25 10:12:11', NULL, NULL, 1),
(136, 'C00136', 'sabus ', 'G', '', '', '', '', 'mill par, captin mor rod.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-26 11:54:48', NULL, NULL, 1),
(137, 'C00137', 'Md. motoir Rahman. (sir)', 'G', '', '', '', '', 'kachoua road. shakipur.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-26 12:08:56', NULL, NULL, 1),
(138, 'C00138', 'Miss: Lovly Akter', 'retail', '', '01310825220', '', '', 'kachoua road, mill par.', 'md. jamal mia.', 0, 2, '', '1000000000.00', '0.00', NULL, 'a', 'London ', '2019-11-26 12:25:31', NULL, NULL, 1),
(139, 'C00139', 'Md. Motair Rahman. (sir)', 'G', '', '', '', '', 'k. road', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-28 16:15:06', NULL, NULL, 1),
(140, 'C00140', 'salf', 'G', '', '', '', '', 'Shop sall.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-28 16:19:29', NULL, NULL, 1),
(141, 'C00141', 'Md. Roshid (fufa)', 'G', '', '', '', '', 'kharta,', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-28 16:31:52', NULL, NULL, 1),
(142, 'C00142', 'Md. Abdur Sabur bi (progoty)', 'G', '', '', '', '', 'k road, (tin)', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-28 16:34:02', NULL, NULL, 1),
(143, 'C00143', 'md', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-28 16:39:02', NULL, NULL, 1),
(144, 'C00144', 'salam', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-28 16:41:57', NULL, NULL, 1),
(145, 'C00145', 'md', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-29 19:38:23', NULL, NULL, 1),
(146, 'C00146', 'sabur bi. (progoti)', 'G', '', '', '', '', 'k road.', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-29 19:40:38', NULL, NULL, 1),
(147, 'C00147', 'Md. Mannan.', 'G', '', '', '', '', 'Singer soroom', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'London ', '2019-11-29 19:41:39', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_payment`
--

DROP TABLE IF EXISTS `tbl_customer_payment`;
CREATE TABLE IF NOT EXISTS `tbl_customer_payment` (
  `CPayment_id` int(11) NOT NULL AUTO_INCREMENT,
  `CPayment_date` date DEFAULT NULL,
  `CPayment_invoice` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `CPayment_customerID` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `CPayment_TransactionType` varchar(20) DEFAULT NULL,
  `CPayment_amount` decimal(18,2) DEFAULT NULL,
  `out_amount` float NOT NULL DEFAULT '0',
  `CPayment_Paymentby` varchar(50) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `CPayment_notes` varchar(225) CHARACTER SET latin1 DEFAULT NULL,
  `CPayment_brunchid` int(11) DEFAULT NULL,
  `CPayment_previous_due` float NOT NULL DEFAULT '0',
  `CPayment_Addby` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `CPayment_AddDAte` date DEFAULT NULL,
  `CPayment_status` varchar(1) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `CPayment_UpdateDAte` date DEFAULT NULL,
  PRIMARY KEY (`CPayment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer_payment`
--

INSERT INTO `tbl_customer_payment` (`CPayment_id`, `CPayment_date`, `CPayment_invoice`, `CPayment_customerID`, `CPayment_TransactionType`, `CPayment_amount`, `out_amount`, `CPayment_Paymentby`, `account_id`, `CPayment_notes`, `CPayment_brunchid`, `CPayment_previous_due`, `CPayment_Addby`, `CPayment_AddDAte`, `CPayment_status`, `update_by`, `CPayment_UpdateDAte`) VALUES
(1, '2019-11-24', 'TR00001', '138', 'CR', '10000.00', 0, 'cash', NULL, 'pay to jamal.', 1, 19442.2, 'London ', '2019-11-26', 'd', NULL, NULL),
(2, '2019-11-29', 'TR00002', '67', 'CR', '450000.00', 0, 'cash', NULL, 'Priv total... (Paid)', 1, 702243, 'London ', '2019-11-30', 'a', 0, '2019-11-30'),
(3, '2019-11-30', 'TR00003', '67', 'CR', '51300.00', 0, 'cash', NULL, 'pay to bira.', 1, 252243, 'London ', '2019-11-30', 'a', 0, '2019-11-30'),
(4, '2019-11-30', 'TR00004', '127', 'CR', '7200.00', 0, 'cash', NULL, 'pay to Dr.', 1, 7190, 'London ', '2019-11-30', 'a', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damage`
--

DROP TABLE IF EXISTS `tbl_damage`;
CREATE TABLE IF NOT EXISTS `tbl_damage` (
  `Damage_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `Damage_InvoiceNo` varchar(50) NOT NULL,
  `Damage_Date` date NOT NULL,
  `Damage_Description` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Damage_brunchid` int(11) NOT NULL,
  PRIMARY KEY (`Damage_SlNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damagedetails`
--

DROP TABLE IF EXISTS `tbl_damagedetails`;
CREATE TABLE IF NOT EXISTS `tbl_damagedetails` (
  `DamageDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `Damage_SlNo` int(11) NOT NULL,
  `Product_SlNo` int(11) NOT NULL,
  `DamageDetails_DamageQuantity` int(11) NOT NULL,
  `damage_amount` float NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`DamageDetails_SlNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

DROP TABLE IF EXISTS `tbl_department`;
CREATE TABLE IF NOT EXISTS `tbl_department` (
  `Department_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `Department_Name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Department_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`Department_SlNo`, `Department_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Sales', 'a', 'London ', '2019-11-26 16:38:40', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designation`
--

DROP TABLE IF EXISTS `tbl_designation`;
CREATE TABLE IF NOT EXISTS `tbl_designation` (
  `Designation_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `Designation_Name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Designation_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_designation`
--

INSERT INTO `tbl_designation` (`Designation_SlNo`, `Designation_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Manager', 'a', 'London ', '2019-11-26 16:38:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

DROP TABLE IF EXISTS `tbl_district`;
CREATE TABLE IF NOT EXISTS `tbl_district` (
  `District_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `District_Name` varchar(50) NOT NULL,
  `status` char(10) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`District_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`District_SlNo`, `District_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Sikdar Road', 'a', 'London ', '2019-11-20 13:27:12', NULL, NULL),
(2, 'Sakhipur, Tangail', 'a', 'London ', '2019-11-20 14:46:24', 'London ', '2019-11-20 14:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

DROP TABLE IF EXISTS `tbl_employee`;
CREATE TABLE IF NOT EXISTS `tbl_employee` (
  `Employee_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `Designation_ID` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  `Employee_ID` varchar(50) NOT NULL,
  `Employee_Name` varchar(150) NOT NULL,
  `Employee_JoinDate` date NOT NULL,
  `Employee_Gender` varchar(20) NOT NULL,
  `Employee_BirthDate` date NOT NULL,
  `Employee_NID` varchar(50) NOT NULL,
  `Employee_ContactNo` varchar(20) NOT NULL,
  `Employee_Email` varchar(50) NOT NULL,
  `Employee_MaritalStatus` varchar(50) NOT NULL,
  `Employee_FatherName` varchar(150) NOT NULL,
  `Employee_MotherName` varchar(150) NOT NULL,
  `Employee_PrasentAddress` text NOT NULL,
  `Employee_PermanentAddress` text NOT NULL,
  `Employee_Pic_org` varchar(250) NOT NULL,
  `Employee_Pic_thum` varchar(250) NOT NULL,
  `salary_range` int(11) NOT NULL,
  `status` char(10) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(50) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(50) NOT NULL,
  `Employee_brinchid` int(11) NOT NULL,
  PRIMARY KEY (`Employee_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`Employee_SlNo`, `Designation_ID`, `Department_ID`, `Employee_ID`, `Employee_Name`, `Employee_JoinDate`, `Employee_Gender`, `Employee_BirthDate`, `Employee_NID`, `Employee_ContactNo`, `Employee_Email`, `Employee_MaritalStatus`, `Employee_FatherName`, `Employee_MotherName`, `Employee_PrasentAddress`, `Employee_PermanentAddress`, `Employee_Pic_org`, `Employee_Pic_thum`, `salary_range`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Employee_brinchid`) VALUES
(1, 1, 1, 'E1001', 'Md. Hazret Ali.', '2019-11-26', 'Male', '2019-11-26', '', '01903272970', '', 'unmarried', '', '', 'Captin more, Shakipur. Tangail.', 'Same.', '', '', 7000, 'a', 'London ', '2019-11-26 16:43:41', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_payment`
--

DROP TABLE IF EXISTS `tbl_employee_payment`;
CREATE TABLE IF NOT EXISTS `tbl_employee_payment` (
  `employee_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `Employee_SlNo` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `month_id` int(11) NOT NULL,
  `payment_amount` decimal(18,2) NOT NULL,
  `deduction_amount` decimal(18,2) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `save_by` char(30) NOT NULL,
  `save_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` int(11) DEFAULT NULL,
  `update_date` varchar(12) NOT NULL,
  `paymentBranch_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_employee_payment`
--

INSERT INTO `tbl_employee_payment` (`employee_payment_id`, `Employee_SlNo`, `payment_date`, `month_id`, `payment_amount`, `deduction_amount`, `status`, `save_by`, `save_date`, `update_by`, `update_date`, `paymentBranch_id`) VALUES
(1, 1, '2019-11-05', 10, '6000.00', '0.00', 'a', '1', '2019-11-26 22:48:31', NULL, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense_head`
--

DROP TABLE IF EXISTS `tbl_expense_head`;
CREATE TABLE IF NOT EXISTS `tbl_expense_head` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_name` varchar(100) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `status` enum('a','d') DEFAULT 'a',
  `saved_by` int(11) DEFAULT NULL,
  `saved_datetime` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_month`
--

DROP TABLE IF EXISTS `tbl_month`;
CREATE TABLE IF NOT EXISTS `tbl_month` (
  `month_id` int(11) NOT NULL AUTO_INCREMENT,
  `month_name` char(30) NOT NULL,
  PRIMARY KEY (`month_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_month`
--

INSERT INTO `tbl_month` (`month_id`, `month_name`) VALUES
(1, 'January.'),
(2, 'February.'),
(3, 'March.'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE IF NOT EXISTS `tbl_product` (
  `Product_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Code` varchar(50) NOT NULL,
  `Product_Name` varchar(150) NOT NULL,
  `ProductCategory_ID` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `size` varchar(11) NOT NULL DEFAULT 'na',
  `vat` float NOT NULL,
  `Product_ReOrederLevel` int(11) NOT NULL,
  `Product_Purchase_Rate` decimal(18,2) NOT NULL,
  `Product_SellingPrice` decimal(18,2) NOT NULL,
  `Product_MinimumSellingPrice` decimal(18,2) NOT NULL,
  `Product_WholesaleRate` decimal(18,2) NOT NULL,
  `one_cartun_equal` varchar(20) NOT NULL,
  `is_service` varchar(10) NOT NULL DEFAULT 'false',
  `Unit_ID` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(100) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `Product_branchid` int(11) NOT NULL,
  PRIMARY KEY (`Product_SlNo`),
  UNIQUE KEY `Product_Code` (`Product_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(1, 'P00001', 'BSRM XT 20mm', 1, 0, 0, 'na', 0, 500, '60.50', '63.00', '0.00', '62.00', '', 'false', 3, 'a', 'London ', '2019-11-20 11:48:32', '', '', 1),
(2, 'P00002', 'BSRM XT 16mm', 1, 0, 0, 'na', 0, 1000, '60.70', '63.00', '0.00', '62.00', '', 'false', 3, 'a', 'London ', '2019-11-20 11:49:10', '', '', 1),
(3, 'P00003', 'BSRM XT 12mm', 1, 0, 0, 'na', 0, 500, '60.50', '63.00', '0.00', '62.00', '', 'false', 3, 'a', 'London ', '2019-11-20 11:49:32', '', '', 1),
(4, 'P00004', 'BSRM XT 10mm', 1, 0, 0, 'na', 0, 1500, '60.70', '63.00', '0.00', '62.00', '', 'false', 3, 'a', 'London ', '2019-11-20 11:50:01', '', '', 1),
(5, 'P00005', 'BSRM XT 08mm', 1, 0, 0, 'na', 0, 500, '60.70', '63.00', '0.00', '62.00', '', 'false', 3, 'a', 'London ', '2019-11-20 11:50:33', '', '', 1),
(6, 'P00006', 'SCAN Cement', 2, 0, 0, 'na', 0, 100, '450.00', '465.00', '0.00', '465.00', '', 'false', 2, 'a', 'London ', '2019-11-20 11:51:56', '', '', 1),
(7, 'P00007', 'HOLCIM Cement', 2, 0, 0, 'na', 0, 100, '460.00', '465.00', '0.00', '460.00', '', 'false', 2, 'a', 'London ', '2019-11-20 11:53:00', '', '', 1),
(8, 'P00008', 'SHAH Cement (SP)', 2, 0, 0, 'na', 0, 100, '432.00', '445.00', '0.00', '440.00', '', 'false', 2, 'a', 'London ', '2019-11-20 11:54:07', '', '', 1),
(9, 'P00009', 'SHAH Cement (PO)', 2, 0, 0, 'na', 0, 50, '412.00', '430.00', '0.00', '420.00', '', 'false', 2, 'a', 'London ', '2019-11-20 11:54:46', '', '', 1),
(10, 'P00010', 'INSEE Cement', 2, 0, 0, 'na', 0, 50, '430.00', '450.00', '0.00', '445.00', '', 'false', 2, 'a', 'London ', '2019-11-20 11:55:38', '', '', 1),
(11, 'P00011', 'FRESH Cement', 2, 0, 0, 'na', 0, 50, '410.00', '440.00', '0.00', '430.00', '', 'false', 2, 'a', 'London ', '2019-11-20 11:56:13', '', '', 1),
(12, 'P00012', 'DELUX Cement', 2, 0, 0, 'na', 0, 50, '405.00', '440.00', '0.00', '430.00', '', 'false', 2, 'a', 'London ', '2019-11-20 11:56:48', '', '', 1),
(13, 'P00013', 'RMC Chemical', 3, 0, 0, 'na', 0, 0, '135.00', '180.00', '0.00', '0.00', '', 'false', 5, 'a', 'London ', '2019-11-20 15:01:47', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productcategory`
--

DROP TABLE IF EXISTS `tbl_productcategory`;
CREATE TABLE IF NOT EXISTS `tbl_productcategory` (
  `ProductCategory_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `ProductCategory_Name` varchar(150) NOT NULL,
  `ProductCategory_Description` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `category_branchid` int(11) NOT NULL,
  PRIMARY KEY (`ProductCategory_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_productcategory`
--

INSERT INTO `tbl_productcategory` (`ProductCategory_SlNo`, `ProductCategory_Name`, `ProductCategory_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `category_branchid`) VALUES
(1, 'Rod', '', 'a', 'London ', '2019-11-20 11:45:09', '', '', 1),
(2, 'Cement', '', 'a', 'London ', '2019-11-20 11:45:19', '', '', 1),
(3, 'Chemical', '', 'a', 'London ', '2019-11-20 15:00:45', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasedetails`
--

DROP TABLE IF EXISTS `tbl_purchasedetails`;
CREATE TABLE IF NOT EXISTS `tbl_purchasedetails` (
  `PurchaseDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `PurchaseMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `PurchaseDetails_TotalQuantity` float NOT NULL,
  `PurchaseDetails_Rate` decimal(18,2) NOT NULL,
  `purchase_cost` decimal(18,2) NOT NULL,
  `PurchaseDetails_Discount` decimal(18,2) NOT NULL,
  `PurchaseDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseDetails_branchID` int(11) NOT NULL,
  PRIMARY KEY (`PurchaseDetails_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchasedetails`
--

INSERT INTO `tbl_purchasedetails` (`PurchaseDetails_SlNo`, `PurchaseMaster_IDNo`, `Product_IDNo`, `PurchaseDetails_TotalQuantity`, `PurchaseDetails_Rate`, `purchase_cost`, `PurchaseDetails_Discount`, `PurchaseDetails_TotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseDetails_branchID`) VALUES
(1, 1, 7, 200, '460.00', '0.00', '0.00', '92000.00', 'a', 'London ', '2019-11-20 12:03:11', NULL, NULL, 1),
(2, 2, 6, 200, '460.00', '0.00', '0.00', '92000.00', 'a', 'London ', '2019-11-20 12:13:41', NULL, NULL, 1),
(3, 3, 1, 1000, '61.50', '0.00', '0.00', '61500.00', 'a', 'London ', '2019-11-20 12:22:48', NULL, NULL, 1),
(4, 3, 2, 5000, '61.50', '0.00', '0.00', '307500.00', 'a', 'London ', '2019-11-20 12:22:48', NULL, NULL, 1),
(5, 3, 3, 1000, '61.50', '0.00', '0.00', '61500.00', 'a', 'London ', '2019-11-20 12:22:48', NULL, NULL, 1),
(6, 3, 4, 5000, '61.50', '0.00', '0.00', '307500.00', 'a', 'London ', '2019-11-20 12:22:48', NULL, NULL, 1),
(7, 3, 5, 1000, '61.50', '0.00', '0.00', '61500.00', 'a', 'London ', '2019-11-20 12:22:48', NULL, NULL, 1),
(8, 4, 1, 4000, '60.50', '0.00', '0.00', '242000.00', 'a', 'London ', '2019-11-20 12:30:44', NULL, NULL, 1),
(9, 4, 2, 4000, '60.50', '0.00', '0.00', '242000.00', 'a', 'London ', '2019-11-20 12:30:44', NULL, NULL, 1),
(10, 4, 3, 2000, '60.50', '0.00', '0.00', '121000.00', 'a', 'London ', '2019-11-20 12:30:44', NULL, NULL, 1),
(11, 4, 4, 3000, '60.50', '0.00', '0.00', '181500.00', 'a', 'London ', '2019-11-20 12:30:44', NULL, NULL, 1),
(12, 5, 2, 6000, '60.70', '0.00', '0.00', '364200.00', 'a', 'London ', '2019-11-20 12:43:05', NULL, NULL, 1),
(13, 5, 4, 6000, '60.70', '0.00', '0.00', '364200.00', 'a', 'London ', '2019-11-20 12:43:05', NULL, NULL, 1),
(14, 5, 5, 1000, '60.70', '0.00', '0.00', '60700.00', 'a', 'London ', '2019-11-20 12:43:05', NULL, NULL, 1),
(16, 7, 8, 200, '432.00', '0.00', '0.00', '86400.00', 'a', 'London ', '2019-11-20 12:54:08', NULL, NULL, 1),
(17, 8, 9, 100, '412.00', '0.00', '0.00', '41200.00', 'a', 'London ', '2019-11-20 12:54:39', NULL, NULL, 1),
(18, 9, 8, 150, '432.00', '0.00', '0.00', '64800.00', 'a', 'London ', '2019-11-20 12:57:41', NULL, NULL, 1),
(19, 10, 11, 200, '410.00', '0.00', '0.00', '82000.00', 'a', 'London ', '2019-11-20 13:01:07', NULL, NULL, 1),
(20, 11, 11, 400, '410.00', '0.00', '0.00', '164000.00', 'a', 'London ', '2019-11-20 13:04:02', NULL, NULL, 1),
(21, 12, 12, 200, '405.00', '0.00', '0.00', '81000.00', 'a', 'London ', '2019-11-20 13:11:20', NULL, NULL, 1),
(22, 13, 6, 142, '465.00', '0.00', '0.00', '65320.00', 'd', 'London ', '2019-11-21 18:22:53', NULL, NULL, 1),
(23, 14, 13, 20, '135.00', '0.00', '0.00', '2700.00', 'a', 'London ', '2019-11-23 11:19:18', NULL, NULL, 1),
(24, 15, 13, 100, '135.00', '0.00', '0.00', '13500.00', 'a', 'London ', '2019-11-23 11:40:16', NULL, NULL, 1),
(27, 18, 6, 400, '450.00', '0.00', '0.00', '180000.00', 'd', 'London ', '2019-11-23 15:21:56', NULL, NULL, 1),
(28, 19, 12, 19, '405.00', '0.00', '0.00', '7695.00', 'a', 'London ', '2019-11-24 18:48:28', NULL, NULL, 1),
(29, 20, 12, 200, '405.00', '0.00', '0.00', '81000.00', 'a', 'London ', '2019-11-24 19:23:35', NULL, NULL, 1),
(30, 21, 10, 200, '430.00', '0.00', '0.00', '86000.00', 'a', 'London ', '2019-11-27 14:42:49', NULL, NULL, 1),
(31, 22, 6, 400, '450.00', '0.00', '0.00', '180000.00', 'a', 'London ', '2019-11-27 16:35:36', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasemaster`
--

DROP TABLE IF EXISTS `tbl_purchasemaster`;
CREATE TABLE IF NOT EXISTS `tbl_purchasemaster` (
  `PurchaseMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `Supplier_SlNo` int(11) NOT NULL,
  `Employee_SlNo` int(11) NOT NULL,
  `PurchaseMaster_InvoiceNo` varchar(50) NOT NULL,
  `PurchaseMaster_OrderDate` date NOT NULL,
  `PurchaseMaster_PurchaseFor` varchar(50) NOT NULL,
  `PurchaseMaster_Description` longtext NOT NULL,
  `PurchaseMaster_TotalAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_DiscountAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_Tax` decimal(18,2) NOT NULL,
  `PurchaseMaster_Freight` decimal(18,2) NOT NULL,
  `PurchaseMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_PaidAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_DueAmount` decimal(18,2) NOT NULL,
  `previous_due` float DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseMaster_BranchID` int(11) NOT NULL,
  PRIMARY KEY (`PurchaseMaster_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchasemaster`
--

INSERT INTO `tbl_purchasemaster` (`PurchaseMaster_SlNo`, `Supplier_SlNo`, `Employee_SlNo`, `PurchaseMaster_InvoiceNo`, `PurchaseMaster_OrderDate`, `PurchaseMaster_PurchaseFor`, `PurchaseMaster_Description`, `PurchaseMaster_TotalAmount`, `PurchaseMaster_DiscountAmount`, `PurchaseMaster_Tax`, `PurchaseMaster_Freight`, `PurchaseMaster_SubTotalAmount`, `PurchaseMaster_PaidAmount`, `PurchaseMaster_DueAmount`, `previous_due`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseMaster_BranchID`) VALUES
(1, 10, 0, '2019000001', '2019-10-20', '1', '', '92000.00', '0.00', '0.00', '0.00', '92000.00', '0.00', '92000.00', 787700, 'a', 'London ', '2019-11-20 12:03:11', NULL, NULL, 1),
(2, 10, 0, '2019000002', '2019-11-06', '1', '', '92000.00', '0.00', '0.00', '0.00', '92000.00', '0.00', '92000.00', 353450, 'a', 'London ', '2019-11-20 12:13:41', NULL, NULL, 1),
(3, 11, 0, '2019000003', '2019-10-19', '1', '', '799500.00', '0.00', '0.00', '0.00', '799500.00', '0.00', '799500.00', -483913, 'a', 'London ', '2019-11-20 12:22:48', 'London ', '2019-11-20 12:23:32', 1),
(4, 11, 0, '2019000004', '2019-11-02', '1', '', '786500.00', '0.00', '0.00', '0.00', '786500.00', '786500.00', '0.00', 132000, 'a', 'London ', '2019-11-20 12:30:44', 'London ', '2019-11-27 18:09:28', 1),
(5, 11, 0, '2019000005', '2019-11-19', '1', '', '789100.00', '0.00', '0.00', '0.00', '789100.00', '0.00', '789100.00', -412300, 'a', 'London ', '2019-11-20 12:43:05', 'London ', '2019-11-27 18:14:53', 1),
(6, 10, 0, '2019000006', '2019-11-19', '1', '', '183540.00', '0.00', '0.00', '0.00', '183540.00', '0.00', '183540.00', 345450, 'd', 'London ', '2019-11-20 12:46:31', 'London ', '2019-11-21 15:56:52', 1),
(7, 12, 0, '2019000007', '2019-10-20', '1', '', '86400.00', '0.00', '0.00', '0.00', '86400.00', '0.00', '86400.00', 255213, 'a', 'London ', '2019-11-20 12:54:08', NULL, NULL, 1),
(8, 12, 0, '2019000008', '2019-11-20', '1', '', '41200.00', '0.00', '0.00', '0.00', '41200.00', '0.00', '41200.00', 341613, 'a', 'London ', '2019-11-20 12:54:39', NULL, NULL, 1),
(9, 12, 0, '2019000009', '2019-11-20', '1', '', '64800.00', '0.00', '0.00', '0.00', '64800.00', '0.00', '64800.00', 301813, 'a', 'London ', '2019-11-20 12:57:41', NULL, NULL, 1),
(10, 13, 0, '2019000010', '2019-10-15', '1', '', '82000.00', '0.00', '0.00', '0.00', '82000.00', '0.00', '82000.00', 200440, 'a', 'London ', '2019-11-20 13:01:07', 'London ', '2019-11-20 13:01:37', 1),
(11, 13, 0, '2019000011', '2019-11-02', '1', '', '164000.00', '0.00', '0.00', '0.00', '164000.00', '0.00', '164000.00', 260440, 'a', 'London ', '2019-11-20 13:04:02', NULL, NULL, 1),
(12, 14, 0, '2019000012', '2019-10-26', '1', '', '81000.00', '0.00', '0.00', '0.00', '81000.00', '0.00', '81000.00', 56000, 'a', 'London ', '2019-11-20 13:11:20', 'London ', '2019-11-25 12:58:51', 1),
(13, 10, 0, '2019000013', '2019-10-19', '1', '', '65320.00', '0.00', '0.00', '0.00', '65320.00', '0.00', '65320.00', 528990, 'd', 'London ', '2019-11-21 18:22:53', NULL, NULL, 1),
(14, 16, 0, '2019000014', '2019-11-23', '1', '', '2700.00', '0.00', '0.00', '0.00', '2700.00', '0.00', '2700.00', 2700, 'a', 'London ', '2019-11-23 11:19:18', NULL, NULL, 1),
(15, 16, 0, '2019000015', '2019-11-19', '1', '', '13500.00', '0.00', '0.00', '0.00', '13500.00', '0.00', '13500.00', 5400, 'a', 'London ', '2019-11-23 11:40:16', NULL, NULL, 1),
(16, 10, 0, '2019000016', '2019-11-19', '1', '', '180000.00', '0.00', '0.00', '0.00', '180000.00', '0.00', '180000.00', 594310, 'd', 'London ', '2019-11-23 11:48:37', 'London ', '2019-11-23 14:44:04', 1),
(17, 17, 0, '2019000017', '2019-11-20', '1', '', '82000.00', '0.00', '0.00', '0.00', '82000.00', '0.00', '82000.00', 0, 'd', 'London ', '2019-11-23 13:52:09', 'London ', '2019-11-23 14:33:39', 1),
(18, 10, 0, '2019000018', '2019-11-19', '1', '', '180000.00', '0.00', '0.00', '0.00', '180000.00', '0.00', '180000.00', 590770, 'd', 'London ', '2019-11-23 15:21:56', NULL, NULL, 1),
(19, 14, 0, '2019000019', '2019-10-19', '1', 'Previs stock.', '7695.00', '0.00', '0.00', '0.00', '7695.00', '7695.00', '0.00', 121370, 'a', 'London ', '2019-11-24 18:48:28', 'London ', '2019-11-25 13:07:39', 1),
(20, 14, 0, '2019000020', '2019-11-23', '1', '', '81000.00', '0.00', '0.00', '0.00', '81000.00', '0.00', '81000.00', 129065, 'a', 'London ', '2019-11-24 19:23:35', NULL, NULL, 1),
(21, 17, 0, '2019000021', '2019-11-20', '1', '', '86000.00', '0.00', '0.00', '0.00', '86000.00', '0.00', '86000.00', 77000, 'a', 'London ', '2019-11-27 14:42:49', NULL, NULL, 1),
(22, 10, 0, '2019000022', '2019-11-19', '1', '', '180000.00', '0.00', '0.00', '0.00', '180000.00', '0.00', '180000.00', 410770, 'a', 'London ', '2019-11-27 16:35:36', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasereturn`
--

DROP TABLE IF EXISTS `tbl_purchasereturn`;
CREATE TABLE IF NOT EXISTS `tbl_purchasereturn` (
  `PurchaseReturn_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `PurchaseMaster_InvoiceNo` varchar(50) NOT NULL,
  `Supplier_IDdNo` int(11) NOT NULL,
  `PurchaseReturn_ReturnDate` date NOT NULL,
  `PurchaseReturn_ReturnAmount` decimal(18,2) NOT NULL,
  `PurchaseReturn_Description` varchar(300) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseReturn_brunchID` int(11) NOT NULL,
  PRIMARY KEY (`PurchaseReturn_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchasereturn`
--

INSERT INTO `tbl_purchasereturn` (`PurchaseReturn_SlNo`, `PurchaseMaster_InvoiceNo`, `Supplier_IDdNo`, `PurchaseReturn_ReturnDate`, `PurchaseReturn_ReturnAmount`, `PurchaseReturn_Description`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseReturn_brunchID`) VALUES
(1, '2019000002', 10, '2019-11-30', '92000.00', '', 'a', 'London ', '2019-11-30 23:07:56', NULL, NULL, 1),
(3, '2019000022', 10, '2019-11-30', '109350.00', '', 'a', 'London ', '2019-11-30 23:18:33', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasereturndetails`
--

DROP TABLE IF EXISTS `tbl_purchasereturndetails`;
CREATE TABLE IF NOT EXISTS `tbl_purchasereturndetails` (
  `PurchaseReturnDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `PurchaseReturn_SlNo` int(11) NOT NULL,
  `PurchaseReturnDetailsProduct_SlNo` int(11) NOT NULL,
  `PurchaseReturnDetails_ReturnQuantity` int(11) NOT NULL,
  `PurchaseReturnDetails_ReturnAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseReturnDetails_brachid` int(11) NOT NULL,
  `purchase_d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`PurchaseReturnDetails_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchasereturndetails`
--

INSERT INTO `tbl_purchasereturndetails` (`PurchaseReturnDetails_SlNo`, `PurchaseReturn_SlNo`, `PurchaseReturnDetailsProduct_SlNo`, `PurchaseReturnDetails_ReturnQuantity`, `PurchaseReturnDetails_ReturnAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseReturnDetails_brachid`, `purchase_d_id`) VALUES
(1, 1, 6, 200, '92000.00', 'a', 'London ', '2019-11-30 23:07:57', NULL, NULL, 1, 2),
(3, 3, 6, 243, '109350.00', 'a', 'London ', '2019-11-30 23:18:33', NULL, NULL, 1, 31);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotaion_customer`
--

DROP TABLE IF EXISTS `tbl_quotaion_customer`;
CREATE TABLE IF NOT EXISTS `tbl_quotaion_customer` (
  `quotation_customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` char(50) NOT NULL,
  `contact_number` varchar(35) NOT NULL,
  `customer_address` text NOT NULL,
  `quation_customer_branchid` int(11) NOT NULL,
  PRIMARY KEY (`quotation_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_details`
--

DROP TABLE IF EXISTS `tbl_quotation_details`;
CREATE TABLE IF NOT EXISTS `tbl_quotation_details` (
  `SaleDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `SaleMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `SaleDetails_TotalQuantity` int(11) NOT NULL,
  `SaleDetails_Rate` decimal(18,2) NOT NULL,
  `SaleDetails_Discount` decimal(18,2) NOT NULL,
  `SaleDetails_Tax` decimal(18,2) NOT NULL,
  `SaleDetails_Freight` decimal(18,2) NOT NULL,
  `SaleDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleDetails_BranchId` int(11) NOT NULL,
  PRIMARY KEY (`SaleDetails_SlNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_master`
--

DROP TABLE IF EXISTS `tbl_quotation_master`;
CREATE TABLE IF NOT EXISTS `tbl_quotation_master` (
  `SaleMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SaleMaster_customer_name` varchar(500) NOT NULL,
  `SaleMaster_customer_mobile` varchar(50) NOT NULL,
  `SaleMaster_customer_address` varchar(1000) NOT NULL,
  `SaleMaster_SaleDate` date NOT NULL,
  `SaleMaster_Description` longtext,
  `SaleMaster_TotalSaleAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TotalDiscountAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TaxAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Freight` decimal(18,2) NOT NULL,
  `SaleMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleMaster_branchid` int(11) NOT NULL,
  PRIMARY KEY (`SaleMaster_SlNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saledetails`
--

DROP TABLE IF EXISTS `tbl_saledetails`;
CREATE TABLE IF NOT EXISTS `tbl_saledetails` (
  `SaleDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `SaleMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `SaleDetails_TotalQuantity` float NOT NULL,
  `Purchase_Rate` decimal(18,2) DEFAULT NULL,
  `SaleDetails_Rate` decimal(18,2) NOT NULL,
  `SaleDetails_Discount` decimal(18,2) NOT NULL,
  `Discount_amount` decimal(18,2) DEFAULT NULL,
  `SaleDetails_Tax` decimal(18,2) NOT NULL,
  `SaleDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleDetails_BranchId` int(11) NOT NULL,
  `purchase_d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`SaleDetails_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_saledetails`
--

INSERT INTO `tbl_saledetails` (`SaleDetails_SlNo`, `SaleMaster_IDNo`, `Product_IDNo`, `SaleDetails_TotalQuantity`, `Purchase_Rate`, `SaleDetails_Rate`, `SaleDetails_Discount`, `Discount_amount`, `SaleDetails_Tax`, `SaleDetails_TotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleDetails_BranchId`, `purchase_d_id`) VALUES
(1, 1, 2, 368.28, '60.70', '63.00', '0.00', NULL, '0.00', '23201.64', 'a', 'London ', '2019-11-20 14:42:51', NULL, NULL, 1, 4),
(2, 1, 1, 406.35, '60.50', '63.00', '0.00', NULL, '0.00', '25600.05', 'a', 'London ', '2019-11-20 14:42:51', NULL, NULL, 1, 3),
(3, 1, 4, 293.7, '60.70', '63.00', '0.00', NULL, '0.00', '18503.10', 'a', 'London ', '2019-11-20 14:42:51', NULL, NULL, 1, 6),
(4, 2, 11, 10, '410.00', '440.00', '0.00', NULL, '0.00', '4400.00', 'a', 'London ', '2019-11-20 14:48:11', NULL, NULL, 1, 19),
(5, 3, 11, 5, '410.00', '440.00', '0.00', NULL, '0.00', '2200.00', 'a', 'London ', '2019-11-20 14:49:30', NULL, NULL, 1, 19),
(6, 4, 12, 1, '405.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-20 14:49:57', NULL, NULL, 1, 21),
(7, 5, 6, 5, '460.00', '470.00', '0.00', NULL, '0.00', '2350.00', 'a', 'London ', '2019-11-20 14:50:30', NULL, NULL, 1, 2),
(8, 6, 11, 10, '410.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-20 14:56:27', NULL, NULL, 1, 19),
(9, 7, 6, 30, '460.00', '465.00', '0.00', NULL, '0.00', '13950.00', 'a', 'London ', '2019-11-20 15:00:02', NULL, NULL, 1, 2),
(10, 8, 3, 147, '60.50', '63.00', '0.00', NULL, '0.00', '9261.00', 'a', 'London ', '2019-11-20 15:11:32', NULL, NULL, 1, 5),
(11, 8, 2, 37.4, '60.70', '63.00', '0.00', NULL, '0.00', '2356.20', 'a', 'London ', '2019-11-20 15:11:32', NULL, NULL, 1, 4),
(12, 8, 4, 72.65, '60.70', '63.00', '0.00', NULL, '0.00', '4576.95', 'a', 'London ', '2019-11-20 15:11:32', NULL, NULL, 1, 6),
(13, 9, 12, 5, '405.00', '430.00', '0.00', NULL, '0.00', '2150.00', 'a', 'London ', '2019-11-20 15:12:36', NULL, NULL, 1, 21),
(14, 10, 9, 10, '412.00', '430.00', '0.00', NULL, '0.00', '4300.00', 'a', 'London ', '2019-11-20 15:13:24', NULL, NULL, 1, 17),
(15, 11, 8, 10, '432.00', '440.00', '0.00', NULL, '0.00', '4400.00', 'a', 'London ', '2019-11-20 15:14:58', NULL, NULL, 1, 16),
(16, 12, 9, 3, '412.00', '425.00', '0.00', NULL, '0.00', '1275.00', 'a', 'London ', '2019-11-20 15:15:43', NULL, NULL, 1, 17),
(17, 13, 8, 1, '432.00', '450.00', '0.00', NULL, '0.00', '450.00', 'a', 'London ', '2019-11-20 15:16:32', NULL, NULL, 1, 16),
(19, 15, 2, 589.8, '60.70', '62.50', '0.00', NULL, '0.00', '36862.50', 'a', 'London ', '2019-11-20 15:23:31', NULL, NULL, 1, 4),
(20, 15, 4, 73.1, '60.70', '62.50', '0.00', NULL, '0.00', '4568.75', 'a', 'London ', '2019-11-20 15:23:31', NULL, NULL, 1, 6),
(21, 15, 1, 233.85, '60.50', '62.50', '0.00', NULL, '0.00', '14615.63', 'a', 'London ', '2019-11-20 15:23:31', NULL, NULL, 1, 3),
(22, 16, 8, 10, '432.00', '440.00', '0.00', NULL, '0.00', '4400.00', 'a', 'London ', '2019-11-20 15:26:21', NULL, NULL, 1, 16),
(23, 17, 8, 8, '432.00', '445.00', '0.00', NULL, '0.00', '3560.00', 'a', 'London ', '2019-11-20 15:27:09', NULL, NULL, 1, 16),
(24, 18, 6, 14, '460.00', '465.00', '0.00', NULL, '0.00', '6510.00', 'a', 'London ', '2019-11-20 15:28:28', NULL, NULL, 1, 2),
(25, 19, 2, 184.25, '60.70', '62.50', '0.00', NULL, '0.00', '11515.63', 'a', 'London ', '2019-11-20 15:29:31', NULL, NULL, 1, 4),
(26, 20, 7, 5, '460.00', '460.00', '0.00', NULL, '0.00', '2300.00', 'a', 'London ', '2019-11-20 15:32:10', NULL, NULL, 1, 1),
(27, 21, 3, 73.15, '60.50', '63.00', '0.00', NULL, '0.00', '4608.45', 'a', 'London ', '2019-11-20 15:34:21', NULL, NULL, 1, 5),
(28, 21, 4, 145.7, '60.70', '63.00', '0.00', NULL, '0.00', '9179.10', 'a', 'London ', '2019-11-20 15:34:21', NULL, NULL, 1, 6),
(29, 22, 11, 5, '410.00', '440.00', '0.00', NULL, '0.00', '2200.00', 'a', 'London ', '2019-11-20 15:35:26', NULL, NULL, 1, 19),
(30, 23, 12, 50, '405.00', '440.00', '0.00', NULL, '0.00', '22000.00', 'a', 'London ', '2019-11-20 15:39:03', NULL, NULL, 1, 21),
(31, 24, 9, 4, '412.00', '425.00', '0.00', NULL, '0.00', '1700.00', 'a', 'London ', '2019-11-20 15:39:33', NULL, NULL, 1, 17),
(32, 25, 9, 20, '412.00', '430.00', '0.00', NULL, '0.00', '8600.00', 'a', 'London ', '2019-11-20 15:41:32', NULL, NULL, 1, 17),
(33, 26, 8, 10, '432.00', '440.00', '0.00', NULL, '0.00', '4400.00', 'a', 'London ', '2019-11-20 15:51:50', NULL, NULL, 1, 16),
(34, 27, 11, 20, '410.00', '440.00', '0.00', NULL, '0.00', '8800.00', 'a', 'London ', '2019-11-20 15:55:27', NULL, NULL, 1, 19),
(35, 28, 2, 368.75, '60.70', '63.00', '0.00', NULL, '0.00', '23231.25', 'a', 'London ', '2019-11-20 15:57:34', NULL, NULL, 1, 4),
(36, 28, 4, 65.4, '60.70', '63.00', '0.00', NULL, '0.00', '4120.20', 'a', 'London ', '2019-11-20 15:57:34', NULL, NULL, 1, 6),
(37, 29, 7, 5, '460.00', '465.00', '0.00', NULL, '0.00', '2325.00', 'a', 'London ', '2019-11-20 15:59:10', NULL, NULL, 1, 1),
(38, 30, 12, 1, '405.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-20 15:59:56', NULL, NULL, 1, 21),
(39, 31, 6, 20, '460.00', '465.00', '0.00', NULL, '0.00', '9300.00', 'a', 'London ', '2019-11-20 17:56:07', NULL, NULL, 1, 2),
(40, 31, 2, 370, '60.70', '63.00', '0.00', NULL, '0.00', '23310.00', 'a', 'London ', '2019-11-20 17:56:07', NULL, NULL, 1, 4),
(42, 33, 8, 6, '432.00', '450.00', '0.00', NULL, '0.00', '2700.00', 'a', 'London ', '2019-11-20 18:04:02', NULL, NULL, 1, 16),
(43, 34, 9, 10, '412.00', '430.00', '0.00', NULL, '0.00', '4300.00', 'a', 'London ', '2019-11-20 18:06:22', NULL, NULL, 1, 17),
(45, 35, 6, 50, '460.00', '465.00', '0.00', NULL, '0.00', '23250.00', 'a', 'London ', '2019-11-20 18:10:36', NULL, NULL, 1, 2),
(46, 36, 11, 1, '410.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-20 18:12:38', NULL, NULL, 1, 19),
(47, 37, 9, 20, '412.00', '420.00', '0.00', NULL, '0.00', '8400.00', 'a', 'London ', '2019-11-20 18:30:56', NULL, NULL, 1, 17),
(48, 38, 11, 5, '410.00', '440.00', '0.00', NULL, '0.00', '2200.00', 'a', 'London ', '2019-11-20 18:32:24', NULL, NULL, 1, 19),
(49, 39, 12, 6, '405.00', '430.00', '0.00', NULL, '0.00', '2580.00', 'a', 'London ', '2019-11-20 18:33:43', NULL, NULL, 1, 21),
(50, 40, 12, 5, '405.00', '440.00', '0.00', NULL, '0.00', '2200.00', 'a', 'London ', '2019-11-20 18:35:26', NULL, NULL, 1, 21),
(51, 41, 4, 70.7, '60.70', '62.50', '0.00', NULL, '0.00', '4418.75', 'a', 'London ', '2019-11-20 18:42:21', NULL, NULL, 1, 6),
(52, 41, 2, 368.75, '60.70', '62.50', '0.00', NULL, '0.00', '23046.88', 'a', 'London ', '2019-11-20 18:42:21', NULL, NULL, 1, 4),
(53, 41, 1, 174.2, '60.50', '62.50', '0.00', NULL, '0.00', '10887.50', 'a', 'London ', '2019-11-20 18:42:21', NULL, NULL, 1, 3),
(54, 42, 12, 1, '405.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-20 18:47:50', NULL, NULL, 1, 21),
(55, 43, 6, 10, '460.00', '465.00', '0.00', NULL, '0.00', '4650.00', 'a', 'London ', '2019-11-20 18:49:09', NULL, NULL, 1, 2),
(56, 44, 5, 14.45, '60.70', '63.00', '0.00', NULL, '0.00', '910.35', 'a', 'London ', '2019-11-20 18:50:52', NULL, NULL, 1, 7),
(57, 45, 12, 1, '405.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-20 18:51:50', NULL, NULL, 1, 21),
(58, 14, 9, 10, '412.00', '430.00', '0.00', NULL, '0.00', '4300.00', 'a', 'London ', '2019-11-21 10:56:24', NULL, NULL, 1, 17),
(59, 32, 8, 4, '432.00', '445.00', '0.00', NULL, '0.00', '1780.00', 'a', 'London ', '2019-11-21 11:04:54', NULL, NULL, 1, 16),
(60, 46, 11, 5, '410.00', '440.00', '0.00', NULL, '0.00', '2200.00', 'a', 'London ', '2019-11-21 11:16:33', NULL, NULL, 1, 19),
(61, 47, 11, 5, '410.00', '440.00', '0.00', NULL, '0.00', '2200.00', 'a', 'London ', '2019-11-21 11:19:13', NULL, NULL, 1, 19),
(62, 48, 8, 2, '432.00', '440.00', '0.00', NULL, '0.00', '880.00', 'a', 'London ', '2019-11-21 11:20:17', NULL, NULL, 1, 16),
(63, 49, 4, 73.05, '60.70', '62.50', '0.00', NULL, '0.00', '4565.63', 'a', 'London ', '2019-11-21 11:32:44', NULL, NULL, 1, 6),
(64, 49, 2, 443.6, '60.70', '62.50', '0.00', NULL, '0.00', '27725.00', 'a', 'London ', '2019-11-21 11:32:44', NULL, NULL, 1, 4),
(65, 49, 1, 57.45, '60.50', '62.50', '0.00', NULL, '0.00', '3590.63', 'a', 'London ', '2019-11-21 11:32:44', NULL, NULL, 1, 3),
(66, 50, 11, 10, '410.00', '440.00', '0.00', NULL, '0.00', '4400.00', 'a', 'London ', '2019-11-21 11:54:32', NULL, NULL, 1, 19),
(67, 51, 11, 10, '410.00', '440.00', '0.00', NULL, '0.00', '4400.00', 'a', 'London ', '2019-11-21 11:57:47', NULL, NULL, 1, 19),
(68, 52, 7, 90, '460.00', '460.00', '0.00', NULL, '0.00', '41400.00', 'a', 'London ', '2019-11-21 12:56:30', NULL, NULL, 1, 1),
(69, 53, 8, 4, '432.00', '440.00', '0.00', NULL, '0.00', '1760.00', 'a', 'London ', '2019-11-21 12:59:07', NULL, NULL, 1, 16),
(70, 54, 11, 2, '410.00', '440.00', '0.00', NULL, '0.00', '880.00', 'a', 'London ', '2019-11-21 13:01:27', NULL, NULL, 1, 19),
(71, 55, 5, 46.9, '60.70', '63.00', '0.00', NULL, '0.00', '2954.70', 'a', 'London ', '2019-11-21 13:05:36', NULL, NULL, 1, 7),
(72, 56, 11, 10, '410.00', '440.00', '0.00', NULL, '0.00', '4400.00', 'a', 'London ', '2019-11-21 13:09:50', NULL, NULL, 1, 19),
(73, 57, 6, 10, '460.00', '465.00', '0.00', NULL, '0.00', '4650.00', 'a', 'London ', '2019-11-21 13:10:52', NULL, NULL, 1, 2),
(74, 58, 12, 4, '405.00', '430.00', '0.00', NULL, '0.00', '1720.00', 'a', 'London ', '2019-11-21 13:13:15', NULL, NULL, 1, 21),
(75, 59, 11, 20, '410.00', '440.00', '0.00', NULL, '0.00', '8800.00', 'a', 'London ', '2019-11-21 13:15:39', NULL, NULL, 1, 19),
(76, 60, 7, 20, '460.00', '460.00', '0.00', NULL, '0.00', '9200.00', 'a', 'London ', '2019-11-21 13:16:59', NULL, NULL, 1, 1),
(77, 61, 2, 522.85, '60.70', '63.00', '0.00', NULL, '0.00', '32939.55', 'a', 'London ', '2019-11-21 13:24:03', NULL, NULL, 1, 4),
(78, 61, 1, 128.15, '60.50', '63.00', '0.00', NULL, '0.00', '36259.65', 'a', 'London ', '2019-11-21 13:24:03', NULL, NULL, 1, 3),
(79, 61, 1, 447.4, '60.50', '63.00', '0.00', NULL, '0.00', '36259.65', 'a', 'London ', '2019-11-21 13:24:03', NULL, NULL, 1, 8),
(80, 62, 9, 10, '412.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-21 13:25:28', NULL, NULL, 1, 17),
(81, 63, 2, 599.9, '60.70', '62.50', '0.00', NULL, '0.00', '37493.75', 'a', 'London ', '2019-11-21 13:35:00', NULL, NULL, 1, 4),
(82, 63, 1, 115.8, '60.50', '62.50', '0.00', NULL, '0.00', '7237.50', 'a', 'London ', '2019-11-21 13:35:00', NULL, NULL, 1, 8),
(83, 64, 11, 50, '410.00', '440.00', '0.00', NULL, '0.00', '22000.00', 'a', 'London ', '2019-11-21 13:37:32', NULL, NULL, 1, 19),
(84, 65, 4, 365.65, '60.70', '63.00', '0.00', NULL, '0.00', '23035.95', 'a', 'London ', '2019-11-21 13:39:03', NULL, NULL, 1, 6),
(85, 66, 9, 10, '412.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-21 13:51:41', NULL, NULL, 1, 17),
(86, 67, 1, 345.75, '60.50', '63.00', '0.00', NULL, '0.00', '21782.25', 'a', 'London ', '2019-11-21 13:55:16', NULL, NULL, 1, 8),
(87, 67, 2, 912.15, '60.70', '63.00', '0.00', NULL, '0.00', '57465.45', 'a', 'London ', '2019-11-21 13:55:16', NULL, NULL, 1, 4),
(88, 68, 12, 1, '405.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-21 13:56:48', NULL, NULL, 1, 21),
(89, 69, 8, 30, '432.00', '440.00', '0.00', NULL, '0.00', '13200.00', 'a', 'London ', '2019-11-21 13:58:15', NULL, NULL, 1, 16),
(90, 70, 7, 2, '460.00', '460.00', '0.00', NULL, '0.00', '920.00', 'a', 'London ', '2019-11-21 14:01:13', NULL, NULL, 1, 1),
(91, 71, 4, 1313.8, '60.70', '63.00', '0.00', NULL, '0.00', '82769.40', 'a', 'London ', '2019-11-21 15:14:45', NULL, NULL, 1, 6),
(92, 72, 11, 10, '410.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-21 15:16:35', NULL, NULL, 1, 19),
(93, 73, 3, 295.9, '60.50', '63.00', '0.00', NULL, '0.00', '18641.70', 'a', 'London ', '2019-11-21 15:20:42', NULL, NULL, 1, 5),
(94, 73, 2, 234.27, '60.70', '63.00', '0.00', NULL, '0.00', '16496.55', 'a', 'London ', '2019-11-21 15:20:42', NULL, NULL, 1, 4),
(95, 73, 2, 27.58, '60.70', '63.00', '0.00', NULL, '0.00', '16496.55', 'a', 'London ', '2019-11-21 15:20:42', NULL, NULL, 1, 9),
(96, 74, 9, 2, '412.00', '420.00', '0.00', NULL, '0.00', '840.00', 'a', 'London ', '2019-11-21 15:53:23', NULL, NULL, 1, 17),
(97, 75, 6, 40, '460.00', '465.00', '0.00', NULL, '0.00', '18600.00', 'a', 'London ', '2019-11-21 15:58:52', NULL, NULL, 1, 2),
(98, 76, 12, 1, '405.00', '440.00', '0.00', NULL, '0.00', '440.00', 'd', 'London ', '2019-11-21 16:11:02', NULL, NULL, 1, 21),
(99, 77, 6, 10, '460.00', '465.00', '0.00', NULL, '0.00', '4650.00', 'a', 'London ', '2019-11-21 16:14:08', NULL, NULL, 1, 2),
(100, 78, 12, 1, '405.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-21 16:38:13', NULL, NULL, 1, 21),
(101, 79, 12, 15, '405.00', '420.00', '0.00', NULL, '0.00', '6300.00', 'a', 'London ', '2019-11-21 16:41:17', NULL, NULL, 1, 21),
(103, 79, 4, 36.8, '60.70', '63.00', '0.00', NULL, '0.00', '2318.40', 'a', 'London ', '2019-11-21 16:43:14', NULL, NULL, 1, 6),
(104, 80, 8, 10, '432.00', '440.00', '0.00', NULL, '0.00', '4400.00', 'a', 'London ', '2019-11-21 16:45:30', NULL, NULL, 1, 16),
(105, 81, 4, 73.35, '60.70', '63.00', '0.00', NULL, '0.00', '4621.05', 'a', 'London ', '2019-11-21 16:48:25', NULL, NULL, 1, 6),
(106, 81, 2, 149.35, '60.70', '63.00', '0.00', NULL, '0.00', '9409.05', 'a', 'London ', '2019-11-21 16:48:25', NULL, NULL, 1, 9),
(107, 82, 11, 1, '410.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-21 16:51:00', NULL, NULL, 1, 19),
(108, 83, 12, 10, '405.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-21 16:52:04', NULL, NULL, 1, 21),
(109, 84, 4, 364.9, '60.70', '63.00', '0.00', NULL, '0.00', '22988.70', 'a', 'London ', '2019-11-21 17:35:13', NULL, NULL, 1, 6),
(110, 85, 12, 20, '405.00', '440.00', '0.00', NULL, '0.00', '8800.00', 'a', 'London ', '2019-11-21 17:49:13', NULL, NULL, 1, 21),
(111, 86, 7, 2, '460.00', '460.00', '0.00', NULL, '0.00', '920.00', 'a', 'London ', '2019-11-21 17:51:20', NULL, NULL, 1, 1),
(112, 87, 12, 20, '405.00', '435.00', '0.00', NULL, '0.00', '8700.00', 'a', 'London ', '2019-11-21 18:09:50', NULL, NULL, 1, 21),
(113, 88, 6, 11, '465.00', '465.00', '0.00', NULL, '0.00', '13950.00', 'a', 'London ', '2019-11-21 18:26:11', NULL, NULL, 1, 2),
(114, 88, 6, 19, '465.00', '465.00', '0.00', NULL, '0.00', '13950.00', 'a', 'London ', '2019-11-21 18:26:11', NULL, NULL, 1, 22),
(115, 89, 11, 10, '410.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-21 18:29:13', NULL, NULL, 1, 19),
(118, 91, 6, 10, '465.00', '465.00', '0.00', NULL, '0.00', '4650.00', 'a', 'London ', '2019-11-21 18:43:14', NULL, NULL, 1, 22),
(119, 92, 8, 10, '432.00', '440.00', '0.00', NULL, '0.00', '4400.00', 'a', 'London ', '2019-11-21 18:44:53', NULL, NULL, 1, 16),
(120, 93, 8, 1, '432.00', '445.00', '0.00', NULL, '0.00', '445.00', 'a', 'London ', '2019-11-21 18:45:36', NULL, NULL, 1, 16),
(121, 94, 5, 75.45, '60.70', '63.00', '0.00', NULL, '0.00', '4753.35', 'a', 'London ', '2019-11-22 11:22:36', NULL, NULL, 1, 7),
(122, 95, 12, 10, '405.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-22 11:25:59', NULL, NULL, 1, 21),
(123, 96, 11, 10, '410.00', '430.00', '0.00', NULL, '0.00', '4300.00', 'a', 'London ', '2019-11-22 11:31:33', NULL, NULL, 1, 19),
(124, 97, 11, 1, '410.00', '420.00', '0.00', NULL, '0.00', '8400.00', 'a', 'London ', '2019-11-22 11:33:25', NULL, NULL, 1, 19),
(125, 97, 11, 19, '410.00', '420.00', '0.00', NULL, '0.00', '8400.00', 'a', 'London ', '2019-11-22 11:33:25', NULL, NULL, 1, 20),
(126, 98, 8, 2, '432.00', '440.00', '0.00', NULL, '0.00', '880.00', 'a', 'London ', '2019-11-22 11:36:36', NULL, NULL, 1, 16),
(127, 99, 7, 5, '460.00', '460.00', '0.00', NULL, '0.00', '2300.00', 'a', 'London ', '2019-11-22 11:37:31', NULL, NULL, 1, 1),
(128, 100, 8, 2, '432.00', '440.00', '0.00', NULL, '0.00', '880.00', 'a', 'London ', '2019-11-22 11:39:48', NULL, NULL, 1, 16),
(129, 101, 7, 4, '460.00', '460.00', '0.00', NULL, '0.00', '1840.00', 'a', 'London ', '2019-11-22 11:41:07', NULL, NULL, 1, 1),
(130, 102, 8, 90, '432.00', '440.00', '0.00', NULL, '0.00', '70400.00', 'a', 'London ', '2019-11-22 11:48:13', NULL, NULL, 1, 16),
(131, 102, 8, 70, '432.00', '440.00', '0.00', NULL, '0.00', '70400.00', 'a', 'London ', '2019-11-22 11:48:13', NULL, NULL, 1, 18),
(132, 103, 6, 30, '465.00', '465.00', '0.00', NULL, '0.00', '13950.00', 'a', 'London ', '2019-11-22 11:50:33', NULL, NULL, 1, 22),
(133, 104, 11, 15, '410.00', '430.00', '0.00', NULL, '0.00', '6450.00', 'a', 'London ', '2019-11-22 11:52:29', NULL, NULL, 1, 20),
(134, 105, 12, 2, '405.00', '430.00', '0.00', NULL, '0.00', '860.00', 'a', 'London ', '2019-11-22 11:53:59', NULL, NULL, 1, 21),
(135, 106, 8, 3, '432.00', '450.00', '0.00', NULL, '0.00', '1350.00', 'a', 'London ', '2019-11-22 11:56:15', NULL, NULL, 1, 18),
(136, 107, 4, 146.35, '60.70', '62.00', '0.00', NULL, '0.00', '9073.70', 'a', 'London ', '2019-11-23 10:08:58', NULL, NULL, 1, 6),
(137, 107, 1, 116, '60.50', '62.00', '0.00', NULL, '0.00', '7192.00', 'a', 'London ', '2019-11-23 10:08:58', NULL, NULL, 1, 8),
(138, 107, 2, 598.1, '60.70', '62.00', '0.00', NULL, '0.00', '37082.20', 'a', 'London ', '2019-11-23 10:08:58', NULL, NULL, 1, 9),
(139, 108, 8, 2, '432.00', '440.00', '0.00', NULL, '0.00', '880.00', 'a', 'London ', '2019-11-23 10:12:01', NULL, NULL, 1, 18),
(140, 109, 12, 10, '405.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-23 10:14:55', NULL, NULL, 1, 21),
(141, 110, 6, 1, '462.50', '465.00', '0.00', NULL, '0.00', '465.00', 'a', 'London ', '2019-11-23 10:22:37', NULL, NULL, 1, 22),
(142, 111, 9, 1, '412.00', '430.00', '0.00', NULL, '0.00', '430.00', 'a', 'London ', '2019-11-23 10:24:52', NULL, NULL, 1, 17),
(143, 112, 6, 10, '462.50', '465.00', '0.00', NULL, '0.00', '4650.00', 'a', 'London ', '2019-11-23 10:27:23', NULL, NULL, 1, 22),
(144, 113, 11, 10, '410.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-23 10:28:39', NULL, NULL, 1, 20),
(145, 114, 12, 10, '405.00', '440.00', '0.00', NULL, '0.00', '4400.00', 'a', 'London ', '2019-11-23 10:39:29', NULL, NULL, 1, 21),
(146, 115, 12, 10, '405.00', '435.00', '0.00', NULL, '0.00', '4350.00', 'a', 'London ', '2019-11-23 10:40:57', NULL, NULL, 1, 21),
(147, 116, 11, 20, '410.00', '420.00', '0.00', NULL, '0.00', '8400.00', 'a', 'London ', '2019-11-23 10:42:08', NULL, NULL, 1, 20),
(148, 117, 11, 6, '410.00', '430.00', '0.00', NULL, '0.00', '2580.00', 'a', 'London ', '2019-11-23 10:43:34', NULL, NULL, 1, 20),
(149, 118, 6, 40, '462.50', '460.00', '0.00', NULL, '0.00', '18400.00', 'a', 'London ', '2019-11-23 11:12:20', NULL, NULL, 1, 22),
(150, 118, 2, 367.65, '60.90', '62.00', '0.00', NULL, '0.00', '22794.30', 'a', 'London ', '2019-11-23 11:12:20', NULL, NULL, 1, 9),
(151, 119, 13, 20, '135.00', '180.00', '0.00', NULL, '0.00', '3600.00', 'a', 'London ', '2019-11-23 11:20:50', NULL, NULL, 1, 23),
(152, 120, 8, 4, '432.00', '440.00', '0.00', NULL, '0.00', '1760.00', 'a', 'London ', '2019-11-23 11:23:36', NULL, NULL, 1, 18),
(153, 121, 6, 10, '462.50', '465.00', '0.00', NULL, '0.00', '4650.00', 'a', 'London ', '2019-11-23 11:24:38', NULL, NULL, 1, 22),
(154, 122, 5, 23.25, '61.10', '63.00', '0.00', NULL, '0.00', '1464.75', 'a', 'London ', '2019-11-23 11:26:00', NULL, NULL, 1, 7),
(155, 123, 4, 87.65, '60.90', '62.50', '0.00', NULL, '0.00', '5478.13', 'a', 'London ', '2019-11-23 11:28:01', NULL, NULL, 1, 6),
(156, 124, 11, 10, '410.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-23 11:29:11', NULL, NULL, 1, 20),
(157, 125, 6, 1, '462.50', '465.00', '0.00', NULL, '0.00', '465.00', 'a', 'London ', '2019-11-23 11:33:43', NULL, NULL, 1, 22),
(158, 126, 8, 10, '432.00', '440.00', '0.00', NULL, '0.00', '4400.00', 'a', 'London ', '2019-11-23 11:37:50', NULL, NULL, 1, 18),
(159, 127, 13, 1, '135.00', '180.00', '0.00', NULL, '0.00', '180.00', 'a', 'London ', '2019-11-23 11:41:54', NULL, NULL, 1, 24),
(160, 127, 11, 3, '410.00', '430.00', '0.00', NULL, '0.00', '1290.00', 'a', 'London ', '2019-11-23 11:41:54', NULL, NULL, 1, 20),
(161, 127, 6, 2, '462.50', '465.00', '0.00', NULL, '0.00', '930.00', 'a', 'London ', '2019-11-23 11:41:54', NULL, NULL, 1, 22),
(162, 128, 6, 10, '462.50', '465.00', '0.00', NULL, '0.00', '4650.00', 'a', 'London ', '2019-11-23 11:43:51', NULL, NULL, 1, 22),
(163, 129, 11, 6, '410.00', '430.00', '0.00', NULL, '0.00', '2580.00', 'a', 'London ', '2019-11-23 12:32:15', NULL, NULL, 1, 20),
(164, 130, 8, 4, '432.00', '445.00', '0.00', NULL, '0.00', '1780.00', 'a', 'London ', '2019-11-23 12:35:37', NULL, NULL, 1, 18),
(165, 131, 2, 386.75, '60.90', '63.00', '0.00', NULL, '0.00', '24365.25', 'a', 'London ', '2019-11-23 12:47:27', NULL, NULL, 1, 9),
(166, 131, 1, 87.65, '61.00', '63.00', '0.00', NULL, '0.00', '5521.95', 'a', 'London ', '2019-11-23 12:47:27', NULL, NULL, 1, 8),
(167, 132, 11, 3, '410.00', '430.00', '0.00', NULL, '0.00', '1290.00', 'a', 'London ', '2019-11-23 12:48:29', NULL, NULL, 1, 20),
(168, 133, 4, 1087.55, '60.90', '60.50', '0.00', NULL, '0.00', '69953.13', 'a', 'London ', '2019-11-23 13:35:49', NULL, NULL, 1, 6),
(169, 133, 4, 68.7001, '60.90', '60.50', '0.00', NULL, '0.00', '69953.13', 'a', 'London ', '2019-11-23 13:35:49', NULL, NULL, 1, 11),
(170, 133, 3, 409.75, '61.00', '60.50', '0.00', NULL, '0.00', '30089.68', 'a', 'London ', '2019-11-23 13:35:49', NULL, NULL, 1, 5),
(171, 133, 3, 87.6, '61.00', '60.50', '0.00', NULL, '0.00', '30089.68', 'a', 'London ', '2019-11-23 13:35:49', NULL, NULL, 1, 10),
(172, 133, 5, 235.9, '61.10', '60.50', '0.00', NULL, '0.00', '14271.95', 'a', 'London ', '2019-11-23 13:35:49', NULL, NULL, 1, 7),
(173, 134, 4, 143.6, '60.90', '61.00', '0.00', NULL, '0.00', '8759.60', 'a', 'London ', '2019-11-23 14:14:05', NULL, NULL, 1, 11),
(174, 134, 2, 675.2, '60.90', '61.00', '0.00', NULL, '0.00', '41187.20', 'a', 'London ', '2019-11-23 14:14:05', NULL, NULL, 1, 9),
(175, 134, 1, 118.1, '61.00', '61.00', '0.00', NULL, '0.00', '7204.10', 'a', 'London ', '2019-11-23 14:14:05', NULL, NULL, 1, 8),
(176, 135, 11, 5, '410.00', '440.00', '0.00', NULL, '0.00', '2200.00', 'a', 'London ', '2019-11-23 14:37:07', NULL, NULL, 1, 20),
(177, 136, 11, 20, '410.00', '420.00', '0.00', NULL, '0.00', '8400.00', 'a', 'London ', '2019-11-23 14:38:42', NULL, NULL, 1, 20),
(178, 137, 6, 9, '458.33', '465.00', '0.00', NULL, '0.00', '4650.00', 'a', 'London ', '2019-11-24 14:14:19', NULL, NULL, 1, 22),
(179, 137, 6, 1, '458.33', '465.00', '0.00', NULL, '0.00', '4650.00', 'a', 'London ', '2019-11-24 14:14:19', NULL, NULL, 1, 27),
(180, 138, 11, 10, '410.00', '430.00', '0.00', NULL, '0.00', '4300.00', 'a', 'London ', '2019-11-24 14:16:43', NULL, NULL, 1, 20),
(181, 139, 5, 29.8, '61.10', '63.00', '0.00', NULL, '0.00', '1877.40', 'a', 'London ', '2019-11-24 19:03:34', NULL, NULL, 1, 7),
(182, 139, 12, 16, '405.00', '440.00', '0.00', NULL, '0.00', '13200.00', 'a', 'London ', '2019-11-24 19:03:34', NULL, NULL, 1, 21),
(183, 139, 12, 14, '405.00', '440.00', '0.00', NULL, '0.00', '13200.00', 'a', 'London ', '2019-11-24 19:03:34', NULL, NULL, 1, 28),
(184, 140, 4, 29.3, '60.90', '63.00', '0.00', NULL, '0.00', '1845.90', 'a', 'London ', '2019-11-24 19:05:01', NULL, NULL, 1, 11),
(185, 141, 11, 3, '410.00', '430.00', '0.00', NULL, '0.00', '1290.00', 'a', 'London ', '2019-11-24 19:06:42', NULL, NULL, 1, 20),
(186, 142, 2, 526.4, '60.90', '61.00', '0.00', NULL, '0.00', '32110.40', 'a', 'London ', '2019-11-24 19:08:56', NULL, NULL, 1, 9),
(187, 143, 2, 225.3, '60.90', '63.00', '0.00', NULL, '0.00', '14193.90', 'a', 'London ', '2019-11-24 19:11:16', NULL, NULL, 1, 9),
(188, 144, 11, 1, '410.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-24 19:16:20', NULL, NULL, 1, 20),
(189, 145, 11, 5, '410.00', '440.00', '0.00', NULL, '0.00', '2200.00', 'a', 'London ', '2019-11-24 19:17:11', NULL, NULL, 1, 20),
(190, 146, 13, 20, '135.00', '180.00', '0.00', NULL, '0.00', '3600.00', 'a', 'London ', '2019-11-24 19:19:51', NULL, NULL, 1, 24),
(191, 146, 6, 20, '458.33', '460.00', '0.00', NULL, '0.00', '9200.00', 'a', 'London ', '2019-11-24 19:19:51', NULL, NULL, 1, 27),
(192, 147, 12, 1, '405.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-24 19:20:20', NULL, NULL, 1, 28),
(193, 148, 6, 5, '458.33', '465.00', '0.00', NULL, '0.00', '2325.00', 'a', 'London ', '2019-11-24 19:21:16', NULL, NULL, 1, 27),
(194, 149, 8, 10, '432.00', '440.00', '0.00', NULL, '0.00', '4400.00', 'a', 'London ', '2019-11-24 19:22:37', NULL, NULL, 1, 18),
(195, 150, 12, 4, '405.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-24 19:24:36', NULL, NULL, 1, 28),
(196, 150, 12, 6, '405.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-24 19:24:36', NULL, NULL, 1, 29),
(197, 151, 11, 10, '410.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-24 19:30:12', NULL, NULL, 1, 20),
(198, 152, 7, 10, '460.00', '460.00', '0.00', NULL, '0.00', '4600.00', 'd', 'London ', '2019-11-24 19:33:37', NULL, NULL, 1, 1),
(199, 152, 4, 225.7, '60.90', '63.00', '0.00', NULL, '0.00', '14219.10', 'd', 'London ', '2019-11-24 19:33:37', NULL, NULL, 1, 11),
(200, 152, 5, 75.8, '61.10', '63.00', '0.00', NULL, '0.00', '4775.40', 'd', 'London ', '2019-11-24 19:33:37', NULL, NULL, 1, 7),
(201, 153, 6, 5, '458.33', '465.00', '0.00', NULL, '0.00', '2325.00', 'a', 'London ', '2019-11-24 19:35:33', NULL, NULL, 1, 27),
(202, 154, 11, 3, '410.00', '440.00', '0.00', NULL, '0.00', '1320.00', 'a', 'London ', '2019-11-25 09:54:23', NULL, NULL, 1, 20),
(203, 155, 12, 1, '405.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-25 10:12:11', NULL, NULL, 1, 29),
(204, 156, 2, 532.7, '60.90', '61.00', '0.00', NULL, '0.00', '32494.70', 'a', 'London ', '2019-11-25 10:52:52', NULL, NULL, 1, 9),
(205, 157, 5, 71.15, '61.10', '63.00', '0.00', NULL, '0.00', '4482.45', 'a', 'London ', '2019-11-26 11:54:48', NULL, NULL, 1, 7),
(206, 157, 11, 6, '410.00', '430.00', '0.00', NULL, '0.00', '2580.00', 'a', 'London ', '2019-11-26 11:54:48', NULL, NULL, 1, 20),
(207, 158, 11, 2, '410.00', '440.00', '0.00', NULL, '0.00', '880.00', 'a', 'London ', '2019-11-26 12:03:28', NULL, NULL, 1, 20),
(208, 159, 8, 3, '432.00', '440.00', '0.00', NULL, '0.00', '1320.00', 'a', 'London ', '2019-11-26 12:08:56', NULL, NULL, 1, 18),
(209, 160, 7, 10, '460.00', '460.00', '0.00', NULL, '0.00', '4600.00', 'a', 'London ', '2019-11-26 12:29:03', NULL, NULL, 1, 1),
(210, 160, 4, 225.7, '60.90', '63.00', '0.00', NULL, '0.00', '14219.10', 'a', 'London ', '2019-11-26 12:29:03', NULL, NULL, 1, 11),
(211, 160, 5, 75.8, '61.10', '63.00', '0.00', NULL, '0.00', '4775.40', 'a', 'London ', '2019-11-26 12:29:03', NULL, NULL, 1, 7),
(212, 161, 5, 14.25, '61.10', '63.00', '0.00', NULL, '0.00', '897.75', 'a', 'London ', '2019-11-26 12:33:08', NULL, NULL, 1, 7),
(213, 161, 7, 10, '460.00', '460.00', '0.00', NULL, '0.00', '4600.00', 'a', 'London ', '2019-11-26 12:33:08', NULL, NULL, 1, 1),
(214, 162, 5, 47.5, '61.10', '63.00', '0.00', NULL, '0.00', '2992.50', 'a', 'London ', '2019-11-26 13:53:54', NULL, NULL, 1, 7),
(215, 163, 11, 2, '410.00', '440.00', '0.00', NULL, '0.00', '880.00', 'a', 'London ', '2019-11-26 13:55:08', NULL, NULL, 1, 20),
(216, 164, 12, 20, '405.00', '440.00', '0.00', NULL, '0.00', '8800.00', 'a', 'London ', '2019-11-26 16:20:50', NULL, NULL, 1, 29),
(217, 165, 5, 77.5, '61.10', '63.00', '0.00', NULL, '0.00', '4882.50', 'a', 'London ', '2019-11-28 15:28:05', NULL, NULL, 1, 7),
(218, 165, 3, 0.00000762939, '61.00', '63.00', '0.00', NULL, '0.00', '4800.60', 'a', 'London ', '2019-11-28 15:28:05', NULL, NULL, 1, 5),
(219, 165, 3, 76.2, '61.00', '63.00', '0.00', NULL, '0.00', '4800.60', 'a', 'London ', '2019-11-28 15:28:05', NULL, NULL, 1, 10),
(220, 166, 4, 72, '60.90', '62.50', '0.00', NULL, '0.00', '4500.00', 'a', 'London ', '2019-11-28 15:35:51', NULL, NULL, 1, 11),
(221, 167, 13, 20, '135.00', '180.00', '0.00', NULL, '0.00', '3600.00', 'a', 'London ', '2019-11-28 15:49:33', NULL, NULL, 1, 24),
(222, 167, 6, 40, '456.25', '460.00', '0.00', NULL, '0.00', '18400.00', 'a', 'London ', '2019-11-28 15:49:33', NULL, NULL, 1, 27),
(223, 168, 8, 1, '432.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-28 16:15:06', NULL, NULL, 1, 18),
(224, 169, 12, 5, '405.00', '420.00', '0.00', NULL, '0.00', '2100.00', 'a', 'London ', '2019-11-28 16:16:30', NULL, NULL, 1, 29),
(225, 170, 12, 1, '405.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-28 16:19:29', NULL, NULL, 1, 29),
(226, 171, 5, 151.8, '61.10', '63.00', '0.00', NULL, '0.00', '9563.40', 'a', 'London ', '2019-11-28 16:31:52', NULL, NULL, 1, 7),
(227, 172, 8, 3, '432.00', '445.00', '0.00', NULL, '0.00', '1335.00', 'a', 'London ', '2019-11-28 16:34:02', NULL, NULL, 1, 18),
(228, 173, 11, 20, '410.00', '430.00', '0.00', NULL, '0.00', '8600.00', 'a', 'London ', '2019-11-28 16:36:33', NULL, NULL, 1, 20),
(231, 173, 5, 60.45, '61.10', '63.00', '0.00', NULL, '0.00', '4781.70', 'a', 'London ', '2019-11-28 16:38:08', NULL, NULL, 1, 7),
(232, 173, 5, 15.45, '61.10', '63.00', '0.00', NULL, '0.00', '4781.70', 'a', 'London ', '2019-11-28 16:38:08', NULL, NULL, 1, 14),
(233, 174, 8, 1, '432.00', '445.00', '0.00', NULL, '0.00', '445.00', 'a', 'London ', '2019-11-28 16:39:02', NULL, NULL, 1, 18),
(234, 175, 1, 119.5, '61.00', '61.00', '0.00', NULL, '0.00', '7289.50', 'a', 'London ', '2019-11-28 16:40:53', NULL, NULL, 1, 8),
(235, 175, 2, 457.2, '60.90', '61.00', '0.00', NULL, '0.00', '27889.20', 'a', 'London ', '2019-11-28 16:40:53', NULL, NULL, 1, 9),
(236, 176, 8, 1, '432.00', '445.00', '0.00', NULL, '0.00', '445.00', 'a', 'London ', '2019-11-28 16:41:57', NULL, NULL, 1, 18),
(237, 177, 6, 5, '456.25', '465.00', '0.00', NULL, '0.00', '2325.00', 'a', 'London ', '2019-11-28 16:42:38', NULL, NULL, 1, 27),
(238, 178, 11, 1, '410.00', '440.00', '0.00', NULL, '0.00', '440.00', 'a', 'London ', '2019-11-29 10:25:40', NULL, NULL, 1, 20),
(239, 179, 11, 1, '410.00', '440.00', '0.00', NULL, '0.00', '440.00', 'd', 'London ', '2019-11-29 19:35:28', NULL, NULL, 1, 20),
(240, 180, 7, 20, '460.00', '460.00', '0.00', NULL, '0.00', '9200.00', 'a', 'London ', '2019-11-29 19:36:22', NULL, NULL, 1, 1),
(241, 181, 3, 217.65, '61.00', '62.50', '0.00', NULL, '0.00', '13603.13', 'a', 'London ', '2019-11-29 19:37:19', NULL, NULL, 1, 10),
(242, 182, 6, 5, '456.25', '465.00', '0.00', NULL, '0.00', '2325.00', 'a', 'London ', '2019-11-29 19:38:23', NULL, NULL, 1, 27),
(243, 183, 12, 10, '405.00', '420.00', '0.00', NULL, '0.00', '4200.00', 'a', 'London ', '2019-11-29 19:39:21', NULL, NULL, 1, 29),
(244, 184, 8, 1, '432.00', '445.00', '0.00', NULL, '0.00', '445.00', 'a', 'London ', '2019-11-29 19:40:38', NULL, NULL, 1, 18),
(245, 185, 12, 1, '405.00', '430.00', '0.00', NULL, '0.00', '430.00', 'a', 'London ', '2019-11-29 19:41:39', NULL, NULL, 1, 29),
(246, 186, 11, 6, '410.00', '440.00', '0.00', NULL, '0.00', '2640.00', 'a', 'London ', '2019-11-30 09:59:26', NULL, NULL, 1, 20),
(247, 187, 6, 20, '456.25', '465.00', '0.00', NULL, '0.00', '9300.00', 'a', 'London ', '2019-11-30 10:02:05', NULL, NULL, 1, 27),
(248, 90, 3, 74.2, '60.50', '63.00', '0.00', NULL, '0.00', '4674.60', 'a', 'London ', '2019-11-30 12:25:57', NULL, NULL, 1, 5),
(249, 90, 3, 0.00000305176, '60.50', '63.00', '0.00', NULL, '0.00', '4674.60', 'a', 'London ', '2019-11-30 12:25:57', NULL, NULL, 1, 10),
(250, 90, 4, 729.65, '60.70', '63.00', '0.00', NULL, '0.00', '45967.95', 'a', 'London ', '2019-11-30 12:25:57', NULL, NULL, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salereturn`
--

DROP TABLE IF EXISTS `tbl_salereturn`;
CREATE TABLE IF NOT EXISTS `tbl_salereturn` (
  `SaleReturn_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SaleReturn_ReturnDate` date NOT NULL,
  `SaleReturn_ReturnAmount` decimal(18,2) NOT NULL,
  `SaleReturn_Description` varchar(300) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleReturn_brunchId` int(11) NOT NULL,
  PRIMARY KEY (`SaleReturn_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_salereturn`
--

INSERT INTO `tbl_salereturn` (`SaleReturn_SlNo`, `SaleMaster_InvoiceNo`, `SaleReturn_ReturnDate`, `SaleReturn_ReturnAmount`, `SaleReturn_Description`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleReturn_brunchId`) VALUES
(1, '2019000160', '2019-11-26', '913.50', '', 'a', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salereturndetails`
--

DROP TABLE IF EXISTS `tbl_salereturndetails`;
CREATE TABLE IF NOT EXISTS `tbl_salereturndetails` (
  `SaleReturnDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `SaleReturn_IdNo` int(11) NOT NULL,
  `SaleReturnDetailsProduct_SlNo` int(11) NOT NULL,
  `SaleReturnDetails_ReturnQuantity` int(11) NOT NULL,
  `SaleReturnDetails_ReturnAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleReturnDetails_brunchID` int(11) NOT NULL,
  `purchase_d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`SaleReturnDetails_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_salereturndetails`
--

INSERT INTO `tbl_salereturndetails` (`SaleReturnDetails_SlNo`, `SaleReturn_IdNo`, `SaleReturnDetailsProduct_SlNo`, `SaleReturnDetails_ReturnQuantity`, `SaleReturnDetails_ReturnAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleReturnDetails_brunchID`, `purchase_d_id`) VALUES
(1, 1, 7, 0, '0.00', 'a', NULL, NULL, NULL, NULL, 1, 1),
(2, 1, 4, 15, '913.50', 'a', NULL, NULL, NULL, NULL, 1, 11),
(3, 1, 5, 0, '0.00', 'a', NULL, NULL, NULL, NULL, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salesmaster`
--

DROP TABLE IF EXISTS `tbl_salesmaster`;
CREATE TABLE IF NOT EXISTS `tbl_salesmaster` (
  `SaleMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SalseCustomer_IDNo` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `SaleMaster_SaleDate` date NOT NULL,
  `SaleMaster_Description` longtext,
  `SaleMaster_SaleType` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT 'Cash',
  `SaleMaster_TotalSaleAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TotalDiscountAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TaxAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Freight` decimal(18,2) DEFAULT '0.00',
  `SaleMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `SaleMaster_PaidAmount` decimal(18,2) NOT NULL,
  `SaleMaster_DueAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Previous_Due` double(18,2) DEFAULT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `is_service` varchar(10) NOT NULL DEFAULT 'false',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleMaster_branchid` int(11) NOT NULL,
  PRIMARY KEY (`SaleMaster_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_salesmaster`
--

INSERT INTO `tbl_salesmaster` (`SaleMaster_SlNo`, `SaleMaster_InvoiceNo`, `SalseCustomer_IDNo`, `employee_id`, `SaleMaster_SaleDate`, `SaleMaster_Description`, `SaleMaster_SaleType`, `payment_type`, `SaleMaster_TotalSaleAmount`, `SaleMaster_TotalDiscountAmount`, `SaleMaster_TaxAmount`, `SaleMaster_Freight`, `SaleMaster_SubTotalAmount`, `SaleMaster_PaidAmount`, `SaleMaster_DueAmount`, `SaleMaster_Previous_Due`, `Status`, `is_service`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleMaster_branchid`) VALUES
(1, '2019000001', 60, NULL, '2019-10-20', '', 'retail', 'Cash', '67624.79', '0.00', '0.00', '320.00', '67304.79', '0.00', '67624.79', 0.00, 'a', 'false', 'London ', '2019-11-20 14:42:51', NULL, NULL, 1),
(2, '2019000002', 61, NULL, '2019-10-20', '', 'retail', 'Cash', '4400.00', '0.00', '0.00', '0.00', '4400.00', '4400.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 14:48:11', NULL, NULL, 1),
(3, '2019000003', 62, NULL, '2019-10-20', '', 'retail', 'Cash', '2250.00', '0.00', '0.00', '50.00', '2200.00', '2250.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 14:49:30', NULL, NULL, 1),
(4, '2019000004', 63, NULL, '2019-10-20', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '440.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 14:49:57', NULL, NULL, 1),
(5, '2019000005', 64, NULL, '2019-10-20', '', 'retail', 'Cash', '2400.00', '0.00', '0.00', '50.00', '2350.00', '2400.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 14:50:29', NULL, NULL, 1),
(6, '2019000006', 65, NULL, '2019-10-21', '', 'retail', 'Cash', '4300.00', '0.00', '0.00', '100.00', '4200.00', '4300.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 14:56:27', NULL, NULL, 1),
(7, '2019000007', 66, NULL, '2019-10-21', '', 'retail', 'Cash', '13950.00', '0.00', '0.00', '0.00', '13950.00', '0.00', '13950.00', 43123.00, 'a', 'false', 'London ', '2019-11-20 15:00:02', NULL, NULL, 1),
(8, '2019000008', 67, NULL, '2019-10-22', '', 'retail', 'Cash', '16194.15', '0.00', '0.00', '0.00', '16194.15', '16194.15', '0.00', 549017.00, 'a', 'false', 'London ', '2019-11-20 15:11:32', NULL, NULL, 1),
(9, '2019000009', 68, NULL, '2019-10-22', '', 'retail', 'Cash', '2200.00', '0.00', '0.00', '50.00', '2150.00', '2200.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 15:12:36', NULL, NULL, 1),
(10, '2019000010', 65, NULL, '2019-10-22', '', 'retail', 'Cash', '4400.00', '0.00', '0.00', '100.00', '4300.00', '4400.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 15:13:24', NULL, NULL, 1),
(11, '2019000011', 60, NULL, '2019-10-23', '', 'retail', 'Cash', '4500.00', '0.00', '0.00', '100.00', '4400.00', '0.00', '4500.00', 67624.79, 'a', 'false', 'London ', '2019-11-20 15:14:58', NULL, NULL, 1),
(12, '2019000012', 69, NULL, '2019-10-23', '', 'retail', 'Cash', '1275.00', '0.00', '0.00', '0.00', '1275.00', '1275.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 15:15:43', NULL, NULL, 1),
(13, '2019000013', 70, NULL, '2019-10-24', '', 'retail', 'Cash', '450.00', '0.00', '0.00', '0.00', '450.00', '450.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 15:16:32', NULL, NULL, 1),
(14, '2019000014', 65, NULL, '2019-10-25', '', 'retail', 'Cash', '4400.00', '0.00', '0.00', '100.00', '4300.00', '1000.00', '3400.00', 0.00, 'a', 'false', 'London ', '2019-11-20 15:17:27', 'London ', '2019-11-21 10:56:24', 1),
(15, '2019000015', 71, NULL, '2019-10-26', '', 'retail', 'Cash', '56316.88', '0.00', '0.00', '270.00', '56046.88', '0.00', '56316.88', 0.00, 'a', 'false', 'London ', '2019-11-20 15:23:31', NULL, NULL, 1),
(16, '2019000016', 60, NULL, '2019-10-26', '', 'retail', 'Cash', '4500.00', '0.00', '0.00', '100.00', '4400.00', '0.00', '4500.00', 72124.79, 'a', 'false', 'London ', '2019-11-20 15:26:21', NULL, NULL, 1),
(17, '2019000017', 72, NULL, '2019-10-26', '', 'retail', 'Cash', '3560.00', '0.00', '0.00', '0.00', '3560.00', '3560.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 15:27:09', NULL, NULL, 1),
(18, '2019000018', 67, NULL, '2019-10-27', '', 'retail', 'Cash', '6510.00', '0.00', '0.00', '0.00', '6510.00', '6510.00', '0.00', 549017.00, 'a', 'false', 'London ', '2019-11-20 15:28:28', NULL, NULL, 1),
(19, '2019000019', 71, NULL, '2019-10-27', '', 'retail', 'Cash', '11570.63', '0.00', '0.00', '55.00', '11515.63', '0.00', '11570.63', 56316.88, 'a', 'false', 'London ', '2019-11-20 15:29:31', 'London ', '2019-11-20 15:30:10', 1),
(20, '2019000020', 73, NULL, '2019-10-27', '', 'retail', 'Cash', '2300.00', '0.00', '0.00', '0.00', '2300.00', '2300.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 15:32:10', NULL, NULL, 1),
(21, '2019000021', 60, NULL, '2019-10-28', '', 'retail', 'Cash', '13852.55', '0.00', '0.00', '65.00', '13787.55', '0.00', '13852.55', 76624.79, 'a', 'false', 'London ', '2019-11-20 15:34:21', NULL, NULL, 1),
(22, '2019000022', 74, NULL, '2019-10-28', '', 'retail', 'Cash', '2250.00', '0.00', '0.00', '50.00', '2200.00', '2250.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 15:35:26', 'London ', '2019-11-20 15:35:51', 1),
(23, '2019000023', 75, NULL, '2019-10-28', '', 'retail', 'Cash', '22000.00', '0.00', '0.00', '0.00', '22000.00', '22000.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 15:39:03', 'London ', '2019-11-20 15:40:24', 1),
(24, '2019000024', 76, NULL, '2019-10-28', '', 'retail', 'Cash', '1740.00', '0.00', '0.00', '40.00', '1700.00', '1740.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 15:39:33', 'London ', '2019-11-20 15:40:11', 1),
(25, '2019000025', 65, NULL, '2019-10-28', '', 'retail', 'Cash', '8800.00', '0.00', '0.00', '200.00', '8600.00', '0.00', '8800.00', 3400.00, 'a', 'false', 'London ', '2019-11-20 15:41:32', NULL, NULL, 1),
(26, '2019000026', 60, NULL, '2019-10-29', '', 'retail', 'Cash', '4500.00', '0.00', '0.00', '100.00', '4400.00', '0.00', '4500.00', 90477.34, 'a', 'false', 'London ', '2019-11-20 15:51:50', NULL, NULL, 1),
(27, '2019000027', 77, NULL, '2019-10-29', '', 'retail', 'Cash', '9000.00', '0.00', '0.00', '200.00', '8800.00', '0.00', '9000.00', 151830.00, 'a', 'false', 'London ', '2019-11-20 15:55:27', 'London ', '2019-11-20 15:55:43', 1),
(28, '2019000028', 66, NULL, '2019-10-29', '', 'retail', 'Cash', '27501.45', '0.00', '0.00', '150.00', '27351.45', '0.00', '27501.45', 57073.00, 'a', 'false', 'London ', '2019-11-20 15:57:34', NULL, NULL, 1),
(29, '2019000029', 78, NULL, '2019-10-29', '', 'retail', 'Cash', '2325.00', '0.00', '0.00', '0.00', '2325.00', '2325.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 15:59:10', NULL, NULL, 1),
(30, '2019000030', 79, NULL, '2019-10-29', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '440.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 15:59:56', NULL, NULL, 1),
(31, '2019000031', 66, NULL, '2019-10-30', '', 'retail', 'Cash', '32940.00', '0.00', '0.00', '330.00', '32610.00', '0.00', '32940.00', 84574.45, 'a', 'false', 'London ', '2019-11-20 17:56:07', NULL, NULL, 1),
(32, '2019000032', 60, NULL, '2019-10-30', '', 'retail', 'Cash', '1820.00', '0.00', '0.00', '40.00', '1780.00', '0.00', '1820.00', 94977.34, 'a', 'false', 'London ', '2019-11-20 17:57:55', 'London ', '2019-11-21 11:04:54', 1),
(33, '2019000033', 80, NULL, '2019-10-30', '', 'retail', 'Cash', '2700.00', '0.00', '0.00', '0.00', '2700.00', '2700.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 18:04:02', NULL, NULL, 1),
(34, '2019000034', 61, NULL, '2019-10-30', '', 'retail', 'Cash', '4400.00', '0.00', '0.00', '100.00', '4300.00', '4400.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 18:06:22', NULL, NULL, 1),
(35, '2019000035', 71, NULL, '2019-10-30', '', 'retail', 'Cash', '23250.00', '0.00', '0.00', '0.00', '23250.00', '0.00', '23250.00', 67887.51, 'a', 'false', 'London ', '2019-11-20 18:08:57', 'London ', '2019-11-20 18:10:36', 1),
(36, '2019000036', 81, NULL, '2019-10-30', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '440.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 18:12:38', NULL, NULL, 1),
(37, '2019000037', 65, NULL, '2019-10-31', '', 'retail', 'Cash', '8600.00', '0.00', '0.00', '200.00', '8400.00', '0.00', '8600.00', 12200.00, 'a', 'false', 'London ', '2019-11-20 18:30:56', NULL, NULL, 1),
(38, '2019000038', 82, NULL, '2019-10-30', '', 'retail', 'Cash', '2250.00', '0.00', '0.00', '50.00', '2200.00', '2250.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 18:32:24', NULL, NULL, 1),
(39, '2019000039', 83, NULL, '2019-10-31', '', 'retail', 'Cash', '2580.00', '0.00', '0.00', '0.00', '2580.00', '2580.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 18:33:43', NULL, NULL, 1),
(40, '2019000040', 84, NULL, '2019-10-31', '', 'retail', 'Cash', '2200.00', '0.00', '0.00', '0.00', '2200.00', '2200.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 18:35:26', NULL, NULL, 1),
(41, '2019000041', 71, NULL, '2019-10-31', '', 'retail', 'Cash', '38538.13', '0.00', '0.00', '185.00', '38353.13', '0.00', '38538.13', 91137.51, 'a', 'false', 'London ', '2019-11-20 18:42:21', NULL, NULL, 1),
(42, '2019000042', 85, NULL, '2019-10-31', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '440.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 18:47:50', NULL, NULL, 1),
(43, '2019000043', 66, NULL, '2019-10-31', '', 'retail', 'Cash', '4750.00', '0.00', '0.00', '100.00', '4650.00', '0.00', '4750.00', 117514.45, 'a', 'false', 'London ', '2019-11-20 18:49:09', NULL, NULL, 1),
(44, '2019000044', 77, NULL, '2019-10-31', '', 'retail', 'Cash', '930.35', '0.00', '0.00', '20.00', '910.35', '0.00', '930.35', 160830.00, 'a', 'false', 'London ', '2019-11-20 18:50:52', NULL, NULL, 1),
(45, '2019000045', 86, NULL, '2019-10-31', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '440.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-20 18:51:50', NULL, NULL, 1),
(46, '2019000046', 87, NULL, '2019-10-31', '', 'retail', 'Cash', '2200.00', '0.00', '0.00', '0.00', '2200.00', '2200.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 11:16:33', NULL, NULL, 1),
(47, '2019000047', 88, NULL, '2019-11-01', '', 'retail', 'Cash', '2200.00', '0.00', '0.00', '0.00', '2200.00', '2200.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 11:19:13', NULL, NULL, 1),
(48, '2019000048', 89, NULL, '2019-11-01', '', 'retail', 'Cash', '880.00', '0.00', '0.00', '0.00', '880.00', '880.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 11:20:17', NULL, NULL, 1),
(49, '2019000049', 71, NULL, '2019-11-01', '', 'retail', 'Cash', '36051.26', '0.00', '0.00', '170.00', '35881.26', '0.00', '36051.26', 129675.64, 'a', 'false', 'London ', '2019-11-21 11:32:44', NULL, NULL, 1),
(50, '2019000050', 90, NULL, '2019-11-01', '', 'retail', 'Cash', '4400.00', '0.00', '0.00', '0.00', '4400.00', '4400.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 11:54:32', NULL, NULL, 1),
(51, '2019000051', 77, NULL, '2019-11-01', '', 'retail', 'Cash', '4500.00', '0.00', '0.00', '100.00', '4400.00', '0.00', '4500.00', 161760.35, 'a', 'false', 'London ', '2019-11-21 11:57:46', NULL, NULL, 1),
(52, '2019000052', 91, NULL, '2019-11-02', '', 'retail', 'Cash', '42300.00', '0.00', '0.00', '900.00', '41400.00', '0.00', '42300.00', 50890.00, 'a', 'false', 'London ', '2019-11-21 12:56:30', NULL, NULL, 1),
(53, '2019000053', 92, NULL, '2019-11-02', '', 'retail', 'Cash', '1800.00', '0.00', '0.00', '40.00', '1760.00', '1800.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 12:59:07', NULL, NULL, 1),
(54, '2019000054', 93, NULL, '2019-11-02', '', 'retail', 'Cash', '880.00', '0.00', '0.00', '0.00', '880.00', '880.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 13:01:27', NULL, NULL, 1),
(55, '2019000055', 91, NULL, '2019-11-02', '', 'retail', 'Cash', '2954.70', '0.00', '0.00', '0.00', '2954.70', '15000.00', '-12045.30', 93190.00, 'a', 'false', 'London ', '2019-11-21 13:05:36', NULL, NULL, 1),
(56, '2019000056', 77, NULL, '2019-11-02', '', 'retail', 'Cash', '4400.00', '0.00', '0.00', '0.00', '4400.00', '0.00', '4400.00', 166260.35, 'a', 'false', 'London ', '2019-11-21 13:09:50', NULL, NULL, 1),
(57, '2019000057', 66, NULL, '2019-11-02', '', 'retail', 'Cash', '4750.00', '0.00', '0.00', '100.00', '4650.00', '0.00', '4750.00', 122264.45, 'a', 'false', 'London ', '2019-11-21 13:10:52', NULL, NULL, 1),
(58, '2019000058', 94, NULL, '2019-11-03', '', 'retail', 'Cash', '1760.00', '0.00', '0.00', '40.00', '1720.00', '1760.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 13:13:15', NULL, NULL, 1),
(59, '2019000059', 95, NULL, '2019-11-03', '', 'retail', 'Cash', '8800.00', '0.00', '0.00', '0.00', '8800.00', '8800.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 13:15:39', NULL, NULL, 1),
(60, '2019000060', 71, NULL, '2019-11-03', '', 'retail', 'Cash', '9400.00', '0.00', '0.00', '200.00', '9200.00', '0.00', '9400.00', 165726.90, 'a', 'false', 'London ', '2019-11-21 13:16:59', NULL, NULL, 1),
(61, '2019000061', 60, NULL, '2019-11-04', '', 'retail', 'Cash', '69527.20', '0.00', '0.00', '328.00', '69199.20', '0.00', '69527.20', 96797.34, 'a', 'false', 'London ', '2019-11-21 13:24:03', NULL, NULL, 1),
(62, '2019000062', 61, NULL, '2019-11-04', '', 'retail', 'Cash', '4400.00', '0.00', '0.00', '200.00', '4200.00', '4400.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 13:25:28', 'London ', '2019-11-21 13:26:33', 1),
(63, '2019000063', 71, NULL, '2019-11-04', '', 'retail', 'Cash', '44946.25', '0.00', '0.00', '215.00', '44731.25', '0.00', '44946.25', 175126.90, 'a', 'false', 'London ', '2019-11-21 13:35:00', NULL, NULL, 1),
(64, '2019000064', 77, NULL, '2019-11-05', '', 'retail', 'Cash', '22000.00', '0.00', '0.00', '0.00', '22000.00', '0.00', '22000.00', 170660.35, 'a', 'false', 'London ', '2019-11-21 13:37:32', NULL, NULL, 1),
(65, '2019000065', 67, NULL, '2019-11-05', '', 'retail', 'Cash', '23035.95', '0.00', '0.00', '0.00', '23035.95', '0.00', '23035.95', 549017.00, 'a', 'false', 'London ', '2019-11-21 13:39:03', NULL, NULL, 1),
(66, '2019000066', 96, NULL, '2019-11-05', '', 'retail', 'Cash', '4300.00', '0.00', '0.00', '100.00', '4200.00', '4300.00', '0.00', 193799.00, 'a', 'false', 'London ', '2019-11-21 13:51:41', NULL, NULL, 1),
(67, '2019000067', 67, NULL, '2019-11-05', '', 'retail', 'Cash', '79247.70', '0.00', '0.00', '0.00', '79247.70', '0.00', '79247.70', 572052.95, 'a', 'false', 'London ', '2019-11-21 13:55:16', NULL, NULL, 1),
(68, '2019000068', 97, NULL, '2019-11-05', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '440.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 13:56:48', NULL, NULL, 1),
(69, '2019000069', 98, NULL, '2019-11-05', '', 'retail', 'Cash', '13200.00', '0.00', '0.00', '0.00', '13200.00', '13200.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 13:58:15', NULL, NULL, 1),
(70, '2019000070', 71, NULL, '2019-11-05', '', 'retail', 'Cash', '940.00', '0.00', '0.00', '20.00', '920.00', '0.00', '940.00', 220073.15, 'a', 'false', 'London ', '2019-11-21 14:01:13', NULL, NULL, 1),
(71, '2019000071', 60, NULL, '2019-11-06', '', 'retail', 'Cash', '83169.40', '0.00', '0.00', '400.00', '82769.40', '0.00', '83169.40', 166324.54, 'a', 'false', 'London ', '2019-11-21 15:14:45', NULL, NULL, 1),
(72, '2019000072', 65, NULL, '2019-11-06', '', 'retail', 'Cash', '4300.00', '0.00', '0.00', '100.00', '4200.00', '0.00', '4300.00', 20800.00, 'a', 'false', 'London ', '2019-11-21 15:16:35', NULL, NULL, 1),
(73, '2019000073', 60, NULL, '2019-11-07', '', 'retail', 'Cash', '35303.25', '0.00', '0.00', '165.00', '35138.25', '0.00', '35303.25', 249493.94, 'a', 'false', 'London ', '2019-11-21 15:20:42', NULL, NULL, 1),
(74, '2019000074', 99, NULL, '2019-11-07', '', 'retail', 'Cash', '840.00', '0.00', '0.00', '0.00', '840.00', '840.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 15:53:23', NULL, NULL, 1),
(75, '2019000075', 71, NULL, '2019-11-07', '', 'retail', 'Cash', '19000.00', '0.00', '0.00', '400.00', '18600.00', '0.00', '19000.00', 221013.15, 'a', 'false', 'London ', '2019-11-21 15:58:52', NULL, NULL, 1),
(76, '2019000076', 96, NULL, '2019-11-21', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '0.00', '440.00', 193799.00, 'd', 'false', 'London ', '2019-11-21 16:11:02', NULL, NULL, 1),
(77, '2019000077', 66, NULL, '2019-11-07', '', 'retail', 'Cash', '4750.00', '0.00', '0.00', '100.00', '4650.00', '0.00', '4750.00', 127014.45, 'a', 'false', 'London ', '2019-11-21 16:14:08', NULL, NULL, 1),
(78, '2019000078', 100, NULL, '2019-11-07', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '440.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 16:38:13', NULL, NULL, 1),
(79, '2019000079', 61, NULL, '2019-11-08', '', 'retail', 'Cash', '9018.40', '0.00', '0.00', '400.00', '8618.40', '9018.40', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 16:41:17', 'London ', '2019-11-21 16:43:14', 1),
(80, '2019000080', 101, NULL, '2019-11-08', '', 'retail', 'Cash', '4400.00', '0.00', '0.00', '0.00', '4400.00', '4400.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 16:45:30', NULL, NULL, 1),
(81, '2019000081', 67, NULL, '2019-11-08', '', 'retail', 'Cash', '14095.10', '0.00', '0.00', '65.00', '14030.10', '14095.10', '0.00', 651300.65, 'a', 'false', 'London ', '2019-11-21 16:48:25', NULL, NULL, 1),
(82, '2019000082', 102, NULL, '2019-11-09', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '440.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 16:51:00', NULL, NULL, 1),
(83, '2019000083', 96, NULL, '2019-11-09', '', 'retail', 'Cash', '4300.00', '0.00', '0.00', '100.00', '4200.00', '4300.00', '0.00', 193799.00, 'a', 'false', 'London ', '2019-11-21 16:52:04', NULL, NULL, 1),
(84, '2019000084', 60, NULL, '2019-11-10', '', 'retail', 'Cash', '23088.70', '0.00', '0.00', '100.00', '22988.70', '0.00', '23088.70', 284797.19, 'a', 'false', 'London ', '2019-11-21 17:35:13', NULL, NULL, 1),
(85, '2019000085', 103, NULL, '2019-11-10', '', 'retail', 'Cash', '8800.00', '0.00', '0.00', '0.00', '8800.00', '10000.00', '-1200.00', 32759.00, 'a', 'false', 'London ', '2019-11-21 17:49:13', NULL, NULL, 1),
(86, '2019000086', 104, NULL, '2019-11-10', '', 'retail', 'Cash', '920.00', '0.00', '0.00', '0.00', '920.00', '920.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 17:51:20', NULL, NULL, 1),
(87, '2019000087', 75, NULL, '2019-11-11', '', 'retail', 'Cash', '8700.00', '0.00', '0.00', '0.00', '8700.00', '8700.00', '0.00', 69122.00, 'a', 'false', 'London ', '2019-11-21 18:09:50', NULL, NULL, 1),
(88, '2019000088', 71, NULL, '2019-11-11', '', 'retail', 'Cash', '14250.00', '0.00', '0.00', '300.00', '13950.00', '0.00', '14250.00', 240013.15, 'a', 'false', 'London ', '2019-11-21 18:26:11', NULL, NULL, 1),
(89, '2019000089', 65, NULL, '2019-11-11', '', 'retail', 'Cash', '4300.00', '0.00', '0.00', '100.00', '4200.00', '0.00', '4300.00', 25100.00, 'a', 'false', 'London ', '2019-11-21 18:29:13', NULL, NULL, 1),
(90, '2019000090', 67, NULL, '2019-11-12', '', 'retail', 'Cash', '50942.55', '0.00', '0.00', '300.00', '50642.55', '50942.55', '0.00', 651300.65, 'a', 'false', 'London ', '2019-11-21 18:42:05', 'London ', '2019-11-30 12:25:57', 1),
(91, '2019000091', 71, NULL, '2019-11-12', '', 'retail', 'Cash', '4750.00', '0.00', '0.00', '100.00', '4650.00', '0.00', '4750.00', 254263.15, 'a', 'false', 'London ', '2019-11-21 18:43:14', NULL, NULL, 1),
(92, '2019000092', 105, NULL, '2019-11-12', '', 'retail', 'Cash', '4500.00', '0.00', '0.00', '100.00', '4400.00', '4500.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 18:44:53', NULL, NULL, 1),
(93, '2019000093', 106, NULL, '2019-11-12', '', 'retail', 'Cash', '445.00', '0.00', '0.00', '0.00', '445.00', '445.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-21 18:45:36', NULL, NULL, 1),
(94, '2019000094', 107, NULL, '2019-11-13', '', 'retail', 'Cash', '4853.35', '0.00', '0.00', '100.00', '4753.35', '4853.35', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-22 11:22:36', NULL, NULL, 1),
(95, '2019000095', 96, NULL, '2019-11-13', '', 'retail', 'Cash', '4300.00', '0.00', '0.00', '100.00', '4200.00', '4300.00', '0.00', 193799.00, 'a', 'false', 'London ', '2019-11-22 11:25:59', NULL, NULL, 1),
(96, '2019000096', 108, NULL, '2019-11-13', '', 'retail', 'Cash', '4450.00', '0.00', '0.00', '150.00', '4300.00', '4450.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-22 11:31:33', NULL, NULL, 1),
(97, '2019000097', 65, NULL, '2019-11-13', '', 'retail', 'Cash', '8600.00', '0.00', '0.00', '200.00', '8400.00', '0.00', '8600.00', 29400.00, 'a', 'false', 'London ', '2019-11-22 11:33:25', NULL, NULL, 1),
(98, '2019000098', 109, NULL, '2019-11-14', '', 'retail', 'Cash', '880.00', '0.00', '0.00', '0.00', '880.00', '880.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-22 11:36:36', NULL, NULL, 1),
(99, '2019000099', 110, NULL, '2019-11-14', '', 'retail', 'Cash', '2350.00', '0.00', '0.00', '50.00', '2300.00', '2350.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-22 11:37:31', NULL, NULL, 1),
(100, '2019000100', 111, NULL, '2019-11-14', '', 'retail', 'Cash', '900.00', '0.00', '0.00', '20.00', '880.00', '900.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-22 11:39:48', NULL, NULL, 1),
(101, '2019000101', 112, NULL, '2019-11-15', '', 'retail', 'Cash', '1880.00', '0.00', '0.00', '40.00', '1840.00', '1880.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-22 11:41:07', NULL, NULL, 1),
(102, '2019000102', 60, NULL, '2019-11-15', '', 'retail', 'Cash', '72000.00', '0.00', '0.00', '1600.00', '70400.00', '0.00', '72000.00', 307885.89, 'a', 'false', 'London ', '2019-11-22 11:48:13', NULL, NULL, 1),
(103, '2019000103', 71, NULL, '2019-11-15', '', 'retail', 'Cash', '14250.00', '0.00', '0.00', '300.00', '13950.00', '0.00', '14250.00', 259013.15, 'a', 'false', 'London ', '2019-11-22 11:50:33', NULL, NULL, 1),
(104, '2019000104', 77, NULL, '2019-11-15', '', 'retail', 'Cash', '6600.00', '0.00', '0.00', '150.00', '6450.00', '6600.00', '0.00', 192660.35, 'a', 'false', 'London ', '2019-11-22 11:52:29', NULL, NULL, 1),
(105, '2019000105', 113, NULL, '2019-11-15', '', 'retail', 'Cash', '880.00', '0.00', '0.00', '20.00', '860.00', '880.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-22 11:53:59', NULL, NULL, 1),
(106, '2019000106', 114, NULL, '2019-11-15', '', 'retail', 'Cash', '1380.00', '0.00', '0.00', '30.00', '1350.00', '1380.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-22 11:56:15', NULL, NULL, 1),
(107, '2019000107', 115, NULL, '2019-11-16', '', 'retail', 'Cash', '53347.90', '0.00', '0.00', '0.00', '53347.90', '0.00', '53347.90', 0.00, 'a', 'false', 'London ', '2019-11-23 10:08:58', NULL, NULL, 1),
(108, '2019000108', 116, NULL, '2019-11-16', '', 'retail', 'Cash', '880.00', '0.00', '0.00', '0.00', '880.00', '880.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-23 10:12:01', NULL, NULL, 1),
(109, '2019000109', 96, NULL, '2019-11-16', '', 'retail', 'Cash', '4300.00', '0.00', '0.00', '100.00', '4200.00', '4300.00', '0.00', 193799.00, 'a', 'false', 'London ', '2019-11-23 10:14:55', NULL, NULL, 1),
(110, '2019000110', 117, NULL, '2019-11-16', '', 'retail', 'Cash', '465.00', '0.00', '0.00', '0.00', '465.00', '465.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-23 10:22:37', NULL, NULL, 1),
(111, '2019000111', 118, NULL, '2019-11-16', '', 'retail', 'Cash', '430.00', '0.00', '0.00', '0.00', '430.00', '430.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-23 10:24:52', NULL, NULL, 1),
(112, '2019000112', 71, NULL, '2019-11-16', '', 'retail', 'Cash', '4750.00', '0.00', '0.00', '100.00', '4650.00', '0.00', '4750.00', 273263.15, 'a', 'false', 'London ', '2019-11-23 10:27:23', NULL, NULL, 1),
(113, '2019000113', 61, NULL, '2019-11-16', '', 'retail', 'Cash', '4400.00', '0.00', '0.00', '200.00', '4200.00', '4400.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-23 10:28:39', NULL, NULL, 1),
(114, '2019000114', 103, NULL, '2019-11-17', '', 'retail', 'Cash', '4600.00', '0.00', '0.00', '200.00', '4400.00', '5000.00', '-400.00', 31559.00, 'a', 'false', 'London ', '2019-11-23 10:39:29', NULL, NULL, 1),
(115, '2019000115', 75, NULL, '2019-11-17', '', 'retail', 'Cash', '4350.00', '0.00', '0.00', '0.00', '4350.00', '4350.00', '0.00', 69122.00, 'a', 'false', 'London ', '2019-11-23 10:40:57', NULL, NULL, 1),
(116, '2019000116', 65, NULL, '2019-11-17', '', 'retail', 'Cash', '8600.00', '0.00', '0.00', '200.00', '8400.00', '0.00', '8600.00', 38000.00, 'a', 'false', 'London ', '2019-11-23 10:42:08', NULL, NULL, 1),
(117, '2019000117', 119, NULL, '2019-11-17', '', 'retail', 'Cash', '2580.00', '0.00', '0.00', '0.00', '2580.00', '2580.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-23 10:43:34', NULL, NULL, 1),
(118, '2019000118', 115, NULL, '2019-11-18', '', 'retail', 'Cash', '41722.30', '0.00', '0.00', '528.00', '41194.30', '0.00', '41722.30', 53347.90, 'a', 'false', 'London ', '2019-11-23 11:12:20', NULL, NULL, 1),
(119, '2019000119', 115, NULL, '2019-11-18', '', 'retail', 'Cash', '3600.00', '0.00', '0.00', '0.00', '3600.00', '0.00', '3600.00', 95070.20, 'a', 'false', 'London ', '2019-11-23 11:20:50', NULL, NULL, 1),
(120, '2019000120', 120, NULL, '2019-11-18', '', 'retail', 'Cash', '1760.00', '0.00', '0.00', '0.00', '1760.00', '1760.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-23 11:23:36', NULL, NULL, 1),
(121, '2019000121', 71, NULL, '2019-11-18', '', 'retail', 'Cash', '4750.00', '0.00', '0.00', '100.00', '4650.00', '0.00', '4750.00', 278013.15, 'a', 'false', 'London ', '2019-11-23 11:24:38', NULL, NULL, 1),
(122, '2019000122', 121, NULL, '2019-11-18', '', 'retail', 'Cash', '1464.75', '0.00', '0.00', '0.00', '1464.75', '1464.75', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-23 11:26:00', NULL, NULL, 1),
(123, '2019000123', 71, NULL, '2019-11-18', '', 'retail', 'Cash', '5508.13', '0.00', '0.00', '30.00', '5478.13', '0.00', '5508.13', 282763.15, 'a', 'false', 'London ', '2019-11-23 11:28:01', NULL, NULL, 1),
(124, '2019000124', 61, NULL, '2019-11-19', '', 'retail', 'Cash', '4400.00', '0.00', '0.00', '200.00', '4200.00', '0.00', '4400.00', 0.00, 'a', 'false', 'London ', '2019-11-23 11:29:11', NULL, NULL, 1),
(125, '2019000125', 122, NULL, '2019-11-19', '', 'retail', 'Cash', '465.00', '0.00', '0.00', '0.00', '465.00', '465.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-23 11:33:43', NULL, NULL, 1),
(126, '2019000126', 123, NULL, '2019-11-19', '', 'retail', 'Cash', '4500.00', '0.00', '0.00', '100.00', '4400.00', '4500.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-23 11:37:50', NULL, NULL, 1),
(127, '2019000127', 77, NULL, '2019-11-19', '', 'retail', 'Cash', '2400.00', '0.00', '0.00', '0.00', '2400.00', '2400.00', '0.00', 192660.35, 'a', 'false', 'London ', '2019-11-23 11:41:54', NULL, NULL, 1),
(128, '2019000128', 71, NULL, '2019-11-19', '', 'retail', 'Cash', '4750.00', '0.00', '0.00', '100.00', '4650.00', '0.00', '4750.00', 288271.28, 'a', 'false', 'London ', '2019-11-23 11:43:51', NULL, NULL, 1),
(129, '2019000129', 124, NULL, '2019-11-20', '', 'retail', 'Cash', '2580.00', '0.00', '0.00', '0.00', '2580.00', '2580.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-23 12:32:15', NULL, NULL, 1),
(130, '2019000130', 125, NULL, '2019-11-20', '', 'retail', 'Cash', '1820.00', '0.00', '0.00', '40.00', '1780.00', '1820.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-23 12:35:37', NULL, NULL, 1),
(131, '2019000131', 66, NULL, '2019-11-20', '', 'retail', 'Cash', '30027.20', '0.00', '0.00', '140.00', '29887.20', '0.00', '30027.20', 131764.45, 'a', 'false', 'London ', '2019-11-23 12:47:27', NULL, NULL, 1),
(132, '2019000132', 77, NULL, '2019-11-20', '', 'retail', 'Cash', '1290.00', '0.00', '0.00', '0.00', '1290.00', '1290.00', '0.00', 192660.35, 'a', 'false', 'London ', '2019-11-23 12:48:29', NULL, NULL, 1),
(133, '2019000133', 126, NULL, '2019-11-20', '', 'retail', 'Cash', '115714.75', '0.00', '0.00', '1400.00', '114314.75', '115714.75', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-23 13:35:49', NULL, NULL, 1),
(134, '2019000134', 115, NULL, '2019-11-21', '', 'retail', 'Cash', '57430.90', '0.00', '0.00', '280.00', '57150.90', '0.00', '57430.90', 98670.20, 'a', 'false', 'London ', '2019-11-23 14:14:05', NULL, NULL, 1),
(135, '2019000135', 127, NULL, '2019-11-21', '', 'retail', 'Cash', '2200.00', '0.00', '0.00', '0.00', '2200.00', '0.00', '2200.00', 0.00, 'a', 'false', 'London ', '2019-11-23 14:37:07', NULL, NULL, 1),
(136, '2019000136', 65, NULL, '2019-11-21', '', 'retail', 'Cash', '8600.00', '0.00', '0.00', '200.00', '8400.00', '0.00', '8600.00', 46600.00, 'a', 'false', 'London ', '2019-11-23 14:38:42', NULL, NULL, 1),
(137, '2019000137', 71, NULL, '2019-11-21', '', 'retail', 'Cash', '4750.00', '0.00', '0.00', '100.00', '4650.00', '0.00', '4750.00', 293021.28, 'a', 'false', 'London ', '2019-11-24 14:14:19', NULL, NULL, 1),
(138, '2019000138', 128, NULL, '2019-11-21', '', 'retail', 'Cash', '4450.00', '0.00', '0.00', '150.00', '4300.00', '4450.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-24 14:16:43', NULL, NULL, 1),
(139, '2019000139', 103, NULL, '2019-11-21', '', 'retail', 'Cash', '15077.40', '0.00', '0.00', '0.00', '15077.40', '0.00', '15077.40', 31159.00, 'a', 'false', 'London ', '2019-11-24 19:03:34', NULL, NULL, 1),
(140, '2019000140', 129, NULL, '2019-11-21', '', 'retail', 'Cash', '1845.90', '0.00', '0.00', '0.00', '1845.90', '1845.90', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-24 19:05:01', NULL, NULL, 1),
(141, '2019000141', 130, NULL, '2019-11-22', '', 'retail', 'Cash', '1300.00', '0.00', '0.00', '10.00', '1290.00', '1300.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-24 19:06:42', NULL, NULL, 1),
(142, '2019000142', 115, NULL, '2019-11-22', '', 'retail', 'Cash', '32270.40', '0.00', '0.00', '160.00', '32110.40', '0.00', '32270.40', 156101.10, 'a', 'false', 'London ', '2019-11-24 19:08:56', NULL, NULL, 1),
(143, '2019000143', 66, NULL, '2019-11-22', '', 'retail', 'Cash', '14263.90', '0.00', '0.00', '70.00', '14193.90', '0.00', '14263.90', 161791.65, 'a', 'false', 'London ', '2019-11-24 19:11:16', NULL, NULL, 1),
(144, '2019000144', 131, NULL, '2019-11-23', '', 'retail', 'Cash', '450.00', '0.00', '0.00', '10.00', '440.00', '450.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-24 19:16:20', NULL, NULL, 1),
(145, '2019000145', 127, NULL, '2019-11-23', '', 'retail', 'Cash', '2250.00', '0.00', '0.00', '50.00', '2200.00', '0.00', '2250.00', 2200.00, 'a', 'false', 'London ', '2019-11-24 19:17:11', NULL, NULL, 1),
(146, '2019000146', 115, NULL, '2019-11-23', '', 'retail', 'Cash', '13000.00', '0.00', '0.00', '200.00', '12800.00', '0.00', '13000.00', 188371.50, 'a', 'false', 'London ', '2019-11-24 19:19:51', NULL, NULL, 1),
(147, '2019000147', 132, NULL, '2019-11-23', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '440.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-24 19:20:20', 'London ', '2019-11-24 19:25:19', 1),
(148, '2019000148', 71, NULL, '2019-11-23', '', 'retail', 'Cash', '2375.00', '0.00', '0.00', '50.00', '2325.00', '0.00', '2375.00', 297771.28, 'a', 'false', 'London ', '2019-11-24 19:21:16', NULL, NULL, 1),
(149, '2019000149', 133, NULL, '2019-11-23', '', 'retail', 'Cash', '4500.00', '0.00', '0.00', '100.00', '4400.00', '4500.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-24 19:22:37', NULL, NULL, 1),
(150, '2019000150', 96, NULL, '2019-11-23', '', 'retail', 'Cash', '4300.00', '0.00', '0.00', '100.00', '4200.00', '0.00', '4300.00', 193799.00, 'a', 'false', 'London ', '2019-11-24 19:24:36', NULL, NULL, 1),
(151, '2019000151', 61, NULL, '2019-11-24', '', 'retail', 'Cash', '4400.00', '0.00', '0.00', '200.00', '4200.00', '4400.00', '0.00', 4400.00, 'a', 'false', 'London ', '2019-11-24 19:30:12', NULL, NULL, 1),
(152, '2019000152', 134, NULL, '2019-11-24', '', 'retail', 'Cash', '23794.50', '0.00', '0.00', '200.00', '23594.50', '23794.50', '0.00', 0.00, 'd', 'false', 'London ', '2019-11-24 19:33:37', NULL, NULL, 1),
(153, '2019000153', 71, NULL, '2019-11-24', '', 'retail', 'Cash', '2375.00', '0.00', '0.00', '50.00', '2325.00', '0.00', '2375.00', 300146.28, 'a', 'false', 'London ', '2019-11-24 19:35:33', NULL, NULL, 1),
(154, '2019000154', 127, NULL, '2019-11-25', '', 'retail', 'Cash', '1350.00', '0.00', '0.00', '30.00', '1320.00', '0.00', '1350.00', 4450.00, 'a', 'false', 'London ', '2019-11-25 09:54:23', NULL, NULL, 1),
(155, '2019000155', 135, NULL, '2019-11-25', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '440.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-25 10:12:11', NULL, NULL, 1),
(156, '2019000156', 115, NULL, '2019-11-25', '', 'retail', 'Cash', '32684.70', '0.00', '0.00', '190.00', '32494.70', '0.00', '32684.70', 201371.50, 'a', 'false', 'London ', '2019-11-25 10:52:52', NULL, NULL, 1),
(157, '2019000157', 136, NULL, '2019-11-26', '', 'retail', 'Cash', '7172.45', '0.00', '0.00', '110.00', '7062.45', '7172.45', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-26 11:54:48', NULL, NULL, 1),
(158, '2019000158', 127, NULL, '2019-11-26', '', 'retail', 'Cash', '920.00', '0.00', '0.00', '40.00', '880.00', '0.00', '920.00', 5800.00, 'a', 'false', 'London ', '2019-11-26 12:03:28', NULL, NULL, 1),
(159, '2019000159', 137, NULL, '2019-11-26', '', 'retail', 'Cash', '1320.00', '0.00', '0.00', '0.00', '1320.00', '1320.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-26 12:08:56', NULL, NULL, 1),
(160, '2019000160', 138, NULL, '2019-11-24', '', 'retail', 'Cash', '23794.50', '0.00', '0.00', '200.00', '23594.50', '10000.00', '13794.50', 0.00, 'a', 'false', 'London ', '2019-11-26 12:29:03', NULL, NULL, 1),
(161, '2019000161', 138, NULL, '2019-11-26', '', 'retail', 'Cash', '5647.75', '0.00', '0.00', '150.00', '5497.75', '18500.00', '-12852.25', 13794.50, 'a', 'false', 'London ', '2019-11-26 12:33:08', 'London ', '2019-11-26 13:49:33', 1),
(162, '2019000162', 65, NULL, '2019-11-26', '', 'retail', 'Cash', '3042.50', '0.00', '0.00', '50.00', '2992.50', '0.00', '3042.50', 55200.00, 'a', 'false', 'London ', '2019-11-26 13:53:54', NULL, NULL, 1),
(163, '2019000163', 77, NULL, '2019-11-26', '', 'retail', 'Cash', '880.00', '0.00', '0.00', '0.00', '880.00', '880.00', '0.00', 192660.35, 'a', 'false', 'London ', '2019-11-26 13:55:08', 'London ', '2019-11-26 13:55:57', 1),
(164, '2019000164', 103, NULL, '2019-11-26', '', 'retail', 'Cash', '8800.00', '0.00', '0.00', '0.00', '8800.00', '0.00', '8800.00', 46236.40, 'a', 'false', 'London ', '2019-11-26 16:20:50', NULL, NULL, 1),
(165, '2019000165', 91, NULL, '2019-11-27', '', 'retail', 'Cash', '9763.10', '0.00', '0.00', '80.00', '9683.10', '0.00', '9763.10', 81144.70, 'a', 'false', 'London ', '2019-11-28 15:28:05', NULL, NULL, 1),
(166, '2019000166', 71, NULL, '2019-11-27', '', 'retail', 'Cash', '4520.00', '0.00', '0.00', '20.00', '4500.00', '0.00', '4520.00', 302521.28, 'a', 'false', 'London ', '2019-11-28 15:35:51', NULL, NULL, 1),
(167, '2019000167', 115, NULL, '2019-11-27', '', 'retail', 'Cash', '22400.00', '0.00', '0.00', '400.00', '22000.00', '0.00', '22400.00', 234056.20, 'a', 'false', 'London ', '2019-11-28 15:49:33', NULL, NULL, 1),
(168, '2019000168', 139, NULL, '2019-11-28', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '440.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-28 16:15:06', NULL, NULL, 1),
(169, '2019000169', 96, NULL, '2019-11-28', '', 'retail', 'Cash', '2150.00', '0.00', '0.00', '50.00', '2100.00', '0.00', '2150.00', 198099.00, 'a', 'false', 'London ', '2019-11-28 16:16:30', NULL, NULL, 1),
(170, '2019000170', 140, NULL, '2019-11-28', '', 'retail', 'Cash', '440.00', '0.00', '0.00', '0.00', '440.00', '440.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-28 16:19:29', NULL, NULL, 1),
(171, '2019000171', 141, NULL, '2019-11-28', '', 'retail', 'Cash', '9563.40', '0.00', '0.00', '0.00', '9563.40', '9563.40', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-28 16:31:52', NULL, NULL, 1),
(172, '2019000172', 142, NULL, '2019-11-28', '', 'retail', 'Cash', '1335.00', '0.00', '0.00', '0.00', '1335.00', '1335.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-28 16:34:02', NULL, NULL, 1),
(173, '2019000173', 65, NULL, '2019-11-28', '', 'retail', 'Cash', '13631.70', '0.00', '0.00', '250.00', '13381.70', '0.00', '13631.70', 58242.50, 'a', 'false', 'London ', '2019-11-28 16:36:33', 'London ', '2019-11-28 16:38:08', 1),
(174, '2019000174', 143, NULL, '2019-11-28', '', 'retail', 'Cash', '445.00', '0.00', '0.00', '0.00', '445.00', '445.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-28 16:39:02', NULL, NULL, 1),
(175, '2019000175', 115, NULL, '2019-11-28', '', 'retail', 'Cash', '35178.70', '0.00', '0.00', '0.00', '35178.70', '0.00', '35178.70', 256456.20, 'a', 'false', 'London ', '2019-11-28 16:40:53', NULL, NULL, 1),
(176, '2019000176', 144, NULL, '2019-11-28', '', 'retail', 'Cash', '445.00', '0.00', '0.00', '0.00', '445.00', '445.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-28 16:41:57', NULL, NULL, 1),
(177, '2019000177', 71, NULL, '2019-11-28', '', 'retail', 'Cash', '2375.00', '0.00', '0.00', '50.00', '2325.00', '0.00', '2375.00', 307041.28, 'a', 'false', 'London ', '2019-11-28 16:42:38', NULL, NULL, 1),
(178, '2019000178', 127, NULL, '2019-11-29', '', 'retail', 'Cash', '470.00', '0.00', '0.00', '30.00', '440.00', '0.00', '470.00', 6720.00, 'a', 'false', 'London ', '2019-11-29 10:25:40', NULL, NULL, 1),
(179, '2019000179', 127, NULL, '2019-11-29', '', 'retail', 'Cash', '490.00', '0.00', '0.00', '50.00', '440.00', '0.00', '490.00', 7190.00, 'd', 'false', 'London ', '2019-11-29 19:35:28', NULL, NULL, 1),
(180, '2019000180', 138, NULL, '2019-11-29', '', 'retail', 'Cash', '9500.00', '0.00', '0.00', '300.00', '9200.00', '0.00', '9500.00', 28.75, 'a', 'false', 'London ', '2019-11-29 19:36:22', NULL, NULL, 1),
(181, '2019000181', 71, NULL, '2019-11-29', '', 'retail', 'Cash', '13673.13', '0.00', '0.00', '70.00', '13603.13', '0.00', '13673.13', 309416.28, 'a', 'false', 'London ', '2019-11-29 19:37:19', NULL, NULL, 1),
(182, '2019000182', 145, NULL, '2019-11-29', '', 'retail', 'Cash', '2325.00', '0.00', '0.00', '0.00', '2325.00', '2325.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-29 19:38:23', NULL, NULL, 1),
(183, '2019000183', 61, NULL, '2019-11-29', '', 'retail', 'Cash', '4400.00', '0.00', '0.00', '200.00', '4200.00', '4400.00', '0.00', 4400.00, 'a', 'false', 'London ', '2019-11-29 19:39:21', NULL, NULL, 1),
(184, '2019000184', 146, NULL, '2019-11-29', '', 'retail', 'Cash', '445.00', '0.00', '0.00', '0.00', '445.00', '445.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-29 19:40:38', NULL, NULL, 1),
(185, '2019000185', 147, NULL, '2019-11-29', '', 'retail', 'Cash', '430.00', '0.00', '0.00', '0.00', '430.00', '430.00', '0.00', 0.00, 'a', 'false', 'London ', '2019-11-29 19:41:39', NULL, NULL, 1),
(186, '2019000186', 91, NULL, '2019-11-30', '', 'retail', 'Cash', '2700.00', '0.00', '0.00', '60.00', '2640.00', '0.00', '2700.00', 90907.80, 'a', 'false', 'London ', '2019-11-30 09:59:26', NULL, NULL, 1),
(187, '2019000187', 71, NULL, '2019-11-30', '', 'retail', 'Cash', '9500.00', '0.00', '0.00', '200.00', '9300.00', '0.00', '9500.00', 323089.41, 'a', 'false', 'London ', '2019-11-30 10:02:05', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms`
--

DROP TABLE IF EXISTS `tbl_sms`;
CREATE TABLE IF NOT EXISTS `tbl_sms` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) NOT NULL,
  `sms_text` varchar(500) NOT NULL,
  `sent_by` int(11) NOT NULL,
  `sent_datetime` datetime NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms_settings`
--

DROP TABLE IF EXISTS `tbl_sms_settings`;
CREATE TABLE IF NOT EXISTS `tbl_sms_settings` (
  `sms_enabled` varchar(10) NOT NULL DEFAULT 'false',
  `api_key` varchar(500) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `bulk_url` varchar(1000) NOT NULL,
  `sms_type` varchar(50) NOT NULL,
  `sender_id` varchar(200) NOT NULL,
  `sender_name` varchar(200) NOT NULL,
  `sender_phone` varchar(50) NOT NULL,
  `saved_by` int(11) DEFAULT NULL,
  `saved_datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_students`
--

DROP TABLE IF EXISTS `tbl_students`;
CREATE TABLE IF NOT EXISTS `tbl_students` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_email` varchar(255) NOT NULL,
  `stu_pass` varchar(255) NOT NULL,
  `stu_first_name` varchar(255) NOT NULL,
  `stu_last_name` varchar(255) NOT NULL,
  `stu_age` varchar(255) NOT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_students`
--

INSERT INTO `tbl_students` (`stu_id`, `stu_email`, `stu_pass`, `stu_first_name`, `stu_last_name`, `stu_age`) VALUES
(1, 'r@gmail.com', '123', 'Rayhan', 'Mondol', '20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

DROP TABLE IF EXISTS `tbl_supplier`;
CREATE TABLE IF NOT EXISTS `tbl_supplier` (
  `Supplier_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `Supplier_Code` varchar(50) NOT NULL,
  `Supplier_Name` varchar(150) NOT NULL,
  `Supplier_Type` varchar(50) NOT NULL,
  `Supplier_Phone` varchar(50) NOT NULL,
  `Supplier_Mobile` varchar(15) NOT NULL,
  `Supplier_Email` varchar(50) NOT NULL,
  `Supplier_OfficePhone` varchar(50) NOT NULL,
  `Supplier_Address` varchar(300) NOT NULL,
  `contact_person` varchar(250) DEFAULT NULL,
  `District_SlNo` int(11) NOT NULL,
  `Country_SlNo` int(11) NOT NULL,
  `Supplier_Web` varchar(150) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Supplier_brinchid` int(11) NOT NULL,
  PRIMARY KEY (`Supplier_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`Supplier_SlNo`, `Supplier_Code`, `Supplier_Name`, `Supplier_Type`, `Supplier_Phone`, `Supplier_Mobile`, `Supplier_Email`, `Supplier_OfficePhone`, `Supplier_Address`, `contact_person`, `District_SlNo`, `Country_SlNo`, `Supplier_Web`, `previous_due`, `image_name`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Supplier_brinchid`) VALUES
(1, 'S00001', 'General Supplier', '', '', ' ', '', '', ' ', '   ', 0, 0, '', '0.00', NULL, 'a', 'London ', '2019-11-14 15:43:00', NULL, NULL, 1),
(10, 'S00002', 'M/S Brohers Corp  (Cement)', '', '', '01855913712', '', '', 'Masjid Road, Tamgail', 'Md. Shahjahan Mia', 0, 0, '', '787700.00', NULL, 'a', 'London ', '2019-11-20 12:02:16', 'London ', '2019-11-27 16:50:43', 1),
(11, 'S00011', 'M/S Brothers Corp ( Rod )', '', '', '01855913724', '', '', 'Masjid Road, Tangail', 'Md. Shahjahan Mia', 0, 0, '', '16087.00', NULL, 'a', 'London ', '2019-11-20 12:16:07', 'London ', '2019-11-20 12:17:21', 1),
(12, 'S00012', 'M/S Rana Hardware', '', '', '01822805280', '', '', 'Dhaka Road, Sakhipur, Tangail', 'Md. Rony Ahmed', 0, 0, '', '290608.00', NULL, 'a', 'London ', '2019-11-20 12:49:32', NULL, NULL, 1),
(13, 'S00013', 'M/S Jonny Trading Corporation', '', '', '01712537417', '', '', 'Tangail Plaza, tangail', 'Jamal Hossen', 0, 0, '', '200440.00', NULL, 'a', 'London ', '2019-11-20 13:00:40', NULL, NULL, 1),
(14, 'S00014', 'M/S Trisha Enterprise', '', '', '01687732088', '', '', 'Club Road, Tangail', 'Jamal Hossen', 0, 0, '', '61000.00', NULL, 'a', 'London ', '2019-11-20 13:08:56', NULL, NULL, 1),
(15, 'S00015', 'M/S Anowar &  Brothers', '', '', '01741187601', '', '', 'Natiyapara, Tangail', 'Anowar Hossen', 0, 0, '', '390620.00', NULL, 'a', 'London ', '2019-11-20 13:24:12', NULL, NULL, 1),
(16, 'S00016', 'Md. Akibul Hassain.', '', '', '01817009348', '', '', 'Dhaka road, (atimkana goli) Shakipur.', 'Eng;', 0, 0, '', '2700.00', NULL, 'a', 'London ', '2019-11-23 11:17:59', NULL, NULL, 1),
(17, 'S00017', 'M/S I V Mithe Tredr\'s.', '', '', '01772966440', '', '', 'Park bazar, Tangail.', 'Md. Jowel Miah.', 0, 0, '', '0.00', NULL, 'a', 'London ', '2019-11-23 13:42:00', 'London ', '2019-11-27 14:14:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier_payment`
--

DROP TABLE IF EXISTS `tbl_supplier_payment`;
CREATE TABLE IF NOT EXISTS `tbl_supplier_payment` (
  `SPayment_id` int(11) NOT NULL AUTO_INCREMENT,
  `SPayment_date` date DEFAULT NULL,
  `SPayment_invoice` varchar(20) DEFAULT NULL,
  `SPayment_customerID` varchar(20) DEFAULT NULL,
  `SPayment_TransactionType` varchar(25) DEFAULT NULL,
  `SPayment_amount` decimal(18,2) DEFAULT NULL,
  `SPayment_Paymentby` varchar(20) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `SPayment_notes` varchar(225) DEFAULT NULL,
  `SPayment_brunchid` int(11) DEFAULT NULL,
  `SPayment_status` varchar(2) DEFAULT NULL,
  `SPayment_Addby` varchar(100) DEFAULT NULL,
  `SPayment_AddDAte` date DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `SPayment_UpdateDAte` date DEFAULT NULL,
  PRIMARY KEY (`SPayment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_supplier_payment`
--

INSERT INTO `tbl_supplier_payment` (`SPayment_id`, `SPayment_date`, `SPayment_invoice`, `SPayment_customerID`, `SPayment_TransactionType`, `SPayment_amount`, `SPayment_Paymentby`, `account_id`, `SPayment_notes`, `SPayment_brunchid`, `SPayment_status`, `SPayment_Addby`, `SPayment_AddDAte`, `update_by`, `SPayment_UpdateDAte`) VALUES
(1, '2019-10-15', 'TR00001', '10', 'CP', '1250.00', 'cash', NULL, 'Scan Cement Sales Commision Sept', 1, 'a', 'London ', '2019-11-20', 0, '2019-11-20'),
(2, '2019-10-26', 'TR00002', '10', 'CP', '15000.00', 'cash', NULL, 'Cash to Alal', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(3, '2019-10-29', 'TR00003', '10', 'CP', '10000.00', 'cash', NULL, 'Cash to Alal', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(4, '2019-11-05', 'TR00004', '10', 'CP', '500000.00', 'cash', NULL, 'Paying at Office by me', 1, 'a', 'London ', '2019-11-20', 0, '2019-11-20'),
(5, '2019-11-16', 'TR00005', '10', 'CP', '100000.00', 'cash', NULL, 'Cash to Alal', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(6, '2019-11-20', 'TR00006', '11', 'CP', '500000.00', 'cash', NULL, 'Advance Paying to Gopal Da', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(7, '2019-10-19', 'TR00007', '11', 'CP', '17500.00', 'cash', NULL, 'for Transport', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(8, '2019-10-21', 'TR00008', '11', 'CP', '150000.00', 'cash', NULL, 'Cash to Gopal Da', 1, 'a', 'London ', '2019-11-20', 0, '2019-11-27'),
(9, '2019-10-21', 'TR00009', '11', 'CP', '87.00', 'cash', NULL, 'Obolopon', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(10, '2019-10-31', 'TR00010', '11', 'CP', '17800.00', 'cash', NULL, 'for Transport-2nd', 1, 'a', 'London ', '2019-11-20', 0, '2019-11-27'),
(11, '2019-11-04', 'TR00011', '11', 'CP', '7000.00', 'cash', NULL, 'Cash to Gopal  Da', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(12, '2019-11-06', 'TR00012', '11', 'CP', '786500.00', 'cash', NULL, 'paying at office by Me', 1, 'd', 'London ', '2019-11-20', NULL, NULL),
(13, '2019-11-14', 'TR00013', '11', 'CP', '440000.00', 'cash', NULL, 'Islami bank online', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(14, '2019-11-18', 'TR00014', '11', 'CP', '60000.00', 'cash', NULL, 'Cash to Gopal Da', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(15, '2019-11-19', 'TR00015', '11', 'CP', '19500.00', 'cash', NULL, 'for 3rd trasnport', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(16, '2019-10-17', 'TR00016', '12', 'CP', '5395.00', 'cash', NULL, 'Sales Commision', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(17, '2019-10-20', 'TR00017', '12', 'CP', '30000.00', 'cash', NULL, 'Cash to Khoshed', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(18, '2019-10-20', 'TR00018', '12', 'CP', '6000.00', 'cash', NULL, 'for transport', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(19, '2019-10-28', 'TR00019', '12', 'CP', '10000.00', 'cash', NULL, 'Cash to Khorshed', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(20, '2019-10-31', 'TR00020', '12', 'CP', '15000.00', 'cash', NULL, 'cash to khorshed', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(21, '2019-11-07', 'TR00021', '12', 'CP', '50000.00', 'cash', NULL, 'Brac Bank Chaque for khorshed', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(22, '2019-11-08', 'TR00022', '12', 'CP', '5000.00', 'cash', NULL, 'for trasnport', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(23, '2019-11-14', 'TR00023', '12', 'CP', '20000.00', 'cash', NULL, 'Chaque & Cash to Khorshed', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(24, '2019-10-21', 'TR00024', '13', 'CP', '10000.00', 'cash', NULL, 'Cash to Arzu', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(25, '2019-10-21', 'TR00025', '13', 'CP', '5000.00', 'cash', NULL, 'for Transport', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(26, '2019-10-28', 'TR00026', '13', 'CP', '7000.00', 'cash', NULL, 'cash to Arzu', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(27, '2019-11-04', 'TR00027', '13', 'CP', '10000.00', 'cash', NULL, 'cash to Arzu', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(28, '2019-11-04', 'TR00028', '13', 'CP', '10000.00', 'cash', NULL, 'for Transport', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(29, '2019-11-13', 'TR00029', '13', 'CP', '15000.00', 'cash', NULL, 'cash to Arzu', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(30, '2019-11-18', 'TR00030', '13', 'CP', '10000.00', 'cash', NULL, 'cash to Azu', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(31, '2019-10-22', 'TR00031', '14', 'CP', '5000.00', 'cash', NULL, 'cash to Shapon', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(32, '2019-10-26', 'TR00032', '14', 'CP', '5000.00', 'cash', NULL, 'cash to Shapon', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(33, '2019-11-02', 'TR00033', '14', 'CP', '5000.00', 'cash', NULL, 'cash to Shapon', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(34, '2019-11-09', 'TR00034', '14', 'CP', '10000.00', 'cash', NULL, 'cas to Shapon', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(35, '2019-11-09', 'TR00035', '14', 'CP', '410.00', 'cash', NULL, 'obolopon', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(36, '2019-11-12', 'TR00036', '14', 'CP', '5000.00', 'cash', NULL, 'cash to shapon', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(37, '2019-11-19', 'TR00037', '14', 'CR', '15780.00', 'cash', NULL, 'Previous Due for Premier Cement', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(38, '2019-11-19', 'TR00038', '14', 'CP', '6000.00', 'cash', NULL, 'cah to shapon', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(39, '2019-11-10', 'TR00039', '15', 'CP', '10000.00', 'cash', NULL, 'cash to Sazzad', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(40, '2019-11-17', 'TR00040', '15', 'CP', '10000.00', 'cash', NULL, 'cash to Sazzad', 1, 'a', 'London ', '2019-11-20', NULL, NULL),
(41, '2019-11-21', 'TR00041', '12', 'CP', '20000.00', 'cash', NULL, 'cash to khorsed.', 1, 'a', 'London ', '2019-11-21', NULL, NULL),
(42, '2019-11-25', 'TR00042', '13', 'CP', '10000.00', 'cash', NULL, 'cash to Arzo\\amir', 1, 'a', 'London ', '2019-11-25', NULL, NULL),
(43, '2019-11-24', 'TR00043', '15', 'CP', '10000.00', 'cash', NULL, 'pay to Sazad.', 1, 'a', 'London ', '2019-11-25', NULL, NULL),
(44, '2019-11-23', 'TR00044', '14', 'CP', '15000.00', 'cash', NULL, 'pay to sopon.', 1, 'a', 'London ', '2019-11-25', NULL, NULL),
(45, '2019-11-27', 'TR00045', '17', 'CP', '5000.00', 'cash', NULL, 'pay to Md. Saddem bi', 1, 'a', 'London ', '2019-11-27', NULL, NULL),
(46, '2019-11-20', 'TR00046', '17', 'CP', '5500.00', 'cash', NULL, 'Insee cmt Tr sp.', 1, 'a', 'London ', '2019-11-27', NULL, NULL),
(47, '2019-10-25', 'TR00047', '10', 'CP', '1250.00', 'cash', NULL, 'sept scn cmt commision- 2019.', 1, 'd', 'London ', '2019-11-27', NULL, NULL),
(48, '2019-11-23', 'TR00048', '10', 'CP', '20000.00', 'cash', NULL, 'pay to alal', 1, 'a', 'London ', '2019-11-27', NULL, NULL),
(49, '2019-11-28', 'TR00049', '12', 'CP', '10000.00', 'cash', NULL, 'pay to khrshed.', 1, 'a', 'London ', '2019-11-28', NULL, NULL),
(50, '2019-11-30', 'TR00050', '10', 'CP', '20000.00', 'cash', NULL, 'pay to alal bi. M n- 6050.', 1, 'a', 'London ', '2019-11-30', NULL, NULL),
(51, '2019-11-30', 'TR00051', '14', 'CP', '10000.00', 'cash', NULL, 'pay to sopun, m n- 4140.', 1, 'a', 'London ', '2019-11-30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transferdetails`
--

DROP TABLE IF EXISTS `tbl_transferdetails`;
CREATE TABLE IF NOT EXISTS `tbl_transferdetails` (
  `transferdetails_id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  PRIMARY KEY (`transferdetails_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transfermaster`
--

DROP TABLE IF EXISTS `tbl_transfermaster`;
CREATE TABLE IF NOT EXISTS `tbl_transfermaster` (
  `transfer_id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_date` date NOT NULL,
  `transfer_by` int(11) NOT NULL,
  `transfer_from` int(11) NOT NULL,
  `transfer_to` int(11) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`transfer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unit`
--

DROP TABLE IF EXISTS `tbl_unit`;
CREATE TABLE IF NOT EXISTS `tbl_unit` (
  `Unit_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `Unit_Name` varchar(150) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Unit_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_unit`
--

INSERT INTO `tbl_unit` (`Unit_SlNo`, `Unit_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'PCS', 'a', 'Admin', '2019-03-06 12:11:15', 'Admin', '2019-05-12 06:53:41'),
(2, 'Bag', 'a', 'London ', '2019-11-14 15:04:09', NULL, NULL),
(3, 'Kg', 'a', 'London ', '2019-11-14 15:04:44', NULL, NULL),
(4, 'Liter', 'd', 'London ', '2019-11-17 12:15:33', NULL, NULL),
(5, 'ltr', 'a', 'London ', '2019-11-20 15:01:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `User_SlNo` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` varchar(50) NOT NULL,
  `FullName` varchar(150) NOT NULL,
  `User_Name` varchar(150) NOT NULL,
  `UserEmail` varchar(200) NOT NULL,
  `userBrunch_id` int(11) NOT NULL,
  `User_Password` varchar(50) NOT NULL,
  `UserType` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `verifycode` int(11) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Brunch_ID` int(11) NOT NULL,
  PRIMARY KEY (`User_SlNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`User_SlNo`, `User_ID`, `FullName`, `User_Name`, `UserEmail`, `userBrunch_id`, `User_Password`, `UserType`, `status`, `verifycode`, `image_name`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Brunch_ID`) VALUES
(1, '1', 'London ', 'admin', '', 1, '202cb962ac59075b964b07152d234b70', 'm', 'a', 0, NULL, NULL, '2019-10-31 00:00:00', NULL, '2019-10-31 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_access`
--

DROP TABLE IF EXISTS `tbl_user_access`;
CREATE TABLE IF NOT EXISTS `tbl_user_access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `access` text NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user_access`
--

INSERT INTO `tbl_user_access` (`access_id`, `user_id`, `access`, `saved_by`, `saved_datetime`) VALUES
(1, 2, '[\"sales\\/product\",\"sales\\/service\",\"salesReturn\",\"customer\",\"customerPaymentPage\",\"currentStock\",\"quotation\"]', 1, '2019-07-16 16:13:11');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
