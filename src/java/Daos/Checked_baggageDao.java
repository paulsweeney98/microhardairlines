/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Checked_baggage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pauls
 */
public class Checked_baggageDao extends Dao implements Checked_baggageDaoInterface {
    
    /**
     * Constructor for creating a Checked_baggageDao instance using the Dao superclass
     * 
     * @param databaseName Name of the database to connect to in the instance
     */
    public Checked_baggageDao(String databaseName) {
        super(databaseName);
    }

    /**
     * Adds a new checked baggage item to the for a user and flight to 
     * the database.
     * 
     * @param checked_baggage The checked_baggage to be added.
     * @return An int of either the newly generated id or -1 if it failed.
     */
    @Override
    public int addChecked_baggage(Checked_baggage checked_baggage) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet generatedKeys = null;
        int newId = -1;

        try {
            con = getConnection();
            // Query
            String query = "INSERT INTO checked_baggage (weight, pricePaid, user_flightId) "
                    + "VALUES (?, ?, ?)";
            // Compile into SQL
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setDouble(1, checked_baggage.getWeight());
            ps.setDouble(2, checked_baggage.getPricePaid());
            ps.setInt(3, checked_baggage.getUser_flightId());
            // Execute SQL
            ps.execute();

            // Get newly generated book_id value
            generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                newId = generatedKeys.getInt(1);
            }

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the checked_baggage table in the addChecked_baggage() method\n"
                    + ex.getMessage());
        } // Close open components
        finally {
            if (generatedKeys != null) {
                try {
                    generatedKeys.close();
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
        // Return id
        return newId;
    }

    /**
     * Gets all checked_baggage by user_flightId.
     * 
     * @param user_flightId The id of the user_flight of the checked_baggage.
     * @return An ArrayList of checked_baggage.
     */
    @Override
    public ArrayList<Checked_baggage> getChecked_baggageByUser_flightId(int user_flightId) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<Checked_baggage> checked_baggage = new ArrayList<Checked_baggage>();
        
        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM checked_baggage "
                        + "WHERE user_flightId = ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setInt(1, user_flightId);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                int id = rs.getInt("id");
                double weight = rs.getDouble("weight");
                double pricePaid = rs.getDouble("pricePaid");
                user_flightId = rs.getInt("user_flightId");

                Checked_baggage cb = new Checked_baggage(id, weight, pricePaid, user_flightId);
                
                checked_baggage.add(cb);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the checked_baggage table in the getChecked_baggageByUser_flightId() method\n"
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
        return checked_baggage;
    }

    /**
     * Removes a check_baggage item by its id.
     * 
     * @param id The id of the checked_baggage item to be removed.
     * @return An int indicating the number of rows affected in the database.
     */
    @Override
    public int removeChecked_baggage(int id) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        
        int rowsAffected = 0;

        try {
            con = getConnection();
            // Query
            String query = "DELETE FROM checked_baggage "
                    + "WHERE id = ?";
            // Compile into SQL
            ps = con.prepareStatement(query);

            ps.setInt(1, id);
            // Execute SQL
            rowsAffected = ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the checked_baggage table in the removeChecked_baggage() method\n"
                    + ex.getMessage());
            rowsAffected = 0;
        } // Close open components
        finally {
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
        return rowsAffected;
    }
    
}
