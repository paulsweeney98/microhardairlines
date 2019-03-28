<%-- 
    Document   : searchRemoveFlights
    Created on : 07-Mar-2019, 15:52:08
    Author     : D00191889
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="Daos.Plane_InventoryDao"%>
<%@page import="Daos.PlaneDao"%>
<%@page import="Dtos.Plane_Inventory"%>
<%@page import="java.util.Date"%>
<%@page import="Validation.Validation"%>
<%@page import="Dtos.Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.FlightDao"%>
<%@page import="Daos.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("adminEditFlight_title")%></title>
    </head>
    <body>
        <%            if (loggedInUser != null && loggedInUser.getPrivileges() == 2) {
                FlightDao fDao = new FlightDao(Dao.getDatabaseName());
                Validation v = new Validation();

                int flightId = v.convertStringToInt(request.getParameter("flightId"));

                PlaneDao pDao = new PlaneDao(Dao.getDatabaseName());
                Plane_InventoryDao piDao = new Plane_InventoryDao(Dao.getDatabaseName());
                ArrayList<Plane_Inventory> planeIs = piDao.getAllPlane_Inventory();
                if (planeIs != null && !planeIs.isEmpty()) {

                    if (flightId > 0) {
                        Flight f = fDao.getFlightById(flightId);
                        if (f != null) {
                            int id = f.getId();
                            String flightNumber = f.getFlightNumber();
                            String departureTime = v.changeMinutesToHours(f.getDepartureTime());
                            String arrivalTime = v.changeMinutesToHours(f.getArrivalTime());
                            String duration = v.changeMinutesToHours2(f.getDuration());
                            String departureTerminal = f.getDepartureTerminal();
                            String arrivalTerminal = f.getArrivalTerminal();
                            Date departureDate = f.getDate();
                            double pricePaid = f.getPrice();
                            String departureAirport = f.getDepartureAirport();
                            String arrivalAirport = f.getArrivalAirport();
                            String departureAirportAbbreviation = f.getDepartureAirportAbbreviation();
                            String arrivalAirportAbbreviation = f.getArrivalAirportAbbreviation();

                            if (departureTime.charAt(2) != ':') {
                                departureTime = "0".concat(departureTime);
                            }
                            if (arrivalTime.charAt(2) != ':') {
                                arrivalTime = "0".concat(arrivalTime);
                            }
        %>

        <div class="row d-none d-md-flex">
            <div class="col-2"></div>
            <div class="col-8 border border-primary rounded"></br>
                <form action="Servlet" method="post">
                    <div class="form-row">
                        <div class="col">
                            <b><label for="toggleFlightNumber"><%=dataBundle.getString("adminEditFlight_flightNumber")%></label> <%=flightNumber%></b></br>
                            <%=dataBundle.getString("adminEditFlight_editForAllFlights")%> <input name="toggleFlightNumber" id="toggleFlightNumber" type="checkbox" value="Yes" class="form-control">
                        </div>
                        <div class="col">
                            <label for="price"><%=dataBundle.getString("adminEditFlight_price")%></label>
                            <input name="price" id="price" type="number" class="form-control" value="<%=pricePaid%>" required >
                        </div>
                        <div class="col">
                            <label for="departureTerminal"><%=dataBundle.getString("adminEditFlight_departureTerminal")%></label>
                            <input name="departureTerminal" id="departureTerminal" type="text" class="form-control" value="<%=departureTerminal%>"required >
                        </div>
                        <div class="col">
                            <label for="arrivalTerminal"><%=dataBundle.getString("adminEditFlight_arrivalTerminal")%></label>
                            <input name="arrivalTerminal" id="arrivalTerminal" type="text" class="form-control" value="<%=arrivalTerminal%>" required >
                        </div>
                    </div></br>

                    <div class="form-row">
                        <div class="col">
                            <label for="departureAirport"><%=dataBundle.getString("adminEditFlight_departureAirport")%></label>
                            <input name="departureAirport" id="departureAirport" type="text" class="form-control" value="<%=departureAirport%>" required >
                        </div>
                        <div class="col">
                            <label for="departureAirportAbbreviation"><%=dataBundle.getString("adminEditFlight_departureAirportAbbreviation")%></label>
                            <input name="departureAirportAbbreviation" id="departureAirportAbbreviation" type="text" class="form-control" value="<%=departureAirportAbbreviation%>" required >
                        </div>
                        <div class="col">
                            <label for="destinationAirport"><%=dataBundle.getString("adminEditFlight_destinationAirport")%></label>
                            <input name="destinationAirport" id="destinationAirport" type="text" class="form-control" value="<%=arrivalAirport%>" required >
                        </div>
                        <div class="col">
                            <label for="destinationAirportAbbreviation"><%=dataBundle.getString("adminEditFlight_destinationAirportAbbreviation")%></label>
                            <input name="destinationAirportAbbreviation" id="destinationAirportAbbreviation" type="text" class="form-control" value="<%=arrivalAirportAbbreviation%>" required >
                        </div>
                    </div></br>

                    <div class="form-row">
                        <div class="col">
                            <label for="departureDate"><%=dataBundle.getString("adminEditFlight_departureDate")%></label>
                            <input name="departureDate" id="departureDate" required type="date" min="<%=LocalDate.now()%>" class="form-control" value="<%=departureDate%>" required />
                        </div>
                        <div class="col">
                            <label for="departureTime"><%=dataBundle.getString("adminEditFlight_departureTime")%></label>
                            <input name="departureTime" id="departureTime" type="time" class="form-control" value="<%=departureTime%>" required >
                        </div>
                        <div class="col">
                            <label for="arrivalTime"><%=dataBundle.getString("adminEditFlight_arrivalTime")%></label>
                            <input name="arrivalTime" id="arrivalTime" type="time" class="form-control" value="<%=arrivalTime%>" required >
                        </div>
                        <div class="col">
                            <label for="planeInventoryId"><%=dataBundle.getString("adminEditFlight_plane")%></label>
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
                            <input class="btn btn-success" type="submit" value="<%=dataBundle.getString("adminEditFlight_editFlight")%>" />&nbsp;&nbsp;
                            <input class="btn btn-danger" type="reset" value="<%=dataBundle.getString("adminEditFlight_reset")%>">
                        </div>
                    </div></br>
                    <input type="hidden" name="flightNumber" value="<%=flightNumber%>" />
                    <input type="hidden" name="id" value="<%=id%>" />
                    <input type="hidden" name="action" value="adminEditFlight" />
                </form></br>
            </div>
            <div class="col-2"></div>
        </div>
                    
<!--        Mobile Version-->
        <div class="row d-flex d-md-none">
            <div class="col border border-primary rounded"></br>
                <form action="Servlet" method="post">
                    <div class="form-row">
                        <div class="col">
                            <b><label for="toggleFlightNumber"><%=dataBundle.getString("adminEditFlight_flightNumber")%></label> <%=flightNumber%></b></br>
                            <%=dataBundle.getString("adminEditFlight_editForAllFlights")%> <input name="toggleFlightNumber" id="toggleFlightNumber" type="checkbox" value="Yes" class="form-control">
                        </div>
                        <div class="col">
                            <label for="price"><%=dataBundle.getString("adminEditFlight_price")%></label>
                            <input name="price" id="price" type="number" class="form-control" value="<%=pricePaid%>" required >
                        </div>
                    </div></br>
                    
                    <div class="form-row">
                        <div class="col">
                            <label for="departureTerminal"><%=dataBundle.getString("adminEditFlight_departureTerminal")%></label>
                            <input name="departureTerminal" id="departureTerminal" type="text" class="form-control" value="<%=departureTerminal%>"required >
                        </div>
                        <div class="col">
                            <label for="arrivalTerminal"><%=dataBundle.getString("adminEditFlight_arrivalTerminal")%></label>
                            <input name="arrivalTerminal" id="arrivalTerminal" type="text" class="form-control" value="<%=arrivalTerminal%>" required >
                        </div>
                    </div></br>

                    <div class="form-row">
                        <div class="col">
                            <label for="departureAirport"><%=dataBundle.getString("adminEditFlight_departureAirport")%></label>
                            <input name="departureAirport" id="departureAirport" type="text" class="form-control" value="<%=departureAirport%>" required >
                        </div>
                        <div class="col">
                            <label for="departureAirportAbbreviation"><%=dataBundle.getString("adminEditFlight_departureAirportAbbreviation")%></label>
                            <input name="departureAirportAbbreviation" id="departureAirportAbbreviation" type="text" class="form-control" value="<%=departureAirportAbbreviation%>" required >
                        </div>
                    </div></br>
                    
                    <div class="form-row">
                        <div class="col">
                            <label for="destinationAirport"><%=dataBundle.getString("adminEditFlight_destinationAirport")%></label>
                            <input name="destinationAirport" id="destinationAirport" type="text" class="form-control" value="<%=arrivalAirport%>" required >
                        </div>
                        <div class="col">
                            <label for="destinationAirportAbbreviation"><%=dataBundle.getString("adminEditFlight_destinationAirportAbbreviation")%></label>
                            <input name="destinationAirportAbbreviation" id="destinationAirportAbbreviation" type="text" class="form-control" value="<%=arrivalAirportAbbreviation%>" required >
                        </div>
                    </div></br>

                    <div class="form-row">
                        <div class="col">
                            <label for="departureDate"><%=dataBundle.getString("adminEditFlight_departureDate")%></label>
                            <input name="departureDate" id="departureDate" required type="date" min="<%=LocalDate.now()%>" class="form-control" value="<%=departureDate%>" required />
                        </div>
                        <div class="col">
                            <label for="departureTime"><%=dataBundle.getString("adminEditFlight_departureTime")%></label>
                            <input name="departureTime" id="departureTime" type="time" class="form-control" value="<%=departureTime%>" required >
                        </div>
                    </div></br>
                    
                    <div class="form-row">
                        <div class="col">
                            <label for="arrivalTime"><%=dataBundle.getString("adminEditFlight_arrivalTime")%></label>
                            <input name="arrivalTime" id="arrivalTime" type="time" class="form-control" value="<%=arrivalTime%>" required >
                        </div>
                        <div class="col">
                            <label for="planeInventoryId"><%=dataBundle.getString("adminEditFlight_plane")%></label>
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
                            <input class="btn btn-success" type="submit" value="<%=dataBundle.getString("adminEditFlight_editFlight")%>" />&nbsp;&nbsp;
                            <input class="btn btn-danger" type="reset" value="<%=dataBundle.getString("adminEditFlight_reset")%>">
                        </div>
                    </div></br>
                    <input type="hidden" name="flightNumber" value="<%=flightNumber%>" />
                    <input type="hidden" name="id" value="<%=id%>" />
                    <input type="hidden" name="action" value="adminEditFlight" />
                </form></br>
            </div>
        </div>

        <%
        } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("adminEditFlight_noFlightsFound")%></h3>
            <a href="adminRemoveFlight.jsp" class="btn btn-success"><%=dataBundle.getString("adminEditFlight_backToSearch")%></a>
        </div>
        <%
            }
        } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("adminEditFlight_noFlightsFound")%></h3>
            <a href="adminRemoveFlight.jsp" class="btn btn-success"><%=dataBundle.getString("adminEditFlight_backToSearch")%></a>
        </div>
        <%
                }
            } else {
                out.println(dataBundle.getString("adminEditFlight_invalidDetailsPassed"));
            }
        } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("adminEditFlight_mustBeAdmin")%></h3>
            <a href="index.jsp" class="btn btn-success"><%=dataBundle.getString("adminEditFlight_normalUserHomepage")%></a>
        </div>
        <%
            }

        %>
    </body>
</html>
