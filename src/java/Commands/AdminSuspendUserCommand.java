/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Dao;
import Daos.UserDao;
import Validation.Validation;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author d00194995
 */
public class AdminSuspendUserCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        UserDao uDao = new UserDao(Dao.getDatabaseName());
        Validation v = new Validation();

        String idString = request.getParameter("id");

        if (idString != null && !idString.equals("")) {

            // Converting the id to the correct format
            int id = v.convertStringToInt(idString);

            if (id != -1) {
                int results = uDao.disableMember(id);

                if (results > 0) {
                    forwardToJsp = "adminIndex.jsp";
                } else {
                    String errorMessage = "Failed to suspend user.";
                    session.setAttribute("errorMessage", errorMessage);
                    forwardToJsp = "error.jsp";
                }
            } else {
                String errorMessage = "Error converting string to int.";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }

        } else {
            String errorMessage = "Invalid user details.";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }

}
