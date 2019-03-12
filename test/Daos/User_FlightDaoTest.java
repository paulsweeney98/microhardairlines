/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.User_Flight;
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
public class User_FlightDaoTest {
    
    // Setting up to use the User_FlightDao class' methods.
    User_FlightDao ufDao = new User_FlightDao(Dao.getTestDatabaseName());

    /**
     * Test of addUser_Flight method, of class User_FlightDao.
     */
    @Test
    public void testAddUser_Flight() {
        System.out.println("addUser_Flight");
        User_Flight uf = new User_Flight(6, 2108, "test", "test", "standard", "non-priority", null, null, 0, 49.99);
        int result = ufDao.addUser_Flight(uf);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsDeleted = ufDao.removeUser_Flight(result);
            assertEquals(1, rowsDeleted);
        }
    }

    /**
     * Test of getTakenSeats method, of class User_FlightDao.
     */
    @Test
    public void testGetTakenSeats() {
        System.out.println("getTakenSeats");
        int expResult = 7;
        ArrayList<String> takenSeats = ufDao.getTakenSeats(2938, "standard");
        int result = takenSeats.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of updateSeat method, of class User_FlightDao.
     */
    @Test
    public void testUpdateSeat() {
        System.out.println("updateSeat");
        int result = ufDao.updateSeat(1, "6a", "front");
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to undo what was added");
            int rowsUpdated = ufDao.updateSeat(1, "3a", "front");
            assertEquals(1, rowsUpdated);
        }
    }

    /**
     * Test of getUser_FlightsByFlightIdUserIdTravelClass method, of class User_FlightDao.
     */
    @Test
    public void testGetUser_FlightsByFlightIdUserIdTravelClass() {
        System.out.println("getUser_FlightsByFlightIdUserIdTravelClass");
        int expResult = 4;
        ArrayList<User_Flight> user_flights = ufDao.getUser_FlightsByFlightIdUserIdTravelClass(2922, 6, "standard");
        int result = user_flights.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of getDistinctUser_FlightsByUserId method, of class User_FlightDao.
     */
    @Test
    public void testGetDistinctUser_FlightsByUserId() {
        System.out.println("getDistinctUser_FlightsByUserId");
        int expResult = 2;
        ArrayList<User_Flight> user_flights = ufDao.getDistinctUser_FlightsByUserId(6);
        int result = user_flights.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of getUser_FlightsByFlightIdUserId method, of class User_FlightDao.
     */
    @Test
    public void testGetUser_FlightsByFlightIdUserId() {
        System.out.println("getUser_FlightsByFlightIdUserId");
        int expResult = 11;
        ArrayList<User_Flight> user_flights = ufDao.getUser_FlightsByFlightIdUserId(2922, 6);
        int result = user_flights.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of removeUser_Flight method, of class User_FlightDao.
     */
    @Test
    public void testRemoveUser_Flight() {
        System.out.println("removeUser_Flight");
        User_Flight uf = new User_Flight(6, 2108, "test", "test", "standard", "non-priority", null, null, 0, 49.99);
        int result = ufDao.addUser_Flight(uf);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsDeleted = ufDao.removeUser_Flight(result);
            assertEquals(1, rowsDeleted);
        }
    }

    /**
     * Test of addPriorityBoarding method, of class User_FlightDao.
     */
    @Test
    public void testAddPriorityBoarding() {
        System.out.println("addPriorityBoarding");
        int result = ufDao.addPriorityBoarding(2);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsUpdated = ufDao.removePriorityBoarding(2);
            assertEquals(1, rowsUpdated);
        }
    }
    
}
