-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 13, 2023 at 08:37 PM
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
-- Database: `lance`
--
-- --------------------------------------------------------
--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `userID` int(6) NOT NULL,
  `balance` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Balance for each user';

-- --------------------------------------------------------
--
-- Table structure for table `user`
--
CREATE TABLE `user` (
  `userID` int(6) NOT NULL,
  `userName` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='User information';


DELIMITER $$
-- Insert Trigger
CREATE TRIGGER insert_account
AFTER INSERT ON user
FOR EACH ROW
BEGIN
    INSERT INTO account (userID, balance) VALUES (NEW.userID, 100);
END$$
-- Delete Trigger
CREATE TRIGGER delete_account
AFTER DELETE ON user
FOR EACH ROW
BEGIN
    DELETE FROM account WHERE userID = OLD.userID;
END$$
DELIMITER ;
--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD KEY `fk_account_user_idx` (`userID`);
--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);
--
-- Constraints for dumped tables
--
--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `fk_account_user_idx` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;