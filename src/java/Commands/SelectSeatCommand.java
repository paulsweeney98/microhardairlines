/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Dao;
import Daos.User_FlightDao;
import Validation.Validation;
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
        
        String seatsBookedJSON = request.getParameter("seatsBookedJSON");
        
        if (seatsBookedJSON != null && !seatsBookedJSON.equals("")) {
            seatsBookedJSON.substring(0, seatsBookedJSON.length() - 1);
            String [] seatsBooked = seatsBookedJSON.split("%%");
            
            boolean validSeats = true;
            boolean seatsAdded = true;
            for (String seat : seatsBooked) {
                if (seat != null && (seat.length() == 2 || seat.length() == 3)) {
                    int seatNumber = v.convertStringToInt(seat.substring(0, seat.length()-1)+"");
                    if (seatNumber != -1) {
                        if (seatNumber <= 15) {
                            int added = ufDao.updateSeat(3, seat, "front");
                            if (added < 1) {
                                seatsAdded = false;
                            }
                        } else {
                            int added = ufDao.updateSeat(3, seat, "back");
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
            String errorMessage = "You must select a seat";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        
        return forwardToJsp;
    }
    
}
