/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Dao;
import Daos.UserDao;
import Dtos.User;
import Validation.Validation;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dean Farrelly
 */
public class EditAccountDetailsCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        Validation v = new Validation();

        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String cityOrTown = request.getParameter("cityOrTown");
        String postalCode = request.getParameter("postalCode");
        String county = request.getParameter("county");
        String country = request.getParameter("country");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String userIdString = request.getParameter("userId");

        int userId = v.convertStringToInt(userIdString);

        if (userId > 0) {
            if (email != null && !email.equals("")) {
                // Check email is valid
                boolean validEmail = v.checkEmail(email);
                if (validEmail) {
                    // Check if email is taken
                    UserDao uDao = new UserDao(Dao.getDatabaseName());
                    User user = uDao.getUserByEmail(email);

                    if (user.getUserId() == -1) {
                        int results = uDao.updateUserEmail(userId, email);

                        if (results > 0) {
                            // Set the page to be viewed to the results page
                            forwardToJsp = "editAccountDetails.jsp";
                        } else {
                            // Set the page to be viewed to the error page
                            forwardToJsp = "error.jsp";
                            // Get the session so we can add information to it
                            HttpSession session = request.getSession();

                            // Add an error message to the session to be displayed on the error page
                            // This lets us inform the user about what went wrong
                            session.setAttribute("errorMessage", "Error updating email address.");
                        }
                    } else {
                        // Set the page to be viewed to the error page
                        forwardToJsp = "error.jsp";
                        // Get the session so we can add information to it
                        HttpSession session = request.getSession();

                        // Add an error message to the session to be displayed on the error page
                        // This lets us inform the user about what went wrong
                        session.setAttribute("errorMessage", "Email already taken.");
                    }
                } else {
                    // Set the page to be viewed to the error page
                    forwardToJsp = "error.jsp";
                    // Get the session so we can add information to it
                    HttpSession session = request.getSession();

                    // Add an error message to the session to be displayed on the error page
                    // This lets us inform the user about what went wrong
                    session.setAttribute("errorMessage", "Invalid email.");
                }
            } else if (phoneNumber != null && !phoneNumber.equals("")) {
                // Call on DAO method to update the amount
                UserDao uDao = new UserDao(Dao.getDatabaseName());
                User user = uDao.getUserById(userId);
                int results = uDao.updateUserPhone(user, phoneNumber);

                if (results > 0) {
                    // Set the page to be viewed to the results page
                    forwardToJsp = "editAccountDetails.jsp";
                } else {
                    // Set the page to be viewed to the error page
                    forwardToJsp = "error.jsp";
                    // Get the session so we can add information to it
                    HttpSession session = request.getSession();

                    // Add an error message to the session to be displayed on the error page
                    // This lets us inform the user about what went wrong
                    session.setAttribute("errorMessage", "user table was unsuccessfully updated.");
                }
            } else if (addressLine1 != null && !addressLine1.equals("")) {
                // Call on DAO method to update the amount
                UserDao uDao = new UserDao(Dao.getDatabaseName());
                User user = uDao.getUserById(userId);
                int results = uDao.updateUserAddressLine1(user, addressLine1);

                if (results > 0) {
                    // Set the page to be viewed to the results page
                    forwardToJsp = "editAccountDetails.jsp";
                } else {
                    // Set the page to be viewed to the error page
                    forwardToJsp = "error.jsp";
                    // Get the session so we can add information to it
                    HttpSession session = request.getSession();

                    // Add an error message to the session to be displayed on the error page
                    // This lets us inform the user about what went wrong
                    session.setAttribute("errorMessage", "user table was unsuccessfully updated.");
                }

            } else if (addressLine2 != null && !addressLine2.equals("")) {
                // Call on DAO method to update the amount
                UserDao uDao = new UserDao(Dao.getDatabaseName());
                User user = uDao.getUserById(userId);
                int results = uDao.updateUserAddressLine2(user, addressLine2);

                if (results > 0) {
                    // Set the page to be viewed to the results page
                    forwardToJsp = "editAccountDetails.jsp";
                } else {
                    // Set the page to be viewed to the error page
                    forwardToJsp = "error.jsp";
                    // Get the session so we can add information to it
                    HttpSession session = request.getSession();

                    // Add an error message to the session to be displayed on the error page
                    // This lets us inform the user about what went wrong
                    session.setAttribute("errorMessage", "user table was unsuccessfully updated.");
                }

            } else if (cityOrTown != null && !cityOrTown.equals("")) {
                // Call on DAO method to update the amount
                UserDao uDao = new UserDao(Dao.getDatabaseName());
                User user = uDao.getUserById(userId);
                int results = uDao.updateCityOrTown(user, cityOrTown);

                if (results > 0) {
                    // Set the page to be viewed to the results page
                    forwardToJsp = "editAccountDetails.jsp";
                } else {
                    // Set the page to be viewed to the error page
                    forwardToJsp = "error.jsp";
                    // Get the session so we can add information to it
                    HttpSession session = request.getSession();

                    // Add an error message to the session to be displayed on the error page
                    // This lets us inform the user about what went wrong
                    session.setAttribute("errorMessage", "user table was unsuccessfully updated.");
                }

            } else if (postalCode != null && !postalCode.equals("")) {
                // Call on DAO method to update the amount
                UserDao uDao = new UserDao(Dao.getDatabaseName());
                User user = uDao.getUserById(userId);
                int results = uDao.updatePostalCode(user, postalCode);

                if (results > 0) {
                    // Set the page to be viewed to the results page
                    forwardToJsp = "editAccountDetails.jsp";
                } else {
                    // Set the page to be viewed to the error page
                    forwardToJsp = "error.jsp";
                    // Get the session so we can add information to it
                    HttpSession session = request.getSession();

                    // Add an error message to the session to be displayed on the error page
                    // This lets us inform the user about what went wrong
                    session.setAttribute("errorMessage", "user table was unsuccessfully updated.");
                }

            } else if (county != null && !county.equals("")) {
                // Call on DAO method to update the amount
                UserDao uDao = new UserDao(Dao.getDatabaseName());
                User user = uDao.getUserById(userId);
                int results = uDao.updateCounty(user, county);

                if (results > 0) {
                    // Set the page to be viewed to the results page
                    forwardToJsp = "editAccountDetails.jsp";
                } else {
                    // Set the page to be viewed to the error page
                    forwardToJsp = "error.jsp";
                    // Get the session so we can add information to it
                    HttpSession session = request.getSession();

                    // Add an error message to the session to be displayed on the error page
                    // This lets us inform the user about what went wrong
                    session.setAttribute("errorMessage", "user table was unsuccessfully updated.");
                }

            } else if (country != null && !country.equals("")) {
                // Call on DAO method to update the amount
                UserDao uDao = new UserDao(Dao.getDatabaseName());
                User user = uDao.getUserById(userId);
                int results = uDao.updateCountry(user, country);

                if (results > 0) {
                    // Set the page to be viewed to the results page
                    forwardToJsp = "editAccountDetails.jsp";
                } else {
                    // Set the page to be viewed to the error page
                    forwardToJsp = "error.jsp";
                    // Get the session so we can add information to it
                    HttpSession session = request.getSession();

                    // Add an error message to the session to be displayed on the error page
                    // This lets us inform the user about what went wrong
                    session.setAttribute("errorMessage", "user table was unsuccessfully updated.");
                }

            } else if (firstName != null && !firstName.equals("")) {
                // Call on DAO method to update the amount
                UserDao uDao = new UserDao(Dao.getDatabaseName());
                User user = uDao.getUserById(userId);
                int results = uDao.updateFirstName(user, firstName);

                if (results > 0) {
                    // Set the page to be viewed to the results page
                    forwardToJsp = "editAccountDetails.jsp";
                } else {
                    // Set the page to be viewed to the error page
                    forwardToJsp = "error.jsp";
                    // Get the session so we can add information to it
                    HttpSession session = request.getSession();

                    // Add an error message to the session to be displayed on the error page
                    // This lets us inform the user about what went wrong
                    session.setAttribute("errorMessage", "user table was unsuccessfully updated.");
                }

            } else if (lastName != null && !lastName.equals("")) {
                // Call on DAO method to update the amount
                UserDao uDao = new UserDao(Dao.getDatabaseName());
                User user = uDao.getUserById(userId);
                int results = uDao.updateLastName(user, lastName);

                if (results > 0) {
                    // Set the page to be viewed to the results page
                    forwardToJsp = "editAccountDetails.jsp";
                } else {
                    // Set the page to be viewed to the error page
                    forwardToJsp = "error.jsp";
                    // Get the session so we can add information to it
                    HttpSession session = request.getSession();

                    // Add an error message to the session to be displayed on the error page
                    // This lets us inform the user about what went wrong
                    session.setAttribute("errorMessage", "user table was unsuccessfully updated.");
                }

            } else {
                // Set the page to be viewed to the error page
                forwardToJsp = "error.jsp";
                // Get the session so we can add information to it
                HttpSession session = request.getSession();

                // Add an error message to the session to be displayed on the error page
                // This lets us inform the user about what went wrong
                session.setAttribute("errorMessage", "A parameter value required for updating was missing");
            }
        } else {
            // Set the page to be viewed to the error page
            forwardToJsp = "error.jsp";
            // Get the session so we can add information to it
            HttpSession session = request.getSession();
            // Add an error message to the session to be displayed on the error page
            // This lets us inform the user about what went wrong
            session.setAttribute("errorMessage", "Text was supplied for the user id.");
        }
        return forwardToJsp;
    }

}
