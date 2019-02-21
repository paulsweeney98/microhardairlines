-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2019 at 04:34 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `microhard_airlines`
--

-- --------------------------------------------------------

--
-- Table structure for table `checked_baggage`
--

CREATE TABLE `checked_baggage` (
  `id` int(11) NOT NULL,
  `size` varchar(20) NOT NULL,
  `weight` double(5,2) NOT NULL,
  `userId` int(11) NOT NULL,
  `flightId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `id` int(11) NOT NULL,
  `flightNumber` varchar(20) NOT NULL,
  `price` double(11,2) NOT NULL,
  `standardSeatsAvailable` int(1) NOT NULL,
  `businessSeatsAvailable` int(1) NOT NULL,
  `firstClassSeatsAvailable` int(1) NOT NULL,
  `date` date NOT NULL,
  `departureTime` time NOT NULL,
  `arrivalTime` time NOT NULL,
  `departureAirport` varchar(80) NOT NULL,
  `departureAirportAbbreviation` varchar(3) NOT NULL,
  `arrivalAirport` varchar(80) NOT NULL,
  `arrivalAirportAbbreviation` varchar(3) NOT NULL,
  `departureTerminal` varchar(3) NOT NULL,
  `arrivalTerminal` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flight_plane`
--

CREATE TABLE `flight_plane` (
  `flightId` int(11) NOT NULL,
  `planeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flight_staff`
--

CREATE TABLE `flight_staff` (
  `flightId` int(11) NOT NULL,
  `staffId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plane`
--

CREATE TABLE `plane` (
  `id` int(11) NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `standardSeatsCapacity` int(1) NOT NULL,
  `businessSeatsCapacity` int(1) NOT NULL,
  `firstClassSeatsCapacity` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(40) NOT NULL,
  `role` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(40) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `addressLine1` varchar(100) NOT NULL,
  `addressLine2` varchar(100) NOT NULL,
  `cityOrTown` varchar(60) NOT NULL,
  `postalCode` varchar(12) NOT NULL,
  `county` varchar(30) NOT NULL,
  `country` varchar(60) NOT NULL,
  `privileges` int(1) NOT NULL,
  `suspended` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_flight`
--

CREATE TABLE `user_flight` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `flightId` int(11) NOT NULL,
  `passengerFirstName` varchar(40) NOT NULL,
  `passengerLastName` varchar(40) NOT NULL,
  `travelClass` varchar(12) NOT NULL,
  `queue` varchar(12) NOT NULL,
  `seat` varchar(6) NOT NULL,
  `boardingDoor` varchar(6) NOT NULL,
  `specialAssistanceRequired` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checked_baggage`
--
ALTER TABLE `checked_baggage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_userId2` (`userId`),
  ADD KEY `FK_flightId2` (`flightId`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flight_plane`
--
ALTER TABLE `flight_plane`
  ADD PRIMARY KEY (`flightId`,`planeId`),
  ADD KEY `FK_planeId` (`planeId`);

--
-- Indexes for table `flight_staff`
--
ALTER TABLE `flight_staff`
  ADD PRIMARY KEY (`flightId`,`staffId`),
  ADD KEY `FK_staffId` (`staffId`);

--
-- Indexes for table `plane`
--
ALTER TABLE `plane`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_flight`
--
ALTER TABLE `user_flight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_userId` (`userId`),
  ADD KEY `FK_flightId` (`flightId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checked_baggage`
--
ALTER TABLE `checked_baggage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plane`
--
ALTER TABLE `plane`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_flight`
--
ALTER TABLE `user_flight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checked_baggage`
--
ALTER TABLE `checked_baggage`
  ADD CONSTRAINT `FK_flightId2` FOREIGN KEY (`flightId`) REFERENCES `flight` (`id`),
  ADD CONSTRAINT `FK_userId2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);

--
-- Constraints for table `flight_plane`
--
ALTER TABLE `flight_plane`
  ADD CONSTRAINT `FK_flightId3` FOREIGN KEY (`flightId`) REFERENCES `flight` (`id`),
  ADD CONSTRAINT `FK_planeId` FOREIGN KEY (`planeId`) REFERENCES `plane` (`id`);

--
-- Constraints for table `flight_staff`
--
ALTER TABLE `flight_staff`
  ADD CONSTRAINT `FK_flightId4` FOREIGN KEY (`flightId`) REFERENCES `flight` (`id`),
  ADD CONSTRAINT `FK_staffId` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`);

--
-- Constraints for table `user_flight`
--
ALTER TABLE `user_flight`
  ADD CONSTRAINT `FK_flightId` FOREIGN KEY (`flightId`) REFERENCES `flight` (`id`),
  ADD CONSTRAINT `FK_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
