/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Dao;
import Daos.UserDao;
import Dtos.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dean Farrelly
 */
public class ChangePasswordCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;

        //HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (email != null && password != null && !email.equals("") && !password.equals("")) {
            UserDao uDao = new UserDao(Dao.getDatabaseName());
            User u = uDao.getCurrentUser(email, password);

            if (newPassword.equals(confirmPassword)) {
                if (u.getUserId() != -1) {
                    int results = uDao.updateUserPassword(u, newPassword);

                    if (results > 0) {
                        // Set the page to be viewed to the results page
                        forwardToJsp = "index.jsp";
                    } else {
                        // Set the page to be viewed to the error page
                        forwardToJsp = "error.jsp";
                        // Get the session so we can add information to it
                        HttpSession session = request.getSession();

                        // Add an error message to the session to be displayed on the error page
                        // This lets us inform the user about what went wrong
                        session.setAttribute("errorMessage", "Failed to update password.");
                    }
                } else {
                    // Set the page to be viewed to the error page
                    forwardToJsp = "error.jsp";
                    // Get the session so we can add information to it
                    HttpSession session = request.getSession();

                    // Add an error message to the session to be displayed on the error page
                    // This lets us inform the user about what went wrong
                    session.setAttribute("errorMessage", "Invalid Details.");
                }
            } else {
                // Set the page to be viewed to the error page
                forwardToJsp = "error.jsp";
                // Get the session so we can add information to it
                HttpSession session = request.getSession();

                // Add an error message to the session to be displayed on the error page
                // This lets us inform the user about what went wrong
                session.setAttribute("errorMessage", "New password and confirm password did not match.");
            }
        } else {
            // Set the page to be viewed to the error page
            forwardToJsp = "error.jsp";
            // Get the session so we can add information to it
            HttpSession session = request.getSession();

            // Add an error message to the session to be displayed on the error page
            // This lets us inform the user about what went wrong
            session.setAttribute("errorMessage", "Invalid input.");
        }
        return forwardToJsp;
    }
}
