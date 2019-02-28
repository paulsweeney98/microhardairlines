/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Flight;
import java.sql.Date;
import java.util.ArrayList;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 * 
 * The author of this class is Paul Sweeney
 */
public interface FlightDaoInterface {
    
    /**
     * Gets all flights from database.
     * 
     * @return An ArrayList of flights.
     */
    public ArrayList<Flight> getFlights();
    
    /**
     * Get all available departure airports (no repeating values).
     * 
     * @return An ArrayList of flights.
     */
    public ArrayList<Flight> getDepartureAirports();
    
    /**
     * Get all available arrival airports (no repeating values).
     * 
     * @return An ArrayList of flights.
     */
    public ArrayList<Flight> getArrivalAirports();
    
    /**
     * View all <code>Flight</code> entries in the database based on their departure 
     * location, destination location, date of the flight and the number of passengers 
     * being booked by the user.
     *
     * @return <code>ArrayList</code> of <code>Flight</code> objects
     */
    public ArrayList<Flight> getFlightsByLocationsDepartureDatePassengerNum(String departureAirport, String destinationAirport, Date date, int numPassengers);
    
    /**
     * Gets a <code>Flight</code> by its id.
     * 
     * @param id The id of the <code>Flight</code>.
     * @return The <code>Flight</code> found.
     */
    public Flight getFlightById(int id);
    
    /**
     * Update the price of a <code>Flight</code> based on the id.
     *
     * @param flight The <code>Flight</code> to be updated.
     * @param newPrice The new price for the flight.
     * 
     * @return <code>int</code> indicating the number of rows affected by the update, should 
     * be 1 if successful and -1 if not.
     */
    public int updatePrice(Flight flight, double newPrice);
    
    /**
     * Add a <code>Flight</code> to the database.
     * 
     * @param flight The <code>Flight</code> to be added.
     * @return The newly generated id of the <code>Flight</code>.
     */
    public int addFlight(Flight flight);
    
    /**
     * Removes a <code>Flight</code> from the database.
     * 
     * @param flight The <code>Flight</code> to be removed.
     * @return An int of the number of rows affected.
     */
    public int removeFlight(Flight flight);
    
    /**
     * Update the seats available on the flight based on the seatType and the 
     * value to change it by.
     * 
     * @param flightId The id of the flight to be updated.
     * @param seatType The type of seat (standard, business or first class).
     * @param changeBy The value to change the seats available by.
     * @return An int of the number of rows updated.
     */
    public int updateSeats(int flightId, String seatType, int changeBy);
    
}
