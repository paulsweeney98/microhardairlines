<%-- 
    Document   : adminAddFlight
    Created on : 07-Mar-2019, 12:16:03
    Author     : D00191889
--%>

<%@page import="Dtos.Plane"%>
<%@page import="Dtos.Plane_Inventory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.Plane_InventoryDao"%>
<%@page import="Daos.PlaneDao"%>
<%@page import="Daos.Dao"%>
<%@page import="java.time.LocalDate"%>
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
                PlaneDao pDao = new PlaneDao(Dao.getDatabaseName());
                Plane_InventoryDao piDao = new Plane_InventoryDao(Dao.getDatabaseName());
                ArrayList<Plane_Inventory> planeIs = piDao.getAllPlane_Inventory();
                if (planeIs != null && !planeIs.isEmpty()) {
        %>
        
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-4">Admin Page</h1>
                <p class="lead">Welcome, <%=loggedInUser.getFirstName()%> <%=loggedInUser.getLastName()%></p>
            </div>
        </div>
            
        <h3 class="text-center">Add Flight</h3>
           
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8 border border-primary rounded"></br>
                <form action="Servlet" method="post">
                    <div class="form-row">
                      <div class="col">
                        <label for="flightNumber">Flight Number</label>
                        <input name="flightNumber" id="flightNumber" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="price">Price</label>
                        <input name="price" id="price" type="number" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="departureTerminal">Departure Terminal</label>
                        <input name="departureTerminal" id="departureTerminal" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="arrivalTerminal">Arrival Terminal</label>
                        <input name="arrivalTerminal" id="arrivalTerminal" type="text" class="form-control" required >
                      </div>
                    </div></br>
                    
                    <div class="form-row">
                      <div class="col">
                        <label for="departureAirport">Departure Airport</label>
                        <input name="departureAirport" id="departureAirport" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="departureAirportAbbreviation">Departure Airport Abbreviation</label>
                        <input name="departureAirportAbbreviation" id="departureAirportAbbreviation" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="destinationAirport">Destination Airport</label>
                        <input name="destinationAirport" id="destinationAirport" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="destinationAirportAbbreviation">Destination Airport Abbreviation</label>
                        <input name="destinationAirportAbbreviation" id="destinationAirportAbbreviation" type="text" class="form-control" required >
                      </div>
                    </div></br>
                    
                    <div class="form-row">
                      <div class="col">
                        <label for="departureDate">Departure Date</label>
                        <input name="departureDate" id="departureDate" required type="date" min="<%=LocalDate.now()%>" class="form-control" required />
                      </div>
                      <div class="col">
                        <label for="departureTime">Departure Time</label>
                        <input name="departureTime" id="departureTime" type="time" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="arrivalTime">Arrival Time</label>
                        <input name="arrivalTime" id="arrivalTime" type="time" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="planeInventoryId">Plane</label>
                        <select name="planeInventoryId" id="planeInventoryId"class="form-control" required>
                            <%
                                for (Plane_Inventory planeI : planeIs) {
                            %>
                            <option value="<%=planeI.getId()%>"><%=pDao.getPlaneById(planeI.getPlaneId()).getMake()%> <%=pDao.getPlaneById(planeI.getPlaneId()).getModel()%></option>
                            <%
                                }
                            %>
                        </select>
                      </div>
                    </div></br>
                    
                    <div class="form-row text-center">
                      <div class="col">
                          <input class="btn btn-success" type="submit" value="Add Flight" />&nbsp;&nbsp;
                        <input class="btn btn-danger" type="reset">
                      </div>
                    </div></br>
                    <input type="hidden" name ="action" value="adminAddFlight" />
                </form></br>
            </div>
            <div class="col-2"></div>
        </div>
        
        <%
                } else {
                    out.println("No planes found.");
                }
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
