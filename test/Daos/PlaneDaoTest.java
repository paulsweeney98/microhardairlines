/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Plane;
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
public class PlaneDaoTest {
    
    // Setting up to use the PlaneDao class' methods.
    PlaneDao pDao = new PlaneDao(Dao.getTestDatabaseName());

    /**
     * Test of getPlaneById method, of class PlaneDao.
     */
    @Test
    public void testGetPlaneById() {
        System.out.println("getPlaneById");
        String expResult = "Boeing Commercial Airplanes";
        Plane plane = pDao.getPlaneById(1);
        String result = plane.getMake();
        assertEquals(expResult, result);
    }
    
}
