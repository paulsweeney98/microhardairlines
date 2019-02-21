/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Checked_baggageDao;
import Daos.Dao;
import Daos.User_FlightDao;
import Dtos.Checked_baggage;
import Dtos.User;
import Dtos.User_Flight;
import Validation.Validation;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author D00191889
 */
public class BookFlightCommand implements Command {

    //@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        Validation v = new Validation();
        User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
        Checked_baggageDao cbDao = new Checked_baggageDao(Dao.getDatabaseName());
        HttpSession session = request.getSession();
        
        String type = request.getParameter("type");
        String number = request.getParameter("number");
        String expiryMonth = request.getParameter("expiryMonth");
        String expiryYear = request.getParameter("expiryYear");
        String cvv = request.getParameter("cvv");
        
        if (type != null && !type.equals("") && number != null && !number.equals("") && expiryMonth != null && !expiryMonth.equals("") && expiryYear != null && !expiryYear.equals("") && cvv != null && !cvv.equals("")) {
            
            boolean validCard = v.checkCard(type, number, expiryMonth, expiryYear, cvv);
            
            if (validCard) {

                // Get number of passengers
                int numPassengers = 0;
                numPassengers = (Integer)session.getAttribute("numPassengers");

                // Get the logged in user
                User loggedInUser = (User) session.getAttribute("loggedInUser");

                if (numPassengers > 0) {

                    if (loggedInUser != null) {

                        boolean User_FlightAdded = true;
                        boolean Checked_baggageAdded = true;

                        if (session.getAttribute("departureFlight0") != null && session.getAttribute("departureFlightCheckedBaggage0") != null && session.getAttribute("returnFlight0") != null && session.getAttribute("returnFlightCheckedBaggage0") != null) {

                            for (int i = 0; i < numPassengers; i++) {
                                // Adding User_Flights
                                User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight" + i);
                                User_Flight returnFlight = (User_Flight) session.getAttribute("returnFlight" + i);

                                // Set the userId incase it wasn't set before
        //                        departureFlight.setUserId(loggedInUser.getUserId());
        //                        returnFlight.setUserId(loggedInUser.getUserId());

                                departureFlight.setUserId(6);
                                returnFlight.setUserId(6);

                                int newDepartureUser_FlightId = ufDao.addUser_Flight(departureFlight);
                                int newReturnUser_FlightId = ufDao.addUser_Flight(returnFlight);

                                // Adding Checked_baggage
                                Checked_baggage departureFlightCheckedBaggage = (Checked_baggage) session.getAttribute("departureFlightCheckedBaggage" + i);
                                Checked_baggage returnFlightCheckedBaggage = (Checked_baggage) session.getAttribute("returnFlightCheckedBaggage" + i);

                                // Set the userId incase it wasn't set before
                                departureFlightCheckedBaggage.setUserId(loggedInUser.getUserId());
                                returnFlightCheckedBaggage.setUserId(loggedInUser.getUserId());

                                int newDepartureChecked_baggageId = cbDao.addChecked_baggage(departureFlightCheckedBaggage);
                                int newReturnChecked_baggageId = cbDao.addChecked_baggage(returnFlightCheckedBaggage);

                                // Incase of failure
                                if ((newDepartureUser_FlightId < 0) || (newReturnUser_FlightId < 0)) {
                                    i = numPassengers;
                                    User_FlightAdded = false;
                                } else if ((newDepartureChecked_baggageId < 0) || (newReturnChecked_baggageId < 0)) {
                                    i = numPassengers;
                                    Checked_baggageAdded = false;
                                }
                            }

                        } else if (session.getAttribute("departureFlight0") != null && session.getAttribute("departureFlightCheckedBaggage0") != null) {

                            for (int i = 0; i < numPassengers; i++) {
                                // Adding User_Flights
                                User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight" + i);

                                // Set the userId incase it wasn't set before
        //                        departureFlight.setUserId(loggedInUser.getUserId());
                                departureFlight.setUserId(6);

                                int newDepartureUser_FlightId = ufDao.addUser_Flight(departureFlight);

                                // Adding Checked_baggage
                                Checked_baggage departureFlightCheckedBaggage = (Checked_baggage) session.getAttribute("departureFlightCheckedBaggage" + i);

                                int newDepartureChecked_baggageId = cbDao.addChecked_baggage(departureFlightCheckedBaggage);

                                // Incase of failure
                                if (newDepartureUser_FlightId < 0) {
                                    i = numPassengers;
                                    User_FlightAdded = false;
                                } else if (newDepartureChecked_baggageId < 0) {
                                    i = numPassengers;
                                    Checked_baggageAdded = false;
                                }
                            }

                        } else {
                            String errorMessage = "Invalid details";
                            session.setAttribute("errorMessage", errorMessage);
                            forwardToJsp = "error.jsp";
                        }

                        if (User_FlightAdded == false) {
                            String errorMessage = "User_Flight not added";
                            session.setAttribute("errorMessage", errorMessage);
                            forwardToJsp = "error.jsp";
                        } else if (Checked_baggageAdded == false) {
                            String errorMessage = "Checked_baggage not added";
                            session.setAttribute("errorMessage", errorMessage);
                            forwardToJsp = "error.jsp";
                        } else {
                            forwardToJsp = "index.jsp";

                            session.invalidate();
                        }

                    } else {
                        String errorMessage = "No user logged in";
                        session.setAttribute("errorMessage", errorMessage);
                        forwardToJsp = "error.jsp";
                    }

                } else {
                    String errorMessage = "Invalid details for the number of passengers, passenger details or checked baggage";
                    session.setAttribute("errorMessage", errorMessage);
                    forwardToJsp = "error.jsp";
                }
        
            } else {
                String errorMessage = "Invalid card. Payment not processed.";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
            
        } else {
            String errorMessage = "Invalid card details passed";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        
        return forwardToJsp;
    }
    
}
