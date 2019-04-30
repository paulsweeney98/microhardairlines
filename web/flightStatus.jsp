<%-- 
    Document   : flightStatus
    Created on : 27-Apr-2019, 13:39:40
    Author     : Dean Farrelly
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Dtos.Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight Status</title>
    </head>
    <body>
        
        <%
            // Getting the current time
            LocalDateTime now = LocalDateTime.now();
            
            ArrayList<Flight> flights = (ArrayList<Flight>) session.getAttribute("flightStatus");
            
            if (flights != null && !flights.isEmpty()) {
                for (Flight flight : flights) {
        %>
        
        <div class="row">
            <div class="col-0 col-md-3"></div>
            <div class="col-12 col-md-6 border border-primary">
                <% if ((flight.getDepartureTime() <= ((now.getHour() * 60) + now.getMinute()) && (flight.getArrivalTime() >= ((now.getHour() * 60) + now.getMinute())))) { %>
                <div class="col-4 bg-danger text-center">
                    <h3>In Air</h3>
                </div>
                <% } else if ((flight.getDepartureTime() > ((now.getHour() * 60) + now.getMinute()))) { %>
                <div class="col-4 bg-success text-center">
                    <h3>On Time</h3>
                </div>
                <% } else { %>
                <div class="col-4 bg-primary text-center">
                    <h3>Landed</h3>
                </div>
                <% } %>
                
                <div class="col-12">
                    From <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) to <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>)
                </div>
            </div>
            <div class="col-0 col-md-3"></div>
        </div>
        
        <%
                }
            } else {
                out.println("No flights found");
            }
        %>
        
    </body>
</html>
