/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.User_Flight;
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
 * @author D00191889
 */
public class User_FlightDao extends Dao implements User_FlightDaoInterface {
    
    /**
     * Constructor for creating a User_FlightDao instance using the Dao superclass
     * 
     * @param databaseName Name of the database to connect to in the instance
     */
    public User_FlightDao(String databaseName) {
        super(databaseName);
    }

    /**
     * Adds a User_Flight to the database to book a user on a flight.
     * 
     * @param uf The User_Flight record to be added.
     * @return An int of the newly generated id or -1 if unsuccessful.
     */
    @Override
    public int addUser_Flight(User_Flight uf) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet generatedKeys = null;
        int newId = -1;

        try {
            con = getConnection();
            // Query
            String query = "INSERT INTO user_flight (userId, flightId, passengerFirstName, passengerLastName, travelClass, queue, seat, boardingDoor, specialAssistanceRequired, pricePaid) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            // Compile into SQL
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, uf.getUserId());
            ps.setInt(2, uf.getFlightId());
            ps.setString(3, uf.getPassengerFirstName());
            ps.setString(4, uf.getPassengerLastName());
            ps.setString(5, uf.getTravelClass());
            ps.setString(6, uf.getQueue());
            ps.setString(7, uf.getSeat());
            ps.setString(8, uf.getBoardingDoor());
            ps.setInt(9, uf.getSpecialAssistanceRequired());
            ps.setDouble(10, uf.getPricePaid());
            
            // Execute SQL
            ps.execute();

            // Get newly generated book_id value
            generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                newId = generatedKeys.getInt(1);
            }

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the user_flight table in the addUser_Flight() method\n"
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
     * Gets an ArrayList of all of the taken seats of a particular travelClass
     * on a flight.
     * 
     * @param flightId The id of the flight.
     * @param travelClass The travelClass of the seats taken.
     * @return An ArrayList of Strings of the seats taken.
     */
    @Override
    public ArrayList<String> getTakenSeats(int flightId, String travelClass) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        ArrayList<String> takenSeats = new ArrayList();

        try {
            con = getConnection();
            // Query
            String query = "SELECT seat FROM user_flight "
                        + "WHERE flightId = ? "
                        + "AND travelClass = ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setInt(1, flightId);
            ps.setString(2, travelClass);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                String seat = rs.getString("seat");

                // Store each book in the ArrayList
                takenSeats.add(seat);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the user_flight table in the getTakenSeats() method\n"
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
        return takenSeats;
    }

    @Override
    public int updateSeat(int User_FlightId, String seat, String boardingDoor) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        
        int rowsUpdated = -1;

        try {
            con = getConnection();
            // Query
            String query = "UPDATE user_flight "
                    + "SET seat = ?, boardingDoor = ? "
                    + "WHERE id = ?";
            // Compile into SQL
            ps = con.prepareStatement(query);

            ps.setString(1, seat);
            ps.setString(2, boardingDoor);
            ps.setInt(3, User_FlightId);
            // Execute SQL
            rowsUpdated = ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the user_flight table in the updateSeat() method\n"
                    + ex.getMessage());
            rowsUpdated = -1;
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
        return rowsUpdated;
    }
}
