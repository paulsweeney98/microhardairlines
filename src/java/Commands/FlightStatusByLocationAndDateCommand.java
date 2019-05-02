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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dean Farrelly
 */
public class FlightStatusByLocationAndDateCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        HttpSession session = request.getSession();
        
        // Removing any previous flight status searches
        session.removeAttribute("flightStatus");
        
        // Request Parameters
        String departureAirport = request.getParameter("departureAirport");
        String destinationAirport = request.getParameter("destinationAirport");
        String departureDateString = request.getParameter("departureDate");
        java.sql.Date departureDate = java.sql.Date.valueOf(departureDateString);
        
        // If all parameters have been filled and not null check if date is valid
        if (departureAirport != null && !departureAirport.equals("") && destinationAirport != null && !destinationAirport.equals("") && departureDate != null && !departureDate.equals("")) {
            Validation v = new Validation();
            boolean validDate = v.checkDate(departureDate);
            
            // If date is valid
            if (validDate) {
                
                FlightDao fDao = new FlightDao(Dao.getDatabaseName());
                ArrayList<Flight> flights = flights = fDao.getFlightsByLocationsDepartureDate(departureAirport, destinationAirport, departureDate);
                
                if (flights == null){
                    forwardToJsp = "error.jsp";
                    
                    session.setAttribute("errorMessage", "No flights were found matching these details");
                } else {
                
                session.setAttribute("flightStatus", flights);
               
                forwardToJsp = "flightStatus.jsp";
                }   
            }  else {
                forwardToJsp = "error.jsp";

                session.setAttribute("errorMessage", "No flights were found matching these details");
        }
        
        } else {
            forwardToJsp = "error.jsp";

            session.setAttribute("errorMessage", "A required parameter was missing");
        }
        
        
        
        return forwardToJsp;
    }
    
}
