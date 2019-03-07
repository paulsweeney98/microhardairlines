/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Plane_Inventory;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author D00191889
 */
public class Plane_InventoryDao extends Dao implements Plane_InventoryDaoInterface {
    
    /**
     * Constructor for creating a PlaneDao instance using the Dao superclass
     * 
     * @param databaseName Name of the database to connect to in the instance
     */
    public Plane_InventoryDao(String databaseName) {
        super(databaseName);
    }

    /**
     * Gets every Plane_Inventory in the database.
     * 
     * @return An ArrayList of Plane_Inventory items.
     */
    @Override
    public ArrayList<Plane_Inventory> getAllPlane_Inventory() {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        ArrayList<Plane_Inventory> planeIs = new ArrayList();

        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM plane_inventory";
            // Compile into SQL
            ps = con.prepareStatement(query);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                int id = rs.getInt("id");
                int planeId = rs.getInt("planeId");

                Plane_Inventory planeI = new Plane_Inventory(id, planeId);

                // Store each book in the ArrayList
                planeIs.add(planeI);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the plane_inventory table in the getAllPlane_Inventory() method\n"
                    + ex.getMessage());
        } // Close open components
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                freeConnection(con);
            }
        }
        // Return results
        return planeIs;
    }

    /**
     * Gets a Plane_Inventory by its id.
     * 
     * @param id The id of the Plane_Inventory.
     * @return The Plane_Inventory.
     */
    @Override
    public Plane_Inventory getPlane_InventoryById(int id) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        Plane_Inventory planeI = null;

        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM plane_inventory "
                        + "WHERE id = ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                id = rs.getInt("id");
                int planeId = rs.getInt("planeId");

                planeI = new Plane_Inventory(id, planeId);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the plane_inventory table in the getPlane_InventoryById() method\n"
                    + ex.getMessage());
        } // Close open components
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                freeConnection(con);
            }
        }
        // Return results
        return planeI;
    }
    
}
