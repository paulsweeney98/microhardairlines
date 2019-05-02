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
 * @author D00194995
 */
public class AdminEditFlightCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        FlightDao fDao = new FlightDao(Dao.getDatabaseName());
        PlaneDao pDao = new PlaneDao(Dao.getDatabaseName());
        Plane_InventoryDao piDao = new Plane_InventoryDao(Dao.getDatabaseName());
        Validation v = new Validation();

        String toggleFlightNumber = request.getParameter("toggleFlightNumber");
        if (toggleFlightNumber != null && !toggleFlightNumber.equals("")) {
            if (!toggleFlightNumber.equals("Yes")) {
                toggleFlightNumber = "No";
            }
        } else {
            toggleFlightNumber = "No";
        }
        
        String idString = request.getParameter("id");
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

        if (idString != null && !idString.equals("") && flightNumber != null && !flightNumber.equals("") && priceString != null && !priceString.equals("") && departureTerminal != null && !departureTerminal.equals("") && arrivalTerminal != null && !arrivalTerminal.equals("") && departureAirport != null && !departureAirport.equals("")
                && departureAirportAbbreviation != null && !departureAirportAbbreviation.equals("") && destinationAirport != null && !destinationAirport.equals("") && destinationAirportAbbreviation != null && !destinationAirportAbbreviation.equals("") && departureDateString != null && !departureDateString.equals("") && departureTimeString != null && !departureTimeString.equals("") && arrivalTimeString != null && !arrivalTimeString.equals("") && planeInventoryIdString != null && !planeInventoryIdString.equals("")) {

            // Converting the id, price, departureDate and planeInventoryId to the correct format
            int id = v.convertStringToInt(idString);
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

            if (dHour != -1 && dMinute != -1 && aHour != -1 && aMinute != -1 && id != -1 && price != -1 && planeInventoryId != -1) {
                int departureTime = (dHour * 60) + (dMinute);
                int arrivalTime = (aHour * 60) + (aMinute);

                // Calculating the duration of the flight
                int duration = arrivalTime - departureTime;

                // Get the seats available based on the plane capacity
                int planeId = piDao.getPlane_InventoryById(planeInventoryId).getPlaneId();
                Plane plane = pDao.getPlaneById(planeId);
                int standardSeatsAvailable = plane.getStandardSeatsCapacity();
                int businessSeatsAvailable = plane.getBusinessSeatsCapacity();
                int firstClassSeatsAvailable = plane.getFirstClassSeatsCapacity();

                int results = -1;
                
                if (toggleFlightNumber.equals("Yes")) {
                    Flight flight = new Flight(planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, destinationAirport, destinationAirportAbbreviation, departureTerminal, arrivalTerminal);
                    results = fDao.editFlightByFlightNumber(flight);
                } else {
                    Flight flight = new Flight(id, planeInventoryId, flightNumber, price, standardSeatsAvailable, businessSeatsAvailable, firstClassSeatsAvailable, departureDate, departureTime, arrivalTime, duration, departureAirport, departureAirportAbbreviation, destinationAirport, destinationAirportAbbreviation, departureTerminal, arrivalTerminal);
                    results = fDao.editFlightById(flight);
                }

                if (results > 0) {
                    forwardToJsp = "adminIndex.jsp";
                } else {
                    String errorMessage = "Failed to edit flight.";
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
