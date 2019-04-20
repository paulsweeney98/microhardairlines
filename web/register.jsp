<%-- 
    Document   : register
    Created on : 26-Nov-2018, 16:53:54
    Author     : pauls
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("register_title")%></title>
    </head>
    <body>
        <%
            String booking = request.getParameter("booking");
            
            if (session.getAttribute("errorMessage") != null) {
        %>
        <h3 class="text-center text-danger"><%=session.getAttribute("errorMessage")%></h3>
        <%
            }
        %>
        
        <div class="row mt-3">
            <div class="col-0 col-md-2"></div>
            <div class="col-12 col-md-8 border border-primary text-center">
                <h1><%=dataBundle.getString("register_register")%></h1>
                <form action="Servlet" method="post">
                    <div class="form-row">
                        <div class="col">
                            <label for="email"><%=dataBundle.getString("register_email")%></label></br>
                            <input name="email" id="email" type="text" required class="form-control">
                        </div>
                    </div><br>
                    
                    <div class="form-row">
                        <div class="col">
                            <label for="password"><%=dataBundle.getString("register_password")%></label></br>
                            <input name="password" id="password" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Your password must contain at least 6 characters, with at least one number and one uppercase and lowercase letter" required class="form-control">
                        </div>
                            
                        <div class="col">
                            <label for="confirmPassword"><%=dataBundle.getString("register_confirmPassword")%></label></br>
                            <input name="confirmPassword" id="confirmPassword" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Your password must contain at least 6 characters, with at least one number and one uppercase and lowercase letter" required class="form-control">
                        </div>
                    </div><br>
                    
                    <div class="form-row">
                        <div class="col">
                            <label for="firstName"><%=dataBundle.getString("register_firstName")%></label></br>
                            <input name="firstName" id="firstName" type="text" required class="form-control">
                        </div>
                            
                        <div class="col">
                            <label for="lastName"><%=dataBundle.getString("register_lastName")%></label></br>
                            <input name="lastName" id="lastName" type="text" required class="form-control">
                        </div>
                    </div><br>
                    
                    <div class="form-row">
                        <div class="col">
                            <label for="dateOfBirth"><%=dataBundle.getString("register_dateOfBirth")%></label></br>
                            <input name="dateOfBirth" id="dateOfBirth" type="date" required class="form-control">
                        </div>
                            
                        <div class="col">
                            <label for="phoneNumber"><%=dataBundle.getString("register_phone")%></label></br>
                            <input name="phoneNumber" id="phoneNumber" type="text" required class="form-control">
                        </div>
                    </div><br>
                    
                    <div class="form-row">
                        <div class="col">
                            <label for="addressLine1"><%=dataBundle.getString("register_addressLine1")%></label></br>
                            <input name="addressLine1" id="addressLine1" type="text" required class="form-control">
                        </div>
                            
                        <div class="col">
                            <label for="addressLine2"><%=dataBundle.getString("register_addressLine2")%></label></br>
                            <input name="addressLine2" id="addressLine2" type="text" required class="form-control">
                        </div>
                    </div><br>
                    
                    <div class="form-row">
                        <div class="col">
                            <label for="cityOrTown"><%=dataBundle.getString("register_cityOrTown")%></label></br>
                            <input name="cityOrTown" id="cityOrTown" type="text" required class="form-control">
                        </div>
                            
                        <div class="col">
                            <label for="postalCode"><%=dataBundle.getString("register_postalCode")%></label></br>
                            <input name="postalCode" id="postalCode" type="text" required class="form-control">
                        </div>
                    </div><br>
                    
                    <div class="form-row">
                        <div class="col">
                            <label for="county"><%=dataBundle.getString("register_county")%></label></br>
                            <input name="county" id="county" type="text" required class="form-control">
                        </div>
                            
                        <div class="col">
                            <label for="country"><%=dataBundle.getString("register_country")%></label></br>
                            <input name="country" id="country" type="text" required class="form-control">
                        </div>
                    </div><br>
                    
                    <input class="btn btn-success" type="submit" value="<%=dataBundle.getString("register_register")%>" /><br>
                    <%
                        if (booking != null) {
                    %>
                    <input type="hidden" name ="booking" value="<%=booking%>" />
                    <%
                        }
                    %>
                    <!-- Include a hidden field to identify what the user wants to do -->
                    <input type="hidden" name ="action" value="register" />
                </form>
            </div>
            <div class="col-0 col-md-2"></div>
        </div>
        
        <!-- Include a footer so that there is always a link back to the home page! -->
        <%@ include file = "footer.jsp" %>
    </body>
</html>
