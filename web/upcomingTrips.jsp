<%-- 
    Document   : upcomingTrips
    Created on : 23-Feb-2019, 10:11:30
    Author     : pauls
--%>

<%@page import="Dtos.User_Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.User_FlightDao"%>
<%@page import="Daos.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upcoming Trips</title>
    </head>
    <body>
        <%
            User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
            
            if (loggedInUser != null) {
                ArrayList<User_Flight> distinctUser_Flights = ufDao.getDistinctUser_FlightsByUserId(loggedInUser.getUserId());
                if (distinctUser_Flights != null && !distinctUser_Flights.isEmpty()) {
                    ArrayList<User_Flight> user_flights = new ArrayList<User_Flight>();
                    for (User_Flight distinctUser_Flight : distinctUser_Flights) {
                        
        %>
        
        <div class="row">
            <div class="col-4 text-center border-top border-bottom border-primary rounded">
                <h1 class="float-left"><%=departureTime%></h1>
                <h1 class="float-right"><%=arrivalTime%></h1>
                
                <h2 class="text-center"><%=duration%></h2>
                </br>
                <h3 class="float-left"><%=f.getDepartureAirportAbbreviation()%></h3>
                <h3 class="float-right"><%=f.getArrivalAirportAbbreviation()%></h3>
                
                <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#collapseFares<%=f.getId()%>" aria-expanded="false" aria-controls="collapseFares<%=f.getId()%>">From <%=currencyFormatter.format(standardPrice)%></button>
                
                </br></br>
                <a class="float-left" data-toggle="collapse" href="#collapseFlightDetails<%=f.getId()%>" role="button" aria-expanded="false" aria-controls="collapseFlightDetails<%=f.getId()%>">Flight Details</a>
                <p href="#" class="float-right"><%=f.getFlightNumber()%></p>
                
                </br></br>
                <div class="collapse" id="collapseFares<%=f.getId()%>">
                    <div class="card card-body">
                        
                    </div>
                </div>
                
                </br></br>
                <div class="collapse" id="collapseFlightDetails<%=f.getId()%>">
                    <div class="card card-body">
                        <p>Flight Number: <%=f.getFlightNumber()%></p></br>
                        <p>
                            Flight will leave from <%=f.getDepartureAirport()%> (<%=f.getDepartureAirportAbbreviation()%>) at <%=v.changeMinutesToHours(f.getDepartureTime())%> on <%=dateFormatter.format(f.getDate())%>, 
                            and arrive at <%=f.getArrivalAirport()%> (<%=f.getArrivalAirportAbbreviation()%>) at <%=v.changeMinutesToHours(f.getArrivalTime())%>.
                        </p>
                        <p>
                            <span class="text-danger">WARNING:</span> If you book a standard OR business ticket, you will not be refunded for any 
                            cancellations and you will not be permitted to make changes to your flight. This is a feature only for first class ticket holders.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        
        <%      
                } else {
        %>
        <div class="text-center">
            <h3>You have no flights booked.</h3>
            <a href="index.jsp" class="btn btn-success">Search for flights</a>
        </div>
        <%
                }
            } else {
        %>
        <div class="text-center">
            <h3>Please login</h3>
            <a href="login.jsp" class="btn btn-success">Login</a>
            <a href="register.jsp" class="btn btn-success">Register</a>
        </div>
        <%
            }
        %>
    </body>
</html>
