/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Dao;
import Daos.User_FlightDao;
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
public class SelectSeatCommand implements Command {

    //@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
        Validation v = new Validation();
        
        ArrayList<User_Flight> user_flights = (ArrayList<User_Flight>) session.getAttribute("user_flights");
        if (user_flights != null && !user_flights.isEmpty()) {
        
            String seatsBookedJSON = request.getParameter("seatsBookedJSON");

            if (seatsBookedJSON != null && !seatsBookedJSON.equals("")) {
                seatsBookedJSON.substring(0, seatsBookedJSON.length() - 1);
                String [] seatsBooked = seatsBookedJSON.split("%%");

                if (user_flights.size() == seatsBooked.length) {

                    boolean validSeats = true;
                    boolean seatsAdded = true;
                    for (int i = 0; i < user_flights.size(); i++) {
                        if (seatsBooked[i] != null && (seatsBooked[i].length() == 2 || seatsBooked[i].length() == 3)) {
                            int seatNumber = v.convertStringToInt(seatsBooked[i].substring(0, seatsBooked[i].length()-1)+"");
                            if (seatNumber != -1) {
                                if (seatNumber <= 15) {
                                    int added = ufDao.updateSeat(user_flights.get(i).getId(), seatsBooked[i], "front");
                                    if (added < 1) {
                                        seatsAdded = false;
                                    }
                                } else {
                                    int added = ufDao.updateSeat(user_flights.get(i).getId(), seatsBooked[i], "back");
                                    if (added < 1) {
                                        seatsAdded = false;
                                    }
                                }
                            } else {
                                validSeats = false;
                            }
                        } else {
                            validSeats = false;
                        }
                    }

                    if (validSeats && seatsAdded) {
                        forwardToJsp = "index.jsp";
                    } else {
                        String errorMessage = "Invalid seat(s)";
                        session.setAttribute("errorMessage", errorMessage);
                        forwardToJsp = "error.jsp";
                    }
                } else {
                    String errorMessage = "Please select the correct amount of seats";
                    session.setAttribute("errorMessage", errorMessage);
                    if (user_flights.get(0).getTravelClass().equals("standard")) {
                        forwardToJsp = "seatSelectionStandard.jsp?flightId=" + user_flights.get(0).getFlightId();
                    } else if (user_flights.get(0).getTravelClass().equals("business")) {
                        forwardToJsp = "seatSelectionBusiness.jsp?flightId=" + user_flights.get(0).getFlightId();
                    } else if (user_flights.get(0).getTravelClass().equals("firstClass")) {
                        forwardToJsp = "seatSelectionFirstClass.jsp?flightId=" + user_flights.get(0).getFlightId();
                    } else {
                        forwardToJsp = "error.jsp";
                    }
                }
            } else {
                String errorMessage = "You must select a seat";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            String errorMessage = "Invalid users for flight";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        
        return forwardToJsp;
    }
    
}
