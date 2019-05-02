/* Dublin to London */
drop procedure if exists flightProcDublinLondon;

DELIMITER //

CREATE PROCEDURE flightProcDublinLondon(week_beginning date)
wholeblock:BEGIN
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
				VALUES (CONCAT("MA-100", CAST((j) AS CHAR(2))), 3, 49.99, 138, 24, 12, DATE_ADD(week_beginning, INTERVAL i DAY), 360+(j*120), 430+(j*120), 70, "Dublin", "DUB", "London Heathrow", "LHR", "T2", "T4");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END;
//

CALL flightProcDublinLondon("2019-04-29");


/* London to Dublin */
drop procedure if exists flightProcLondonDublin;

DELIMITER //

CREATE PROCEDURE flightProcLondonDublin(week_beginning date)
wholeblock:BEGIN
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
				VALUES (CONCAT("MA-101", CAST((j) AS CHAR(2))), 3, 69.99, 138, 24, 12, DATE_ADD(week_beginning, INTERVAL i DAY), 420+(j*120), 490+(j*120), 70, "London Heathrow", "LHR", "Dublin", "DUB", "T4", "T2");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END;
//

CALL flightProcLondonDublin("2019-04-29");


/* Dublin to Paris */
drop procedure if exists flightProcDublinParis;

DELIMITER //

CREATE PROCEDURE flightProcDublinParis(week_beginning date)
wholeblock:BEGIN
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
				VALUES (CONCAT("MA-206", CAST((j) AS CHAR(2))), 5, 39.99, 138, 24, 12, DATE_ADD(week_beginning, INTERVAL i DAY), 390+(j*240), 560+(j*240), 110, "Dublin", "DUB", "Paris", "CDG", "T2", "T2");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END;
//

CALL flightProcDublinParis("2019-04-29");


/* Paris to Dublin */
drop procedure if exists flightProcParisDublin;

DELIMITER //

CREATE PROCEDURE flightProcParisDublin(week_beginning date)
wholeblock:BEGIN
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
				VALUES (CONCAT("MA-207", CAST((j) AS CHAR(2))), 5, 39.99, 138, 24, 12, DATE_ADD(week_beginning, INTERVAL i DAY), 620+(j*240), 670+(j*240), 110, "Paris", "CDG", "Dublin", "DUB", "T2", "T2");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END;
//

CALL flightProcParisDublin("2019-04-29");


/* Dublin to New York */
drop procedure if exists flightProcDublinNewYork;

DELIMITER //

CREATE PROCEDURE flightProcDublinNewYork(week_beginning date)
wholeblock:BEGIN
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
				VALUES (CONCAT("MA-260", CAST((j) AS CHAR(2))), 1, 499.99, 150, 42, 12, DATE_ADD(week_beginning, INTERVAL i DAY), 650+(j*360), 800+(j*360), 450, "Dublin", "DUB", "New York", "JFK", "T2", "T3");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END;
//

CALL flightProcDublinNewYork("2019-04-29");


/* New York to Dublin */
drop procedure if exists flightProcNewYorkDublin;

DELIMITER //

CREATE PROCEDURE flightProcNewYorkDublin(week_beginning date)
wholeblock:BEGIN
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
				VALUES (CONCAT("MA-270", CAST((j) AS CHAR(2))), 1, 579.99, 150, 42, 12, DATE_ADD(week_beginning, INTERVAL i DAY), 1040+(j*360), 290+(j*360), 450, "New York", "JFK", "Dublin", "DUB", "T3", "T2");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END;
//

CALL flightProcNewYorkDublin("2019-04-29")


/* Dublin to Dubai */
drop procedure if exists flightProcDublinDubai;

DELIMITER //

CREATE PROCEDURE flightProcDublinDubai(week_beginning date)
wholeblock:BEGIN
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
				VALUES (CONCAT("MA-300", CAST((j) AS CHAR(2))), 1, 699.99, 150, 42, 12, DATE_ADD(week_beginning, INTERVAL i DAY), 650+(j*360), 800+(j*360), 450, "Dublin", "DUB", "Dubai", "DXB", "T2", "T3");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END;
//

CALL flightProcDublinDubai("2019-04-29");


/* Dubai to Dublin */
drop procedure if exists flightProcDubaiDublin;

DELIMITER //

CREATE PROCEDURE flightProcDubaiDublin(week_beginning date)
wholeblock:BEGIN
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
				VALUES (CONCAT("MA-310", CAST((j) AS CHAR(2))), 1, 699.99, 150, 42, 12, DATE_ADD(week_beginning, INTERVAL i DAY), 1040+(j*360), 290+(j*360), 450, "Dubai", "DBX", "Dublin", "DUB", "T3", "T2");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END;
//

CALL flightProcDubaiDublin("2019-04-29");


/* Dublin to Lanzarote */
drop procedure if exists flightProcDublinLanzarote;

DELIMITER //

CREATE PROCEDURE flightProcDublinLanzarote(week_beginning date)
wholeblock:BEGIN
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
				VALUES (CONCAT("MA-400", CAST((j) AS CHAR(2))), 5, 29.99, 138, 24, 12, DATE_ADD(week_beginning, INTERVAL i DAY), 390+(j*240), 560+(j*240), 110, "Dublin", "DUB", "Lanzarote", "ACE", "T2", "T2");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END;
//

CALL flightProcDublinLanzarote("2019-04-29");


/* Lanzarote to Dublin */
drop procedure if exists flightProcLanzaroteDublin;

DELIMITER //

CREATE PROCEDURE flightProcLanzaroteDublin(week_beginning date)
wholeblock:BEGIN
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
				VALUES (CONCAT("MA-410", CAST((j) AS CHAR(2))), 5, 29.99, 138, 24, 12, DATE_ADD(week_beginning, INTERVAL i DAY), 620+(j*240), 670+(j*240), 110, "Lanzarote", "ACE", "Dublin", "DUB", "T2", "T2");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END;
//

CALL flightProcLanzaroteDublin("2019-04-29");


/* Dublin to Barcelona */
drop procedure if exists flightProcDublinBarcelona;

DELIMITER //

CREATE PROCEDURE flightProcDublinBarcelona(week_beginning date)
wholeblock:BEGIN
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
				VALUES (CONCAT("MA-500", CAST((j) AS CHAR(2))), 5, 36.99, 138, 24, 12, DATE_ADD(week_beginning, INTERVAL i DAY), 290+(j*240), 460+(j*240), 110, "Dublin", "DUB", "Barcelona", "BCN", "T2", "T1");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END;
//

CALL flightProcDublinBarcelona("2019-04-29");


/* Barcelona to Dublin */
drop procedure if exists flightProcBarcelonaDublin;

DELIMITER //

CREATE PROCEDURE flightProcBarcelonaDublin(week_beginning date)
wholeblock:BEGIN
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
				VALUES (CONCAT("MA-510", CAST((j) AS CHAR(2))), 5, 36.99, 138, 24, 12, DATE_ADD(week_beginning, INTERVAL i DAY), 520+(j*240), 570+(j*240), 110, "Barcelona", "BCN", "Dublin", "DUB", "T1", "T2");
				SET j = j + 1;
			END LOOP loop_label2;
        SET i = i + 1;
		IF i >= 7 THEN
			LEAVE loop_label;
		END IF;
    END LOOP loop_label;
END;
//

CALL flightProcBarcelonaDublin("2019-04-29");



/* All Flights */
drop procedure if exists flightProcAll;

DELIMITER //

CREATE PROCEDURE flightProcAll(week_beginning date)
BEGIN
	CALL flightProcDublinLondon(week_beginning);
	CALL flightProcLondonDublin(week_beginning);
	CALL flightProcDublinParis(week_beginning);
	CALL flightProcParisDublin(week_beginning);
	CALL flightProcDublinNewYork(week_beginning);
	CALL flightProcNewYorkDublin(week_beginning);
        CALL flightProcDublinDubai(week_beginning);
	CALL flightProcDubaiDublin(week_beginning);
        CALL flightProcDublinLanzarote(week_beginning);
	CALL flightProcLanzaroteDublin(week_beginning);
        CALL flightProcDublinBarcelona(week_beginning);
	CALL flightProcBarcelonaDublin(week_beginning);
END;
//

CALL flightProcAll("2019-04-29")