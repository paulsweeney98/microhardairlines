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
public class CancelFlightCommand implements Command {
    
    //@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        Validation v = new Validation();
        FlightDao fDao = new FlightDao(Dao.getDatabaseName());
        User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
        Checked_baggageDao cbDao = new Checked_baggageDao(Dao.getDatabaseName());
        
        int flightId = v.convertStringToInt(request.getParameter("flightId"));
        int userId = v.convertStringToInt(request.getParameter("userId"));
        
        boolean canceled = true;
        boolean baggageUpdated = true;
        boolean seatsUpdated = true;
        boolean checkedSeatsUpdated = true;
        
        // Refund to be given
        double refund = 0;
        
        if (flightId > -1 && userId > -1) {
            
            ArrayList<User_Flight> user_flights = ufDao.getUser_FlightsByFlightIdUserId(flightId, userId);
            if (user_flights != null && !user_flights.isEmpty()) {
                
                for (User_Flight user_flight : user_flights) {
                    
                    if (user_flight.getTravelClass().equals("standard")) {
                        ArrayList<Checked_baggage> checked_baggage = cbDao.getChecked_baggageByUser_flightId(user_flight.getId());
                        for (Checked_baggage cBag : checked_baggage) {
                            // Remove this checked_baggage
                            int removed = cbDao.removeChecked_baggage(cBag.getId());
                            if (removed == 0) {
                                baggageUpdated = false;
                            }
                        }
                        
                        if (baggageUpdated) {
                            // Remove this user_flight
                            int removed = ufDao.removeUser_Flight(user_flight.getId());
                            if (removed == 0) {
                                canceled = false;
                            }

                            if (canceled) {
                                // Update the seats available
                                int updated = fDao.updateStandardSeats(flightId, "standard", -1);
                                if (updated == 0) {
                                    seatsUpdated = false;
                                }
                            }
                        }
                    } else if (user_flight.getTravelClass().equals("business")) {
                        ArrayList<Checked_baggage> checked_baggage = cbDao.getChecked_baggageByUser_flightId(user_flight.getId());
                        for (Checked_baggage cBag : checked_baggage) {
                            // Remove this checked_baggage
                            int removed = cbDao.removeChecked_baggage(cBag.getId());
                            if (removed == 0) {
                                baggageUpdated = false;
                            }
                        }
                        
                        if (baggageUpdated) {
                            // Remove this user_flight
                            int removed = ufDao.removeUser_Flight(user_flight.getId());
                            if (removed == 0) {
                                canceled = false;
                            }

                            if (canceled) {
                                // Update the seats available
                                int updated = fDao.updateStandardSeats(flightId, "business", -1);
                                if (updated == 0) {
                                    seatsUpdated = false;
                                }
                            }
                        }
                    } else if (user_flight.getTravelClass().equals("firstClass")) {
                        ArrayList<Checked_baggage> checked_baggage = cbDao.getChecked_baggageByUser_flightId(user_flight.getId());
                        for (Checked_baggage cBag : checked_baggage) {
                            refund += cBag.getPricePaid();
                            // Remove this checked_baggage
                            int removed = cbDao.removeChecked_baggage(cBag.getId());
                            if (removed == 0) {
                                baggageUpdated = false;
                            }
                        }
                        
                        if (baggageUpdated) {
                            refund += user_flight.getPricePaid();
                            
                            // Remove this user_flight
                            int removed = ufDao.removeUser_Flight(user_flight.getId());
                            if (removed == 0) {
                                canceled = false;
                            }

                            if (canceled) {
                                // Update the seats available
                                int updated = fDao.updateStandardSeats(flightId, "firstClass", -1);
                                if (updated == 0) {
                                    seatsUpdated = false;
                                }
                            }
                        }
                    }
                    
                }
                
                if (canceled == false) {
                    String errorMessage = "Flight(s) unsuccessfully canceled.";
                    session.setAttribute("errorMessage", errorMessage);
                    forwardToJsp = "error.jsp";
                } else if (baggageUpdated == false) {
                    String errorMessage = "Checked baggage unsuccessfully removed.";
                    session.setAttribute("errorMessage", errorMessage);
                    forwardToJsp = "error.jsp";
                } else if (seatsUpdated == false) {
                    String errorMessage = "Problem with updating the seats.";
                    session.setAttribute("errorMessage", errorMessage);
                    forwardToJsp = "error.jsp";
                } else {
                    String message = "Flight(s) successfully canceled. You will be refunded " + refund;
                    session.setAttribute("message", message);
                    forwardToJsp = "upcomingTrips.jsp";
                }
                
            } else {
                String errorMessage = "You have not booked any tickets for this flight.";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
            
        } else {
            String errorMessage = "Invalid flight or user.";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        
        return forwardToJsp;
    }
    
}
