/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Dao;
import Daos.User_Security_QuestionDao;
import Dtos.User;
import Dtos.User_Security_Question;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 *
 * The author of this class is Gerard Hoey
 */
public class AddSecurityQuestionsCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;

        HttpSession session = request.getSession();

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            int userId = loggedInUser.getUserId();

            int questionId1 = Integer.parseInt(request.getParameter("securityQuestions_questionId1"));
            String answer1 = request.getParameter("securityQuestions_answer1");

            int questionId2 = Integer.parseInt(request.getParameter("securityQuestions_questionId2"));
            String answer2 = request.getParameter("securityQuestions_answer2");

            int questionId3 = Integer.parseInt(request.getParameter("securityQuestions_questionId3"));
            String answer3 = request.getParameter("securityQuestions_answer3");

            if (questionId1 > 0 && answer1 != null && !answer1.equals("")
                    && questionId2 > 0 && answer2 != null && !answer2.equals("")
                    && questionId3 > 0 && answer3 != null && !answer3.equals("")) {
                User_Security_QuestionDao usqDao = new User_Security_QuestionDao(Dao.getDatabaseName());
                // Check if user already has security questions attached to their account
                usqDao.getUser_Security_QuestionById(userId);
                ArrayList<User_Security_Question> usqs = usqDao.getUser_Security_QuestionById(loggedInUser.getUserId());
                if (!usqs.isEmpty()) {
                    // Remove this user's previous security questions
                    usqDao.removeUser_Security_QuestionById(userId);
                }
                
                // Add this user's new security questions & hashed answers to the user_security_question table
                usqs = new ArrayList();

                usqs.add(new User_Security_Question(userId, questionId1, answer1));
                usqs.add(new User_Security_Question(userId, questionId2, answer2));
                usqs.add(new User_Security_Question(userId, questionId3, answer3));

                for (User_Security_Question usq : usqs) {
                    usqDao.addUser_Security_Question(usq);
                }

                if (loggedInUser.getPrivileges() == 1) {
                    forwardToJsp = "index.jsp";
                } else if (loggedInUser.getPrivileges() == 2) {
                    forwardToJsp = "adminIndex.jsp";
                } else {
                    forwardToJsp = "error.jsp";
                }
            } else {
                // One or more fields were missing
                // Send the user to the error page and inform them of this
                String errorMessage = "One or more fields were missing. Please <a href='securityQuestions.jsp'>go back</a> and try again.";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            // Not logged in
            // Send the user to the error page and inform them of this
            String errorMessage = "You must be logged in to add security questions to your account. Please log in and try again.";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }

}
