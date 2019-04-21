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
 * @author Paul Sweeney
 */
public class VerifyWhatsAppCodeCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        UserDao uDao = new UserDao(Dao.getDatabaseName());
        
        String userEnteredCode = request.getParameter("userEnteredCode");
        String code = request.getParameter("code");
        
        if (userEnteredCode != null && !userEnteredCode.equals("") && code != null && !code.equals("")) {
            
            if (userEnteredCode.equals(code)) {
                // Unset error message
                session.removeAttribute("errorMessage");
                
                // Log user in and send them straight to change password page
                User verifyUser = (User) session.getAttribute("verifyUser");
                session.setAttribute("loggedInUser", verifyUser);
                forwardToJsp = "changePassword.jsp";
            } else {
                String errorMessage = "Code entered does not match, please try again.";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "whatsapp.jsp";
            }
            
        } else {
            String errorMessage = "User entered code and actual code not found.";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        
        return forwardToJsp;
    }
    
}
