/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

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
 * @author pauls
 */
public class StoreCheckedBaggageCommand implements Command {
    
    //@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        
        Validation v = new Validation();
        HttpSession session = request.getSession();
        
        int numPassengers = 0;
        numPassengers = (Integer)session.getAttribute("numPassengers");

        if ((numPassengers > 0) && (numPassengers <= 10)) {
            ArrayList<String> checkedBaggage = new ArrayList<String>();

            boolean detailsValid = true;
            for (int i = 0; i < numPassengers; i++) {
                if (request.getParameter("weight" + i) != null && !request.getParameter("weight" + i).equals("")) {
                    checkedBaggage.add(request.getParameter("weight" + i));
                } else {
                    detailsValid = false;
                }
            }

            if (detailsValid) {
                
                User loggedInUser = (User) session.getAttribute("loggedInUser");
                User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight0");
                
                if (session.getAttribute("departureFlight0") != null && session.getAttribute("returnFlight0") != null) {
                    
                    for (int i = 0; i < numPassengers; i++) {
                        double pricePaid = -1;
                        if (Double.parseDouble(checkedBaggage.get(i)) == 0) {
                            pricePaid = 0;
                        } else if (Double.parseDouble(checkedBaggage.get(i)) == 15) {
                            pricePaid = 20;
                        } else if (Double.parseDouble(checkedBaggage.get(i)) == 20) {
                            pricePaid = 25;
                        } else if (Double.parseDouble(checkedBaggage.get(i)) == 25) {
                            pricePaid = 30;
                        } else if (Double.parseDouble(checkedBaggage.get(i)) == 40) {
                            pricePaid = 65;
                        }

                        Checked_baggage departureFlightCheckedBaggage = new Checked_baggage(Double.parseDouble(checkedBaggage.get(i)), pricePaid, departureFlight.getId());
                        Checked_baggage returnFlightCheckedBaggage = new Checked_baggage(Double.parseDouble(checkedBaggage.get(i)), pricePaid, departureFlight.getId());

                        session.setAttribute("departureFlightCheckedBaggage" + i, departureFlightCheckedBaggage);
                        session.setAttribute("returnFlightCheckedBaggage" + i, returnFlightCheckedBaggage);
                    }
                    
                    forwardToJsp = "paymentDetails.jsp";
                    
                } else if (session.getAttribute("departureFlight0") != null) {
                    
                    for (int i = 0; i < numPassengers; i++) {
                        double pricePaid = -1;
                        if (Double.parseDouble(checkedBaggage.get(i)) == 0) {
                            pricePaid = 0;
                        } else if (Double.parseDouble(checkedBaggage.get(i)) == 15) {
                            pricePaid = 20;
                        } else if (Double.parseDouble(checkedBaggage.get(i)) == 20) {
                            pricePaid = 25;
                        } else if (Double.parseDouble(checkedBaggage.get(i)) == 25) {
                            pricePaid = 30;
                        } else if (Double.parseDouble(checkedBaggage.get(i)) == 40) {
                            pricePaid = 65;
                        }

                        Checked_baggage departureFlightCheckedBaggage = new Checked_baggage(Double.parseDouble(checkedBaggage.get(i)), pricePaid, departureFlight.getId());

                        session.setAttribute("departureFlightCheckedBaggage" + i, departureFlightCheckedBaggage);
                    }
                    
                    forwardToJsp = "paymentDetails.jsp";
                    
                } else {
                    String errorMessage = "Flights not found";
                    session.setAttribute("errorMessage", errorMessage);
                    forwardToJsp = "error.jsp";
                }

            } else {
                String errorMessage = "Invalid checked baggage";
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
