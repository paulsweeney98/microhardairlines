<%-- 
    Document   : securityQuestions
    Created on : 12-February-2019, 18:45:12
    Author     : gerard
--%>

<%@page import="Dtos.User_Security_Question"%>
<%@page import="Daos.User_Security_QuestionDao"%>
<%@page import="Dtos.SecurityQuestion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.SecurityQuestionDao"%>
<%@page import="Daos.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("securityQuestions_securityQuestions")%></title>
    </head>
    <%
        if (loggedInUser != null) {

            // Get list of possible security questions
            SecurityQuestionDao sqDao = new SecurityQuestionDao(Dao.getDatabaseName());
            ArrayList<SecurityQuestion> securityQuestions = sqDao.getSecurityQuestions();

            // If user already has security questions added to their account
            User_Security_QuestionDao usqDao = new User_Security_QuestionDao(Dao.getDatabaseName());
            ArrayList<User_Security_Question> usqs = usqDao.getUser_Security_QuestionById(loggedInUser.getUserId());
    %>

    <body>
        <div class="row mt-3">
            <div class="col-lg-4 col-md-4"></div>
            <div class="col-lg-5 col-md-6 border border-primary text-center">
                <h1><%=dataBundle.getString("securityQuestions_securityQuestions")%></h1>

                <%
                    if (usqs.isEmpty()) {
                %>
                <p><%=dataBundle.getString("securityQuestions_optional")%></p>
                <%
                } else {
                %>
                <p><%=dataBundle.getString("securityQuestions_update")%></p>
                <%
                    }
                %>

                <form action="Servlet" method="post"> 
                    <table>
                        <tr>
                            <td><%=dataBundle.getString("securityQuestions_question")%></td>
                            <td><select name="securityQuestions_questionId1" class="form-control" required>
                                    <%
                                        if (securityQuestions != null && !securityQuestions.isEmpty()) {
                                            for (SecurityQuestion sq : securityQuestions) {
                                    %>
                                    <option value="<%=sq.getId()%>"><%=sq.getQuestion()%></option>
                                    <%
                                            }
                                        } else {
                                            out.println(dataBundle.getString("securityQuestions_couldNotBeRetrieved"));
                                        }
                                    %>
                                </select></td> 
                        </tr>

                        <tr>
                            <td><%=dataBundle.getString("securityQuestions_answer")%></td><td> <input name="securityQuestions_answer1" required size=40 type="text" /> </td> 
                        </tr>

                        <tr>
                            <td><%=dataBundle.getString("securityQuestions_question")%></td>
                            <td><select name="securityQuestions_questionId2" class="form-control" required>
                                    <%
                                        if (securityQuestions != null && !securityQuestions.isEmpty()) {
                                            for (SecurityQuestion sq : securityQuestions) {
                                    %>
                                    <option value="<%=sq.getId()%>"><%=sq.getQuestion()%></option>
                                    <%
                                            }
                                        } else {
                                            out.println(dataBundle.getString("securityQuestions_couldNotBeRetrieved"));
                                        }
                                    %>
                                </select></td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("securityQuestions_answer")%></td><td> <input name="securityQuestions_answer2" required size=40 type="text" /> </td> 
                        </tr>

                        <tr>
                            <td><%=dataBundle.getString("securityQuestions_question")%></td>
                            <td><select name="securityQuestions_questionId3" class="form-control" required>
                                    <%
                                        if (securityQuestions != null && !securityQuestions.isEmpty()) {
                                            for (SecurityQuestion sq : securityQuestions) {
                                    %>
                                    <option value="<%=sq.getId()%>"><%=sq.getQuestion()%></option>
                                    <%
                                            }
                                        } else {
                                            out.println(dataBundle.getString("securityQuestions_couldNotBeRetrieved"));
                                        }
                                    %>
                                </select></td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("securityQuestions_answer")%></td><td> <input name="securityQuestions_answer3" required size=40 type="text" /> </td> 
                        </tr>
                    </table>
                    </br>
                    <a href="editAccountDetails.jsp" class="btn btn-light border float-left ml-3 ml-md-0"><%=dataBundle.getString("securityQuestions_backToProfile")%></a>
                    <input type="submit" class="btn btn-success float-right mr-3" value="<%=dataBundle.getString("securityQuestions_addSecurityQuestions")%>" />
                    <!-- Include a hidden field to identify what the user wants to do -->
                    <input type="hidden" name="action" value="addSecurityQuestions" />
                    <br/><br/>
                </form>
            </div>
            <div class="col-4"></div>
        </div>
        <%
        } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("securityQuestions_youMustLoginOrRegister")%></h3></br>
            <a href="login.jsp" class="btn btn-success"><%=dataBundle.getString("securityQuestions_login")%></a>&nbsp;&nbsp;
            <a href="register.jsp" class="btn btn-success"><%=dataBundle.getString("securityQuestions_register")%></a>
        </div>
        <%
            }
        %>
        <!-- Include a footer so that there is always a link back to the home page! -->
        <%@ include file = "footer.jsp" %>
    </body>
</html>
