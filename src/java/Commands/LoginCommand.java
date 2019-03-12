/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Dao;
import Daos.UserDao;
import Dtos.User;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 * 
 * The author of this class is Dean Farrelly
 */
public class LoginCommand implements Command{

    //@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        
        // Get the username and password information that the user
        // entered into the form on the previous page
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        
        // If user logged in during booking they will be sent back to their page
        String booking = request.getParameter("booking");
        
        if(email != null && password != null && !email.equals("") && !password.equals(""))
        {
            UserDao uDao = new UserDao(Dao.getDatabaseName());
            User u = uDao.getCurrentUser(email, password);
            // If a user was found, then there is a user with this username and password
            // so we can log them in
            if(u != null){
                // Store cookie to store email if user opts in
                if (rememberMe != null) {
                    Cookie emailStored = new Cookie("emailStored", email);
                    response.addCookie(emailStored);
                }
                
                // Remove error message from previous potential failed login attempts
                HttpSession session = request.getSession();
                session.removeAttribute("errorMessage");
                
                // Put the user in the session 
                // (we can use this to track if the user has logged in -
                // if it's there, then they have completed this process
                // if it's not, then they haven't)
                session.setAttribute("loggedInUser", u);
                if (u.getPrivileges() == 1) {
                    if (booking != null) {
                        forwardToJsp = "paymentDetails.jsp";
                    } else {
                        forwardToJsp = "index.jsp";
                    }
                } else if (u.getPrivileges() == 2) {
                    forwardToJsp = "adminIndex.jsp";
                } else {
                    forwardToJsp = "error.jsp";
                }
            }
            else{
                HttpSession session = request.getSession();
                // The username and/or password didn't match someone in the database
                // Send the user to the error page and inform them of this
                String errorMessage = "No user found matching those details."
                        + " Please try again.";
                session.setAttribute("errorMessage", errorMessage);
                if (booking != null) {
                    forwardToJsp = "login.jsp?booking=" + booking;
                } else {
                    forwardToJsp = "login.jsp";
                }
            }
        }
        else{
            // The username and/or password was missing
            // Send the user to the error page and inform them of this
            String errorMessage = "Your username and/or password was missing. Please try again.";
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "login.jsp";
        }
        return forwardToJsp;
    }
    
}
