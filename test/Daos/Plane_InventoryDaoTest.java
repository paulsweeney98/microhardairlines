/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Plane_Inventory;
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
public class Plane_InventoryDaoTest {
    
    // Setting up to use the Plane_InventoryDao class' methods.
    Plane_InventoryDao piDao = new Plane_InventoryDao(Dao.getTestDatabaseName());

    /**
     * Test of getAllPlane_Inventory method, of class Plane_InventoryDao.
     */
    @Test
    public void testGetAllPlane_Inventory() {
        System.out.println("getAllPlane_Inventory");
        int expResult = 5;
        ArrayList<Plane_Inventory> planeIs = piDao.getAllPlane_Inventory();
        int result = planeIs.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of getPlane_InventoryById method, of class Plane_InventoryDao.
     */
    @Test
    public void testGetPlane_InventoryById() {
        System.out.println("getPlane_InventoryById");
        int expResult = 3;
        Plane_Inventory planeI = piDao.getPlane_InventoryById(4);
        int result = planeI.getPlaneId();
        assertEquals(expResult, result);
    }
    
}
