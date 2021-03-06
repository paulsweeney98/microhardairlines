<%-- 
    Document   : flightStatus
    Created on : 27-Apr-2019, 13:39:40
    Author     : Dean Farrelly
--%>

<%@page import="Validation.Validation"%>
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
        <title><%=dataBundle.getString("flightStatus_title")%></title>
    </head>
    <body>
        
        <%
            Validation v = new Validation();
            
            // Getting today's date
            LocalDate todaysDate = LocalDate.now();
            
            // Getting the current time
            LocalDateTime now = LocalDateTime.now();
            
            ArrayList<Flight> flights = (ArrayList<Flight>) session.getAttribute("flightStatus");
            
            if (flights != null && !flights.isEmpty()) {
        %>
          
        <h3 class='text-center'><%=flights.get(0).getDepartureAirport()%> (<%=flights.get(0).getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("flightStatus_To")%> <%=flights.get(0).getArrivalAirport()%> (<%=flights.get(0).getArrivalAirportAbbreviation()%>)</h3>
        <h3 class='text-center'><%=dataBundle.getString("flightStatus_Date")%> <%=dateFormatter.format(flights.get(0).getDate())%></h3>
        
        <%
                for (Flight flight : flights) {
        %>
        
        <div class="row">
            <div class="col-0 col-md-3"></div>
            
            <!-- Checking if the flight is after today -->
            <% if (flight.getDate().toLocalDate().isAfter(todaysDate)) { %>

            <div class="col-3 col-md-2 border border-success bg-success text-center text-light">
                <h3><%=dataBundle.getString("flightStatus_OnTime")%></h3>
            </div>

            <!-- Checking if the flight is before today -->
            <% } else if (flight.getDate().toLocalDate().isBefore(todaysDate)) { %>
            
            <div class="col-3 col-md-2 border border-primary bg-primary text-center text-light">
                <h3><%=dataBundle.getString("flightStatus_Landed")%></h3>
            </div>
            
            <!-- The flight is either today or before today -->
            <% } else { %>

                <!-- Checking if the flight is in the air -->
                <% if ((flight.getDepartureTime() <= ((now.getHour() * 60) + now.getMinute()) && (flight.getArrivalTime() >= ((now.getHour() * 60) + now.getMinute())))) { %>
                <div class="col-3 col-md-2 border border-danger bg-danger text-center text-light">
                    <h3><%=dataBundle.getString("flightStatus_InAir")%></h3>
                </div>

                <!-- Checking if the flight hasn't left yet -->
                <% } else if ((flight.getDepartureTime() > ((now.getHour() * 60) + now.getMinute()))) { %>
                <div class="col-3 col-md-2 border border-success bg-success text-center text-light">
                    <h3><%=dataBundle.getString("flightStatus_OnTime")%></h3>
                </div>

                <!-- The flight has landed as its arrival time is after the current time -->
                <% } else { %>
                <div class="col-3 col-md-2 border border-primary bg-primary text-center text-light">
                    <h3><%=dataBundle.getString("flightStatus_Landed")%></h3>
                </div>
                <% } %>

            <% } %>
            
            <div class="col-9 col-md-4 border border-primary">
                <p><%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("flightStatus_To")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("flightStatus_DepartsAt")%> <%=v.changeMinutesToHours(flight.getDepartureTime())%> <%=dataBundle.getString("flightStatus_AndArrivesAt")%> <%=v.changeMinutesToHours(flight.getArrivalTime())%></p>
            </div>
            <div class="col-0 col-md-3"></div>
        </div><br>
        
        <%
                }
            } else {
                out.println("No flights found");
            }
        %>
        
    </body>
</html>
