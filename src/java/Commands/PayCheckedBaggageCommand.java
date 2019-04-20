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
import Validation.Validation;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 *
 * The author of this class is Gerard Hoey
 */
public class PayCheckedBaggageCommand implements Command {

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
                numPassengers = (Integer) session.getAttribute("numPassengers");

                // Get the logged in user
                User loggedInUser = (User) session.getAttribute("loggedInUser");

                if ((numPassengers > 0) && (numPassengers <= 10)) {

                    if (loggedInUser != null) {

                        boolean Checked_baggageAdded = true;

                        if (session.getAttribute("departureFlight0") != null && session.getAttribute("departureFlightCheckedBaggage0") != null) {

                            for (int i = 0; i < numPassengers; i++) {
                                // Adding Checked_baggage
                                Checked_baggage departureFlightCheckedBaggage = (Checked_baggage) session.getAttribute("departureFlightCheckedBaggage" + i);

                                int newDepartureChecked_baggageId = -1;
                                if (departureFlightCheckedBaggage.getWeight() == 0) {
                                    newDepartureChecked_baggageId = 1;
                                } else {
                                    newDepartureChecked_baggageId = cbDao.addChecked_baggage(departureFlightCheckedBaggage);
                                }

                                // Incase of failure
                                if (newDepartureChecked_baggageId < 0) {
                                    i = numPassengers;
                                    Checked_baggageAdded = false;
                                }
                            }

                        } else {
                            String errorMessage = "Invalid details";
                            session.setAttribute("errorMessage", errorMessage);
                            forwardToJsp = "error.jsp";
                        }

                        if (Checked_baggageAdded == false) {
                            String errorMessage = "Checked_baggage not added";
                            session.setAttribute("errorMessage", errorMessage);
                            forwardToJsp = "error.jsp";
                        } else {
                            forwardToJsp = "index.jsp";

                            // Remove all attributes for flights from session before searching for a new one
                            session.removeAttribute("numPassengers");
                            session.removeAttribute("departureFlight");
                            for (int i = 0; i <= 10; i++) {
                                session.removeAttribute("departureFlight" + i);
                                session.removeAttribute("departureFlightCheckedBaggage" + i);
                            }
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
