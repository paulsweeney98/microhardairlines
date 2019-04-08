/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Dtos.User_Flight;
import Validation.Validation;
import java.util.ArrayList;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pauls
 */
public class StorePassengerDetailsCommand implements Command {

    //@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        
        Validation v = new Validation();
        HttpSession session = request.getSession();
        
        int numPassengers = 0;
        numPassengers = (Integer)session.getAttribute("numPassengers");

        if ((numPassengers > 0) && (numPassengers >= 10)) {
            ArrayList<String> passengerDetails = new ArrayList<String>();

            boolean detailsValid = true;
            for (int i = 0; i < numPassengers; i++) {
                if (request.getParameter("title" + i) != null && !request.getParameter("title" + i).equals("") && request.getParameter("firstName" + i) != null && !request.getParameter("firstName" + i).equals("") && request.getParameter("lastName" + i) != null && !request.getParameter("lastName" + i).equals("")) {
                    passengerDetails.add(request.getParameter("title" + i) + "%%" + request.getParameter("firstName" + i) + "%%" + request.getParameter("lastName" + i));
                } else {
                    detailsValid = false;
                }
            }

            if (detailsValid) {
                
                if (session.getAttribute("departureFlight") != null && session.getAttribute("returnFlight") != null) {
                    
                    User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight");
                    User_Flight returnFlight = (User_Flight) session.getAttribute("returnFlight");
                    
                    for (int i = 0; i < numPassengers; i++) {
                        String [] passengerDetailsSplit = passengerDetails.get(i).split("%%");
                        
                        User_Flight newUser_FlightDeparture = null;
                        if (departureFlight.getUserId() != -1) {
                            newUser_FlightDeparture = new User_Flight(departureFlight.getUserId(), departureFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], departureFlight.getTravelClass(), departureFlight.getQueue(), null, null, 0, departureFlight.getPricePaid());
                        } else {
                            newUser_FlightDeparture = new User_Flight(-1, departureFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], departureFlight.getTravelClass(), departureFlight.getQueue(), null, null, 0, departureFlight.getPricePaid());
                        }
                        
                        User_Flight newUser_FlightReturn = null;
                        if (departureFlight.getUserId() != -1) {
                            newUser_FlightReturn = new User_Flight(returnFlight.getUserId(), returnFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], returnFlight.getTravelClass(), returnFlight.getQueue(), null, null, 0, returnFlight.getPricePaid());
                        } else {
                            newUser_FlightReturn = new User_Flight(-1, returnFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], returnFlight.getTravelClass(), returnFlight.getQueue(), null, null, 0, returnFlight.getPricePaid());
                        }
                        
                        session.setAttribute("departureFlight" + i, newUser_FlightDeparture);
                        session.setAttribute("returnFlight" + i, newUser_FlightReturn);
                    }
                    
                    forwardToJsp = "checkedBaggage.jsp";
                    
                } else if (session.getAttribute("departureFlight") != null) {
                    
                    User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight");
                    
                    for (int i = 0; i < numPassengers; i++) {
                        String [] passengerDetailsSplit = passengerDetails.get(i).split("%%");
                        
                        User_Flight newUser_FlightDeparture = null;
                        if (departureFlight.getUserId() != -1) {
                            newUser_FlightDeparture = new User_Flight(departureFlight.getUserId(), departureFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], departureFlight.getTravelClass(), departureFlight.getQueue(), null, null, 0, departureFlight.getPricePaid());
                        } else {
                            newUser_FlightDeparture = new User_Flight(-1, departureFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], departureFlight.getTravelClass(), departureFlight.getQueue(), null, null, 0, departureFlight.getPricePaid());
                        }
                        
                        if (newUser_FlightDeparture != null) {
                            session.setAttribute("departureFlight" + i, newUser_FlightDeparture);
                        }
                    }
                    
                    forwardToJsp = "checkedBaggage.jsp";
                    
                } else {
                    String errorMessage = "Flights not found";
                    session.setAttribute("errorMessage", errorMessage);
                    forwardToJsp = "error.jsp";
                }

            } else {
                String errorMessage = "Ivalid passenger details";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }

        } else {
            String errorMessage = "You must book for at least one passenger, and at most 10 passengers";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        
        return forwardToJsp;
    }
    
}
