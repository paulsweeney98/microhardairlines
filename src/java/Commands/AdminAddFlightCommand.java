/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Dao;
import Daos.FlightDao;
import Daos.PlaneDao;
import Daos.Plane_InventoryDao;
import Dtos.Flight;
import Dtos.Plane;
import Validation.Validation;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author D00191889
 */
public class AdminAddFlightCommand implements Command {

    //@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        FlightDao fDao = new FlightDao(Dao.getDatabaseName());
        PlaneDao pDao = new PlaneDao(Dao.getDatabaseName());
        Plane_InventoryDao piDao = new Plane_InventoryDao(Dao.getDatabaseName());
        Validation v = new Validation();
        
        String flightNumber = request.getParameter("flightNumber");
        String priceString = request.getParameter("price");
        String departureTerminal = request.getParameter("departureTerminal");
        String arrivalTerminal = request.getParameter("arrivalTerminal");
        String departureAirport = request.getParameter("departureAirport");
        String departureAirportAbbreviation = request.getParameter("departureAirportAbbreviation");
        String destinationAirport = request.getParameter("destinationAirport");
        String destinationAirportAbbreviation = request.getParameter("destinationAirportAbbreviation");
        String departureDateString = request.getParameter("departureDate");
        String departureTimeString = request.getParameter("departureTime");
        String arrivalTimeString = request.getParameter("arrivalTime");
        String planeInventoryIdString = request.getParameter("planeInventoryId");
        
        if (flightNumber != null && !flightNumber.equals("") && priceString != null && !priceString.equals("") && departureTerminal != null && !departureTerminal.equals("") && arrivalTerminal != null && !arrivalTerminal.equals("") && departureAirport != null && !departureAirport.equals("") && 
            departureAirportAbbreviation != null && !departureAirportAbbreviation.equals("") && destinationAirport != null && !destinationAirport.equals("") && destinationAirportAbbreviation != null && !destinationAirportAbbreviation.equals("") && departureDateString != null && !departureDateString.equals("") && departureTimeString != null && !departureTimeString.equals("") && arrivalTimeString != null && !arrivalTimeString.equals("") && planeInventoryIdString != null && !planeInventoryIdString.equals("")) {
        
            // Converting the price, departureDate and planeInventoryId to the correct format
            double price = v.convertStringToDouble(priceString);
            int planeInventoryId = v.convertStringToInt(planeInventoryIdString);
            java.sql.Date departureDate = java.sql.Date.valueOf(departureDateString);
            
            // Converting the departure and arrival times from string to int
            String dHourString = departureTimeString.substring(0, 2);
            int dHour = v.convertStringToInt(dHourString);
            String dMinuteString = departureTimeString.substring(3);
            int dMinute = v.convertStringToInt(dMinuteString);
            String aHourString = arrivalTimeString.substring(0, 2);
            int aHour = v.convertStringToInt(aHourString);
            String aMinuteString = arrivalTimeString.substring(3);
            int aMinute = v.convertStringToInt(aMinuteString);
            
            if (dHour != -1 && dMinute != -1 && aHour != -1 && aMinute != -1 && price != -1 && planeInventoryId != -1) {
                int departureTime = (dHour * 60) + (dMinute);
                int arrivalTime = (aHour * 60) + (aMinute);
                
                // Calculating the duration of the flight
                int duration = arrivalTime - departureTime;
                
                // Checking if the flight being added is already in the database (or if it's too similar to add)
                boolean flightDuplicate = false;
                ArrayList<Flight> flights = fDao.getFlights();
                for (Flight flight : flights) {
                    if (flight.getDepartureAirport().equals(departureAirport) && flight.getArrivalAirport().equals(destinationAirport) && flight.getDate() == departureDate && flight.getDepartureTime() == departureTime) {
                        flightDuplicate = true;
                    }
                }
                
                if (flightDuplicate == false) {
                    // Get the seats available based on the plane capacity
                    int planeId = piDao.getPlane_InventoryById(planeInventoryId).getPlaneId();
                    Plane plane = pDao.getPlaneById(planeId);
                    int standardSeatsAvailable = plane.getStandardSeatsCapacity();
                    int businessSeatsAvailable = plane.getBusinessSeatsCapacity();
                    int firstClassSeatsAvailable = plane.getFirstClassSeatsCapacity();
                    
                    Flight flight = new Flight(planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, departureDate, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, destinationAirport, destinationAirportAbbreviation, departureTerminal, arrivalTerminal);
                    int added = fDao.addFlight(flight);
                    
                    if (added > 0) {
                        forwardToJsp = "adminIndex.jsp";
                    } else {
                        String errorMessage = "Failed to add flight to database.";
                        session.setAttribute("errorMessage", errorMessage);
                        forwardToJsp = "error.jsp";
                    }
                } else {
                    String errorMessage = "Flight already exists in database.";
                    session.setAttribute("errorMessage", errorMessage);
                    forwardToJsp = "error.jsp";
                }
            } else {
                String errorMessage = "Error converting strings to int.";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
            
        } else {
            String errorMessage = "Invalid flight details.";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }
    
}
