-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2023 at 02:02 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `royalbankdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branchId` int(11) NOT NULL,
  `branchNo` varchar(111) NOT NULL,
  `branchName` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branchId`, `branchNo`, `branchName`) VALUES
(1, '100101', 'Brac Bank Ltd.'),
(2, '100102', 'Trust Bank Ltd.');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackId` int(11) NOT NULL,
  `message` text NOT NULL,
  `userId` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackId`, `message`, `userId`, `date`) VALUES
(1, 'This is testing message to admin or manager by fk', 1, '2023-12-15 04:32:42'),
(3, 'This is testing message to admin or manager by fk', 2, '2023-12-15 04:30:48'),
(4, 'this is help card for admin', 1, '2023-12-17 06:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(111) NOT NULL,
  `password` varchar(111) NOT NULL,
  `type` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `email`, `password`, `type`, `date`) VALUES
(1, 'cashier1@cashier.com', '12345', 'cashier1', '2023-12-15 04:36:27'),
(2, 'manager@manager.com', '12345', 'manager', '2023-12-15 04:36:27'),
(3, 'cashier2@cashier.com', '12345', 'cashier2', '2023-12-16 07:14:47'),
(4, 'rabbi@gmil.com', '12345', 'user', '2023-12-24 13:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `userId` varchar(111) NOT NULL,
  `notice` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `userId`, `notice`, `date`) VALUES
(1, '1', 'Dear Customer! <br> OUr privacy policy is changed for account information get new prospectus from your nearest branch', '2017-12-14 13:11:46'),
(6, '2', 'Dear Ali,<br>\r\nOur privacy policy has been changed please visit nearest <kbd> MCB </kbd> branch for new prospectus.', '2017-12-16 06:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `otheraccounts`
--

CREATE TABLE `otheraccounts` (
  `id` int(11) NOT NULL,
  `accountNo` varchar(111) NOT NULL,
  `bankName` varchar(111) NOT NULL,
  `holderName` varchar(111) NOT NULL,
  `balance` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `otheraccounts`
--

INSERT INTO `otheraccounts` (`id`, `accountNo`, `bankName`, `holderName`, `balance`, `date`) VALUES
(1, '12001122', 'UCB', 'Selim Mia', '40800', '2023-12-14 11:55:01'),
(2, '12001123', 'IBBL', 'Saima akter samia', '22000', '2023-12-14 11:35:04'),
(3, '12001124', 'Royal Bank Ltd.', 'Al Imtiaz', '1271500', '2023-12-14 11:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transactionId` int(11) NOT NULL,
  `action` varchar(111) NOT NULL,
  `credit` varchar(111) NOT NULL,
  `debit` varchar(111) NOT NULL,
  `balance` varchar(111) NOT NULL,
  `beneId` varchar(111) NOT NULL,
  `other` varchar(111) NOT NULL,
  `userId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transactionId`, `action`, `credit`, `debit`, `balance`, `beneId`, `other`, `userId`, `date`) VALUES
(4, 'transfer', '', '2000', '', '', '12001122', 1, '2023-11-12 12:33:40'),
(5, 'transfer', '', '2050', '', '', '10054777', 1, '2023-12-16 10:56:48'),
(6, 'transfer', '', '3050', '', '', '10054777', 1, '2023-04-14 12:57:20'),
(7, 'transfer', '', '2000', '', '', '10054777', 1, '2023-12-11 11:58:19'),
(8, 'transfer', '', '333', '', '', '10054777', 1, '2023-12-14 13:00:23'),
(16, 'withdraw', '', '100', '', '', '23423', 1, '2023-12-15 08:31:59'),
(17, 'deposit', '1200', '', '', '', '234232', 1, '2023-07-15 07:32:17'),
(18, 'transfer', '', '467', '', '', '12001122', 1, '2023-02-17 06:44:48'),
(22, 'deposit', '1200', '', '', '', '32424', 2, '2023-02-19 06:56:29'),
(23, 'withdraw', '', '1000', '', '', '23423', 2, '2023-10-17 05:59:02'),
(24, 'deposit', '12', '', '', '', '21321', 2, '2023-05-11 06:59:20'),
(25, 'transfer', '', '1200', '', '', '10054777', 1, '2023-01-16 08:01:37'),
(26, 'deposit', '600', '', '', '', '342342', 2, '2023-12-17 06:04:39'),
(27, 'withdraw', '', '1012', '', '', '23423', 2, '2023-10-04 07:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `useraccounts`
--

CREATE TABLE `useraccounts` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `name` varchar(111) NOT NULL,
  `balance` varchar(111) NOT NULL,
  `cnic` varchar(111) NOT NULL,
  `number` varchar(111) NOT NULL,
  `city` varchar(111) NOT NULL,
  `address` varchar(111) NOT NULL,
  `source` varchar(111) NOT NULL,
  `accountNo` varchar(111) NOT NULL,
  `branch` varchar(111) NOT NULL,
  `accountType` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `birth` date NOT NULL DEFAULT current_timestamp(),
  `nationality` varchar(200) NOT NULL,
  `occupation` varchar(200) NOT NULL,
  `authority` varchar(200) NOT NULL,
  `issued_state` varchar(200) NOT NULL,
  `district` varchar(200) NOT NULL,
  `nid_number` varchar(200) NOT NULL,
  `nname` varchar(200) NOT NULL,
  `nnid` varchar(200) NOT NULL,
  `issued_date` date NOT NULL DEFAULT current_timestamp(),
  `expiry_date` date NOT NULL DEFAULT current_timestamp(),
  `select_gender` varchar(200) NOT NULL DEFAULT 'gender'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `useraccounts`
--

INSERT INTO `useraccounts` (`id`, `email`, `password`, `name`, `balance`, `cnic`, `number`, `city`, `address`, `source`, `accountNo`, `branch`, `accountType`, `date`, `birth`, `nationality`, `occupation`, `authority`, `issued_state`, `district`, `nid_number`, `nname`, `nnid`, `issued_date`, `expiry_date`, `select_gender`) VALUES
(7, 'Arisha@gmail.com', '12345', 'Arisha islam tazbi', '12121', '3240338834901', '01641819220', 'Mymensingh', 'IBBL', 'Student', '1513410837', '1', 'saving', '2023-11-16 07:54:18', '2023-10-23', '', '', '', '', '', '', '', '', '2023-10-23', '2023-10-23', 'gender'),
(11, 'rabbi@gmil.com', '12345', 'golam rabbi', '23154315', '1234556457648', '0123435333', 'dhaka', 'mirpur', '123000', '1431524316666624', '1', 'saving', '2023-12-24 12:57:16', '2023-12-01', 'bangladeshi', 'student', 'afad', 'family', '143154535245', 'arman', '13133435324', 'dhaka', '2009-12-14', '2023-12-07', 'Male'),
(12, 'rabbi@gmil.com', '12345', 'golam rabbi', '12134232', '1342143535', '06870993224', 'dhaka', 'mirpur', '123000', '1431524316666624', '2', 'saving', '2023-12-24 13:00:21', '2023-12-08', 'bangladeshi', 'student', 'father', 'family', '6456436345', 'arman', '1234566778', 'bangladesh', '2010-12-09', '2023-12-28', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `user_form`
--

CREATE TABLE `user_form` (
  `id` int(200) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'user',
  `number` varchar(200) NOT NULL,
  `birth` text NOT NULL DEFAULT current_timestamp(),
  `address` varchar(200) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `nationality` varchar(200) NOT NULL,
  `occupation` varchar(200) NOT NULL,
  `authority` varchar(200) NOT NULL,
  `issued_state` varchar(200) NOT NULL,
  `issued_date` varchar(200) NOT NULL DEFAULT current_timestamp(),
  `expiry_date` varchar(200) NOT NULL DEFAULT current_timestamp(),
  `nominee_name` varchar(200) NOT NULL,
  `nid_number` varchar(200) NOT NULL,
  `select_gender` varchar(200) NOT NULL DEFAULT 'gender'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_form`
--

INSERT INTO `user_form` (`id`, `name`, `email`, `password`, `user_type`, `number`, `birth`, `address`, `account_type`, `nationality`, `occupation`, `authority`, `issued_state`, `issued_date`, `expiry_date`, `nominee_name`, `nid_number`, `select_gender`) VALUES
(1, 'selim', 'selims@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'user', '01456789235', '02-03-1980', 'bangladesh', 'student', ' bangladesh', 'student', 'fddfs', 'sdaas', '03-02-1960', '03-60-1205', 'nahim', '1234567890258963', 'Male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchId`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackId`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otheraccounts`
--
ALTER TABLE `otheraccounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionId`);

--
-- Indexes for table `useraccounts`
--
ALTER TABLE `useraccounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_form`
--
ALTER TABLE `user_form`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branchId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `otheraccounts`
--
ALTER TABLE `otheraccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `useraccounts`
--
ALTER TABLE `useraccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_form`
--
ALTER TABLE `user_form`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
