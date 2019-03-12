/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Flight;
import java.sql.Date;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author D00191889
 */
public class FlightDaoTest {
    
    // Setting up to use the FlightDao class' methods.
    FlightDao fDao = new FlightDao(Dao.getTestDatabaseName());
    
    /**
     * Test of getFlights method, of class FlightDao.
     */
    @Test
    public void testGetFlights() {
        System.out.println("getFlights");
        int expResult = 1050;
        ArrayList<Flight> flights = fDao.getFlights();
        int result = flights.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of getDepartureAirports method, of class FlightDao.
     */
    @Test
    public void testGetDepartureAirports() {
        System.out.println("getDepartureAirports");
        int expResult = 4;
        ArrayList<Flight> departureAirports = fDao.getDepartureAirports();
        int result = departureAirports.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of getArrivalAirports method, of class FlightDao.
     */
    @Test
    public void testGetArrivalAirports() {
        System.out.println("getArrivalAirports");
        int expResult = 4;
        ArrayList<Flight> arrivalAirports = fDao.getArrivalAirports();
        int result = arrivalAirports.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of getFlightsByLocationsDepartureDatePassengerNum method, of class FlightDao.
     */
    @Test
    public void testGetFlightsByLocationsDepartureDatePassengerNum() {
        System.out.println("getFlightsByLocationsDepartureDatePassengerNum");
        String departureAirport = "Dublin";
        String destinationAirport = "Paris";
        Date date = java.sql.Date.valueOf("2019-03-12");
        int numPassengers = 1;
        int expResult = 4;
        ArrayList<Flight> flights = fDao.getFlightsByLocationsDepartureDatePassengerNum(departureAirport, destinationAirport, date, numPassengers);
        int result = flights.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of getFlightById method, of class FlightDao.
     */
    @Test
    public void testGetFlightById() {
        System.out.println("getFlightById");
        int id = 2108;
        String expResult = "London Heathrow";
        Flight flight = fDao.getFlightById(id);
        String result = flight.getArrivalAirport();
        assertEquals(expResult, result);
    }

    /**
     * Test of updatePrice method, of class FlightDao.
     */
    @Test
    public void testUpdatePrice() {
        System.out.println("updatePrice");
        Flight flight = fDao.getFlightById(2108);
        int result = fDao.updatePrice(flight, 120);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to undo what was added");
            int rowsUpdated = fDao.updatePrice(flight, 49.99);
            assertEquals(1, rowsUpdated);
        }
    }

    /**
     * Test of addFlight method, of class FlightDao.
     */
    @Test
    public void testAddFlight() {
        System.out.println("addFlight");
        Flight flight = new Flight(3, "MA-999", 100, 180, 30, 16, java.sql.Date.valueOf("2019-03-12"), 360, 420, 60, "Dublin Test", "DUB", "London Heathrow Test", "LHR", "T2", "T2");
        int result = fDao.addFlight(flight);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsDeleted = fDao.removeFlight(result);
            assertEquals(1, rowsDeleted);
        }
    }

    /**
     * Test of removeFlight method, of class FlightDao.
     */
    @Test
    public void testRemoveFlight() {
        System.out.println("removeFlight");
        Flight flight = new Flight(3, "MA-999", 100, 180, 30, 16, java.sql.Date.valueOf("2019-03-12"), 360, 420, 60, "Dublin Test", "DUB", "London Heathrow Test", "LHR", "T2", "T2");
        int result = fDao.addFlight(flight);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsDeleted = fDao.removeFlight(result);
            assertEquals(1, rowsDeleted);
        }
    }

    /**
     * Test of updateStandardSeats method, of class FlightDao.
     */
    @Test
    public void testUpdateStandardSeats() {
        System.out.println("updateStandardSeats");
        int result = fDao.updateStandardSeats(2108, "standardSeatsAvailable", -1);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to undo what was added");
            int rowsUpdated = fDao.updateStandardSeats(2108, "standardSeatsAvailable", 1);
            assertEquals(1, rowsUpdated);
        }
    }

    /**
     * Test of updateBusinessSeats method, of class FlightDao.
     */
    @Test
    public void testUpdateBusinessSeats() {
        System.out.println("updateBusinessSeats");
        int result = fDao.updateBusinessSeats(2108, "businessSeatsAvailable", -1);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to undo what was added");
            int rowsUpdated = fDao.updateBusinessSeats(2108, "businessSeatsAvailable", 1);
            assertEquals(1, rowsUpdated);
        }
    }

    /**
     * Test of updateFirstClassSeats method, of class FlightDao.
     */
    @Test
    public void testUpdateFirstClassSeats() {
        System.out.println("updateFirstClassSeats");
        int result = fDao.updateFirstClassSeats(2108, "firstClassSeatsAvailable", -1);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to undo what was added");
            int rowsUpdated = fDao.updateFirstClassSeats(2108, "firstClassSeatsAvailable", 1);
            assertEquals(1, rowsUpdated);
        }
    }
    
}
