<%-- 
    Document   : adminIndex
    Created on : 07-Mar-2019, 11:42:32
    Author     : D00191889
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (loggedInUser != null && loggedInUser.getPrivileges() == 2) {
        %>
        
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-4">Admin Page</h1>
                <p class="lead">Welcome, <%=loggedInUser.getFirstName()%> <%=loggedInUser.getLastName()%></p>
            </div>
        </div>
            
        <div class="row">
            <div class="col-0 col-md-2"></div>
            <div class="col-12 col-md-8">
                <div class="row text-center">
                    <div class="col border border-primary rounded"></br>
                        <h3>Add Flight</h3>
                        <p></p>
                        <a href="adminAddFlight.jsp" class="btn btn-success">Add Flight</a></br></br>
                    </div>
                    <div class="col border border-primary rounded"></br>
                        <h3>Edit or Remove Flight</h3>
                        <p></p>
                        <a href="adminSearchFlight.jsp" class="btn btn-success">Search</a></br></br>
                    </div>
                    <div class="col border border-primary rounded"></br>
                        <h3>Disable or Enable Users</h3>
                        <p></p>
                        <a href="adminViewUsers.jsp" class="btn btn-success">View</a></br></br>
                    </div>
                </div>
            </div>
            <div class="col-0 col-md-2"></div>
        </div>
        
        <%
            } else {
        %>
        <div class="text-center">
            <h3>You must be an admin to access this page</h3>
            <a href="index.jsp" class="btn btn-success">Normal User Homepage</a>
        </div>
        <%
            }
        %>
    </body>
</html>
