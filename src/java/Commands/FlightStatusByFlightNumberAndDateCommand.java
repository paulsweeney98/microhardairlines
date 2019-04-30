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
public class FlightStatusByFlightNumberAndDateCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        HttpSession session = request.getSession();
        
        String flightNumber = request.getParameter("flightNumber");
        String departureDateString = request.getParameter("departureDate");
        java.sql.Date departureDate = java.sql.Date.valueOf(departureDateString);
        
        if (flightNumber != null && !flightNumber.equals("") && departureDate != null && !departureDate.equals("")) {
            Validation v = new Validation();
            boolean validDate = v.checkDate(departureDate);
            boolean validDepartureDate = v.checkDepartureDate(departureDate);  
            
            if (validDate && validDepartureDate) {
                
                FlightDao fDao = new FlightDao(Dao.getDatabaseName());
                Flight flight = fDao.getFlightsByFlightNumAndDate(flightNumber, departureDate);
                
                session.setAttribute("flightStatus", flight);
            }
        
        }
     
        return forwardToJsp;
    }

}