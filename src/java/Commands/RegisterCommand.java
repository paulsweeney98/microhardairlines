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
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 * 
 * The author of this class is Dean Farrelly
 */
public class RegisterCommand implements Command{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dateOfBirthString = request.getParameter("dateOfBirth");
        java.sql.Date dateOfBirth = java.sql.Date.valueOf(dateOfBirthString);
        String phoneNumber = request.getParameter("phoneNumber");
        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String cityOrTown = request.getParameter("cityOrTown");
        String postalCode = request.getParameter("postalCode");
        String county = request.getParameter("county");
        String country = request.getParameter("country");
        
        // If user registered during booking they will be sent back to their page
        String booking = request.getParameter("booking");
        
        
        if(email != null && !email.equals("") && password != null && !password.equals("") && confirmPassword != null && !confirmPassword.equals("") && firstName != null && !firstName.equals("") && lastName != null && !lastName.equals("") && dateOfBirth != null && !dateOfBirth.equals("") && phoneNumber != null && !phoneNumber.equals("") && addressLine1 != null && !addressLine1.equals("") && addressLine2 != null && !addressLine2.equals("") && cityOrTown != null && !cityOrTown.equals("") && postalCode != null && !postalCode.equals("") && county != null && !county.equals("") && country != null && !country.equals("")){
            Validation v = new Validation();
            boolean validDate = v.checkDate(dateOfBirth);
            
            if (validDate) {
                UserDao uDao = new UserDao(Dao.getDatabaseName());
                if(password.equals(confirmPassword)){
                    User u = uDao.getUserByEmail(email);
                    if(u.getUserId() == -1) {
                        User addUser = new User(email, password, firstName, lastName, (java.sql.Date) dateOfBirth, phoneNumber, addressLine1, addressLine2, cityOrTown, postalCode, county, country,  User.STANDARD, User.ENABLED);
                        int newId = uDao.addUser(addUser);
                            if(newId != -1){
                                // Registration was successful, log the user in!
                                User u1 = uDao.getCurrentUser(email, password);

                                HttpSession session = request.getSession();
                                session.setAttribute("loggedInUser", u1);

                                if (booking != null) {
                                    forwardToJsp = "paymentDetails.jsp";
                                } else {
                                    forwardToJsp = "securityQuestions.jsp";
                                }
                    } else{
                        // The user couldn't be added to the database
                        // Send the user to the error page and inform them of this
                        String errorMessage = "User couldn't be added to the database at this time"
                                + " Please <a href='register.jsp'>go back</a> and try again.<br/>Try a different email!";
                        HttpSession session = request.getSession();
                        session.setAttribute("errorMessage", errorMessage);
                        if (booking != null) {
                            forwardToJsp = "register.jsp?booking=" + booking;
                        } else {
                            forwardToJsp = "register.jsp";
                        }
                    }         
                    } else {
                        String errorMessage = "Email already taken"
                                + " Please <a href='register.jsp'>go back</a> and try again.<br/>Try a different email!";
                        HttpSession session = request.getSession();
                        session.setAttribute("errorMessage", errorMessage);
                        if (booking != null) {
                            forwardToJsp = "register.jsp?booking=" + booking;
                        } else {
                            forwardToJsp = "register.jsp";
                        }
                    }
                } else {
                    String errorMessage = "Passwords did not match"
                                + " Please <a href='register.jsp'>go back</a> and try again.<br/>Try confirming password again!";
                        HttpSession session = request.getSession();
                        session.setAttribute("errorMessage", errorMessage);
                        if (booking != null) {
                            forwardToJsp = "register.jsp?booking=" + booking;
                        } else {
                            forwardToJsp = "register.jsp";
                        }
                }
            } else {
                    // The user couldn't be added to the database
                        // Send the user to the error page and inform them of this
                        String errorMessage = "User couldn't be added to the database at this time"
                                + " Please <a href='register.jsp'>go back</a> and try again.<br/>Problem with date of birth!";
                        HttpSession session = request.getSession();
                        session.setAttribute("errorMessage", errorMessage);
                        if (booking != null) {
                            forwardToJsp = "register.jsp?booking=" + booking;
                        } else {
                            forwardToJsp = "register.jsp";
                        }
                }
            }else{
                // One or more fields were missing
                // Send the user to the error page and inform them of this
                String errorMessage = "One or more fields were missing. Please <a href='register.jsp'>go back</a> and try again.";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "register.jsp";
            }
            return forwardToJsp;
        }
        
    }
    
    

    


