<%-- 
    Document   : adminSearchFlightResults
    Created on : 07-Mar-2019, 15:52:08
    Author     : D00191889
--%>

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
        <title><%=dataBundle.getString("adminSearchFlightResults_title")%></title>
    </head>
    <body>
        <%
            if (loggedInUser != null && loggedInUser.getPrivileges() == 2) {
                FlightDao fDao = new FlightDao(Dao.getDatabaseName());
                Validation v = new Validation();

                String departureAirport = request.getParameter("departureAirport");
                String destinationAirport = request.getParameter("destinationAirport");
                String departureDateString = request.getParameter("departureDate");

                if (departureAirport != null && !departureAirport.isEmpty() && destinationAirport != null && !destinationAirport.isEmpty() && departureDateString != null && !departureDateString.isEmpty()) {
                    java.sql.Date departureDate = java.sql.Date.valueOf(departureDateString);
                    ArrayList<Flight> flights = fDao.getFlightsByLocationsDepartureDatePassengerNum(departureAirport, destinationAirport, departureDate, 0);
                    if (flights != null && !flights.isEmpty()) {
                        for (Flight f : flights) {
                            String departureTime = v.changeMinutesToHours(f.getDepartureTime());
                            String arrivalTime = v.changeMinutesToHours(f.getArrivalTime());
                            String duration = v.changeMinutesToHours2(f.getDuration());
        %>
        
        <div class="row mt-3">
            <div class="col-4"></div>
            <div class="col-4 text-center border-top border-bottom border-primary rounded">
                <h1 class="float-left"><%=departureTime%></h1>
                <h1 class="float-right"><%=arrivalTime%></h1>
                
                <h2 class="text-center"><%=duration%></h2>
                </br>
                <h3 class="float-left"><%=f.getDepartureAirportAbbreviation()%></h3>
                <h3 class="float-right"><%=f.getArrivalAirportAbbreviation()%></h3>
                
                <a href="adminEditFlight.jsp?flightId=<%=f.getId()%>" class="btn btn-success"><%=dataBundle.getString("adminSearchFlightResults_editFlight")%></a>
                <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseRemove<%=f.getId()%>" aria-expanded="false" aria-controls="collapseRemove<%=f.getId()%>"><%=dataBundle.getString("adminSearchFlightResults_removeFlight")%></button>
                
                </br></br>
                <p href="#" class="float-right"><%=f.getFlightNumber()%></p>
                
                </br></br>
                <div class="collapse" id="collapseRemove<%=f.getId()%>">
                    <div class="card card-body">
                        <p><%=dataBundle.getString("adminSearchFlightResults_areYouSure")%></p>
                        <a href="Servlet?action=adminRemoveFlight&flightId=<%=f.getId()%>" class="btn btn-danger"><%=dataBundle.getString("adminSearchFlightResults_removeFlight")%></a>
                    </div>
                </div>
            </div>
            <div class="col-4"></div>
        </div>
        <%
                        }
                    } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("adminSearchFlightResults_noFlightsFound")%></h3>
            <a href="adminSearchFlight.jsp" class="btn btn-success"><%=dataBundle.getString("adminSearchFlightResults_backToSearch")%></a>
        </div>
        <%
                    }
                } else {
                    out.println(dataBundle.getString("adminSearchFlightResults_invalidDetailsPassed"));
                }
            } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("adminSearchFlightResults_mustBeAdmin")%></h3>
            <a href="index.jsp" class="btn btn-success"><%=dataBundle.getString("adminSearchFlightResults_normalUserHomepage")%></a>
        </div>
        <%
            }
        %>
    </body>
</html>
