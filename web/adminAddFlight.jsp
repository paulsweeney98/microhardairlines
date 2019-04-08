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
        <title><%=dataBundle.getString("adminAddFlight_title")%></title>
    </head>
    <body>
        <%
            if (loggedInUser != null && loggedInUser.getPrivileges() == 2) {
                PlaneDao pDao = new PlaneDao(Dao.getDatabaseName());
                Plane_InventoryDao piDao = new Plane_InventoryDao(Dao.getDatabaseName());
                ArrayList<Plane_Inventory> planeIs = piDao.getAllPlane_Inventory();
                if (planeIs != null && !planeIs.isEmpty()) {
        %>
            
        <h3 class="text-center"><%=dataBundle.getString("adminAddFlight_addFlight")%></h3>
           
        <div class="row d-none d-md-flex">
            <div class="col-2"></div>
            <div class="col-8 border border-primary rounded"></br>
                <form action="Servlet" method="post">
                    <div class="form-row">
                      <div class="col">
                        <label for="flightNumber"><%=dataBundle.getString("adminAddFlight_flightNumber")%></label>
                        <input name="flightNumber" id="flightNumber" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="price"><%=dataBundle.getString("adminAddFlight_price")%></label>
                        <input name="price" id="price" type="number" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="departureTerminal"><%=dataBundle.getString("adminAddFlight_departureTerminal")%></label>
                        <input name="departureTerminal" id="departureTerminal" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="arrivalTerminal"><%=dataBundle.getString("adminAddFlight_arrivalTerminal")%></label>
                        <input name="arrivalTerminal" id="arrivalTerminal" type="text" class="form-control" required >
                      </div>
                    </div></br>
                    
                    <div class="form-row">
                      <div class="col">
                        <label for="departureAirport"><%=dataBundle.getString("adminAddFlight_departureAirport")%></label>
                        <input name="departureAirport" id="departureAirport" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="departureAirportAbbreviation"><%=dataBundle.getString("adminAddFlight_departureAirportAbbreviation")%></label>
                        <input name="departureAirportAbbreviation" id="departureAirportAbbreviation" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="destinationAirport"><%=dataBundle.getString("adminAddFlight_destinationAirport")%></label>
                        <input name="destinationAirport" id="destinationAirport" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="destinationAirportAbbreviation"><%=dataBundle.getString("adminAddFlight_destinationAirportAbbreviation")%></label>
                        <input name="destinationAirportAbbreviation" id="destinationAirportAbbreviation" type="text" class="form-control" required >
                      </div>
                    </div></br>
                    
                    <div class="form-row">
                      <div class="col">
                        <label for="departureDate"><%=dataBundle.getString("adminAddFlight_departureDate")%></label>
                        <input name="departureDate" id="departureDate" required type="date" min="<%=LocalDate.now()%>" class="form-control" required />
                      </div>
                      <div class="col">
                        <label for="departureTime"><%=dataBundle.getString("adminAddFlight_departureTime")%></label>
                        <input name="departureTime" id="departureTime" type="time" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="arrivalTime"><%=dataBundle.getString("adminAddFlight_arrivalTime")%></label>
                        <input name="arrivalTime" id="arrivalTime" type="time" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="planeInventoryId"><%=dataBundle.getString("adminAddFlight_plane")%></label>
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
                          <input class="btn btn-success" type="submit" value="<%=dataBundle.getString("adminAddFlight_addFlight")%>" />&nbsp;&nbsp;
                        <input class="btn btn-danger" type="reset" value="<%=dataBundle.getString("adminAddFlight_reset")%>">
                      </div>
                    </div></br>
                    <input type="hidden" name ="action" value="adminAddFlight" />
                </form></br>
            </div>
            <div class="col-2"></div>
        </div>
                        
<!--        Mobile Version-->
        <div class="row d-block d-md-none">
            <div class="col border border-primary rounded"></br>
                <form action="Servlet" method="post">
                    <div class="form-row">
                      <div class="col">
                        <label for="flightNumber"><%=dataBundle.getString("adminAddFlight_flightNumber")%></label>
                        <input name="flightNumber" id="flightNumber" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="price"><%=dataBundle.getString("adminAddFlight_price")%></label>
                        <input name="price" id="price" type="number" class="form-control" required >
                      </div>
                    </div></br>
                    
                    <div class="form-row">
                      <div class="col">
                        <label for="departureTerminal"><%=dataBundle.getString("adminAddFlight_departureTerminal")%></label>
                        <input name="departureTerminal" id="departureTerminal" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="arrivalTerminal"><%=dataBundle.getString("adminAddFlight_arrivalTerminal")%></label>
                        <input name="arrivalTerminal" id="arrivalTerminal" type="text" class="form-control" required >
                      </div>
                    </div></br>
                    
                    <div class="form-row">
                      <div class="col">
                        <label for="departureAirport"><%=dataBundle.getString("adminAddFlight_departureAirport")%></label>
                        <input name="departureAirport" id="departureAirport" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="departureAirportAbbreviation"><%=dataBundle.getString("adminAddFlight_departureAirportAbbreviation")%></label>
                        <input name="departureAirportAbbreviation" id="departureAirportAbbreviation" type="text" class="form-control" required >
                      </div>
                    </div></br>
                    
                    <div class="form-row">
                      <div class="col">
                        <label for="destinationAirport"><%=dataBundle.getString("adminAddFlight_destinationAirport")%></label>
                        <input name="destinationAirport" id="destinationAirport" type="text" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="destinationAirportAbbreviation"><%=dataBundle.getString("adminAddFlight_destinationAirportAbbreviation")%></label>
                        <input name="destinationAirportAbbreviation" id="destinationAirportAbbreviation" type="text" class="form-control" required >
                      </div>
                    </div></br>
                    
                    <div class="form-row">
                      <div class="col">
                        <label for="departureDate"><%=dataBundle.getString("adminAddFlight_departureDate")%></label>
                        <input name="departureDate" id="departureDate" required type="date" min="<%=LocalDate.now()%>" class="form-control" required />
                      </div>
                      <div class="col">
                        <label for="departureTime"><%=dataBundle.getString("adminAddFlight_departureTime")%></label>
                        <input name="departureTime" id="departureTime" type="time" class="form-control" required >
                      </div>
                    </div></br>
                    
                    <div class="form-row">
                      <div class="col">
                        <label for="arrivalTime"><%=dataBundle.getString("adminAddFlight_arrivalTime")%></label>
                        <input name="arrivalTime" id="arrivalTime" type="time" class="form-control" required >
                      </div>
                      <div class="col">
                        <label for="planeInventoryId"><%=dataBundle.getString("adminAddFlight_plane")%></label>
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
                          <input class="btn btn-success" type="submit" value="<%=dataBundle.getString("adminAddFlight_addFlight")%>" />&nbsp;&nbsp;
                        <input class="btn btn-danger" type="reset" value="<%=dataBundle.getString("adminAddFlight_reset")%>">
                      </div>
                    </div></br>
                    <input type="hidden" name ="action" value="adminAddFlight" />
                </form></br>
            </div>
        </div>
        
        <%
                } else {
                    out.println(dataBundle.getString("adminAddFlight_noPlanesFound"));
                }
            } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("adminAddFlight_mustBeAdmin")%></h3>
            <a href="index.jsp" class="btn btn-success"><%=dataBundle.getString("adminAddFlight_normalUserHomepage")%></a>
        </div>
        <%
            }
        %>
    </body>
</html>
