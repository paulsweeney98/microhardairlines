<%-- 
    Document   : cancelFlight
    Created on : 26-Feb-2019, 09:32:09
    Author     : D00191889
--%>

<%@page import="Dtos.Flight"%>
<%@page import="Daos.FlightDao"%>
<%@page import="Dtos.User_Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.User_FlightDao"%>
<%@page import="Daos.Dao"%>
<%@page import="Validation.Validation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("cancelFlight_title")%></title>
    </head>
    <body>
        <%
            Validation v = new Validation();
            User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
            FlightDao fDao = new FlightDao(Dao.getDatabaseName());
            
            if (loggedInUser != null) {
            
                int flightId = v.convertStringToInt(request.getParameter("flightId"));
                int userId = v.convertStringToInt(request.getParameter("userId"));

                if (flightId > -1 && userId > -1) {
                    Flight flight = fDao.getFlightById(flightId);
                    ArrayList<User_Flight> user_flights = ufDao.getUser_FlightsByFlightIdUserId(flightId, userId);
                    
                    if (flight != null && user_flights != null && !user_flights.isEmpty()) {
        %>
        <h3 class='text-center'>
            &nbsp;&nbsp;<%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>)
        </h3>
        <hr></br></br>
        
        <%
            // Checking of all of the bookings for this user and flight are first class for refund reasons
            boolean firstClassOnly = true;
            for (User_Flight user_flight : user_flights) {
                if (user_flight.getTravelClass().equals("standard") || user_flight.getTravelClass().equals("business")) {
                    firstClassOnly = false;
                }
            }
            
            if (firstClassOnly == false) {
        %>
        <div class="row">
            <div class="col-0 col-md-4"></div>
            <div class="col-12 col-md-4 border-top border-bottom border-primary rounded">
                </br><p class="ml-3 ml-md-0 mr-3 mr-md-0"><%=dataBundle.getString("cancelFlight_youAreAboutToCancelNoRefund")%></p>
                <div class='text-center'>
                    <a href='upcomingTrips.jsp' class='btn btn-success'><%=dataBundle.getString("cancelFlight_goBack")%></a>
                    <a href='Servlet?action=cancelFlight&flightId=<%=flight.getId()%>&userId=<%=loggedInUser.getUserId()%>' class='btn btn-danger'><%=dataBundle.getString("cancelFlight_title")%></a>
                </div></br>
            </div>
            <div class="col-0 col-md-4"></div>
        </div>
        
        <% } else { %>
        
        <div class="row">
            <div class="col-0 col-md-4"></div>
            <div class="col-12 col-md-4 border-top border-bottom border-primary rounded">
                </br><p class="ml-3 ml-md-0 mr-3 mr-md-0"><%=dataBundle.getString("cancelFlight_youAreAboutToCancelRefund")%></p>
                <div class='text-center'>
                    <a href='upcomingTrips.jsp' class='btn btn-success'><%=dataBundle.getString("cancelFlight_goBack")%></a>
                    <a href='Servlet?action=cancelFlight&flightId=<%=flight.getId()%>&userId=<%=loggedInUser.getUserId()%>' class='btn btn-danger'><%=dataBundle.getString("cancelFlight_title")%></a>
                </div></br>
            </div>
            <div class="col-0 col-md-4"></div>
        </div>
        
        <% } %>
        <%          } else {
                        out.println(dataBundle.getString("cancelFlight_noBookingsFound"));
                    }
                } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("cancelFlight_noFlightsBooked")%></h3>
            <a href="index.jsp" class="btn btn-success"><%=dataBundle.getString("cancelFlight_searchForFlights")%></a>
        </div>
        <%
                }
            } else {
                out.println(dataBundle.getString("cancelFlight_noBookingsFound"));
            }
        %>
    </body>
</html>
