/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Plane;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author D00191889
 */
public class PlaneDao extends Dao implements PlaneDaoInterface {
    
    /**
     * Constructor for creating a PlaneDao instance using the Dao superclass
     * 
     * @param databaseName Name of the database to connect to in the instance
     */
    public PlaneDao(String databaseName) {
        super(databaseName);
    }

    /**
     * Gets a Plane by its id.
     * 
     * @param id The id of the Plane.
     * @return The Plane.
     */
    @Override
    public Plane getPlaneById(int id) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        Plane plane = null;

        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM plane "
                        + "WHERE id = ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                id = rs.getInt("id");
                String make = rs.getString("make");
                String model = rs.getString("model");
                int standardSeatsCapacity = rs.getInt("standardSeatsCapacity");
                int businessSeatsCapacity = rs.getInt("businessSeatsCapacity");
                int firstClassSeatsCapacity = rs.getInt("firstClassSeatsCapacity");

                plane = new Plane(id, make, model, standardSeatsCapacity, businessSeatsCapacity, firstClassSeatsCapacity);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the plane table in the getPlaneById() method\n"
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
        return plane;
    }
    
}
