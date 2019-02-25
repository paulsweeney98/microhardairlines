<%-- 
    Document   : upcomingTrips
    Created on : 23-Feb-2019, 10:11:30
    Author     : pauls
--%>

<%@page import="Validation.Validation"%>
<%@page import="Dtos.Flight"%>
<%@page import="Daos.FlightDao"%>
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
            FlightDao fDao = new FlightDao(Dao.getDatabaseName());
            Validation v = new Validation();
            
            if (loggedInUser != null) {
                ArrayList<User_Flight> distinctUser_Flights = ufDao.getDistinctUser_FlightsByUserId(loggedInUser.getUserId());
                if (distinctUser_Flights != null && !distinctUser_Flights.isEmpty()) {
                    for (User_Flight distinctUser_Flight : distinctUser_Flights) {
                        Flight flight = fDao.getFlightById(distinctUser_Flight.getFlightId());
                        ArrayList<User_Flight> user_flights = ufDao.getUser_FlightsByFlightIdUserId(distinctUser_Flight.getFlightId(), loggedInUser.getUserId());
                        int numPassengers = user_flights.size();
        %>
        
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4 text-center border-top border-bottom border-primary rounded">
                <h1 class="float-left"><%=v.changeMinutesToHours(flight.getDepartureTime())%></h1>
                <h1 class="float-right"><%=v.changeMinutesToHours(flight.getArrivalTime())%></h1>
                
                <h2 class="text-center"><%=flight.getArrivalAirport()%></h2>
                </br>
                <h3 class="float-left"><%=flight.getDepartureAirportAbbreviation()%></h3>
                <h3 class="float-right"><%=flight.getArrivalAirportAbbreviation()%></h3>
                
                <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#manageBooking<%=flight.getId()%>" aria-expanded="false" aria-controls="manageBooking<%=flight.getId()%>">Manage Booking</button>
                
                </br></br>
                <a class="float-left" data-toggle="collapse" href="#collapseFlightDetails<%=flight.getId()%>" role="button" aria-expanded="false" aria-controls="collapseFlightDetails<%=flight.getId()%>">Flight Details</a>
                <p class="float-right">Passengers Booked: <%=numPassengers%></p>
                
                </br></br>
                <div class="collapse" id="manageBooking<%=flight.getId()%>">
                    <div class="card card-body">
                        <div class="row text-center">
                            <%
                                if (user_flights.get(0).getSeat() == null) {
                                    if (user_flights.get(0).getTravelClass().equals("standard")) {
                            %>
                            <div class="col-6">
                                <a href="seatSelectionStandard.jsp?flightId=<%=user_flights.get(0).getFlightId()%>" class="btn btn-success">Check In</a>
                            </div>
                            <%
                                    } else if (user_flights.get(0).getTravelClass().equals("business")) {
                            %>
                            <div class="col-6">
                                <a href="seatSelectionBusiness.jsp?flightId=<%=user_flights.get(0).getFlightId()%>" class="btn btn-success">Check In</a>
                            </div>
                            <%
                                    } else if (user_flights.get(0).getTravelClass().equals("firstClass")) {
                            %>
                            <div class="col-6">
                                <a href="seatSelectionFirstClass.jsp?flightId=<%=user_flights.get(0).getFlightId()%>" class="btn btn-success">Check In</a>
                            </div>
                            <%
                                    }
                                }
                            %>
                            
                            <%
                                if (user_flights.get(0).getQueue().equals("non-priority")) {
                            %>
                            <div class="col-6">
                                <a href="#" class="btn btn-success">Priority Boarding</a>
                            </div>
                            <%
                                }
                            %>
                        </div></br>
                            
                        <div class="row text-center">
                            <div class="col-6">
                                <a href="Servlet?flightId=<%=flight.getId()%>&userId=<%=loggedInUser.getUserId()%>" class="btn btn-success">Cancel Flight</a>
                            </div>
                            <div class="col-6">
                                <a href="#" class="btn btn-success">Checked Baggage</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                </br></br>
                <div class="collapse" id="collapseFlightDetails<%=flight.getId()%>">
                    <div class="card card-body">
                        <p>Flight Number: <%=flight.getFlightNumber()%></p></br>
                        <p>
                            Flight will leave from <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) at <%=v.changeMinutesToHours(flight.getDepartureTime())%> on <%=dateFormatter.format(flight.getDate())%>, 
                            and arrive at <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) at <%=v.changeMinutesToHours(flight.getArrivalTime())%>.
                        </p>
                        <p>
                            <span class="text-danger">WARNING:</span> If you book a standard OR business ticket, you will not be refunded for any 
                            cancellations and you will not be permitted to make changes to your flight. This is a feature only for first class ticket holders.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-4"></div>
        </div></br>
        
        <%      
                    }
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
