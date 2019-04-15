<%-- 
    Document   : editAccountDetails
    Created on : 26-Feb-2019, 09:40:43
    Author     : Dean Farrelly
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.io.InputStream"%>
<%@page import="Dtos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("editUserProfile_title")%></title>
    </head>
    <body>
        <%
            
            if (loggedInUser != null) {
        %>
        <div class="row mt-3">
            <div class="col-2"></div>
            <div class="col-8 border border-primary text-center">
                <h1 class="text-center text-dark"><%=dataBundle.getString("editUserProfile_profile")%></h1>
                <p class="text-dark"><%=dataBundle.getString("editUserProfile_hereIsAllYourInformation")%></p>
                <%
                if (loggedInUser == null){
                    out.println(dataBundle.getString("editUserProfile_userNotLoggedIn"));
                } else {
                    String change = request.getParameter("change");
                    if (change == null) {
                %>
                <p><b><%=dataBundle.getString("editUserProfile_firstName")%> </b><%=loggedInUser.getFirstName()%> <a href="editAccountDetails.jsp?change=firstName"><%=dataBundle.getString("editUserProfile_edit")%></a></p>
                <p><b><%=dataBundle.getString("editUserProfile_lastName")%> </b><%=loggedInUser.getLastName()%> <a href="editAccountDetails.jsp?change=lastName"><%=dataBundle.getString("editUserProfile_edit")%></a></p>
                <p><b><%=dataBundle.getString("editUserProfile_email")%> </b><%=loggedInUser.getEmail()%> <a href="editAccountDetails.jsp?change=email"><%=dataBundle.getString("editUserProfile_edit")%></a></p>
                <p><b><%=dataBundle.getString("editUserProfile_phoneNumber")%> </b><%=loggedInUser.getPhoneNumber()%> <a href="editAccountDetails.jsp?change=phone"><%=dataBundle.getString("editUserProfile_edit")%></a></p>
                <p><b><%=dataBundle.getString("editUserProfile_dateOfBirth")%> </b><%=dateFormatter.format(loggedInUser.getDateOfBirth())%></p> 
                <p><b><%=dataBundle.getString("editUserProfile_addressLine1")%> </b><%=loggedInUser.getAddressLine1()%> <a href="editAccountDetails.jsp?change=addressLine1"><%=dataBundle.getString("editUserProfile_edit")%></a></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine2")%> </b><%=loggedInUser.getAddressLine2()%> <a href="editAccountDetails.jsp?change=addressLine2"><%=dataBundle.getString("editUserProfile_edit")%></a></p>
                <p><b><%=dataBundle.getString("editUserProfile_cityOrTown")%> </b><%=loggedInUser.getCityOrTown()%> <a href="editAccountDetails.jsp?change=cityOrTown"><%=dataBundle.getString("editUserProfile_edit")%></a></p>
                <p><b><%=dataBundle.getString("editUserProfile_postalCode")%> </b><%=loggedInUser.getPostalCode()%> <a href="editAccountDetails.jsp?change=postalCode"><%=dataBundle.getString("editUserProfile_edit")%></a></p>
                <p><b><%=dataBundle.getString("editUserProfile_county")%> </b><%=loggedInUser.getCounty()%> <a href="editAccountDetails.jsp?change=county"><%=dataBundle.getString("editUserProfile_edit")%></a></p>
                <p><b><%=dataBundle.getString("editUserProfile_country")%> </b><%=loggedInUser.getCountry()%> <a href="editAccountDetails.jsp?change=country"><%=dataBundle.getString("editUserProfile_edit")%></a></p>
                <%
                    } else if (change.equals("firstName")) {
                %>
                <form action="Servlet" method="post">
                    <label><b><%=dataBundle.getString("editUserProfile_firstName")%></b></label>
                    <input name="firstName" required size=15 type="text" value="<%=loggedInUser.getFirstName()%>" />
                    <input type="submit" value="<%=dataBundle.getString("editUserProfile_edit")%>" />
                    <input type="hidden" name ="userId" value="<%=loggedInUser.getUserId()%>" />
                    <input type="hidden" name ="action" value="editAccountDetails" />
                </form>
                <p><b><%=dataBundle.getString("editUserProfile_lastName")%> </b><%=loggedInUser.getLastName()%>
                <p><b><%=dataBundle.getString("editUserProfile_email")%></b><%=loggedInUser.getEmail()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_phoneNumber")%></b><%=loggedInUser.getPhoneNumber()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_dateOfBirth")%></b><%=dateFormatter.format(loggedInUser.getDateOfBirth())%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine1")%> </b><%=loggedInUser.getAddressLine1()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine2")%> </b><%=loggedInUser.getAddressLine2()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_cityOrTown")%> </b><%=loggedInUser.getCityOrTown()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_postalCode")%> </b><%=loggedInUser.getPostalCode()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_county")%> </b><%=loggedInUser.getCounty()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_country")%> </b><%=loggedInUser.getCountry()%></p>
                <%
                    } else if (change.equals("lastName")) {
                %>
                <p><b><%=dataBundle.getString("editUserProfile_firstName")%> </b><%=loggedInUser.getFirstName()%>
                <form action="Servlet" method="post">
                    <label><b><%=dataBundle.getString("editUserProfile_lastName")%></b></label>
                    <input name="lastName" required size=15 type="text" value="<%=loggedInUser.getLastName()%>" />
                    <input type="submit" value="<%=dataBundle.getString("editUserProfile_edit")%>" />
                    <input type="hidden" name ="userId" value="<%=loggedInUser.getUserId()%>" />
                    <input type="hidden" name ="action" value="editAccountDetails" />
                </form>
                <p><b><%=dataBundle.getString("editUserProfile_email")%></b><%=loggedInUser.getEmail()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_phoneNumber")%></b><%=loggedInUser.getPhoneNumber()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_dateOfBirth")%></b><%=dateFormatter.format(loggedInUser.getDateOfBirth())%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine1")%> </b><%=loggedInUser.getAddressLine1()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine2")%> </b><%=loggedInUser.getAddressLine2()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_cityOrTown")%> </b><%=loggedInUser.getCityOrTown()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_postalCode")%> </b><%=loggedInUser.getPostalCode()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_county")%> </b><%=loggedInUser.getCounty()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_country")%> </b><%=loggedInUser.getCountry()%></p>
                <%
                    } else if (change.equals("email")) {
                %>
                <p><b><%=dataBundle.getString("editUserProfile_firstName")%> </b><%=loggedInUser.getFirstName()%>
                <p><b><%=dataBundle.getString("editUserProfile_lastName")%> </b><%=loggedInUser.getLastName()%>
                <form action="Servlet" method="post">
                    <label><b><%=dataBundle.getString("editUserProfile_email")%> </b></label>
                    <input name="email" required size=15 type="email" value="<%=loggedInUser.getEmail()%>" />
                    <input type="submit" value="<%=dataBundle.getString("editUserProfile_edit")%>" />
                    <input type="hidden" name ="userId" value="<%=loggedInUser.getUserId()%>" />
                    <input type="hidden" name ="action" value="editAccountDetails" />
                </form>
                <p><b><%=dataBundle.getString("editUserProfile_phoneNumber")%></b><%=loggedInUser.getPhoneNumber()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_dateOfBirth")%></b><%=dateFormatter.format(loggedInUser.getDateOfBirth())%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine1")%> </b><%=loggedInUser.getAddressLine1()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine2")%> </b><%=loggedInUser.getAddressLine2()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_cityOrTown")%> </b><%=loggedInUser.getCityOrTown()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_postalCode")%> </b><%=loggedInUser.getPostalCode()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_county")%> </b><%=loggedInUser.getCounty()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_country")%> </b><%=loggedInUser.getCountry()%></p>
                <%
                    } else if (change.equals("phone")) {
                %>
                <p><b><%=dataBundle.getString("editUserProfile_firstName")%> </b><%=loggedInUser.getFirstName()%>
                <p><b><%=dataBundle.getString("editUserProfile_lastName")%> </b><%=loggedInUser.getLastName()%>
                <p><b><%=dataBundle.getString("editUserProfile_email")%> </b><%=loggedInUser.getEmail()%></p>
                <form action="Servlet" method="post">
                    <label><b><%=dataBundle.getString("editUserProfile_phoneNumber")%></b></label>
                    <input name="phoneNumber" required size=15 type="text" value="<%=loggedInUser.getPhoneNumber()%>" />
                    <input type="submit" value="<%=dataBundle.getString("editUserProfile_edit")%>" />
                    <input type="hidden" name ="userId" value="<%=loggedInUser.getUserId()%>" />
                    <input type="hidden" name ="action" value="editAccountDetails" />
                </form>
                <p><b><%=dataBundle.getString("editUserProfile_dateOfBirth")%></b><%=dateFormatter.format(loggedInUser.getDateOfBirth())%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine1")%> </b><%=loggedInUser.getAddressLine1()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine2")%> </b><%=loggedInUser.getAddressLine2()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_cityOrTown")%> </b><%=loggedInUser.getCityOrTown()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_postalCode")%> </b><%=loggedInUser.getPostalCode()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_county")%> </b><%=loggedInUser.getCounty()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_country")%> </b><%=loggedInUser.getCountry()%></p>
                <p><b>Date Of Birth: </b><%=dateFormatter.format(loggedInUser.getDateOfBirth())%></p>
                <%
                    } else if (change.equals("addressLine1")) {
                %>
                <p><b><%=dataBundle.getString("editUserProfile_firstName")%> </b><%=loggedInUser.getFirstName()%>
                <p><b><%=dataBundle.getString("editUserProfile_lastName")%> </b><%=loggedInUser.getLastName()%>
                <p><b><%=dataBundle.getString("editUserProfile_email")%> </b><%=loggedInUser.getEmail()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_phoneNumber")%></b><%=loggedInUser.getPhoneNumber()%></p>
                <form action="Servlet" method="post">
                    <label><b><%=dataBundle.getString("editUserProfile_addressLine1")%></b></label>
                    <input name="addressLine1" required size=15 type="text" value="<%=loggedInUser.getAddressLine1()%>" />
                    <input type="submit" value="<%=dataBundle.getString("editUserProfile_edit")%>" />
                    <input type="hidden" name ="userId" value="<%=loggedInUser.getUserId()%>" />
                    <input type="hidden" name ="action" value="editAccountDetails" />
                </form>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine2")%> </b><%=loggedInUser.getAddressLine2()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_cityOrTown")%> </b><%=loggedInUser.getCityOrTown()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_postalCode")%> </b><%=loggedInUser.getPostalCode()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_county")%> </b><%=loggedInUser.getCounty()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_country")%> </b><%=loggedInUser.getCountry()%></p>
                <%
                    } else if (change.equals("addressLine2")) {
                %>
                <p><b><%=dataBundle.getString("editUserProfile_firstName")%> </b><%=loggedInUser.getFirstName()%>
                <p><b><%=dataBundle.getString("editUserProfile_lastName")%> </b><%=loggedInUser.getLastName()%>
                <p><b><%=dataBundle.getString("editUserProfile_email")%> </b><%=loggedInUser.getEmail()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_phoneNumber")%></b><%=loggedInUser.getPhoneNumber()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine1")%> </b><%=loggedInUser.getAddressLine1()%></p>
                <form action="Servlet" method="post">
                    <label><b><%=dataBundle.getString("editUserProfile_addressLine2")%></b></label>
                    <input name="addressLine2" required size=15 type="text" value="<%=loggedInUser.getAddressLine2()%>" />
                    <input type="submit" value="<%=dataBundle.getString("editUserProfile_edit")%>" />
                    <input type="hidden" name ="userId" value="<%=loggedInUser.getUserId()%>" />
                    <input type="hidden" name ="action" value="editAccountDetails" />
                </form>
                <p><b><%=dataBundle.getString("editUserProfile_cityOrTown")%> </b><%=loggedInUser.getCityOrTown()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_postalCode")%> </b><%=loggedInUser.getPostalCode()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_county")%> </b><%=loggedInUser.getCounty()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_country")%> </b><%=loggedInUser.getCountry()%></p>
                <%
                    } else if (change.equals("cityOrTown")) {
                %>
                <p><b><%=dataBundle.getString("editUserProfile_firstName")%> </b><%=loggedInUser.getFirstName()%>
                <p><b><%=dataBundle.getString("editUserProfile_lastName")%> </b><%=loggedInUser.getLastName()%>
                <p><b><%=dataBundle.getString("editUserProfile_email")%> </b><%=loggedInUser.getEmail()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_phoneNumber")%></b><%=loggedInUser.getPhoneNumber()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine1")%> </b><%=loggedInUser.getAddressLine1()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine2")%> </b><%=loggedInUser.getAddressLine2()%></p>
                <form action="Servlet" method="post">
                    <label><b><%=dataBundle.getString("editUserProfile_cityOrTown")%></b></label>
                    <input name="cityOrTown" required size=15 type="text" value="<%=loggedInUser.getCityOrTown()%>" />
                    <input type="submit" value="<%=dataBundle.getString("editUserProfile_edit")%>" />
                    <input type="hidden" name ="userId" value="<%=loggedInUser.getUserId()%>" />
                    <input type="hidden" name ="action" value="editAccountDetails" />
                </form>
                <p><b><%=dataBundle.getString("editUserProfile_postalCode")%> </b><%=loggedInUser.getPostalCode()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_county")%> </b><%=loggedInUser.getCounty()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_country")%> </b><%=loggedInUser.getCountry()%></p>
                <%
                    } else if (change.equals("postalCode")) {
                %>
                <p><b><%=dataBundle.getString("editUserProfile_firstName")%> </b><%=loggedInUser.getFirstName()%>
                <p><b><%=dataBundle.getString("editUserProfile_lastName")%> </b><%=loggedInUser.getLastName()%>
                <p><b><%=dataBundle.getString("editUserProfile_email")%> </b><%=loggedInUser.getEmail()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_phoneNumber")%></b><%=loggedInUser.getPhoneNumber()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine1")%> </b><%=loggedInUser.getAddressLine1()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine2")%> </b><%=loggedInUser.getAddressLine2()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_cityOrTown")%> </b><%=loggedInUser.getCityOrTown()%></p>
                <form action="Servlet" method="post">
                    <label><b><%=dataBundle.getString("editUserProfile_postalCode")%></b></label>
                    <input name="postalCode" required size=15 type="text" value="<%=loggedInUser.getPostalCode()%>" />
                    <input type="submit" value="<%=dataBundle.getString("editUserProfile_edit")%>" />
                    <input type="hidden" name ="userId" value="<%=loggedInUser.getUserId()%>" />
                    <input type="hidden" name ="action" value="editAccountDetails" />
                </form>
                <p><b><%=dataBundle.getString("editUserProfile_county")%> </b><%=loggedInUser.getCounty()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_country")%> </b><%=loggedInUser.getCountry()%></p>
                <%
                    } else if (change.equals("county")) {
                %>
                <p><b><%=dataBundle.getString("editUserProfile_firstName")%> </b><%=loggedInUser.getFirstName()%>
                <p><b><%=dataBundle.getString("editUserProfile_lastName")%> </b><%=loggedInUser.getLastName()%>
                <p><b><%=dataBundle.getString("editUserProfile_email")%> </b><%=loggedInUser.getEmail()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_phoneNumber")%></b><%=loggedInUser.getPhoneNumber()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine1")%> </b><%=loggedInUser.getAddressLine1()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine2")%> </b><%=loggedInUser.getAddressLine2()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_cityOrTown")%> </b><%=loggedInUser.getCityOrTown()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_postalCode")%> </b><%=loggedInUser.getPostalCode()%></p>
                <form action="Servlet" method="post">
                    <label><b><%=dataBundle.getString("editUserProfile_county")%></b></label>
                    <input name="county" required size=15 type="text" value="<%=loggedInUser.getCounty()%>" />
                    <input type="submit" value="<%=dataBundle.getString("editUserProfile_edit")%>" />
                    <input type="hidden" name ="userId" value="<%=loggedInUser.getUserId()%>" />
                    <input type="hidden" name ="action" value="editAccountDetails" />
                </form>
                <p><b><%=dataBundle.getString("editUserProfile_country")%> </b><%=loggedInUser.getCountry()%></p>
                <%
                    } else if (change.equals("country")) {
                %>
                <p><b><%=dataBundle.getString("editUserProfile_firstName")%> </b><%=loggedInUser.getFirstName()%>
                <p><b><%=dataBundle.getString("editUserProfile_lastName")%> </b><%=loggedInUser.getLastName()%>
                <p><b><%=dataBundle.getString("editUserProfile_email")%> </b><%=loggedInUser.getEmail()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_phoneNumber")%></b><%=loggedInUser.getPhoneNumber()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine1")%> </b><%=loggedInUser.getAddressLine1()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_addressLine2")%> </b><%=loggedInUser.getAddressLine2()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_cityOrTown")%> </b><%=loggedInUser.getCityOrTown()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_postalCode")%> </b><%=loggedInUser.getPostalCode()%></p>
                <p><b><%=dataBundle.getString("editUserProfile_county")%> </b><%=loggedInUser.getCounty()%></p>
                <form action="Servlet" method="post">
                    <label><b><%=dataBundle.getString("editUserProfile_country")%></b></label>
                    <input name="country" required size=15 type="text" value="<%=loggedInUser.getCountry()%>" />
                    <input type="submit" value="<%=dataBundle.getString("editUserProfile_edit")%>" />
                    <input type="hidden" name ="userId" value="<%=loggedInUser.getUserId()%>" />
                    <input type="hidden" name ="action" value="editAccountDetails" />
                </form>
                <%
                    }
                }
                %>
            </div>
            <div class="col-2"></div>
        </div>
        <%
            } else {
        %>
        <div class="text-center">
            <p><%=dataBundle.getString("editUserProfile_youMustBeLoggedInToSeeThisInformation")%></p>
        </div>
        <%
            }
        %>
        <%@ include file = "footer.jsp" %>
    </body>
</html>

