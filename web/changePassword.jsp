<%-- 
    Document   : changePassword
    Created on : 11-Mar-2019, 22:09:04
    Author     : Dean Farrelly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%
            String email = loggedInUser.getEmail();
            if (email != null) {
        %>
        
        <h1 class="text-center"><%=dataBundle.getString("changePassword_ChangePassword")%></h1>
        
        <div class="row mt-3">
            <div class="col-4"></div>
            <div class="col-4 border border-primary text-center"></br>
                <form action="Servlet" method="post">
                    
                    <div class="form-row">
                        <div class="col">
                            <label for="oldPassword"><%=dataBundle.getString("changePassword_OldPassword")%></label></br>
                            <input name="oldPassword" id="oldPassword" type="password" required>
                        </div>
                    </br>
                    
                        <div class="col">
                            <label for="newPassword"><%=dataBundle.getString("changePassword_NewPassword")%></label>
                            <input name="newPassword" id="newPassword" type="password" required>
                        </div>
                        <div class="col">
                            <label for="confirmPassword"><%=dataBundle.getString("changePassword_ConfirmPassword")%></label>
                            <input name="confirmPassword" id="confirmPassword" type="password" required>
                        </div>
                    </div></br>
                    
                    <input class="btn btn-success" type="submit" value="<%=dataBundle.getString("changePassword_ChangePassword")%>" />
                    <input type="hidden" name="email" value="<%=email%>" />
                    <!-- Include a hidden field to identify what the user wants to do -->
                    <input type="hidden" name ="action" value="changePassword" />
                </form></br>
            </div>
            <div class="col-4"></div>
        </div>
        
        <%
            } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("changePassword_mustBeLoggedIn")%></h3>
            <a href="login.jsp" class="btn btn-success"><%=dataBundle.getString("login_login")%></a>
            <a href="register.jsp" class="btn btn-success"><%=dataBundle.getString("login_dontHaveAnAccountRegisterHere")%></a>
        </div>
        <%
            }
        %>
    </body>
</html>
