/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.User_Flight;
import java.util.ArrayList;

/**
 *
 * @author D00191889
 */
public interface User_FlightDaoInterface {
    
    /**
     * Adds a User_Flight to the database to book a user on a flight.
     * 
     * @param uf The User_Flight record to be added.
     * @return An int of the newly generated id or -1 if unsuccessful.
     */
    public int addUser_Flight(User_Flight uf);
    
    /**
     * Gets an ArrayList of all of the taken seats of a particular travelClass
     * on a flight.
     * 
     * @param flightId The id of the flight.
     * @param travelClass The travelClass of the seats taken.
     * @return An ArrayList of Strings of the seats taken.
     */
    public ArrayList<String> getTakenSeats(int flightId, String travelClass);
    
    /**
     * Updates the seat and boardingDoor of a User_Flight.
     * 
     * @param User_FlightId The id of the User_Flight.
     * @param seat The seat to be added.
     * @param boardingDoor The boardingDoor to be added.
     * @return 
     */
    public int updateSeat(int User_FlightId, String seat, String boardingDoor);
    
    /**
     * Gets User_Flights that have vacant seats by flightId and userId.
     * 
     * @param flightId The id of the flight.
     * @param userId The id of the user.
     * @return An ArrayList of User_Flights.
     */
    public ArrayList<User_Flight> getUser_FlightsByFlightIdUserIdTravelClass(int flightId, int userId, String travelClass);
    
    public ArrayList<User_Flight> getDistinctUser_FlightsByUserId(int userId);
    
}
