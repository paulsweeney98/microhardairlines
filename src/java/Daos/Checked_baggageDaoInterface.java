/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Checked_baggage;
import java.util.ArrayList;

/**
 *
 * @author pauls
 */
public interface Checked_baggageDaoInterface {
    
    /**
     * Adds a new checked baggage item to the for a user and flight to 
     * the database.
     * 
     * @param checked_baggage The checked_baggage to be added.
     * @return An int of either the newly generated id or -1 if it failed.
     */
    public int addChecked_baggage(Checked_baggage checked_baggage);
    
    /**
     * Gets all checked_baggage by user_flightId.
     * 
     * @param user_flightId The id of the user_flight of the checked_baggage.
     * @return An ArrayList of checked_baggage.
     */
    public ArrayList<Checked_baggage> getChecked_baggageByUser_flightId(int user_flightId);
    
    /**
     * Removes a check_baggage item by its id.
     * 
     * @param id The id of the checked_baggage item to be removed.
     * @return An int indicating the number of rows affected in the database.
     */
    public int removeChecked_baggage(int id);
    
}
