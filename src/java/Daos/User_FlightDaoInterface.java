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
    
}
