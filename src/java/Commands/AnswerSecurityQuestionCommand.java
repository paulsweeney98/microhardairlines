/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Dao;
import Daos.UserDao;
import Daos.User_Security_QuestionDao;
import Dtos.User;
import Dtos.User_Security_Question;
import Validation.Validation;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dean Farrelly
 */
public class AnswerSecurityQuestionCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        User_Security_QuestionDao usqDao = new User_Security_QuestionDao(Dao.getDatabaseName());
        UserDao uDao = new UserDao(Dao.getDatabaseName());
        Validation v = new Validation();
        
        String questionIdString = request.getParameter("questionId");
        String userIdString = request.getParameter("userId");
        String answer = request.getParameter("answer");
        
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");
        
        if (questionIdString != null && !questionIdString.equals("") && userIdString != null && !userIdString.equals("") && answer != null && !answer.equals("") && newPassword != null && !newPassword.equals("") && confirmNewPassword != null && !confirmNewPassword.equals("")) {
            int questionId = v.convertStringToInt(questionIdString);
            int userId = v.convertStringToInt(userIdString);
            
            if ((questionId > 0) && (userId > 0)) {
            
                User_Security_Question u = usqDao.checkUser_Security_Answer(userId, questionId, answer);

                if (u != null) {
                    User user = uDao.getUserById(userId);
                    if (user != null) {
                        if (newPassword.equals(confirmNewPassword)) {
                            // Update password method

                            session.setAttribute("loggedInUser", user);
                            forwardToJsp = "changePassword.jsp";
                        } else {
                            session.setAttribute("errorMessage", "New password and confirm password doesn't match");
                            forwardToJsp = "error.jsp";
                        }
                    } else {
                        session.setAttribute("errorMessage", "User not found");
                        forwardToJsp = "error.jsp";
                    }
                } else {
                    session.setAttribute("errorMessage", "Incorrect answer to security question");
                    forwardToJsp = "error.jsp";
                }
            } else {
                session.setAttribute("errorMessage", "Invalid integers");
                forwardToJsp = "error.jsp";
            }
        } else {
            session.setAttribute("errorMessage", "A parameter value required for updating was missing");
            forwardToJsp = "error.jsp";
        }
        
        return forwardToJsp;
    }
    
}
