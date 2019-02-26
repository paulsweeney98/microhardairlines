/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Checked_baggageDao;
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
 * @author D00191889
 */
public class CancelFlightCommand implements Command {
    
    //@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        Validation v = new Validation();
        User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
        Checked_baggageDao cbDao = new Checked_baggageDao(Dao.getDatabaseName());
        
        int flightId = v.convertStringToInt(request.getParameter("flightId"));
        int userId = v.convertStringToInt(request.getParameter("userId"));
        
        // Refund to be given
        double refund = 0;
        
        if (flightId > -1 && userId > -1) {
            
            ArrayList<User_Flight> user_flights = ufDao.getUser_FlightsByFlightIdUserId(flightId, userId);
            if (user_flights != null && !user_flights.isEmpty()) {
                
                for (User_Flight user_flight : user_flights) {
                    
                    if (user_flight.getTravelClass().equals("standard") || user_flight.getTravelClass().equals("business")) {
                        
                    } else if (user_flight.getTravelClass().equals("firstClass")) {
                        
//                        cbDao.getChecked_baggageByUserIdAndFlightId(userId, flightId);
                        refund += user_flight.getPricePaid();
                    }
                    
                }
                
            } else {
                
            }
            
        } else {
            
        }
        
        return forwardToJsp;
    }
    
}
