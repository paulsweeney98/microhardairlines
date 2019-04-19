/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Dtos.Checked_baggage;
import Dtos.User_Flight;
import Validation.Validation;
import java.util.ArrayList;
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

        if ((numPassengers > 0) && (numPassengers <= 10)) {
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
                
                // Return
                if (session.getAttribute("departureFlight") != null && session.getAttribute("returnFlight") != null) {
                    
                    User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight");
                    User_Flight returnFlight = (User_Flight) session.getAttribute("returnFlight");
                    
                    boolean businessOrFirstClass = false;
                    
                    for (int i = 0; i < numPassengers; i++) {
                        String [] passengerDetailsSplit = passengerDetails.get(i).split("%%");
                        
                        User_Flight newUser_FlightDeparture = null;
                        Checked_baggage newChecked_baggageDeparture = null;
                        Checked_baggage newChecked_baggageReturn = null;
                        
                        // If the booking is business or first class, complimentary checked baggage must be added for each passenger
                        // The booking is business or first class
                        if (departureFlight.getTravelClass().equals("business") || departureFlight.getTravelClass().equals("firstClass")) {
                            if (departureFlight.getUserId() != -1) {
                                newUser_FlightDeparture = new User_Flight(departureFlight.getUserId(), departureFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], departureFlight.getTravelClass(), departureFlight.getQueue(), null, null, 0, departureFlight.getPricePaid());
                            } else {
                                newUser_FlightDeparture = new User_Flight(-1, departureFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], departureFlight.getTravelClass(), departureFlight.getQueue(), null, null, 0, departureFlight.getPricePaid());
                            }
                            
                            newChecked_baggageDeparture = new Checked_baggage(20, 0, newUser_FlightDeparture.getId());
                            
                            businessOrFirstClass = true;
                            
                            // The booking is standard
                        } else {
                            if (departureFlight.getUserId() != -1) {
                                newUser_FlightDeparture = new User_Flight(departureFlight.getUserId(), departureFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], departureFlight.getTravelClass(), departureFlight.getQueue(), null, null, 0, departureFlight.getPricePaid());
                            } else {
                                newUser_FlightDeparture = new User_Flight(-1, departureFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], departureFlight.getTravelClass(), departureFlight.getQueue(), null, null, 0, departureFlight.getPricePaid());
                            }
                            
                            newChecked_baggageDeparture = new Checked_baggage(0, 0, newUser_FlightDeparture.getId());
                        }
                        
                        User_Flight newUser_FlightReturn = null;
                        
                        // If the booking is business or first class, complimentary checked baggage must be added for each passenger
                        // The booking is business or first class
                        if (returnFlight.getTravelClass().equals("business") || returnFlight.getTravelClass().equals("firstClass")) {
                            if (returnFlight.getUserId() != -1) {
                                newUser_FlightReturn = new User_Flight(returnFlight.getUserId(), returnFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], returnFlight.getTravelClass(), returnFlight.getQueue(), null, null, 0, returnFlight.getPricePaid());
                            } else {
                                newUser_FlightReturn = new User_Flight(-1, returnFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], returnFlight.getTravelClass(), returnFlight.getQueue(), null, null, 0, returnFlight.getPricePaid());
                            }
                            
                            newChecked_baggageReturn = new Checked_baggage(20, 0, newUser_FlightReturn.getId());
                            
                            businessOrFirstClass = true;
                            
                            // The booking is standard
                        } else {
                            if (returnFlight.getUserId() != -1) {
                                newUser_FlightReturn = new User_Flight(returnFlight.getUserId(), returnFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], returnFlight.getTravelClass(), returnFlight.getQueue(), null, null, 0, returnFlight.getPricePaid());
                            } else {
                                newUser_FlightReturn = new User_Flight(-1, returnFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], returnFlight.getTravelClass(), returnFlight.getQueue(), null, null, 0, returnFlight.getPricePaid());
                            }
                            
                            newChecked_baggageReturn = new Checked_baggage(0, 0, newUser_FlightReturn.getId());
                        }
                        
                        session.setAttribute("departureFlight" + i, newUser_FlightDeparture);
                        session.setAttribute("returnFlight" + i, newUser_FlightReturn);
                        
                        session.setAttribute("departureFlightCheckedBaggage" + i, newChecked_baggageDeparture);
                        session.setAttribute("returnFlightCheckedBaggage" + i, newChecked_baggageReturn);
                    }
                    
                    // If a booking is business or first class, user should not be sent to checked baggage page 
                    // as they already have checked bagage
                    if (businessOrFirstClass) {
                        forwardToJsp = "paymentDetails.jsp";
                    } else {
                        forwardToJsp = "checkedBaggage.jsp";
                    }
                    
                // One-way
                } else if (session.getAttribute("departureFlight") != null) {
                    
                    User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight");
                    
                    boolean businessOrFirstClass = false;
                    
                    for (int i = 0; i < numPassengers; i++) {
                        String [] passengerDetailsSplit = passengerDetails.get(i).split("%%");
                        
                        User_Flight newUser_FlightDeparture = null;
                        Checked_baggage newChecked_baggageDeparture = null;
                        
                        // If the booking is business or first class, complimentary checked baggage must be added for each passenger
                        // The booking is business or first class
                        if (departureFlight.getTravelClass().equals("business") || departureFlight.getTravelClass().equals("firstClass")) {
                            if (departureFlight.getUserId() != -1) {
                                newUser_FlightDeparture = new User_Flight(departureFlight.getUserId(), departureFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], departureFlight.getTravelClass(), departureFlight.getQueue(), null, null, 0, departureFlight.getPricePaid());
                            } else {
                                newUser_FlightDeparture = new User_Flight(-1, departureFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], departureFlight.getTravelClass(), departureFlight.getQueue(), null, null, 0, departureFlight.getPricePaid());
                            }
                            
                            newChecked_baggageDeparture = new Checked_baggage(20, 0, newUser_FlightDeparture.getId());
                            
                            businessOrFirstClass = true;
                            
                        // The booking is standard
                        } else {
                            if (departureFlight.getUserId() != -1) {
                                newUser_FlightDeparture = new User_Flight(departureFlight.getUserId(), departureFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], departureFlight.getTravelClass(), departureFlight.getQueue(), null, null, 0, departureFlight.getPricePaid());
                            } else {
                                newUser_FlightDeparture = new User_Flight(-1, departureFlight.getFlightId(), passengerDetailsSplit[1], passengerDetailsSplit[2], departureFlight.getTravelClass(), departureFlight.getQueue(), null, null, 0, departureFlight.getPricePaid());
                            }
                            
                            newChecked_baggageDeparture = new Checked_baggage(0, 0, newUser_FlightDeparture.getId());
                        }
                        
                        if (newUser_FlightDeparture != null) {
                            session.setAttribute("departureFlight" + i, newUser_FlightDeparture);
                        }
                        
                        if (newChecked_baggageDeparture != null) {
                            session.setAttribute("departureFlightCheckedBaggage" + i, newChecked_baggageDeparture);
                        }
                    }
                    
                    // If a booking is business or first class, user should not be sent to checked baggage page 
                    // as they already have checked bagage
                    if (businessOrFirstClass) {
                        forwardToJsp = "paymentDetails.jsp";
                    } else {
                        forwardToJsp = "checkedBaggage.jsp";
                    }
                    
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
