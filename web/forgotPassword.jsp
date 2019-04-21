<%-- 
    Document   : forgotPassword
    Created on : 21-Apr-2019, 20:58:48
    Author     : Paul Sweeney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("forgotPassword_title")%></title>
    </head>
    <body>
        <%
            if (loggedInUser == null) {
        %>
        
        <div class="row text-center">
            <div class="col-0 col-md-2"></div>
            
            <div class="col">
                <h3><%=dataBundle.getString("forgotPassword_recoverPasswordWithSecurityQuestions")%></h3>
                <a href="answerSecurityQuestion.jsp" class="btn btn-success"><%=dataBundle.getString("forgotPassword_securityQuestions")%></a>
            </div>
            <div class="col">
                <h3><%=dataBundle.getString("forgotPassword_recoverPasswordWithWhatsApp")%></h3>
                <a href="whatsapp.jsp" class="btn btn-success"><%=dataBundle.getString("forgotPassword_WhatsApp")%></a>
            </div>
            
            <div class="col-0 col-md-2"></div>
        </div>
        
        <%
            } else {
        %>
        <h3 class="text-center"><%=dataBundle.getString("forgotPassword_youAreAlreadyLoggedIn")%>, <%=loggedInUser.getFirstName()%>.</h3>
        <%
            }
        %>
    </body>
</html>
