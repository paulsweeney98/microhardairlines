/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Dtos.User;
import Dtos.User_Flight;
import Validation.Validation;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 * 
 * The author of this class is Gerard Hoey
 */
public class AddPriorityBoardingCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;

        Validation v = new Validation();
        HttpSession session = request.getSession();

        int numPassengers = 0;
        numPassengers = (Integer) session.getAttribute("numPassengers");

        if (numPassengers > 0) {
            ArrayList<String> priorityBoarding = new ArrayList<String>();

            int amountOfNos = 0;

            for (int i = 0; i < numPassengers; i++) {
                if (request.getParameter("priorityBoarding" + i) != null && !request.getParameter("priorityBoarding" + i).equals("")) {
                    priorityBoarding.add(request.getParameter("priorityBoarding" + i));
                } else {
                    priorityBoarding.add("No");
                    amountOfNos++;
                }
            }

            if (amountOfNos != numPassengers) {

                User loggedInUser = (User) session.getAttribute("loggedInUser");
                User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight0");

                if (session.getAttribute("departureFlight0") != null) {

                    if (loggedInUser != null) {

                        for (int i = 0; i < numPassengers; i++) {
                            User_Flight departureFlightPriorityBoarding = new User_Flight();
                            if (priorityBoarding.get(i).equals("Yes")) {
                                departureFlightPriorityBoarding.setQueue("priority");
                            } else {
                                departureFlightPriorityBoarding.setQueue("non-priority");
                            }

//                            Checked_baggage departureFlightCheckedBaggage = new Checked_baggage(Double.parseDouble(checkedBaggage.get(i)), pricePaid, departureFlight.getId());
//                            
                            departureFlight = (User_Flight) session.getAttribute("departureFlight" + i);
                            
                            departureFlightPriorityBoarding.setId(departureFlight.getId());

                            session.setAttribute("departureFlightPriorityBoarding" + i, departureFlightPriorityBoarding);
                        }

                    } else {

//                        for (int i = 0; i < numPassengers; i++) {
//                            double pricePaid = -1;
//                            if (Double.parseDouble(checkedBaggage.get(i)) == 0) {
//                                pricePaid = 0;
//                            } else if (Double.parseDouble(checkedBaggage.get(i)) == 15) {
//                                pricePaid = 20;
//                            } else if (Double.parseDouble(checkedBaggage.get(i)) == 20) {
//                                pricePaid = 25;
//                            } else if (Double.parseDouble(checkedBaggage.get(i)) == 25) {
//                                pricePaid = 30;
//                            } else if (Double.parseDouble(checkedBaggage.get(i)) == 40) {
//                                pricePaid = 65;
//                            }
//                            Checked_baggage departureFlightCheckedBaggage = new Checked_baggage(Double.parseDouble(checkedBaggage.get(i)), pricePaid, departureFlight.getId());
//                            
//                            session.setAttribute("departureFlightCheckedBaggage" + i, departureFlightCheckedBaggage);
//                        }
                    }

                    forwardToJsp = "payPriorityBoarding.jsp";

                } else {
                    String errorMessage = "Flights not found";
                    session.setAttribute("errorMessage", errorMessage);
                    forwardToJsp = "error.jsp";
                }

            } else {
                String errorMessage = "You have not selected Priority Boarding for any passenger";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }

        } else {
            String errorMessage = "You must book for at least one passenger";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }

        return forwardToJsp;
    }

}
