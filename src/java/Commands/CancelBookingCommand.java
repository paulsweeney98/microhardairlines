/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author D00191889
 */
public class CancelBookingCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "index.jsp";
        HttpSession session = request.getSession();
        
        // Remove all attributes for flights from session before searching for a new one
        session.removeAttribute("numPassengers");
        session.removeAttribute("departureFlight");
        session.removeAttribute("returnFlight");
        for (int i = 0; i <= 10; i++) {
            session.removeAttribute("departureFlight" + i);
            session.removeAttribute("returnFlight" + i);
            session.removeAttribute("departureFlightCheckedBaggage" + i);
            session.removeAttribute("returnFlightCheckedBaggage" + i);
        }
        
        return forwardToJsp;
    }
    
}
