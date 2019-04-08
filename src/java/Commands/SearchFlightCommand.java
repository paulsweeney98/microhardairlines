/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Dao;
import Daos.FlightDao;
import Dtos.Flight;
import Validation.Validation;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author D00191889
 */
public class SearchFlightCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        HttpSession session = request.getSession();

        // Remove all attributes for flights from session before searching for a new one
        session.removeAttribute("numPassengers");
        session.removeAttribute("departureFlight");
        session.removeAttribute("returnFlight");
        for (int i = 0; i <= 10; i++) {
            session.removeAttribute("departureFlight" + i);
            session.removeAttribute("returnFlight" + i);
            session.removeAttribute("departureFlightCheckedBaggage" + i);
            session.removeAttribute("returnFlightCheckedBaggage" + i);
        }
        
        String departureAirport = request.getParameter("departureAirport");
        String destinationAirport = request.getParameter("destinationAirport");
        String departureDateString = request.getParameter("departureDate");
        java.sql.Date departureDate = java.sql.Date.valueOf(departureDateString);
        String returnDate = request.getParameter("returnDate");
        String numPassengersString  = request.getParameter("numPassengers");
        
        // Information from selected departure flight if applicable
        String departureFlightId = request.getParameter("departureFlightId");
        String departureFlightPricePaid = request.getParameter("departureFlightPricePaid");
        String departureFlightTravelClass = request.getParameter("departureFlightTravelClass");

        // Validation
        if (departureAirport != null && !departureAirport.equals("") && destinationAirport != null && !destinationAirport.equals("") && departureDate != null && !departureDate.equals("") && numPassengersString != null && !numPassengersString.equals("")) {
            
            Validation v = new Validation();
            boolean validDate = v.checkDate(departureDate);
            boolean validDepartureDate = v.checkDepartureDate(departureDate);
            
            boolean validReturnDate = true;
            if (returnDate != null) {
                java.sql.Date returnDateSQLDate = java.sql.Date.valueOf(returnDate);
                validReturnDate = v.checkReturnDate(departureDate, returnDateSQLDate);
            }
            
            int numPassengers = v.convertStringToInt(numPassengersString);
            
            if ((numPassengers > 0) && (numPassengers >= 10)) {
                
                if (validDate && validDepartureDate && validReturnDate) {
                    
                    FlightDao fDao = new FlightDao(Dao.getDatabaseName());
                    ArrayList<Flight> flights = flights = fDao.getFlightsByLocationsDepartureDatePassengerNum(departureAirport, destinationAirport, (java.sql.Date) departureDate, numPassengers);

                    // Store the book in the session
                    session.setAttribute("flights", flights);

                    if (departureFlightId != null && !departureFlightId.equals("") && departureFlightPricePaid != null && !departureFlightPricePaid.equals("") && departureFlightTravelClass != null && !departureFlightTravelClass.equals("")) {
                        // Set the page to be viewed to the results page
                        forwardToJsp = "flights.jsp?numPassengers=" + numPassengers + "&departureFlightId=" + departureFlightId + "&departureFlightPricePaid=" + departureFlightPricePaid + "&departureFlightTravelClass=" + departureFlightTravelClass;
                    } else if (returnDate != null && !returnDate.equals("")) {
                        // Set the page to be viewed to the results page
                        forwardToJsp = "flights.jsp?numPassengers=" + numPassengers + "&returnDate=" + returnDate;
                    } else {
                        // Set the page to be viewed to the results page
                        forwardToJsp = "flights.jsp?numPassengers=" + numPassengers;
                    }
                    
                } else {
                    forwardToJsp = "error.jsp";

                    session.setAttribute("errorMessage", "Invalid dates supplied.");
                }
                
            } else {
                forwardToJsp = "error.jsp";

                session.setAttribute("errorMessage", "You must book for at least one passenger and at most 10 passengers.");
            }

        } else {
            forwardToJsp = "error.jsp";

            session.setAttribute("errorMessage", "A required parameter was missing");
        }

        return forwardToJsp;
    }
    
}
