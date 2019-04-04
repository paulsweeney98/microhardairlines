<%-- 
    Document   : bookingConfirmation
    Created on : 02-Apr-2019, 12:37:52
    Author     : Paul Sweeney
--%>

<%@page import="Dtos.Checked_baggage"%>
<%@page import="Dtos.Flight"%>
<%@page import="Dtos.User_Flight"%>
<%@page import="Validation.Validation"%>
<%@page import="Daos.FlightDao"%>
<%@page import="Daos.Dao"%>
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
            if (loggedInUser != null) {
        %>

        <div class="jumbotron jumbotron-fluid bg-primary text-light">
            <div class="container">
                <h1 class="display-4">Booking Confirmed!</h1>
                <p class="lead">Thank you for booking this flight, <%=loggedInUser.getFirstName()%> <%=loggedInUser.getLastName()%></p>
            </div>
        </div>
        
        <%
                FlightDao fDao = new FlightDao(Dao.getDatabaseName());
                Validation v = new Validation();

                // Get number of passengers
                int numPassengers = -1;
                numPassengers = (Integer) session.getAttribute("numPassengers");

                if (session.getAttribute("departureFlight") != null && numPassengers > 0) {
                    int departureFlightId = -1;
                    User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight0");
                    departureFlightId = departureFlight.getFlightId();

                    Flight flight = fDao.getFlightById(departureFlightId);

                    // Get departure checked baggage prices
                    double departureCheckedBaggagePrice = 0;
                    if (session.getAttribute("departureFlightCheckedBaggage0") != null) {
                        for (int i = 0; i < numPassengers; i++) {
                            Checked_baggage checkedBaggage = (Checked_baggage) session.getAttribute("departureFlightCheckedBaggage" + i);
                            departureCheckedBaggagePrice = departureCheckedBaggagePrice + checkedBaggage.getPricePaid();
                        }
                    }

                    if (session.getAttribute("returnFlight") != null) {
                        User_Flight returnFlight = (User_Flight) session.getAttribute("returnFlight0");
                        Flight returnFlightObject = fDao.getFlightById(returnFlight.getFlightId());

                        // Get return checked baggage prices
                        double returnCheckedBaggagePrice = 0;
                        if (session.getAttribute("returnFlightCheckedBaggage0") != null) {
                            for (int i = 0; i < numPassengers; i++) {
                                Checked_baggage checkedBaggage = (Checked_baggage) session.getAttribute("returnFlightCheckedBaggage" + i);
                                returnCheckedBaggagePrice = returnCheckedBaggagePrice + checkedBaggage.getPricePaid();
                            }
                        }
        %>

        <h3 class="ml-3">
            <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_return")%> - <%=dateFormatter.format(flight.getDate())%> <%=dataBundle.getString("passengerDetails_to")%> <%=dateFormatter.format(returnFlightObject.getDate())%>
            <span class="float-right mr-3"><%=dataBundle.getString("paymentDetails_total")%> <%=currencyFormatter.format(departureFlight.getPricePaid() + returnFlight.getPricePaid() + departureCheckedBaggagePrice + returnCheckedBaggagePrice)%>&nbsp;&nbsp;</span>
        </h3>
        <hr></br>

        <%
        } else {
        %>

        <h3 class="ml-3">
            <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_oneWay")%> - <%=dateFormatter.format(flight.getDate())%>
            <span class="float-right mr-3"><%=dataBundle.getString("paymentDetails_total")%> <%=currencyFormatter.format(departureFlight.getPricePaid() + departureCheckedBaggagePrice)%>&nbsp;&nbsp;</span>
        </h3>
        <hr></br>

        <%
            }

            if (numPassengers > 0) {

        %>

        <div class="row text-center">
            <div class="col-0 col-md-2"></div>
            <div class="col-0 col-md-8 flex-wrap">
                <h3><%=dataBundle.getString("paymentDetails_passengersBooked")%>Passengers Booked:</h3>
                <%
                    for (int i = 0; i < numPassengers; i++) {
                        if (session.getAttribute("departureFlight" + i) != null && session.getAttribute("departureFlightCheckedBaggage" + i) != null) {
                            departureFlight = (User_Flight) session.getAttribute("departureFlight" + i);
                            Checked_baggage departureFlightCheckedBaggage = (Checked_baggage) session.getAttribute("departureFlightCheckedBaggage" + i);
                %>

                <div class="col-4 border border-primary rounded">
                    <%=departureFlight.getPassengerFirstName()%> <%=departureFlight.getPassengerLastName()%>
                    </br><%=dataBundle.getString("paymentDetails_checkedBaggage")%>: <%=departureFlightCheckedBaggage.getWeight()%> kg
                </div>

                <%
                        }
                    }
                %>
            </div>
            <div class="col-0 col-md-2"></div>
        </div>
            
        <div class="row text-center">
            <div class="col-0 col-md-2"></div>
            <div class="col-0 col-md-8">
                <div class="col border border-primary rounded">
                    <h3>View Upcoming Trips</h3></br>
                    <a href="upcomingTrips.jsp" class="btn btn-success">View</a>
                </div>
                <%
                    if (departureFlight.getTravelClass().equals("standard")) {
                %>
                <div class="col border border-primary rounded">
                    <h3>Add Priority Boarding to your departure flight</h3></br>
                    <a href="addPriorityBoarding.jsp?flightId=<%=flight.getId()%>&userId=<%=loggedInUser.getUserId()%>" class="btn btn-success">Add</a>
                </div>
                <%
                    }
                %>
                <div class="col border border-primary rounded">
                    <h3>Add Checked Baggage</h3></br>
                    <a href="#" class="btn btn-success"></a>
                </div>
                <div class="col border border-primary rounded">
                    <h3></h3></br>
                    <a href="#" class="btn btn-success"></a>
                </div>
            </div>
            <div class="col-0 col-md-2"></div>
        </div>

        <%
                } else {
                    out.println(dataBundle.getString("paymentDetails_invalidNumber"));
                }
            } else {
                out.println(dataBundle.getString("paymentDetails_noFlightFound"));
            }

        } else {
        %>

        <div class="text-center">
            <h3><%=dataBundle.getString("paymentDetails_youMustLoginOrRegister")%></h3></br>
            <a href="login.jsp?booking=true" class="btn btn-success"><%=dataBundle.getString("login_login")%></a>&nbsp;&nbsp;
            <a href="register.jsp?booking=true" class="btn btn-success"><%=dataBundle.getString("login_dontHaveAnAccountRegisterHere")%></a>
        </div>

        <%
            }

            // Remove all attributes for the flights
            session.removeAttribute("numPassengers");
            session.removeAttribute("departureFlight");
            session.removeAttribute("returnFlight");
            for (int i = 0; i <= 10; i++) {
                session.removeAttribute("departureFlight" + i);
                session.removeAttribute("returnFlight" + i);
                session.removeAttribute("departureFlightCheckedBaggage" + i);
                session.removeAttribute("returnFlightCheckedBaggage" + i);
            }
        %>
    </body>
</html>
