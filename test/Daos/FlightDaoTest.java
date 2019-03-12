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
    FlightDao fDao = new FlightDao("microhard_airlines_test");
    
    /**
     * Test of getFlights method, of class FlightDao.
     */
    @Test
    public void testGetFlights() {
        System.out.println("getFlights");
        FlightDao instance = null;
        ArrayList<Flight> expResult = null;
        ArrayList<Flight> result = instance.getFlights();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDepartureAirports method, of class FlightDao.
     */
    @Test
    public void testGetDepartureAirports() {
        System.out.println("getDepartureAirports");
        FlightDao instance = null;
        ArrayList<Flight> expResult = null;
        ArrayList<Flight> result = instance.getDepartureAirports();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getArrivalAirports method, of class FlightDao.
     */
    @Test
    public void testGetArrivalAirports() {
        System.out.println("getArrivalAirports");
        FlightDao instance = null;
        ArrayList<Flight> expResult = null;
        ArrayList<Flight> result = instance.getArrivalAirports();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFlightsByLocationsDepartureDatePassengerNum method, of class FlightDao.
     */
    @Test
    public void testGetFlightsByLocationsDepartureDatePassengerNum() {
        System.out.println("getFlightsByLocationsDepartureDatePassengerNum");
        String departureAirport = "";
        String destinationAirport = "";
        Date date = null;
        int numPassengers = 0;
        FlightDao instance = null;
        ArrayList<Flight> expResult = null;
        ArrayList<Flight> result = instance.getFlightsByLocationsDepartureDatePassengerNum(departureAirport, destinationAirport, date, numPassengers);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFlightById method, of class FlightDao.
     */
    @Test
    public void testGetFlightById() {
        System.out.println("getFlightById");
        int id = 0;
        FlightDao instance = null;
        Flight expResult = null;
        Flight result = instance.getFlightById(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updatePrice method, of class FlightDao.
     */
    @Test
    public void testUpdatePrice() {
        System.out.println("updatePrice");
        Flight flight = null;
        double newPrice = 0.0;
        FlightDao instance = null;
        int expResult = 0;
        int result = instance.updatePrice(flight, newPrice);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addFlight method, of class FlightDao.
     */
    @Test
    public void testAddFlight() {
        System.out.println("addFlight");
        Flight flight = null;
        FlightDao instance = null;
        int expResult = 0;
        int result = instance.addFlight(flight);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of removeFlight method, of class FlightDao.
     */
    @Test
    public void testRemoveFlight() {
        System.out.println("removeFlight");
        int id = 0;
        FlightDao instance = null;
        int expResult = 0;
        int result = instance.removeFlight(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateStandardSeats method, of class FlightDao.
     */
    @Test
    public void testUpdateStandardSeats() {
        System.out.println("updateStandardSeats");
        int flightId = 0;
        String seatType = "";
        int changeBy = 0;
        FlightDao instance = null;
        int expResult = 0;
        int result = instance.updateStandardSeats(flightId, seatType, changeBy);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateBusinessSeats method, of class FlightDao.
     */
    @Test
    public void testUpdateBusinessSeats() {
        System.out.println("updateBusinessSeats");
        int flightId = 0;
        String seatType = "";
        int changeBy = 0;
        FlightDao instance = null;
        int expResult = 0;
        int result = instance.updateBusinessSeats(flightId, seatType, changeBy);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateFirstClassSeats method, of class FlightDao.
     */
    @Test
    public void testUpdateFirstClassSeats() {
        System.out.println("updateFirstClassSeats");
        int flightId = 0;
        String seatType = "";
        int changeBy = 0;
        FlightDao instance = null;
        int expResult = 0;
        int result = instance.updateFirstClassSeats(flightId, seatType, changeBy);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
