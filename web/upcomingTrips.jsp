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
        <title><%=dataBundle.getString("upcomingTrips_title")%></title>
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
            <div class="col-0 col-md-4"></div>
            <div class="col-12 col-md-4 text-center border-top border-bottom border-primary rounded">
                <h1 class="float-left ml-3 ml-md-0"><%=v.changeMinutesToHours(flight.getDepartureTime())%></h1>
                <h1 class="float-right mr-3 mr-md-0"><%=v.changeMinutesToHours(flight.getArrivalTime())%></h1>
                
                <h2 class="text-center"><%=flight.getArrivalAirport()%></h2>
                </br>
                <h3 class="float-left ml-3 ml-md-0"><%=flight.getDepartureAirportAbbreviation()%></h3>
                <h3 class="float-right mr-3 mr-md-0"><%=flight.getArrivalAirportAbbreviation()%></h3>
                
                <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#manageBooking<%=flight.getId()%>" aria-expanded="false" aria-controls="manageBooking<%=flight.getId()%>"><%=dataBundle.getString("upcomingTrips_manageBooking")%></button>
                
                </br></br>
                <a class="float-left ml-3 ml-md-0" data-toggle="collapse" href="#collapseFlightDetails<%=flight.getId()%>" role="button" aria-expanded="false" aria-controls="collapseFlightDetails<%=flight.getId()%>"><%=dataBundle.getString("upcomingTrips_flightDetails")%></a>
                <p class="float-right mr-3 mr-md-0"><%=dataBundle.getString("upcomingTrips_passengersBooked")%>: <%=numPassengers%></p>
                
                </br></br>
                <div class="collapse" id="manageBooking<%=flight.getId()%>">
                    <div class="card card-body">
                        <div class="row text-center">
                            <%
                                // For loop needed to check all passenger seats
                                boolean allCheckedInStandard = true;
                                boolean allCheckedInBusiness = true;
                                boolean allCheckedInFirstClass = true;
                                for (User_Flight user_flight : user_flights) {
                                    if ((user_flight.getSeat() == null) && (user_flight.getTravelClass().equals("firstClass"))) {
                                        allCheckedInFirstClass = false;
                                    } else if ((user_flight.getSeat() == null) && (user_flight.getTravelClass().equals("business"))) {
                                        allCheckedInBusiness = false;
                                    } else if ((user_flight.getSeat() == null) && (user_flight.getTravelClass().equals("standard"))) {
                                        allCheckedInStandard = false;
                                    }
                                }
                                
                                // Checks to see if the flight is short haul or long haul
                                // Flight is long haul if it goes in here
                                if (flight.getArrivalAirportAbbreviation().equals("JFK") || flight.getDepartureAirportAbbreviation().equals("JFK")) {
                                    // Checks to see if the booking is standard, business or first class and sends user to the appropriate check in page
                                    if (allCheckedInFirstClass == false) {
                            %>
                            <div class="col-6">
                                <a href="seatSelectionFirstClassLH.jsp?flightId=<%=user_flights.get(0).getFlightId()%>" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_checkIn")%></a>
                            </div>
                            <%
                                    // Checks to see if the booking is standard, business or first class and sends user to the appropriate check in page
                                    } else if (allCheckedInBusiness == false) {
                            %>
                            <div class="col-6">
                                <a href="seatSelectionBusinessLH.jsp?flightId=<%=user_flights.get(0).getFlightId()%>" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_checkIn")%></a>
                            </div>
                            <%
                                    // Checks to see if the booking is standard, business or first class and sends user to the appropriate check in page
                                    } else if (allCheckedInStandard == false) {
                            %>
                            <div class="col-6">
                                <a href="seatSelectionStandardLH.jsp?flightId=<%=user_flights.get(0).getFlightId()%>" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_checkIn")%></a>
                            </div>
                            <%
                                    // In this case there are no passengers on this booking that need to be checked in
                                    } else {
                            %>
                            <div class="col-6">
                                <a href="boardingPass.jsp?flightId=<%=user_flights.get(0).getFlightId()%>" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_boardingPass")%></a>
                            </div>
                            <%
                                    }
                                    // Flight is short haul if it goes in here
                                } else {
                                    // Checks to see if the booking is standard, business or first class and sends user to the appropriate check in page
                                    if (allCheckedInFirstClass == false) {
                            %>
                            <div class="col-6">
                                <a href="seatSelectionFirstClassSH.jsp?flightId=<%=user_flights.get(0).getFlightId()%>" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_checkIn")%></a>
                            </div>
                            <%
                                    // Checks to see if the booking is standard, business or first class and sends user to the appropriate check in page
                                    } else if (allCheckedInBusiness == false) {
                            %>
                            <div class="col-6">
                                <a href="seatSelectionBusinessSH.jsp?flightId=<%=user_flights.get(0).getFlightId()%>" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_checkIn")%></a>
                            </div>
                            <%
                                    // Checks to see if the booking is standard, business or first class and sends user to the appropriate check in page
                                    } else if (allCheckedInStandard == false) {
                            %>
                            <div class="col-6">
                                <a href="seatSelectionStandardSH.jsp?flightId=<%=user_flights.get(0).getFlightId()%>" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_checkIn")%></a>
                            </div>
                            <%
                                    // In this case there are no passengers on this booking that need to be checked in
                                    } else {
                            %>
                            <div class="col-6">
                                <a href="boardingPass.jsp?flightId=<%=user_flights.get(0).getFlightId()%>" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_boardingPass")%></a>
                            </div>
                            <%
                                    }
                                }
                                
                                // For loop to check priority status
                                boolean allPriority = true;
                                
                                for (User_Flight user_flight : user_flights) {
                                    if (user_flight.getQueue().equals("non-priority")) {
                                        allPriority = false;
                                    }
                                }
                                
                                if (allPriority == false) {
                            %>
                            <div class="col-6">
                                <a href="addPriorityBoarding.jsp?flightId=<%=flight.getId()%>&userId=<%=loggedInUser.getUserId()%>" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_priorityBoarding")%></a>
                            </div>
                            <%
                                }
                            %>
                        </div></br>
                            
                        <div class="row text-center">
                            <div class="col-6">
                                <a href="cancelFlight.jsp?flightId=<%=flight.getId()%>&userId=<%=loggedInUser.getUserId()%>" class="btn btn-danger"><%=dataBundle.getString("upcomingTrips_cancelFlight")%></a>
                            </div>
                            <div class="col-6">
                                <a href="addCheckedBaggage.jsp?flightId=<%=flight.getId()%>&userId=<%=loggedInUser.getUserId()%>&travelClass=<%=user_flights.get(0).getTravelClass()%>" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_checkedBaggage")%></a>
                            </div>
                        </div>
                    </div>
                </div>
                
                </br></br>
                <div class="collapse" id="collapseFlightDetails<%=flight.getId()%>">
                    <div class="card card-body">
                        <p><%=dataBundle.getString("upcomingTrips_flightNumber")%>: <%=flight.getFlightNumber()%></p></br>
                        <p>
                            <%=dataBundle.getString("upcomingTrips_flightWillLeaveFrom")%> <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("upcomingTrips_at")%> <%=v.changeMinutesToHours(flight.getDepartureTime())%> <%=dataBundle.getString("upcomingTrips_on")%> <%=dateFormatter.format(flight.getDate())%>, 
                            <%=dataBundle.getString("upcomingTrips_andArriveAt")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("upcomingTrips_at")%> <%=v.changeMinutesToHours(flight.getArrivalTime())%>.
                        </p>
                        <p>
                            <span class="text-danger"><%=dataBundle.getString("upcomingTrips_warning")%>:</span> <%=dataBundle.getString("upcomingTrips_ifYouBookAStandardOrBusinessTicket")%>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-0 col-md-4"></div>
        </div></br>
        
        <%      
                    }
                } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("upcomingTrips_noFlightsBooked")%></h3>
            <a href="index.jsp" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_searchForFlights")%></a>
        </div>
        <%
                }
            } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("upcomingTrips_pleaseLogin")%></h3>
            <a href="login.jsp" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_login")%></a>
            <a href="register.jsp" class="btn btn-success"><%=dataBundle.getString("upcomingTrips_register")%></a>
        </div>
        <%
            }
        %>
    </body>
</html>
