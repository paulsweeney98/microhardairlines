<%-- 
    Document   : answerSecurityQuestion
    Created on : 21-Feb-2019, 11:27:50
    Author     : Dean Farrelly
--%>

<%@page import="Daos.UserDao"%>
<%@page import="Dtos.User_Security_Question"%>
<%@page import="Daos.User_Security_QuestionDao"%>
<%@page import="Dtos.SecurityQuestion"%>
<%@page import="Daos.SecurityQuestionDao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@page import="Daos.Dao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            if (email != null && !email.isEmpty()) {
        %>
        
            <%
                UserDao uDao = new UserDao(Dao.getDatabaseName());
                User user = uDao.getUserByEmail(email);

                // If user already has security questions added to their account
                User_Security_QuestionDao usqDao = new User_Security_QuestionDao(Dao.getDatabaseName());
                ArrayList<User_Security_Question> uQuestions = usqDao.getUser_Security_QuestionById(user.getUserId());

                if (uQuestions != null && !uQuestions.isEmpty()) {
                    
                    SecurityQuestionDao sqDao = new SecurityQuestionDao(Dao.getDatabaseName());
                    ArrayList<SecurityQuestion> questions = new ArrayList<SecurityQuestion>();
                    for (User_Security_Question uQuestion : uQuestions) {
                        questions.add(sqDao.getSecurityQuestionById(uQuestion.getSecurityQuestionId()));
                    }
                    
                    if (questions != null && !questions.isEmpty()) {
            %>         
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6 text-center">
                    <form action="Servlet" method="post">
                        <div class="form-row">
                            <select name="questionId">
                                <%
                                    for (SecurityQuestion question : questions) {
                                %>
                                    <option value="<%=question.getId()%>"><%=question.getQuestion()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-row">
                            <input name="answer" type="text" required>
                        </div></br>
                        
                        <div class="form-row">
                            <input name="newPassword" type="password" placeholder="New Password" required>
                        </div>
                        <div class="form-row">
                            <input name="confirmNewPassword" type="password" placeholder="Confirm Password" required>
                        </div></br>
                            
                        <div class="form-row">
                            <input type="submit" value="Submit" />
                        </div>
                            
                        <input type="hidden" name="userId" value="<%=user.getUserId()%>" />
                        <input type="hidden" name ="action" value="answerSecurityQuestion" />
                    </form>
                </div>
                <div class="col-3"></div>
            </div>
            <%
                    } else {
                        out.println("Problem finding questions");
                    }
                } else {
            %>
            <h3 class="text-center">You have no security questions set up.</h3>
            <%
                }
            %>
        
        <%
            } else {
        %>
        <div class="text-center">
            <h3>Enter your email address</h3>
            <form action="answerSecurityQuestion.jsp" method="post">
                <input name="email" type="email" required>
                <input type="submit" value="Submit" />
            </form>
        </div>
        <%
            }
        %>
    </div>
    </body>
</html>
