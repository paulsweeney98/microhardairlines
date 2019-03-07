/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Dao;
import Daos.FlightDao;
import Validation.Validation;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author D00191889
 */
public class AdminRemoveFlightCommand implements Command {
    
    //@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        FlightDao fDao = new FlightDao(Dao.getDatabaseName());
        Validation v = new Validation();
        
        String flightIdString = request.getParameter("flightId");
        
        if (flightIdString != null && !flightIdString.isEmpty()) {
            int flightId = v.convertStringToInt(flightIdString);
            if (flightId != -1) {
                int removed = fDao.removeFlight(flightId);
                if (removed > 0) {
                    forwardToJsp = "adminIndex.jsp";
                } else {
                    String errorMessage = "Unable to remove flight from database.";
                    session.setAttribute("errorMessage", errorMessage);
                    forwardToJsp = "error.jsp";
                }
            } else {
                String errorMessage = "Problem converting the string to int.";
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
