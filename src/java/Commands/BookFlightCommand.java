/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Checked_baggageDao;
import Daos.Dao;
import Daos.FlightDao;
import Daos.User_FlightDao;
import Dtos.Checked_baggage;
import Dtos.Flight;
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
        FlightDao fDao = new FlightDao(Dao.getDatabaseName());
        User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
        Checked_baggageDao cbDao = new Checked_baggageDao(Dao.getDatabaseName());
        HttpSession session = request.getSession();
        
        String type = request.getParameter("type");
        String number = request.getParameter("number");
        String expiryMonth = request.getParameter("expiryMonth");
        String expiryYear = request.getParameter("expiryYear");
        String cvv = request.getParameter("cvv");
        
        // If the user paid with Paypal
        String paidWithPaypal = request.getParameter("paidWithPaypal");
        
        if ((type != null && !type.equals("") && number != null && !number.equals("") && expiryMonth != null && !expiryMonth.equals("") && expiryYear != null && !expiryYear.equals("") && cvv != null && !cvv.equals("") && paidWithPaypal == null) || (paidWithPaypal != null && !paidWithPaypal.equals(""))) {
            
            boolean validCard = true;
            if (paidWithPaypal == null) {
                validCard = v.checkCard(type, number, expiryMonth, expiryYear, cvv);
            }
            
            if (validCard) {

                // Get number of passengers
                int numPassengers = 0;
                numPassengers = (Integer)session.getAttribute("numPassengers");

                // Get the logged in user
                User loggedInUser = (User) session.getAttribute("loggedInUser");

                if ((numPassengers > 0) && (numPassengers >= 10)) {

                    if (loggedInUser != null) {
                        
                        boolean seatsAvailable = true;
                        boolean User_FlightAdded = true;
                        boolean Checked_baggageAdded = true;
                        boolean seatsUpdated = true;

                        if (session.getAttribute("departureFlight0") != null && session.getAttribute("departureFlightCheckedBaggage0") != null && session.getAttribute("returnFlight0") != null && session.getAttribute("returnFlightCheckedBaggage0") != null) {

                            // Get the user flights to get the flights to check seat availablility
                            User_Flight ufCheckSeatsDeparture = (User_Flight) session.getAttribute("departureFlight0");
                            User_Flight ufCheckSeatsReturn = (User_Flight) session.getAttribute("returnFlight0");
                            Flight fCheckSeatsDeparture = fDao.getFlightById(ufCheckSeatsDeparture.getFlightId());
                            Flight fCheckSeatsReturn = fDao.getFlightById(ufCheckSeatsReturn.getFlightId());
                            
                            if (ufCheckSeatsDeparture.getTravelClass().equals("standard")) {
                                if (fCheckSeatsDeparture.getStandardSeatsAvailable() < numPassengers) {
                                    seatsAvailable = false;
                                }
                            } else if (ufCheckSeatsDeparture.getTravelClass().equals("business")) {
                                if (fCheckSeatsDeparture.getBusinessSeatsAvailable() < numPassengers) {
                                    seatsAvailable = false;
                                }
                            } else if (ufCheckSeatsDeparture.getTravelClass().equals("firstClass")) {
                                if (fCheckSeatsDeparture.getFirstClassSeatsAvailable() < numPassengers) {
                                    seatsAvailable = false;
                                }
                            }
                            
                            if (ufCheckSeatsReturn.getTravelClass().equals("standard")) {
                                if (fCheckSeatsReturn.getStandardSeatsAvailable() < numPassengers) {
                                    seatsAvailable = false;
                                }
                            } else if (ufCheckSeatsReturn.getTravelClass().equals("business")) {
                                if (fCheckSeatsReturn.getBusinessSeatsAvailable() < numPassengers) {
                                    seatsAvailable = false;
                                }
                            } else if (ufCheckSeatsReturn.getTravelClass().equals("firstClass")) {
                                if (fCheckSeatsReturn.getFirstClassSeatsAvailable() < numPassengers) {
                                    seatsAvailable = false;
                                }
                            }
                            
                            if (seatsAvailable) {
                                for (int i = 0; i < numPassengers; i++) {
                                    // Adding User_Flights
                                    User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight" + i);
                                    User_Flight returnFlight = (User_Flight) session.getAttribute("returnFlight" + i);

                                    // Set the userId incase it wasn't set before
                                    departureFlight.setUserId(loggedInUser.getUserId());
                                    returnFlight.setUserId(loggedInUser.getUserId());

                                    int newDepartureUser_FlightId = ufDao.addUser_Flight(departureFlight);
                                    int newReturnUser_FlightId = ufDao.addUser_Flight(returnFlight);

                                    // Adding Checked_baggage
                                    Checked_baggage departureFlightCheckedBaggage = (Checked_baggage) session.getAttribute("departureFlightCheckedBaggage" + i);
                                    Checked_baggage returnFlightCheckedBaggage = (Checked_baggage) session.getAttribute("returnFlightCheckedBaggage" + i);

                                    int newDepartureChecked_baggageId = -1;
                                    int newReturnChecked_baggageId = -1;
                                    if (departureFlightCheckedBaggage.getWeight() == 0) {
                                        newDepartureChecked_baggageId = 1;
                                        newReturnChecked_baggageId = 1;
                                    } else {
                                        if ((newDepartureUser_FlightId > -1) && (newReturnUser_FlightId > -1)) {
                                            // Adding the user_flight to checked_baggage
                                            departureFlightCheckedBaggage.setUser_flightId(newDepartureUser_FlightId);
                                            returnFlightCheckedBaggage.setUser_flightId(newReturnUser_FlightId);
                                            
                                            newDepartureChecked_baggageId = cbDao.addChecked_baggage(departureFlightCheckedBaggage);
                                            newReturnChecked_baggageId = cbDao.addChecked_baggage(returnFlightCheckedBaggage);
                                        } else {
                                            newDepartureChecked_baggageId = -1;
                                            newReturnChecked_baggageId = -1;
                                        }
                                    }

                                    // Incase of failure
                                    if ((newDepartureUser_FlightId < 0) || (newReturnUser_FlightId < 0)) {
                                        i = numPassengers;
                                        User_FlightAdded = false;
                                    } else if ((newDepartureChecked_baggageId < 0) || (newReturnChecked_baggageId < 0)) {
                                        i = numPassengers;
                                        Checked_baggageAdded = false;
                                    }
                                }

                                if (User_FlightAdded && Checked_baggageAdded) {
                                    User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight0");
                                    User_Flight returnFlight = (User_Flight) session.getAttribute("returnFlight0");

                                    int updateSeatsDeparture = -1;
                                    if (departureFlight.getTravelClass().equals("standard")) {
                                        updateSeatsDeparture = fDao.updateStandardSeats(departureFlight.getFlightId(), "standardSeatsAvailable", -numPassengers);
                                    } else if (departureFlight.getTravelClass().equals("business")) {
                                        updateSeatsDeparture = fDao.updateBusinessSeats(departureFlight.getFlightId(), "businessSeatsAvailable", -numPassengers);
                                    } else if (departureFlight.getTravelClass().equals("firstClass")) {
                                        updateSeatsDeparture = fDao.updateFirstClassSeats(departureFlight.getFlightId(), "firstClassSeatsAvailable", -numPassengers);
                                    }

                                    int updateSeatsReturn = -1;
                                    if (returnFlight.getTravelClass().equals("standard")) {
                                        updateSeatsReturn = fDao.updateStandardSeats(returnFlight.getFlightId(), "standardSeatsAvailable", -numPassengers);
                                    } else if (returnFlight.getTravelClass().equals("business")) {
                                        updateSeatsReturn = fDao.updateBusinessSeats(returnFlight.getFlightId(), "businessSeatsAvailable", -numPassengers);
                                    } else if (returnFlight.getTravelClass().equals("firstClass")) {
                                        updateSeatsReturn = fDao.updateFirstClassSeats(returnFlight.getFlightId(), "firstClassSeatsAvailable", -numPassengers);
                                    }

                                    if ((updateSeatsDeparture == -1) || (updateSeatsReturn == -1)) {
                                        seatsUpdated = false;
                                    }
                                }
                            }

                        } else if (session.getAttribute("departureFlight0") != null && session.getAttribute("departureFlightCheckedBaggage0") != null) {

                            // Get the user flights to get the flights to check seat availablility
                            User_Flight ufCheckSeatsDeparture = (User_Flight) session.getAttribute("departureFlight0");
                            Flight fCheckSeatsDeparture = fDao.getFlightById(ufCheckSeatsDeparture.getFlightId());
                            
                            if (ufCheckSeatsDeparture.getTravelClass().equals("standard")) {
                                if (fCheckSeatsDeparture.getStandardSeatsAvailable() < numPassengers) {
                                    seatsAvailable = false;
                                }
                            } else if (ufCheckSeatsDeparture.getTravelClass().equals("business")) {
                                if (fCheckSeatsDeparture.getBusinessSeatsAvailable() < numPassengers) {
                                    seatsAvailable = false;
                                }
                            } else if (ufCheckSeatsDeparture.getTravelClass().equals("firstClass")) {
                                if (fCheckSeatsDeparture.getFirstClassSeatsAvailable() < numPassengers) {
                                    seatsAvailable = false;
                                }
                            }
                            
                            if (seatsAvailable) {
                                for (int i = 0; i < numPassengers; i++) {
                                    // Adding User_Flights
                                    User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight" + i);

                                    // Set the userId incase it wasn't set before
                                    departureFlight.setUserId(loggedInUser.getUserId());

                                    int newDepartureUser_FlightId = ufDao.addUser_Flight(departureFlight);

                                    // Adding Checked_baggage
                                    Checked_baggage departureFlightCheckedBaggage = (Checked_baggage) session.getAttribute("departureFlightCheckedBaggage" + i);

                                    int newDepartureChecked_baggageId = -1;
                                    if (departureFlightCheckedBaggage.getWeight() == 0) {
                                        newDepartureChecked_baggageId = 1;
                                    } else {
                                        if (newDepartureUser_FlightId > -1) {
                                            // Adding the user_flight to checked_baggage
                                            departureFlightCheckedBaggage.setUser_flightId(newDepartureUser_FlightId);
                                            
                                            newDepartureChecked_baggageId = cbDao.addChecked_baggage(departureFlightCheckedBaggage);
                                        } else {
                                            newDepartureChecked_baggageId = -1;
                                        }
                                    }

                                    // Incase of failure
                                    if (newDepartureUser_FlightId < 0) {
                                        i = numPassengers;
                                        User_FlightAdded = false;
                                    } else if (newDepartureChecked_baggageId < 0) {
                                        i = numPassengers;
                                        Checked_baggageAdded = false;
                                    }
                                }

                                if (User_FlightAdded && Checked_baggageAdded) {
                                    User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight0");

                                    int updateSeatsDeparture = -1;
                                    if (departureFlight.getTravelClass().equals("standard")) {
                                        updateSeatsDeparture = fDao.updateStandardSeats(departureFlight.getFlightId(), "standardSeatsAvailable", -numPassengers);
                                    } else if (departureFlight.getTravelClass().equals("business")) {
                                        updateSeatsDeparture = fDao.updateBusinessSeats(departureFlight.getFlightId(), "businessSeatsAvailable", -numPassengers);
                                    } else if (departureFlight.getTravelClass().equals("firstClass")) {
                                        updateSeatsDeparture = fDao.updateFirstClassSeats(departureFlight.getFlightId(), "firstClassSeatsAvailable", -numPassengers);
                                    }

                                    if (updateSeatsDeparture == -1) {
                                        seatsUpdated = false;
                                    }
                                }
                            }

                        } else {
                            String errorMessage = "Invalid details";
                            session.setAttribute("errorMessage", errorMessage);
                            forwardToJsp = "error.jsp";
                        }

                        if (seatsAvailable == false) {
                            String errorMessage = "No seats available";
                            session.setAttribute("errorMessage", errorMessage);
                            forwardToJsp = "error.jsp";
                        } else if (User_FlightAdded == false) {
                            String errorMessage = "User_Flight not added";
                            session.setAttribute("errorMessage", errorMessage);
                            forwardToJsp = "error.jsp";
                        } else if (Checked_baggageAdded == false) {
                            String errorMessage = "Checked_baggage not added";
                            session.setAttribute("errorMessage", errorMessage);
                            forwardToJsp = "error.jsp";
                        } else if (seatsUpdated == false) {
                            String errorMessage = "Seats not updated";
                            session.setAttribute("errorMessage", errorMessage);
                            forwardToJsp = "error.jsp";
                        } else {
                            forwardToJsp = "bookingConfirmation.jsp";
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
