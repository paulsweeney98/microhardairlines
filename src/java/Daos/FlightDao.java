/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Flight;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 * 
 * The author of this class is Paul Sweeney
 */
public class FlightDao extends Dao implements FlightDaoInterface {
    
    /**
     * Constructor for creating a FlightDao instance using the Dao superclass
     * 
     * @param databaseName Name of the database to connect to in the instance
     */
    public FlightDao(String databaseName) {
        super(databaseName);
    }

    /**
     * Gets all flights from database.
     * 
     * @return An ArrayList of flights.
     */
    @Override
    public ArrayList<Flight> getFlights() {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        ArrayList<Flight> flights = new ArrayList();

        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM flight";
            // Compile into SQL
            ps = con.prepareStatement(query);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                int id = rs.getInt("id");
                int planeInventoryId = rs.getInt("planeInventoryId");
                String flightNumber = rs.getString("flightNumber");
                double price = rs.getDouble("price");
                int standardSeatsAvailable = rs.getInt("standardSeatsAvailable");
                int businessSeatsAvailable = rs.getInt("businessSeatsAvailable");
                int firstClassSeatsAvailable = rs.getInt("firstClassSeatsAvailable");
                Date date = rs.getDate("date");
                int departureTime = rs.getInt("departureTime");
                int arrivalTime = rs.getInt("arrivalTime");
                int duration = rs.getInt("duration");
                String departureAirport = rs.getString("departureAirport");
                String departureAirportAbbreviation = rs.getString("departureAirportAbbreviation");
                String arrivalAirport = rs.getString("arrivalAirport");
                String arrivalAirportAbbreviation = rs.getString("arrivalAirportAbbreviation");
                String departureTerminal = rs.getString("departureTerminal");
                String arrivalTerminal = rs.getString("arrivalTerminal");

                Flight flight = new Flight(id, planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal);

                // Store each flight in the ArrayList
                flights.add(flight);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the getFlights() method\n"
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
        return flights;
    }
    
    /**
     * Get all available departure airports (no repeating values).
     * 
     * @return An ArrayList of flights.
     */
    @Override
    public ArrayList<Flight> getDepartureAirports() {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        ArrayList<Flight> flights = new ArrayList();

        try {
            con = getConnection();
            // Query
            String query = "SELECT DISTINCT departureAirport, departureAirportAbbreviation "
                    + "FROM flight";
            // Compile into SQL
            ps = con.prepareStatement(query);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                int id = -1;
                int planeInverntoryId = -1;
                String flightNumber = "";
                double price = -1;
                int standardSeatsAvailable = -1;
                int businessSeatsAvailable = -1;
                int firstClassSeatsAvailable = -1;
                Date date = new Date(2000, 1, 1);
                int departureTime = -1;
                int arrivalTime = -1;
                int duration = -1;
                String departureAirport = rs.getString("departureAirport");
                String departureAirportAbbreviation = rs.getString("departureAirportAbbreviation");
                String arrivalAirport = "";
                String arrivalAirportAbbreviation = "";
                String departureTerminal = "";
                String arrivalTerminal = "";

                Flight flight = new Flight(id, planeInverntoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal);

                // Store each flight in the ArrayList
                flights.add(flight);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the getDepartureAirports() method\n"
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
        return flights;
    }

    /**
     * Get all available arrival airports (no repeating values).
     * 
     * @return An ArrayList of flights.
     */
    @Override
    public ArrayList<Flight> getArrivalAirports() {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        ArrayList<Flight> flights = new ArrayList();

        try {
            con = getConnection();
            // Query
            String query = "SELECT DISTINCT arrivalAirport, arrivalAirportAbbreviation "
                    + "FROM flight";
            // Compile into SQL
            ps = con.prepareStatement(query);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                int id = -1;
                int planeInventoryId = -1;
                String flightNumber = "";
                double price = -1;
                int standardSeatsAvailable = -1;
                int businessSeatsAvailable = -1;
                int firstClassSeatsAvailable = -1;
                Date date = new Date(2000, 1, 1);
                int departureTime = -1;
                int arrivalTime = -1;
                int duration = -1;
                String departureAirport = "";
                String departureAirportAbbreviation = "";
                String arrivalAirport = rs.getString("arrivalAirport");
                String arrivalAirportAbbreviation = rs.getString("arrivalAirportAbbreviation");
                String departureTerminal = "";
                String arrivalTerminal = "";

                Flight flight = new Flight(id, planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal);

                // Store each flight in the ArrayList
                flights.add(flight);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the getArrivalAirports() method\n"
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
        return flights;
    }
    
    /**
     * View all <code>Flight</code> entries in the database based on their departure 
     * location, destination location, date of the flight and the number of passengers 
     * being booked by the user.
     *
     * @return <code>ArrayList</code> of <code>Flight</code> objects
     */
    @Override
    public ArrayList<Flight> getFlightsByLocationsDepartureDatePassengerNum(String departureAirport, String destinationAirport, Date date, int numPassengers) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        ArrayList<Flight> flights = new ArrayList();

        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM flight "
                        + "WHERE departureAirport = ? "
                        + "AND arrivalAirport = ? "
                        + "AND date = ? "
                        + "AND (standardSeatsAvailable + businessSeatsAvailable + firstClassSeatsAvailable) >= ?";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setString(1, departureAirport);
            ps.setString(2, destinationAirport);
            ps.setDate(3, date);
            ps.setInt(4, numPassengers);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                int id = rs.getInt("id");
                int planeInventoryId = rs.getInt("planeInventoryId");
                String flightNumber = rs.getString("flightNumber");
                double price = rs.getDouble("price");
                int standardSeatsAvailable = rs.getInt("standardSeatsAvailable");
                int businessSeatsAvailable = rs.getInt("businessSeatsAvailable");
                int firstClassSeatsAvailable = rs.getInt("firstClassSeatsAvailable");
                date = rs.getDate("date");
                int departureTime = rs.getInt("departureTime");
                int arrivalTime = rs.getInt("arrivalTime");
                int duration = rs.getInt("duration");
                departureAirport = rs.getString("departureAirport");
                String departureAirportAbbreviation = rs.getString("departureAirportAbbreviation");
                String arrivalAirport = rs.getString("arrivalAirport");
                String arrivalAirportAbbreviation = rs.getString("arrivalAirportAbbreviation");
                String departureTerminal = rs.getString("departureTerminal");
                String arrivalTerminal = rs.getString("arrivalTerminal");

                Flight flight = new Flight(id, planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal);

                // Store each flight in the ArrayList
                flights.add(flight);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the getFlightsByLocationsDepartureDatePassengerNum() method\n"
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
        return flights;
    }
    
    /**
     * Get all <code>Flight</code> entries in the database before a certain date
     * 
     * @param date The date where the query ends
     * @return <code>ArrayList</code> of <code>Flight</code> objects
     */
    @Override
    public ArrayList<Flight> getFlightsBeforeDepartureDate(Date date) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        ArrayList<Flight> flights = new ArrayList();

        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM flight "
                        + "WHERE date < ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setDate(1, date);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                int id = rs.getInt("id");
                int planeInventoryId = rs.getInt("planeInventoryId");
                String flightNumber = rs.getString("flightNumber");
                double price = rs.getDouble("price");
                int standardSeatsAvailable = rs.getInt("standardSeatsAvailable");
                int businessSeatsAvailable = rs.getInt("businessSeatsAvailable");
                int firstClassSeatsAvailable = rs.getInt("firstClassSeatsAvailable");
                date = rs.getDate("date");
                int departureTime = rs.getInt("departureTime");
                int arrivalTime = rs.getInt("arrivalTime");
                int duration = rs.getInt("duration");
                String departureAirport = rs.getString("departureAirport");
                String departureAirportAbbreviation = rs.getString("departureAirportAbbreviation");
                String arrivalAirport = rs.getString("arrivalAirport");
                String arrivalAirportAbbreviation = rs.getString("arrivalAirportAbbreviation");
                String departureTerminal = rs.getString("departureTerminal");
                String arrivalTerminal = rs.getString("arrivalTerminal");

                Flight flight = new Flight(id, planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal);

                // Store each flight in the ArrayList
                flights.add(flight);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the getFlightsBeforeDepartureDate() method\n"
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
        return flights;
    }

    /**
     * Gets a <code>Flight</code> by its id.
     * 
     * @param id The id of the <code>Flight</code>.
     * @return The <code>Flight</code> found.
     */
    @Override
    public Flight getFlightById(int id) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        Flight flight = null;

        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM flight "
                        + "WHERE id = ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                id = rs.getInt("id");
                int planeInventoryId = rs.getInt("planeInventoryId");
                String flightNumber = rs.getString("flightNumber");
                double price = rs.getDouble("price");
                int standardSeatsAvailable = rs.getInt("standardSeatsAvailable");
                int businessSeatsAvailable = rs.getInt("businessSeatsAvailable");
                int firstClassSeatsAvailable = rs.getInt("firstClassSeatsAvailable");
                Date date = rs.getDate("date");
                int departureTime = rs.getInt("departureTime");
                int arrivalTime = rs.getInt("arrivalTime");
                int duration = rs.getInt("duration");
                String departureAirport = rs.getString("departureAirport");
                String departureAirportAbbreviation = rs.getString("departureAirportAbbreviation");
                String arrivalAirport = rs.getString("arrivalAirport");
                String arrivalAirportAbbreviation = rs.getString("arrivalAirportAbbreviation");
                String departureTerminal = rs.getString("departureTerminal");
                String arrivalTerminal = rs.getString("arrivalTerminal");

                flight = new Flight(id, planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the getFlightById() method\n"
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
        return flight;
    }
    
    /**
     * Update the price of a <code>Flight</code> based on the id.
     *
     * @param Flight The <code>Flight</code> to be updated.
     * @param newPrice The new price for the flight.
     * 
     * @return <code>int</code> indicating the number of rows affected by the update, should 
     * be 1 if successful and -1 if not.
     */
    @Override
    public int updatePrice(Flight flight, double newPrice) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        
        int rowsUpdated = -1;

        try {
            con = getConnection();
            // Query
            String query = "UPDATE flight "
                    + "SET price = ? "
                    + "WHERE id = ?";
            // Compile into SQL
            ps = con.prepareStatement(query);

            ps.setInt(1, flight.getId());
            ps.setDouble(2, newPrice);
            // Execute SQL
            rowsUpdated = ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the updatePrice() method\n"
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

    /**
     * Add a <code>Flight</code> to the database.
     * 
     * @param flight The <code>Flight</code> to be added.
     * @return The newly generated id of the <code>Flight</code>.
     */
    @Override
    public int addFlight(Flight flight) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet generatedKeys = null;
        int newId = -1;

        try {
            con = getConnection();
            // Query
            String query = "INSERT INTO flight (planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            // Compile into SQL
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, flight.getPlaneInventoryId());
            ps.setString(2, flight.getFlightNumber());
            ps.setDouble(3, flight.getPrice());
            ps.setInt(4, flight.getStandardSeatsAvailable());
            ps.setInt(5, flight.getBusinessSeatsAvailable());
            ps.setInt(6, flight.getFirstClassSeatsAvailable());
            ps.setDate(7, flight.getDate());
            ps.setInt(8, flight.getDepartureTime());
            ps.setInt(9, flight.getArrivalTime());
            ps.setInt(10, flight.getDuration());
            ps.setString(11, flight.getDepartureAirport());
            ps.setString(12, flight.getDepartureAirportAbbreviation());
            ps.setString(13, flight.getArrivalAirport());
            ps.setString(14, flight.getArrivalAirportAbbreviation());
            ps.setString(15, flight.getDepartureTerminal());
            ps.setString(16, flight.getArrivalTerminal());
            // Execute SQL
            ps.execute();

            // Get newly generated id value
            generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                newId = generatedKeys.getInt(1);
            }

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the addFlight() method\n"
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
     * Edit a <code>Flight</code> in the database.
     * 
     * @param flight The <code>Flight</code> to be edited.
     * @return <code>int</code> indicating the number of rows affected by the update, should 
     * be 1 if successful and -1 if not.
     */
    @Override
    public int editFlightById(Flight flight) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;

        int rowsUpdated = -1;

        try {
            con = getConnection();
            // Query
            String query = "UPDATE flight "
                    + " SET planeInventoryId = ?, price = ?, standardSeatsAvailable = ?, businessSeatsAvailable = ?, firstClassSeatsAvailable = ?, date = ?, departureTime = ?, arrivalTime = ?, duration = ?, departureAirport = ?, departureAirportAbbreviation = ?, arrivalAirport = ?, arrivalAirportAbbreviation = ?, departureTerminal = ?, arrivalTerminal = ?"
                    + " WHERE id = ?";
            // Compile into SQL
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, flight.getPlaneInventoryId());
            ps.setDouble(2, flight.getPrice());
            ps.setInt(3, flight.getStandardSeatsAvailable());
            ps.setInt(4, flight.getBusinessSeatsAvailable());
            ps.setInt(5, flight.getFirstClassSeatsAvailable());
            ps.setDate(6, flight.getDate());
            ps.setInt(7, flight.getDepartureTime());
            ps.setInt(8, flight.getArrivalTime());
            ps.setInt(9, flight.getDuration());
            ps.setString(10, flight.getDepartureAirport());
            ps.setString(11, flight.getDepartureAirportAbbreviation());
            ps.setString(12, flight.getArrivalAirport());
            ps.setString(13, flight.getArrivalAirportAbbreviation());
            ps.setString(14, flight.getDepartureTerminal());
            ps.setString(15, flight.getArrivalTerminal());
            ps.setInt(16, flight.getId());
            // Execute SQL
            rowsUpdated = ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the editFlightById() method\n"
                    + ex.getMessage());
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
        // Return id
        return rowsUpdated;
    }
    
    /**
     * Edit <code>Flights</code> in the database with the same flightNumber.
     * 
     * @param flight The <code>Flight</code> to be edited.
     * @return <code>int</code> indicating the number of rows affected by the update, should 
     * be 1 or more if successful and -1 if not.
     */
    @Override
    public int editFlightByFlightNumber(Flight flight) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;

        int rowsUpdated = -1;

        try {
            con = getConnection();
            // Query
            String query = "UPDATE flight "
                    + " SET planeInventoryId = ?, price = ?, standardSeatsAvailable = ?, businessSeatsAvailable = ?, firstClassSeatsAvailable = ?, date = ?, departureTime = ?, arrivalTime = ?, duration = ?, departureAirport = ?, departureAirportAbbreviation = ?, arrivalAirport = ?, arrivalAirportAbbreviation = ?, departureTerminal = ?, arrivalTerminal = ?"
                    + " WHERE flightNumber = ?";
            // Compile into SQL
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, flight.getPlaneInventoryId());
            ps.setDouble(2, flight.getPrice());
            ps.setInt(3, flight.getStandardSeatsAvailable());
            ps.setInt(4, flight.getBusinessSeatsAvailable());
            ps.setInt(5, flight.getFirstClassSeatsAvailable());
            ps.setDate(6, flight.getDate());
            ps.setInt(7, flight.getDepartureTime());
            ps.setInt(8, flight.getArrivalTime());
            ps.setInt(9, flight.getDuration());
            ps.setString(10, flight.getDepartureAirport());
            ps.setString(11, flight.getDepartureAirportAbbreviation());
            ps.setString(12, flight.getArrivalAirport());
            ps.setString(13, flight.getArrivalAirportAbbreviation());
            ps.setString(14, flight.getDepartureTerminal());
            ps.setString(15, flight.getArrivalTerminal());
            ps.setString(16, flight.getFlightNumber());
            // Execute SQL
            rowsUpdated = ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the editFlightNumber() method\n"
                    + ex.getMessage());
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
        // Return id
        return rowsUpdated;
    }
    
    /**
     * Removes a <code>Flight</code> from the database.
     * 
     * @param id The id of the <code>Flight</code> to be removed.
     * @return An int of the number of rows affected.
     */
    @Override
    public int removeFlight(int id) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        
        int rowsAffected = 0;

        try {
            con = getConnection();
            // Query
            String query = "DELETE FROM flight "
                    + "WHERE id = ?";
            // Compile into SQL
            ps = con.prepareStatement(query);

            ps.setInt(1, id);
            // Execute SQL
            rowsAffected = ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the removeFlight() method\n"
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

    /**
     * Update the seats available on the flight based on the seatType and the 
     * value to change it by.
     * 
     * @param flightId The id of the flight to be updated.
     * @param seatType The type of seat (standard, business or first class).
     * @param changeBy The value to change the seats available by.
     * @return An int of the number of rows updated.
     */
    @Override
    public int updateStandardSeats(int flightId, String seatType, int changeBy) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        
        int rowsUpdated = -1;

        try {
            con = getConnection();
            // Query
            String query = "UPDATE flight "
                    + "SET standardSeatsAvailable = standardSeatsAvailable + (?) "
                    + "WHERE id = ?";
            // Compile into SQL
            ps = con.prepareStatement(query);

            ps.setInt(1, changeBy);
            ps.setInt(2, flightId);
            // Execute SQL
            rowsUpdated = ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the updateStandardSeats() method\n"
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

    /**
     * Update the business seats available on the flight based on the seatType and the 
     * value to change it by.
     * 
     * @param flightId The id of the flight to be updated.
     * @param seatType The type of seat (standard, business or first class).
     * @param changeBy The value to change the seats available by.
     * @return An int of the number of rows updated.
     */
    @Override
    public int updateBusinessSeats(int flightId, String seatType, int changeBy) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        
        int rowsUpdated = -1;

        try {
            con = getConnection();
            // Query
            String query = "UPDATE flight "
                    + "SET businessSeatsAvailable = businessSeatsAvailable + (?) "
                    + "WHERE id = ?";
            // Compile into SQL
            ps = con.prepareStatement(query);

            ps.setInt(1, changeBy);
            ps.setInt(2, flightId);
            // Execute SQL
            rowsUpdated = ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the updateBusinessSeats() method\n"
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

    /**
     * Update the first class seats available on the flight based on the seatType and the 
     * value to change it by.
     * 
     * @param flightId The id of the flight to be updated.
     * @param seatType The type of seat (standard, business or first class).
     * @param changeBy The value to change the seats available by.
     * @return An int of the number of rows updated.
     */
    @Override
    public int updateFirstClassSeats(int flightId, String seatType, int changeBy) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        
        int rowsUpdated = -1;

        try {
            con = getConnection();
            // Query
            String query = "UPDATE flight "
                    + "SET firstClassSeatsAvailable = firstClassSeatsAvailable + (?) "
                    + "WHERE id = ?";
            // Compile into SQL
            ps = con.prepareStatement(query);

            ps.setInt(1, changeBy);
            ps.setInt(2, flightId);
            // Execute SQL
            rowsUpdated = ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the updateFirstClassSeats() method\n"
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
    
    /**
     * Gets a <code>Flight</code> by its flightNum.
     * 
     * @param flightNum The id of the <code>Flight</code>.
     * @return The <code>Flight</code> found.
     */
    @Override
    public Flight getFlightByFlightNum(int flightNum) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        Flight flight = null;

        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM flight "
                        + "WHERE flightNumber = ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setInt(1, flightNum);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                int planeInventoryId = rs.getInt("planeInventoryId");
                String flightNumber = rs.getString("flightNumber");
                double price = rs.getDouble("price");
                int standardSeatsAvailable = rs.getInt("standardSeatsAvailable");
                int businessSeatsAvailable = rs.getInt("businessSeatsAvailable");
                int firstClassSeatsAvailable = rs.getInt("firstClassSeatsAvailable");
                Date date = rs.getDate("date");
                int departureTime = rs.getInt("departureTime");
                int arrivalTime = rs.getInt("arrivalTime");
                int duration = rs.getInt("duration");
                String departureAirport = rs.getString("departureAirport");
                String departureAirportAbbreviation = rs.getString("departureAirportAbbreviation");
                String arrivalAirport = rs.getString("arrivalAirport");
                String arrivalAirportAbbreviation = rs.getString("arrivalAirportAbbreviation");
                String departureTerminal = rs.getString("departureTerminal");
                String arrivalTerminal = rs.getString("arrivalTerminal");

                flight = new Flight(planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the getFlightById() method\n"
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
        return flight;
    }
    
     /**
     * View all <code>Flight</code> entries in the database based on their departure airport,
     * destination airport and date.
     * 
     * @param departureAirport The departure airport of the flight.
     * @param destinationAirport The destination airport of the flight.
     * @param date The date of the flight.
     * 
     * @return <code>ArrayList</code> of <code>Flight</code> objects
     */
    @Override
    public ArrayList<Flight> getFlightsByLocationsDepartureDate(String departureAirport, String destinationAirport, Date date) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        ArrayList<Flight> flights = new ArrayList();

        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM flight "
                        + "WHERE departureAirport = ? "
                        + "AND arrivalAirport = ? "
                        + "AND date = ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setString(1, departureAirport);
            ps.setString(2, destinationAirport);
            ps.setDate(3, date);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                int id = rs.getInt("id");
                int planeInventoryId = rs.getInt("planeInventoryId");
                String flightNumber = rs.getString("flightNumber");
                double price = rs.getDouble("price");
                int standardSeatsAvailable = rs.getInt("standardSeatsAvailable");
                int businessSeatsAvailable = rs.getInt("businessSeatsAvailable");
                int firstClassSeatsAvailable = rs.getInt("firstClassSeatsAvailable");
                date = rs.getDate("date");
                int departureTime = rs.getInt("departureTime");
                int arrivalTime = rs.getInt("arrivalTime");
                int duration = rs.getInt("duration");
                departureAirport = rs.getString("departureAirport");
                String departureAirportAbbreviation = rs.getString("departureAirportAbbreviation");
                String arrivalAirport = rs.getString("arrivalAirport");
                String arrivalAirportAbbreviation = rs.getString("arrivalAirportAbbreviation");
                String departureTerminal = rs.getString("departureTerminal");
                String arrivalTerminal = rs.getString("arrivalTerminal");

                Flight flight = new Flight(id, planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal);

                // Store each book in the ArrayList
                flights.add(flight);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the getFlightsByLocationsDepartureDatePassengerNum() method\n"
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
        return flights;
    }
    
    /**
     * View all <code>Flight</code> entries in the database based on their flight number
     * and date.
     * 
     * @param flightNumber The number of the flight.
     * @param date The date of the flight.
     * 
     * @return <code>ArrayList</code> of <code>Flight</code> objects
     */
    @Override
    public Flight getFlightsByFlightNumAndDate(String flightNumber, Date date) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        Flight flight = null;
        
        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM flight "
                        + "WHERE flightNumber = ? "
                        + "AND date = ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setString(1, flightNumber);
            ps.setDate(2, date);
            // Execute SQL
            rs = ps.executeQuery();
            

            // While loop through rows returned from query
            while (rs.next()) {
                int id = rs.getInt("id");
                int planeInventoryId = rs.getInt("planeInventoryId");
                flightNumber = rs.getString("flightNumber");
                double price = rs.getDouble("price");
                int standardSeatsAvailable = rs.getInt("standardSeatsAvailable");
                int businessSeatsAvailable = rs.getInt("businessSeatsAvailable");
                int firstClassSeatsAvailable = rs.getInt("firstClassSeatsAvailable");
                date = rs.getDate("date");
                int departureTime = rs.getInt("departureTime");
                int arrivalTime = rs.getInt("arrivalTime");
                int duration = rs.getInt("duration");
                String departureAirport = rs.getString("departureAirport");
                String departureAirportAbbreviation = rs.getString("departureAirportAbbreviation");
                String arrivalAirport = rs.getString("arrivalAirport");
                String arrivalAirportAbbreviation = rs.getString("arrivalAirportAbbreviation");
                String departureTerminal = rs.getString("departureTerminal");
                String arrivalTerminal = rs.getString("arrivalTerminal");

                flight = new Flight(id, planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, date, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, arrivalAirport, arrivalAirportAbbreviation, departureTerminal, arrivalTerminal);

            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the flight table in the getFlightsByLocationsDepartureDatePassengerNum() method\n"
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
        return flight;
    }
    
}
