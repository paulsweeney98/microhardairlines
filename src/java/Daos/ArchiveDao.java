/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Checked_baggage;
import Dtos.Flight;
import Dtos.User_Flight;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 *
 * The author of this class is Gerard Hoey
 */
public class ArchiveDao extends Dao implements ArchiveDaoInterface {

    /**
     * Constructor for creating a ArchiveFlightsDao instance using the Dao
     * superclass
     *
     * @param databaseName Name of the database to connect to in the instance
     */
    public ArchiveDao(String databaseName) {
        super(databaseName);
    }

    /**
     * Archives a <code>Flight</code> in the flight_archive table in the
     * database.
     *
     * @param flight The <code>Flight</code> to be archived.
     * @return <code>int</code> indicating the number of rows affected by the
     * insert, should be 1 if successful and -1 if not.
     */
    @Override
    public int archiveFlight(Flight flight) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet generatedKeys = null;
        int success = -1;

        try {
            con = getConnection();
            // Query
            String query = "INSERT INTO flight_archive (id, planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            // Compile into SQL
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, flight.getId());
            ps.setInt(2, flight.getPlaneInventoryId());
            ps.setString(3, flight.getFlightNumber());
            ps.setDouble(4, flight.getPrice());
            ps.setInt(5, flight.getStandardSeatsAvailable());
            ps.setInt(6, flight.getBusinessSeatsAvailable());
            ps.setInt(7, flight.getFirstClassSeatsAvailable());
            ps.setDate(8, flight.getDate());
            ps.setInt(9, flight.getDepartureTime());
            ps.setInt(10, flight.getArrivalTime());
            ps.setInt(11, flight.getDuration());
            ps.setString(12, flight.getDepartureAirport());
            ps.setString(13, flight.getDepartureAirportAbbreviation());
            ps.setString(14, flight.getArrivalAirport());
            ps.setString(15, flight.getArrivalAirportAbbreviation());
            ps.setString(16, flight.getDepartureTerminal());
            ps.setString(17, flight.getArrivalTerminal());
            // Execute SQL
            success = ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight_archive table in the archiveFlight() method\n"
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
        // Return success
        return success;
    }

    @Override
    public int archiveChecked_baggage(Checked_baggage checked_baggage) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet generatedKeys = null;
        int success = -1;

        try {
            con = getConnection();
            // Query
            String query = "INSERT INTO checked_baggage_archive (id, weight, pricePaid, user_flightId) "
                    + "VALUES (?, ?, ?, ?)";
            // Compile into SQL
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, checked_baggage.getId());
            ps.setDouble(2, checked_baggage.getWeight());
            ps.setDouble(3, checked_baggage.getPricePaid());
            ps.setInt(4, checked_baggage.getUser_flightId());
            // Execute SQL
            success = ps.executeUpdate();


        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the checked_baggage_archive table in the archiveChecked_baggage() method\n"
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
        // Return success
        return success;
    }

    @Override
    public int archiveUser_Flight(User_Flight user_flight) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet generatedKeys = null;
        int success = -1;

        try {
            con = getConnection();
            // Query
            String query = "INSERT INTO user_flight_archive (id, userId, flightId, passengerFirstName, passengerLastName, travelClass, queue, seat, boardingDoor, specialAssistanceRequired, pricePaid) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            // Compile into SQL
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, user_flight.getId());
            ps.setInt(2, user_flight.getUserId());
            ps.setInt(3, user_flight.getFlightId());
            ps.setString(4, user_flight.getPassengerFirstName());
            ps.setString(5, user_flight.getPassengerLastName());
            ps.setString(6, user_flight.getTravelClass());
            ps.setString(7, user_flight.getQueue());
            ps.setString(8, user_flight.getSeat());
            ps.setString(9, user_flight.getBoardingDoor());
            ps.setInt(10, user_flight.getSpecialAssistanceRequired());
            ps.setDouble(11, user_flight.getPricePaid());
            
            // Execute SQL
            success = ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the user_flight_archive table in the archiveUser_Flight() method\n"
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
        // Return success
        return success;
    }

}
