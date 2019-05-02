<%-- 
    Document   : whatsapp
    Created on : 21-Apr-2019, 21:09:10
    Author     : Paul Sweeney
--%>

<%@page import="Daos.UserDao"%>
<%@page import="Daos.Dao"%>
<%@page import="Twilio.whatsapp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("whatsapp_title")%></title>
    </head>
    <body>
        <%
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null && !errorMessage.equals("")) {
        %>
        <h3 class="text-danger text-center"><%=errorMessage%></h3>
        <%
            }
        %>
        
        <%
            if (loggedInUser == null) {
                
                String email = request.getParameter("email");
                
                // If the user has not yet entered in an email
                if (email == null || email.equals("")) {
        %>
        
        <div class="text-center">
            <h3><%=dataBundle.getString("whatsapp_enterEmail")%></h3>
            <form action="whatsapp.jsp" method="post">
                <input name="email" type="email" required>
                <input type="submit" value="<%=dataBundle.getString("whatsapp_submit")%>" />
            </form>
        </div>
        
        <%
                // if the user has entered in an email
                } else {

                    UserDao uDao = new UserDao(Dao.getDatabaseName());
                    User user = uDao.getUserByEmail(email);
                    
                    // If there is a valid user for the email address entered
                    if (user.getUserId() != -1) {

                        session.setAttribute("verifyUser", user);

                        whatsapp whatsapp = new whatsapp();
                        // Creating the code to be sent to the user's phone
                        String code = whatsapp.createCode();

                        // Sending the code to the user's phone using Twilio API
                        // WARNING: We are using a free account for this API so this will only work for phone numbers
                        // that have been set up in the developer's section of the Twilio account, but this feature will
                        // be demonstrated during presentation using my phone number which I have previously set up on Twilio (this is Paul).
                        // This line of code below would send a WhatsApp message to any number if we paid for premium.
                        whatsapp.sendWhatsAppMessage(code, user.getPhoneNumber());
        %>
        
        <div class="row text-center">
            <div class="col-0 col-md-3"></div>
            
            <div class="col">
                <h3><%=dataBundle.getString("whatsapp_verifyCodeWithWhatsApp")%></h3>
                
                <form action="Servlet" method="post">
                    <label><%=dataBundle.getString("whatsapp_codeSentTo")%> <%=user.getPhoneNumber()%>, <%=dataBundle.getString("whatsapp_pleaseEnterCodeHere")%></label>
                    <input name="userEnteredCode" required type="text" placeholder="<%=dataBundle.getString("whatsapp_enterCode")%>" class="form-control" />
                    
                    <!-- The code sent-->
                    <input type="hidden" name="code" value="<%=code%>" />
                    
                    <input type="hidden" name="action" value="verifyWhatsAppCode" />
                    <input type="submit" value="<%=dataBundle.getString("whatsapp_submit")%>" class="form-control btn btn-success" />
                </form>
            </div>
            
            <div class="col-0 col-md-3"></div>
        </div>
        
        <%
                    } else {
        %>
        <div class="row text-center">
            <div class="col-0 col-md-3"></div>
            <div class="col-12 col-md-6">
                <h3><%=dataBundle.getString("whatsapp_noUserFoundWithThisEmail")%></h3>
                <form action="whatsapp.jsp" method="post">
                    <input type="submit" value="<%=dataBundle.getString("whatsapp_retry")%>" class="form-control btn btn-success" />
                </form>
            </div>
            <div class="col-0 col-md-3"></div>
        </div>
        <%
                    }
                }
            } else {
        %>
        <h3 class="text-center"><%=dataBundle.getString("forgotPassword_youAreAlreadyLoggedIn")%>, <%=loggedInUser.getFirstName()%>.</h3>
        <%
            }
        %>
    </body>
</html>
