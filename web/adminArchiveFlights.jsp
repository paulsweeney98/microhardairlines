<%-- 
    Document   : adminIndex
    Created on : 07-Mar-2019, 11:42:32
    Author     : D00191889
--%>

<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("adminArchiveFlights_title")%></title>
    </head>
    <body>
        <%
            if (loggedInUser != null && loggedInUser.getPrivileges() == 2) {
        %>


        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="row text-center">
                    <div class="col"></br>
                        <form action="Servlet" method="post">
                            <%
                                String successMessage = (String) session.getAttribute("successMessage");
                                if (successMessage != null && !successMessage.equals("")) {
                            %>      
                            <h3><%=successMessage%></h3>
                            <%
                                }
                                session.removeAttribute("successMessage");

                            %>
                            <label for="departureDate"><%=dataBundle.getString("adminArchiveFlights_departureDate")%></label>
                            <input name="departureDate" id="departureDate" required type="date" class="form-control" value="<%=LocalDate.now()%>" required /><br/><br/>

                            <input class="btn btn-success" type="submit" value="<%=dataBundle.getString("adminArchiveFlights_archiveFlights")%>" />
                            <input type="hidden" name="action" value="adminArchive" /><br/><br/>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-0 col-md-2"></div>
        </div>

        <%
        } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("adminArchiveFlights_mustBeAdmin")%></h3>
            <a href="index.jsp" class="btn btn-success"><%=dataBundle.getString("adminArchiveFlights_normalUserHomepage")%></a>
        </div>
        <%
            }
        %>
    </body>
</html>
