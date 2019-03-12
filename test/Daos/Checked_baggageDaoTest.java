/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Checked_baggage;
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
public class Checked_baggageDaoTest {
    
    // Setting up to use the Checked_baggageDao class' methods.
    Checked_baggageDao cbDao = new Checked_baggageDao(Dao.getTestDatabaseName());

    /**
     * Test of addChecked_baggage method, of class Checked_baggageDao.
     */
    @Test
    public void testAddChecked_baggage() {
        System.out.println("addChecked_baggage");
        Checked_baggage checked_baggage = new Checked_baggage(15, 20, 1);
        int result = cbDao.addChecked_baggage(checked_baggage);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsDeleted = cbDao.removeChecked_baggage(result);
            assertEquals(1, rowsDeleted);
        }
    }

    /**
     * Test of getChecked_baggageByUser_flightId method, of class Checked_baggageDao.
     */
    @Test
    public void testGetChecked_baggageByUser_flightId() {
        System.out.println("getChecked_baggageByUser_flightId");
        int expResult = 1;
        ArrayList<Checked_baggage> checked_baggage = cbDao.getChecked_baggageByUser_flightId(21);
        int result = checked_baggage.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of removeChecked_baggage method, of class Checked_baggageDao.
     */
    @Test
    public void testRemoveChecked_baggage() {
        System.out.println("removeChecked_baggage");
        Checked_baggage checked_baggage = new Checked_baggage(15, 20, 1);
        int result = cbDao.addChecked_baggage(checked_baggage);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsDeleted = cbDao.removeChecked_baggage(result);
            assertEquals(1, rowsDeleted);
        }
    }
    
}
