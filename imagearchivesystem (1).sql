-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2017 at 06:17 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imagearchivesystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `follower_relation`
--

CREATE TABLE `follower_relation` (
  `userid1` int(10) NOT NULL,
  `userid2` int(10) NOT NULL,
  `isfollow` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `photoid` int(10) NOT NULL,
  `photo` longblob,
  `description` varchar(255) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `privacy` text NOT NULL,
  `userid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `photo_keyword_map`
--

CREATE TABLE `photo_keyword_map` (
  `photoid` int(10) NOT NULL,
  `keywordid` int(10) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tagged_keywords`
--

CREATE TABLE `tagged_keywords` (
  `keywordid` int(10) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tagged_people`
--

CREATE TABLE `tagged_people` (
  `photoid` int(10) NOT NULL,
  `userid1` int(10) NOT NULL,
  `userid2` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(10) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `gender` text,
  `dateofbirth` date DEFAULT NULL,
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `follower_relation`
--
ALTER TABLE `follower_relation`
  ADD KEY `followers` (`userid2`),
  ADD KEY `loginuser` (`userid1`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photoid`),
  ADD KEY `photo_user` (`userid`);

--
-- Indexes for table `photo_keyword_map`
--
ALTER TABLE `photo_keyword_map`
  ADD KEY `photo_id` (`photoid`),
  ADD KEY `keyword_id` (`keywordid`);

--
-- Indexes for table `tagged_keywords`
--
ALTER TABLE `tagged_keywords`
  ADD PRIMARY KEY (`keywordid`);

--
-- Indexes for table `tagged_people`
--
ALTER TABLE `tagged_people`
  ADD KEY `taggedphoto` (`photoid`),
  ADD KEY `tagginguser` (`userid1`),
  ADD KEY `taggeduser` (`userid2`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `photoid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `tagged_keywords`
--
ALTER TABLE `tagged_keywords`
  MODIFY `keywordid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `follower_relation`
--
ALTER TABLE `follower_relation`
  ADD CONSTRAINT `followers` FOREIGN KEY (`userid2`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loginuser` FOREIGN KEY (`userid1`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photo_keyword_map`
--
ALTER TABLE `photo_keyword_map`
  ADD CONSTRAINT `keyword_id` FOREIGN KEY (`keywordid`) REFERENCES `tagged_keywords` (`keywordid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `photo_id` FOREIGN KEY (`photoid`) REFERENCES `photo` (`photoid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tagged_people`
--
ALTER TABLE `tagged_people`
  ADD CONSTRAINT `taggedphoto` FOREIGN KEY (`photoid`) REFERENCES `photo` (`photoid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `taggeduser` FOREIGN KEY (`userid2`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tagginguser` FOREIGN KEY (`userid1`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
