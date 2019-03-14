-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2019 at 09:43 AM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `microhard_airlines_test`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `flightProcAll` (`week_beginning` DATE)  BEGIN
	CALL flightProcDublinLondon(week_beginning);
	CALL flightProcLondonDublin(week_beginning);
	CALL flightProcDublinParis(week_beginning);
	CALL flightProcParisDublin(week_beginning);
	CALL flightProcDublinNewYork(week_beginning);
	CALL flightProcNewYorkDublin(week_beginning);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `flightProcDublinLondon` (`week_beginning` DATE)  wholeblock:BEGIN
	DECLARE i,j INT DEFAULT 0;
	loop_label: LOOP
		SET j=0;	
			loop_label2: LOOP
				IF j >= 9 THEN
					LEAVE loop_label2;
				END IF;
				INSERT INTO flight (flightNumber, planeInventoryId, price, standardSeatsAvailable, 
				businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, 
				arrivalTime, duration, departureAirport, departureAirportAbbreviation,
				arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal) 
				VALUES (CONCAT("MA-100", CAST((j) AS CHAR(2))), 3, 49.99, 164, 40, 16, DATE_ADD(week_beginning, INTERVAL i DAY), 360+(j*120), 430+(j*120), 70, "Dublin", "DUB", "London Heathrow", "LHR", "T2", "T4");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `flightProcDublinNewYork` (`week_beginning` DATE)  wholeblock:BEGIN
	DECLARE i,j INT DEFAULT 0;
	loop_label: LOOP
		SET j=0;	
			loop_label2: LOOP
				IF j >= 2 THEN
					LEAVE loop_label2;
				END IF;
				INSERT INTO flight (flightNumber, planeInventoryId, price, standardSeatsAvailable, 
				businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, 
				arrivalTime, duration, departureAirport, departureAirportAbbreviation,
				arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal) 
				VALUES (CONCAT("MA-260", CAST((j) AS CHAR(2))), 1, 499.99, 341, 90, 36, DATE_ADD(week_beginning, INTERVAL i DAY), 650+(j*360), 800+(j*360), 450, "Dublin", "DUB", "New York", "JFK", "T2", "T3");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `flightProcDublinParis` (`week_beginning` DATE)  wholeblock:BEGIN
	DECLARE i,j INT DEFAULT 0;
	loop_label: LOOP
		SET j=0;	
			loop_label2: LOOP
				IF j >= 4 THEN
					LEAVE loop_label2;
				END IF;
				INSERT INTO flight (flightNumber, planeInventoryId, price, standardSeatsAvailable, 
				businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, 
				arrivalTime, duration, departureAirport, departureAirportAbbreviation,
				arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal) 
				VALUES (CONCAT("MA-206", CAST((j) AS CHAR(2))), 5, 39.99, 164, 40, 16, DATE_ADD(week_beginning, INTERVAL i DAY), 390+(j*240), 560+(j*240), 110, "Dublin", "DUB", "Paris", "CDG", "T2", "T2");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `flightProcLondonDublin` (`week_beginning` DATE)  wholeblock:BEGIN
	DECLARE i,j INT DEFAULT 0;
	loop_label: LOOP
		SET j=0;	
			loop_label2: LOOP
				IF j >= 9 THEN
					LEAVE loop_label2;
				END IF;
				INSERT INTO flight (flightNumber, planeInventoryId, price, standardSeatsAvailable, 
				businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, 
				arrivalTime, duration, departureAirport, departureAirportAbbreviation,
				arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal) 
				VALUES (CONCAT("MA-101", CAST((j) AS CHAR(2))), 3, 69.99, 164, 40, 16, DATE_ADD(week_beginning, INTERVAL i DAY), 420+(j*120), 490+(j*120), 70, "London Heathrow", "LHR", "Dublin", "DUB", "T4", "T2");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `flightProcNewYorkDublin` (`week_beginning` DATE)  wholeblock:BEGIN
	DECLARE i,j INT DEFAULT 0;
	loop_label: LOOP
		SET j=0;	
			loop_label2: LOOP
				IF j >= 2 THEN
					LEAVE loop_label2;
				END IF;
				INSERT INTO flight (flightNumber, planeInventoryId, price, standardSeatsAvailable, 
				businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, 
				arrivalTime, duration, departureAirport, departureAirportAbbreviation,
				arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal) 
				VALUES (CONCAT("MA-270", CAST((j) AS CHAR(2))), 1, 579.99, 341, 90, 36, DATE_ADD(week_beginning, INTERVAL i DAY), 1040+(j*360), 290+(j*360), 450, "New York", "JFK", "Dublin", "DUB", "T3", "T2");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `flightProcParisDublin` (`week_beginning` DATE)  wholeblock:BEGIN
	DECLARE i,j INT DEFAULT 0;
	loop_label: LOOP
		SET j=0;	
			loop_label2: LOOP
				IF j >= 4 THEN
					LEAVE loop_label2;
				END IF;
				INSERT INTO flight (flightNumber, planeInventoryId, price, standardSeatsAvailable, 
				businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, 
				arrivalTime, duration, departureAirport, departureAirportAbbreviation,
				arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal) 
				VALUES (CONCAT("MA-207", CAST((j) AS CHAR(2))), 5, 39.99, 164, 40, 16, DATE_ADD(week_beginning, INTERVAL i DAY), 620+(j*240), 670+(j*240), 110, "Paris", "CDG", "Dublin", "DUB", "T2", "T2");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `checked_baggage`
--

CREATE TABLE `checked_baggage` (
  `id` int(11) NOT NULL,
  `weight` double(5,2) NOT NULL,
  `pricePaid` double(11,2) NOT NULL,
  `user_flightId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checked_baggage`
--

INSERT INTO `checked_baggage` (`id`, `weight`, `pricePaid`, `user_flightId`) VALUES
(1, 20.00, 25.00, 21),
(2, 20.00, 25.00, 22);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `id` int(11) NOT NULL,
  `planeInventoryId` int(11) NOT NULL,
  `flightNumber` varchar(20) NOT NULL,
  `price` double(11,2) NOT NULL,
  `standardSeatsAvailable` int(1) NOT NULL,
  `businessSeatsAvailable` int(1) NOT NULL,
  `firstClassSeatsAvailable` int(1) NOT NULL,
  `date` date NOT NULL,
  `departureTime` int(6) NOT NULL,
  `arrivalTime` int(6) NOT NULL,
  `duration` int(6) NOT NULL,
  `departureAirport` varchar(80) NOT NULL,
  `departureAirportAbbreviation` varchar(3) NOT NULL,
  `arrivalAirport` varchar(80) NOT NULL,
  `arrivalAirportAbbreviation` varchar(3) NOT NULL,
  `departureTerminal` varchar(3) NOT NULL,
  `arrivalTerminal` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`id`, `planeInventoryId`, `flightNumber`, `price`, `standardSeatsAvailable`, `businessSeatsAvailable`, `firstClassSeatsAvailable`, `date`, `departureTime`, `arrivalTime`, `duration`, `departureAirport`, `departureAirportAbbreviation`, `arrivalAirport`, `arrivalAirportAbbreviation`, `departureTerminal`, `arrivalTerminal`) VALUES
(2108, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-02-18', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2109, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-02-18', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2110, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-02-18', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2111, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-02-18', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2112, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-02-18', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2113, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-02-18', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2114, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-02-18', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2115, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-02-18', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2116, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-02-18', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2117, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-02-19', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2118, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-02-19', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2119, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-02-19', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2120, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-02-19', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2121, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-02-19', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2122, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-02-19', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2123, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-02-19', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2124, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-02-19', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2125, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-02-19', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2126, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-02-20', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2127, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-02-20', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2128, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-02-20', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2129, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-02-20', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2130, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-02-20', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2131, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-02-20', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2132, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-02-20', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2133, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-02-20', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2134, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-02-20', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2135, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-02-21', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2136, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-02-21', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2137, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-02-21', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2138, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-02-21', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2139, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-02-21', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2140, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-02-21', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2141, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-02-21', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2142, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-02-21', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2143, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-02-21', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2144, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-02-22', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2145, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-02-22', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2146, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-02-22', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2147, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-02-22', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2148, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-02-22', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2149, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-02-22', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2150, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-02-22', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2151, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-02-22', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2152, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-02-22', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2153, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-02-23', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2154, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-02-23', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2155, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-02-23', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2156, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-02-23', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2157, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-02-23', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2158, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-02-23', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2159, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-02-23', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2160, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-02-23', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2161, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-02-23', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2162, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-02-24', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2163, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-02-24', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2164, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-02-24', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2165, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-02-24', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2166, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-02-24', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2167, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-02-24', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2168, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-02-24', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2169, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-02-24', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2170, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-02-24', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2171, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-02-18', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2172, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-02-18', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2173, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-02-18', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2174, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-02-18', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2175, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-02-18', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2176, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-02-18', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2177, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-02-18', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2178, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-02-18', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2179, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-02-18', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2180, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-02-19', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2181, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-02-19', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2182, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-02-19', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2183, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-02-19', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2184, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-02-19', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2185, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-02-19', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2186, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-02-19', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2187, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-02-19', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2188, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-02-19', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2189, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-02-20', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2190, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-02-20', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2191, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-02-20', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2192, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-02-20', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2193, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-02-20', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2194, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-02-20', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2195, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-02-20', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2196, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-02-20', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2197, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-02-20', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2198, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-02-21', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2199, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-02-21', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2200, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-02-21', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2201, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-02-21', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2202, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-02-21', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2203, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-02-21', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2204, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-02-21', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2205, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-02-21', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2206, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-02-21', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2207, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-02-22', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2208, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-02-22', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2209, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-02-22', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2210, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-02-22', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2211, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-02-22', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2212, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-02-22', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2213, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-02-22', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2214, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-02-22', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2215, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-02-22', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2216, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-02-23', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2217, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-02-23', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2218, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-02-23', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2219, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-02-23', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2220, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-02-23', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2221, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-02-23', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2222, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-02-23', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2223, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-02-23', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2224, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-02-23', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2225, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-02-24', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2226, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-02-24', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2227, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-02-24', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2228, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-02-24', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2229, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-02-24', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2230, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-02-24', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2231, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-02-24', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2232, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-02-24', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2233, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-02-24', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2234, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-02-18', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2235, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-02-18', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2236, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-02-18', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2237, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-02-18', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2238, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-02-19', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2239, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-02-19', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2240, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-02-19', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2241, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-02-19', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2242, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-02-20', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2243, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-02-20', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2244, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-02-20', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2245, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-02-20', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2246, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-02-21', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2247, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-02-21', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2248, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-02-21', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2249, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-02-21', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2250, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-02-22', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2251, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-02-22', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2252, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-02-22', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2253, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-02-22', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2254, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-02-23', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2255, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-02-23', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2256, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-02-23', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2257, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-02-23', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2258, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-02-24', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2259, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-02-24', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2260, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-02-24', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2261, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-02-24', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2262, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-02-18', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2263, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-02-18', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2264, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-02-18', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2265, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-02-18', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2266, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-02-19', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2267, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-02-19', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2268, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-02-19', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2269, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-02-19', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2270, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-02-20', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2271, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-02-20', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2272, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-02-20', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2273, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-02-20', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2274, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-02-21', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2275, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-02-21', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2276, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-02-21', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2277, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-02-21', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2278, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-02-22', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2279, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-02-22', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2280, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-02-22', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2281, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-02-22', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2282, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-02-23', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2283, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-02-23', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2284, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-02-23', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2285, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-02-23', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2286, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-02-24', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2287, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-02-24', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2288, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-02-24', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2289, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-02-24', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2290, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-02-18', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2291, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-02-18', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2292, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-02-19', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2293, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-02-19', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2294, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-02-20', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2295, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-02-20', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2296, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-02-21', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2297, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-02-21', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2298, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-02-22', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2299, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-02-22', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2300, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-02-23', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2301, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-02-23', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2302, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-02-24', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2303, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-02-24', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2304, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-02-18', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2305, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-02-18', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2306, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-02-19', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2307, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-02-19', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2308, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-02-20', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2309, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-02-20', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2310, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-02-21', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2311, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-02-21', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2312, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-02-22', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2313, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-02-22', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2314, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-02-23', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2315, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-02-23', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2316, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-02-24', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2317, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-02-24', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2318, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-02-25', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2319, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-02-25', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2320, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-02-25', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2321, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-02-25', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2322, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-02-25', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2323, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-02-25', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2324, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-02-25', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2325, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-02-25', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2326, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-02-25', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2327, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-02-26', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2328, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-02-26', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2329, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-02-26', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2330, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-02-26', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2331, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-02-26', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2332, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-02-26', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2333, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-02-26', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2334, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-02-26', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2335, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-02-26', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2336, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-02-27', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2337, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-02-27', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2338, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-02-27', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2339, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-02-27', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2340, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-02-27', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2341, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-02-27', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2342, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-02-27', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2343, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-02-27', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2344, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-02-27', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2345, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-02-28', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2346, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-02-28', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2347, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-02-28', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2348, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-02-28', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2349, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-02-28', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2350, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-02-28', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2351, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-02-28', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2352, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-02-28', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2353, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-02-28', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2354, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-01', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2355, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-01', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2356, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-01', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2357, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-01', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2358, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-01', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2359, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-01', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2360, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-01', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2361, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-01', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2362, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-01', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2363, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-02', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2364, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-02', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2365, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-02', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2366, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-02', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2367, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-02', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2368, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-02', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2369, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-02', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2370, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-02', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2371, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-02', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2372, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-03', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2373, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-03', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2374, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-03', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2375, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-03', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2376, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-03', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2377, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-03', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2378, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-03', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2379, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-03', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2380, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-03', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2381, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-02-25', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2382, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-02-25', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2383, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-02-25', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2384, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-02-25', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2385, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-02-25', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2386, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-02-25', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2387, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-02-25', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2388, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-02-25', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2389, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-02-25', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2390, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-02-26', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2391, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-02-26', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2392, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-02-26', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2393, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-02-26', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2394, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-02-26', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2395, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-02-26', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2396, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-02-26', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2397, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-02-26', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2398, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-02-26', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2399, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-02-27', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2400, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-02-27', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2401, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-02-27', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2402, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-02-27', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2403, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-02-27', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2404, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-02-27', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2405, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-02-27', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2406, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-02-27', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2407, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-02-27', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2408, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-02-28', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2409, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-02-28', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2410, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-02-28', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2411, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-02-28', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2412, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-02-28', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2413, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-02-28', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2414, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-02-28', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2415, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-02-28', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2416, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-02-28', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2417, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-01', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2418, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-01', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2419, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-01', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2420, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-01', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2421, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-01', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2422, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-01', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2423, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-01', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2424, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-01', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2425, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-01', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2426, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-02', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2427, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-02', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2428, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-02', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2429, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-02', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2430, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-02', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2431, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-02', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2432, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-02', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2433, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-02', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2434, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-02', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2435, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-03', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2436, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-03', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2437, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-03', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2438, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-03', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2439, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-03', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2440, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-03', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2441, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-03', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2442, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-03', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2443, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-03', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2444, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-02-25', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2445, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-02-25', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2446, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-02-25', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2447, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-02-25', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2448, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-02-26', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2449, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-02-26', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2450, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-02-26', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2451, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-02-26', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2452, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-02-27', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2453, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-02-27', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2454, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-02-27', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2455, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-02-27', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2456, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-02-28', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2457, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-02-28', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2458, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-02-28', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2459, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-02-28', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2460, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-01', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2461, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-01', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2462, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-01', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2463, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-01', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2464, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-02', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2465, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-02', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2466, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-02', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2467, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-02', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2468, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-03', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2469, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-03', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2470, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-03', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2471, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-03', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2472, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-02-25', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2473, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-02-25', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2474, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-02-25', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2475, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-02-25', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2476, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-02-26', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2477, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-02-26', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2478, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-02-26', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2479, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-02-26', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2480, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-02-27', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2481, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-02-27', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2482, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-02-27', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2483, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-02-27', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2484, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-02-28', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2485, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-02-28', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2486, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-02-28', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2487, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-02-28', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2488, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-01', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2489, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-01', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2490, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-01', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2491, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-01', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2492, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-02', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2493, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-02', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2494, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-02', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2495, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-02', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2496, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-03', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2497, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-03', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2498, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-03', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2499, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-03', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2500, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-02-25', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2501, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-02-25', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2502, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-02-26', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2503, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-02-26', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2504, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-02-27', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2505, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-02-27', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2506, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-02-28', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2507, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-02-28', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2508, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-01', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2509, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-01', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2510, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-02', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2511, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-02', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2512, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-03', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2513, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-03', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2514, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-02-25', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2515, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-02-25', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2516, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-02-26', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2517, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-02-26', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2');
INSERT INTO `flight` (`id`, `planeInventoryId`, `flightNumber`, `price`, `standardSeatsAvailable`, `businessSeatsAvailable`, `firstClassSeatsAvailable`, `date`, `departureTime`, `arrivalTime`, `duration`, `departureAirport`, `departureAirportAbbreviation`, `arrivalAirport`, `arrivalAirportAbbreviation`, `departureTerminal`, `arrivalTerminal`) VALUES
(2518, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-02-27', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2519, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-02-27', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2520, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-02-28', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2521, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-02-28', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2522, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-01', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2523, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-01', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2524, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-02', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2525, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-02', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2526, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-03', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2527, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-03', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2528, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-04', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2529, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-04', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2530, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-04', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2531, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-04', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2532, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-04', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2533, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-04', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2534, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-04', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2535, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-04', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2536, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-04', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2537, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-05', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2538, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-05', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2539, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-05', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2540, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-05', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2541, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-05', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2542, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-05', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2543, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-05', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2544, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-05', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2545, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-05', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2546, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-06', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2547, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-06', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2548, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-06', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2549, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-06', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2550, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-06', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2551, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-06', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2552, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-06', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2553, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-06', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2554, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-06', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2555, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-07', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2556, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-07', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2557, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-07', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2558, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-07', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2559, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-07', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2560, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-07', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2561, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-07', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2562, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-07', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2563, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-07', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2564, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-08', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2565, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-08', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2566, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-08', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2567, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-08', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2568, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-08', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2569, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-08', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2570, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-08', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2571, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-08', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2572, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-08', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2573, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-09', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2574, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-09', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2575, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-09', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2576, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-09', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2577, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-09', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2578, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-09', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2579, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-09', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2580, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-09', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2581, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-09', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2582, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-10', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2583, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-10', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2584, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-10', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2585, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-10', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2586, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-10', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2587, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-10', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2588, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-10', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2589, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-10', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2590, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-10', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2591, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-04', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2592, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-04', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2593, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-04', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2594, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-04', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2595, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-04', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2596, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-04', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2597, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-04', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2598, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-04', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2599, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-04', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2600, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-05', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2601, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-05', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2602, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-05', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2603, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-05', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2604, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-05', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2605, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-05', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2606, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-05', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2607, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-05', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2608, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-05', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2609, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-06', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2610, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-06', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2611, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-06', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2612, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-06', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2613, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-06', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2614, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-06', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2615, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-06', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2616, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-06', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2617, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-06', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2618, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-07', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2619, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-07', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2620, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-07', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2621, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-07', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2622, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-07', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2623, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-07', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2624, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-07', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2625, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-07', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2626, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-07', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2627, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-08', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2628, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-08', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2629, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-08', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2630, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-08', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2631, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-08', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2632, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-08', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2633, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-08', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2634, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-08', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2635, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-08', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2636, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-09', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2637, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-09', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2638, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-09', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2639, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-09', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2640, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-09', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2641, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-09', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2642, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-09', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2643, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-09', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2644, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-09', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2645, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-10', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2646, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-10', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2647, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-10', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2648, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-10', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2649, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-10', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2650, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-10', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2651, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-10', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2652, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-10', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2653, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-10', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2654, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-04', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2655, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-04', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2656, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-04', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2657, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-04', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2658, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-05', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2659, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-05', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2660, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-05', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2661, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-05', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2662, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-06', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2663, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-06', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2664, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-06', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2665, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-06', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2666, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-07', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2667, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-07', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2668, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-07', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2669, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-07', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2670, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-08', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2671, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-08', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2672, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-08', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2673, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-08', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2674, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-09', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2675, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-09', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2676, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-09', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2677, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-09', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2678, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-10', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2679, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-10', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2680, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-10', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2681, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-10', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2682, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-04', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2683, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-04', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2684, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-04', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2685, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-04', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2686, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-05', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2687, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-05', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2688, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-05', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2689, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-05', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2690, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-06', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2691, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-06', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2692, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-06', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2693, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-06', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2694, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-07', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2695, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-07', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2696, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-07', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2697, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-07', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2698, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-08', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2699, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-08', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2700, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-08', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2701, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-08', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2702, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-09', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2703, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-09', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2704, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-09', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2705, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-09', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2706, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-10', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2707, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-10', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2708, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-10', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2709, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-10', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2710, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-04', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2711, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-04', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2712, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-05', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2713, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-05', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2714, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-06', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2715, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-06', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2716, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-07', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2717, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-07', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2718, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-08', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2719, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-08', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2720, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-09', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2721, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-09', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2722, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-10', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2723, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-10', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2724, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-04', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2725, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-04', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2726, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-05', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2727, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-05', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2728, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-06', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2729, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-06', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2730, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-07', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2731, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-07', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2732, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-08', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2733, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-08', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2734, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-09', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2735, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-09', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2736, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-10', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2737, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-10', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2738, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-11', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2739, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-11', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2740, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-11', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2741, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-11', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2742, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-11', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2743, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-11', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2744, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-11', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2745, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-11', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2746, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-11', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2747, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-12', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2748, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-12', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2749, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-12', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2750, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-12', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2751, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-12', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2752, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-12', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2753, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-12', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2754, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-12', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2755, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-12', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2756, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-13', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2757, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-13', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2758, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-13', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2759, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-13', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2760, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-13', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2761, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-13', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2762, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-13', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2763, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-13', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2764, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-13', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2765, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-14', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2766, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-14', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2767, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-14', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2768, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-14', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2769, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-14', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2770, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-14', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2771, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-14', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2772, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-14', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2773, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-14', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2774, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-15', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2775, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-15', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2776, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-15', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2777, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-15', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2778, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-15', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2779, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-15', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2780, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-15', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2781, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-15', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2782, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-15', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2783, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-16', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2784, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-16', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2785, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-16', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2786, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-16', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2787, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-16', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2788, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-16', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2789, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-16', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2790, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-16', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2791, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-16', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2792, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-17', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2793, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-17', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2794, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-17', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2795, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-17', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2796, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-17', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2797, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-17', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2798, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-17', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2799, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-17', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2800, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-17', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2801, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-11', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2802, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-11', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2803, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-11', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2804, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-11', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2805, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-11', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2806, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-11', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2807, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-11', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2808, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-11', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2809, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-11', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2810, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-12', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2811, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-12', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2812, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-12', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2813, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-12', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2814, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-12', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2815, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-12', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2816, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-12', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2817, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-12', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2818, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-12', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2819, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-13', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2820, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-13', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2821, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-13', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2822, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-13', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2823, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-13', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2824, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-13', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2825, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-13', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2826, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-13', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2827, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-13', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2828, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-14', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2829, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-14', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2830, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-14', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2831, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-14', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2832, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-14', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2833, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-14', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2834, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-14', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2835, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-14', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2836, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-14', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2837, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-15', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2838, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-15', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2839, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-15', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2840, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-15', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2841, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-15', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2842, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-15', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2843, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-15', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2844, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-15', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2845, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-15', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2846, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-16', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2847, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-16', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2848, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-16', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2849, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-16', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2850, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-16', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2851, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-16', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2852, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-16', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2853, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-16', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2854, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-16', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2855, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-17', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2856, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-17', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2857, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-17', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2858, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-17', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2859, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-17', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2860, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-17', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2861, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-17', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2862, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-17', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2863, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-17', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(2864, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-11', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2865, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-11', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2866, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-11', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2867, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-11', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2868, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-12', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2869, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-12', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2870, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-12', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2871, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-12', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2872, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-13', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2873, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-13', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2874, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-13', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2875, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-13', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2876, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-14', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2877, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-14', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2878, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-14', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2879, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-14', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2880, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-15', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2881, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-15', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2882, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-15', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2883, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-15', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2884, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-16', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2885, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-16', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2886, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-16', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2887, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-16', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2888, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-17', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2889, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-17', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2890, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-17', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2891, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-17', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(2892, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-11', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2893, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-11', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2894, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-11', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2895, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-11', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2896, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-12', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2897, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-12', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2898, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-12', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2899, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-12', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2900, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-13', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2901, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-13', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2902, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-13', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2903, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-13', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2904, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-14', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2905, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-14', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2906, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-14', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2907, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-14', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2908, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-15', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2909, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-15', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2910, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-15', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2911, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-15', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2912, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-16', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2913, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-16', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2914, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-16', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2915, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-16', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2916, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-17', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2917, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-17', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2918, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-17', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2919, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-17', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(2920, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-11', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2921, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-11', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2922, 1, 'MA-2600', 499.99, 336, 90, 0, '2019-03-12', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2923, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-12', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2924, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-13', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2925, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-13', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2926, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-14', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2927, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-14', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3');
INSERT INTO `flight` (`id`, `planeInventoryId`, `flightNumber`, `price`, `standardSeatsAvailable`, `businessSeatsAvailable`, `firstClassSeatsAvailable`, `date`, `departureTime`, `arrivalTime`, `duration`, `departureAirport`, `departureAirportAbbreviation`, `arrivalAirport`, `arrivalAirportAbbreviation`, `departureTerminal`, `arrivalTerminal`) VALUES
(2928, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-15', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2929, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-15', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2930, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-16', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2931, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-16', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2932, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-17', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2933, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-17', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(2934, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-11', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2935, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-11', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2936, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-12', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2937, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-12', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2938, 1, 'MA-2700', 579.99, 337, 90, 34, '2019-03-13', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2939, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-13', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2940, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-14', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2941, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-14', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2942, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-15', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2943, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-15', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2944, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-16', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2945, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-16', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2946, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-17', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2947, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-17', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(2948, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-18', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2949, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-18', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2950, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-18', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2951, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-18', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2952, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-18', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2953, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-18', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2954, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-18', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2955, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-18', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2956, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-18', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2957, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-19', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2958, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-19', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2959, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-19', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2960, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-19', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2961, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-19', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2962, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-19', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2963, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-19', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2964, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-19', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2965, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-19', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2966, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-20', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2967, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-20', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2968, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-20', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2969, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-20', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2970, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-20', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2971, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-20', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2972, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-20', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2973, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-20', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2974, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-20', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2975, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-21', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2976, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-21', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2977, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-21', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2978, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-21', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2979, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-21', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2980, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-21', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2981, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-21', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2982, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-21', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2983, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-21', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2984, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-22', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2985, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-22', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2986, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-22', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2987, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-22', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2988, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-22', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2989, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-22', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2990, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-22', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2991, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-22', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2992, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-22', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2993, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-23', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2994, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-23', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2995, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-23', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2996, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-23', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2997, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-23', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2998, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-23', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(2999, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-23', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(3000, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-23', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(3001, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-23', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(3002, 3, 'MA-1000', 49.99, 164, 40, 16, '2019-03-24', 360, 430, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(3003, 3, 'MA-1001', 49.99, 164, 40, 16, '2019-03-24', 480, 550, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(3004, 3, 'MA-1002', 49.99, 164, 40, 16, '2019-03-24', 600, 670, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(3005, 3, 'MA-1003', 49.99, 164, 40, 16, '2019-03-24', 720, 790, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(3006, 3, 'MA-1004', 49.99, 164, 40, 16, '2019-03-24', 840, 910, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(3007, 3, 'MA-1005', 49.99, 164, 40, 16, '2019-03-24', 960, 1030, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(3008, 3, 'MA-1006', 49.99, 164, 40, 16, '2019-03-24', 1080, 1150, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(3009, 3, 'MA-1007', 49.99, 164, 40, 16, '2019-03-24', 1200, 1270, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(3010, 3, 'MA-1008', 49.99, 164, 40, 16, '2019-03-24', 1320, 1390, 70, 'Dublin', 'DUB', 'London Heathrow', 'LHR', 'T2', 'T4'),
(3011, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-18', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3012, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-18', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3013, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-18', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3014, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-18', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3015, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-18', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3016, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-18', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3017, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-18', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3018, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-18', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3019, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-18', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3020, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-19', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3021, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-19', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3022, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-19', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3023, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-19', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3024, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-19', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3025, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-19', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3026, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-19', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3027, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-19', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3028, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-19', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3029, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-20', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3030, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-20', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3031, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-20', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3032, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-20', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3033, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-20', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3034, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-20', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3035, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-20', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3036, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-20', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3037, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-20', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3038, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-21', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3039, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-21', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3040, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-21', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3041, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-21', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3042, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-21', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3043, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-21', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3044, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-21', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3045, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-21', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3046, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-21', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3047, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-22', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3048, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-22', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3049, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-22', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3050, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-22', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3051, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-22', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3052, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-22', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3053, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-22', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3054, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-22', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3055, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-22', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3056, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-23', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3057, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-23', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3058, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-23', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3059, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-23', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3060, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-23', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3061, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-23', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3062, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-23', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3063, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-23', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3064, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-23', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3065, 3, 'MA-1010', 69.99, 164, 40, 16, '2019-03-24', 420, 490, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3066, 3, 'MA-1011', 69.99, 164, 40, 16, '2019-03-24', 540, 610, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3067, 3, 'MA-1012', 69.99, 164, 40, 16, '2019-03-24', 660, 730, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3068, 3, 'MA-1013', 69.99, 164, 40, 16, '2019-03-24', 780, 850, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3069, 3, 'MA-1014', 69.99, 164, 40, 16, '2019-03-24', 900, 970, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3070, 3, 'MA-1015', 69.99, 164, 40, 16, '2019-03-24', 1020, 1090, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3071, 3, 'MA-1016', 69.99, 164, 40, 16, '2019-03-24', 1140, 1210, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3072, 3, 'MA-1017', 69.99, 164, 40, 16, '2019-03-24', 1260, 1330, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3073, 3, 'MA-1018', 69.99, 164, 40, 16, '2019-03-24', 1380, 1450, 70, 'London Heathrow', 'LHR', 'Dublin', 'DUB', 'T4', 'T2'),
(3074, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-18', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3075, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-18', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3076, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-18', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3077, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-18', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3078, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-19', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3079, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-19', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3080, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-19', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3081, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-19', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3082, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-20', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3083, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-20', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3084, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-20', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3085, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-20', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3086, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-21', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3087, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-21', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3088, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-21', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3089, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-21', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3090, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-22', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3091, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-22', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3092, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-22', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3093, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-22', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3094, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-23', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3095, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-23', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3096, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-23', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3097, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-23', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3098, 5, 'MA-2060', 39.99, 164, 40, 16, '2019-03-24', 390, 560, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3099, 5, 'MA-2061', 39.99, 164, 40, 16, '2019-03-24', 630, 800, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3100, 5, 'MA-2062', 39.99, 164, 40, 16, '2019-03-24', 870, 1040, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3101, 5, 'MA-2063', 39.99, 164, 40, 16, '2019-03-24', 1110, 1280, 110, 'Dublin', 'DUB', 'Paris', 'CDG', 'T2', 'T2'),
(3102, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-18', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3103, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-18', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3104, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-18', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3105, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-18', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3106, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-19', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3107, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-19', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3108, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-19', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3109, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-19', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3110, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-20', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3111, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-20', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3112, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-20', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3113, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-20', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3114, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-21', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3115, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-21', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3116, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-21', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3117, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-21', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3118, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-22', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3119, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-22', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3120, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-22', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3121, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-22', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3122, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-23', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3123, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-23', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3124, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-23', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3125, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-23', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3126, 5, 'MA-2070', 39.99, 164, 40, 16, '2019-03-24', 620, 670, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3127, 5, 'MA-2071', 39.99, 164, 40, 16, '2019-03-24', 860, 910, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3128, 5, 'MA-2072', 39.99, 164, 40, 16, '2019-03-24', 1100, 1150, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3129, 5, 'MA-2073', 39.99, 164, 40, 16, '2019-03-24', 1340, 1390, 110, 'Paris', 'CDG', 'Dublin', 'DUB', 'T2', 'T2'),
(3130, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-18', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3131, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-18', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3132, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-19', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3133, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-19', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3134, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-20', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3135, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-20', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3136, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-21', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3137, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-21', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3138, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-22', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3139, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-22', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3140, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-23', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3141, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-23', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3142, 1, 'MA-2600', 499.99, 341, 90, 36, '2019-03-24', 650, 800, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3143, 1, 'MA-2601', 499.99, 341, 90, 36, '2019-03-24', 1010, 1160, 450, 'Dublin', 'DUB', 'New York', 'JFK', 'T2', 'T3'),
(3144, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-18', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3145, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-18', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3146, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-19', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3147, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-19', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3148, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-20', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3149, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-20', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3150, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-21', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3151, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-21', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3152, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-22', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3153, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-22', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3154, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-23', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3155, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-23', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3156, 1, 'MA-2700', 579.99, 341, 90, 36, '2019-03-24', 1040, 290, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2'),
(3157, 1, 'MA-2701', 579.99, 341, 90, 36, '2019-03-24', 1400, 650, 450, 'New York', 'JFK', 'Dublin', 'DUB', 'T3', 'T2');

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

--
-- Dumping data for table `plane`
--

INSERT INTO `plane` (`id`, `make`, `model`, `standardSeatsCapacity`, `businessSeatsCapacity`, `firstClassSeatsCapacity`) VALUES
(1, 'Boeing Commercial Airplanes', '747-8', 341, 90, 36),
(2, 'Boeing Commercial Airplanes', '777-9', 322, 80, 12),
(3, 'Airbus', 'A321', 164, 40, 16),
(4, 'Airbus', 'A330-200', 248, 23, 0);

-- --------------------------------------------------------

--
-- Table structure for table `plane_inventory`
--

CREATE TABLE `plane_inventory` (
  `id` int(11) NOT NULL,
  `planeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plane_inventory`
--

INSERT INTO `plane_inventory` (`id`, `planeId`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `security_question`
--

CREATE TABLE `security_question` (
  `id` int(11) NOT NULL,
  `question` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security_question`
--

INSERT INTO `security_question` (`id`, `question`) VALUES
(1, 'In which city were you born?'),
(2, 'What is the name of your favourite cousin?'),
(3, 'What is the name of the street where you grew up?'),
(4, 'Who was your childhood hero?'),
(5, 'What was the name of your primary school?'),
(6, 'When you were young, what did you want to be when you grew up?'),
(7, 'What is your oldest sibling\'s middle name?');

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

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `firstName`, `lastName`, `role`) VALUES
(1, 'Jimmy', 'Carr', 'Pilot'),
(2, 'Sean', 'Locke', 'Co-pilot'),
(3, 'Addison', 'Wells', 'Senior Flight Attendant'),
(4, 'Mollie', 'Clarke', 'Flight Attendant'),
(5, 'Frankie', 'Shaw', 'Flight Attendant'),
(6, 'Casey', 'Carter', 'Flight Attendant'),
(7, 'Robin', 'Ross', 'Flight Attendant'),
(8, 'Shay', 'Brown', 'Flight Attendant'),
(9, 'Leslie', 'Richardson', 'Senior Flight Attendant'),
(10, 'Genevieve', 'Smith', 'Flight Attendant'),
(11, 'Calvin', 'Wallace', 'Pilot'),
(12, 'Rowan', 'Harrison', 'Co-pilot'),
(13, 'Vinnie', 'Mcdonald', 'Pilot'),
(14, 'Theodore', 'Young', 'Co-pilot'),
(15, 'Christopher', 'Stevens', 'Flight Attendant'),
(16, 'Matilda', 'Murphy', 'Flight Attendant'),
(17, 'Aubrey', 'Parry', 'Flight Attendant'),
(18, 'Eleanor', 'Lane', 'Flight Attendant'),
(19, 'Seth', 'Wallace', 'Flight Attendant'),
(20, 'Ashley', 'Richardson', 'Flight Attendant');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(150) NOT NULL,
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

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `firstName`, `lastName`, `dateOfBirth`, `phoneNumber`, `addressLine1`, `addressLine2`, `cityOrTown`, `postalCode`, `county`, `country`, `privileges`, `suspended`) VALUES
(1, 'john.doe@microhard.com', 'John', 'John', 'Doe', '1995-06-14', '086-055-7880', 'Red Lane', '', 'Dundalk', '434-RRF', 'Co. Louth', 'Ireland', 1, 0),
(2, 'joe.bloggs@microhard.com', 'Joe', 'Joe', 'Bloggs', '1991-10-05', '086-765-2453', 'Green Lane', 'Big Estate', 'Dundalk', '5TF-8K99', 'Co. Louth', 'Ireland', 1, 1),
(3, 'andy.anderson@microhard.com', 'Andy', 'Andy', 'Anderson', '1998-06-16', '083-567-8766', 'Blue Lane', '', 'Dundalk', 'DFA-8788', 'Co. Louth', 'Ireland', 1, 0),
(4, 'dave.franco@microhard.com', 'Dave', 'Dave', 'Franco', '1985-06-12', '087-989-9090', '3500 West Olive Suite', 'Suite 1470', 'Burbank', '91505', 'California', 'USA', 1, 0),
(5, 'celine.dion@microhard.com', 'Celine', 'Celine', 'Dion', '1968-04-30', '085-343', 'Purple Road', '', 'Quebec City', '534-1212', 'Quebec', 'Canada', 1, 0),
(6, 'pauls@gmail.com', '$2a$10$svVze2X1B0adCPJnEQh36OlLFrNWnXkaaBOUwRoymn6K.bgVAHG0i', 'Paul', 'Sweeney', '1998-06-06', '0877777777', 'Village', 'Louth', 'Dundalk', '0000', 'Louth', 'Ireland', 1, 0);

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
  `seat` varchar(6) DEFAULT NULL,
  `boardingDoor` varchar(6) DEFAULT NULL,
  `specialAssistanceRequired` int(1) NOT NULL,
  `pricePaid` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_flight`
--

INSERT INTO `user_flight` (`id`, `userId`, `flightId`, `passengerFirstName`, `passengerLastName`, `travelClass`, `queue`, `seat`, `boardingDoor`, `specialAssistanceRequired`, `pricePaid`) VALUES
(1, 6, 2922, 'Paul', 'Sweeney', 'standard', 'non-priority', '3a', 'front', 0, 499.99),
(2, 6, 2938, 'Paul', 'Sweeney', 'standard', 'non-priority', NULL, NULL, 0, 629.99),
(3, 6, 2922, 'Paul', 'Sweeney', 'standard', 'non-priority', '3b', 'front', 0, 499.99),
(4, 6, 2938, 'Paul', 'Sweeney', 'standard', 'non-priority', NULL, NULL, 0, 579.99),
(5, 6, 2922, 'Paul', 'Sweeney', 'standard', 'non-priority', '3c', 'front', 0, 599.99),
(6, 6, 2938, 'Paul', 'Sweeney', 'business', 'priority', NULL, NULL, 0, 811.99),
(7, 6, 2922, 'Paul', 'Sweeney', 'business', 'priority', NULL, NULL, 0, 909.98),
(8, 6, 2938, 'Paul', 'Sweeney', 'standard', 'non-priority', NULL, NULL, 0, 579.99),
(9, 6, 2922, 'Paul', 'Sweeney', 'firstClass', 'priority', NULL, NULL, 0, 1949.96),
(10, 6, 2938, 'Paul', 'Sweeney', 'firstClass', 'priority', NULL, NULL, 0, 1739.97),
(11, 6, 2922, 'Paul', 'Sweeney', 'firstClass', 'priority', NULL, NULL, 0, 1949.96),
(12, 6, 2938, 'Paul', 'Sweeney', 'firstClass', 'priority', NULL, NULL, 0, 1739.97),
(13, 6, 2922, 'Paul', 'Sweeney', 'firstClass', 'priority', NULL, NULL, 0, 1949.96),
(14, 6, 2938, 'Paul', 'Sweeney', 'firstClass', 'priority', NULL, NULL, 0, 1739.97),
(15, 6, 2922, 'Paul', 'Sweeney', 'standard', 'non-priority', NULL, NULL, 0, 649.99),
(16, 6, 2938, 'Paul', 'Sweeney', 'standard', 'non-priority', NULL, NULL, 0, 579.99),
(17, 6, 2922, 'Paul', 'Sweeney', 'standard', 'non-priority', NULL, NULL, 0, 649.99),
(18, 6, 2938, 'Paul', 'Sweeney', 'standard', 'non-priority', NULL, NULL, 0, 579.99),
(19, 6, 2922, 'Paul', 'Sweeney', 'standard', 'non-priority', NULL, NULL, 0, 649.99),
(20, 6, 2938, 'Paul', 'Sweeney', 'standard', 'non-priority', NULL, NULL, 0, 579.99),
(21, 6, 2922, 'Paul', 'Sweeney', 'standard', 'non-priority', NULL, NULL, 0, 649.99),
(22, 6, 2938, 'Paul', 'Sweeney', 'standard', 'non-priority', NULL, NULL, 0, 579.99);

-- --------------------------------------------------------

--
-- Table structure for table `user_security_question`
--

CREATE TABLE `user_security_question` (
  `userId` int(11) NOT NULL,
  `securityQuestionId` int(11) NOT NULL,
  `answer` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_security_question`
--

INSERT INTO `user_security_question` (`userId`, `securityQuestionId`, `answer`) VALUES
(3, 1, '$2a$10$kJu39.f2z6d6k4U1rd6N/.cCEmq7bBg.YJJ5FFZQ0cfX06OLPFju.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checked_baggage`
--
ALTER TABLE `checked_baggage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_flightId` (`user_flightId`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_planeId` (`planeInventoryId`);

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
-- Indexes for table `plane_inventory`
--
ALTER TABLE `plane_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_planeId` (`planeId`);

--
-- Indexes for table `security_question`
--
ALTER TABLE `security_question`
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
-- Indexes for table `user_security_question`
--
ALTER TABLE `user_security_question`
  ADD PRIMARY KEY (`userId`,`securityQuestionId`),
  ADD KEY `FK_securityQuestionId` (`securityQuestionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checked_baggage`
--
ALTER TABLE `checked_baggage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3171;
--
-- AUTO_INCREMENT for table `plane`
--
ALTER TABLE `plane`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `plane_inventory`
--
ALTER TABLE `plane_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `security_question`
--
ALTER TABLE `security_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `user_flight`
--
ALTER TABLE `user_flight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `checked_baggage`
--
ALTER TABLE `checked_baggage`
  ADD CONSTRAINT `fk_user_flightId` FOREIGN KEY (`user_flightId`) REFERENCES `user_flight` (`id`);

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `FK_planeInventoryId` FOREIGN KEY (`planeInventoryId`) REFERENCES `plane_inventory` (`id`);

--
-- Constraints for table `flight_staff`
--
ALTER TABLE `flight_staff`
  ADD CONSTRAINT `FK_flightId4` FOREIGN KEY (`flightId`) REFERENCES `flight` (`id`),
  ADD CONSTRAINT `FK_staffId` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`);

--
-- Constraints for table `plane_inventory`
--
ALTER TABLE `plane_inventory`
  ADD CONSTRAINT `FK_planeId` FOREIGN KEY (`planeId`) REFERENCES `plane` (`id`);

--
-- Constraints for table `user_flight`
--
ALTER TABLE `user_flight`
  ADD CONSTRAINT `FK_flightId` FOREIGN KEY (`flightId`) REFERENCES `flight` (`id`),
  ADD CONSTRAINT `FK_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_security_question`
--
ALTER TABLE `user_security_question`
  ADD CONSTRAINT `FK_securityQuestionId` FOREIGN KEY (`securityQuestionId`) REFERENCES `security_question` (`id`),
  ADD CONSTRAINT `FK_userId3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
