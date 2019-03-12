<%-- 
    Document   : addCheckedBaggage
    Created on : 25-Feb-2019, 17:24:20
    Author     : D00194995
--%>

<%@page import="Daos.User_FlightDao"%>
<%@page import="Dtos.User_Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Dtos.Flight"%>
<%@page import="Daos.FlightDao"%>
<%@page import="Daos.Dao"%>
<%@page import="Validation.Validation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("checkedBaggage_title")%></title>
    </head>
    <body>
        <%

            FlightDao fDao = new FlightDao(Dao.getDatabaseName());
            Validation v = new Validation();

            // If a user is adding checked baggage to a flight that's already been booked
            if (loggedInUser != null) {

                int flightId = v.convertStringToInt(request.getParameter("flightId"));
                int userId = v.convertStringToInt(request.getParameter("userId"));

                if (flightId > -1 && userId > -1) {
                    Flight flight = fDao.getFlightById(flightId);
                    User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
                    ArrayList<User_Flight> user_flights = ufDao.getUser_FlightsByFlightIdUserId(flightId, userId);

                    if (flight != null && user_flights != null && !user_flights.isEmpty()) {
                        for (int i = 0; i < user_flights.size(); i++) {
                            session.setAttribute("departureFlight"+i, user_flights.get(i));
                        }
                        
                        
                        //session.setAttribute("departureFlight0", user_flights.get(0));
                        session.setAttribute("departureFlight", user_flights.get(0));
                        session.setAttribute("numPassengers", user_flights.size());
                        boolean firstClassOnly = true;
                        for (User_Flight user_flight : user_flights) {
                            if (user_flight.getTravelClass().equals("standard") || user_flight.getTravelClass().equals("business")) {
                                firstClassOnly = false;
                            }
                        }

                        if (firstClassOnly == false) {
                            session.setAttribute("travelClass", "standard");
                        } else {
                            session.setAttribute("travelClass", "firstClass");
                        }
                    }
                }
            }
            
            if (session.getAttribute("departureFlight") != null) {
                int departureFlightId = -1;
                User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight0");
                departureFlightId = departureFlight.getFlightId();

                Flight flight = fDao.getFlightById(departureFlightId);

                if (session.getAttribute("returnFlight") != null) {
                    User_Flight returnFlight = (User_Flight) session.getAttribute("returnFlight0");
        %>

        <h3>
            &nbsp;&nbsp;<%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_return")%>
            <span class="float-right"><%=dataBundle.getString("checkedBaggage_total")%>: <%=currencyFormatter.format(departureFlight.getPricePaid() + returnFlight.getPricePaid())%>&nbsp;&nbsp;</span>
        </h3>
        <hr></br></br>

        <%
        } else {
        %>

        <h3>
            &nbsp;&nbsp;<%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_oneWay")%>
            <span class="float-right"><%=dataBundle.getString("checkedBaggage_total")%>: <%=currencyFormatter.format(departureFlight.getPricePaid())%>&nbsp;&nbsp;</span>
        </h3>
        <hr></br></br>

        <%
            }

            int numPassengers = 0;
            numPassengers = (Integer) session.getAttribute("numPassengers");

            if (numPassengers > 0) {

        %>

        <%            if (session.getAttribute("travelClass") != null) {
                String travelClass = (String) session.getAttribute("travelClass");
                if (travelClass.equals("standard")) {
        %>

        <!--Add priority boarding to standard booking-->
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6 text-center">

            </div>
            <div class="col-3"></div>
        </div>

        <%
                }
            }

        %>

        <!--        Seat selection-->

        <!--Checked baggage-->
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6 text-center">
                <form action="Servlet" method="post">
                    <%                        for (int i = 0; i < numPassengers; i++) {
                            if (session.getAttribute("departureFlight" + i) != null) {
                                departureFlight = (User_Flight) session.getAttribute("departureFlight" + i);
                    %>
                    <div class="form-row">
                        <div class="col">
                            <h3><%=departureFlight.getPassengerFirstName()%> <%=departureFlight.getPassengerLastName()%></h3>
                        </div>
                        <div class="col">
                            <label for="weight">Weight</label>
                            <select name="weight<%=i%>" id="weight" class="form-control">
                                <option value="0">No Bag</option>
                                <option value="15">15kg - <%=currencyFormatter.format(20)%> <%=dataBundle.getString("checkedBaggage_perFlight")%></option>
                                <option value="20">20kg - <%=currencyFormatter.format(25)%> <%=dataBundle.getString("checkedBaggage_perFlight")%></option>
                                <option value="25">25kg - <%=currencyFormatter.format(30)%> <%=dataBundle.getString("checkedBaggage_perFlight")%></option>
                                <option value="40">40kg - <%=currencyFormatter.format(65)%> <%=dataBundle.getString("checkedBaggage_perFlight")%></option>
                            </select>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                    </br><button type="submit" class="btn btn-success">Submit</button>
                    <input type="hidden" name ="action" value="addCheckedBaggage" />
                </form>
            </div>
            <div class="col-3"></div>
        </div>

        <%
                } else {
                    out.println("You must book for at least one passenger");
                }
            } else {
                out.println("No flights found");
            }
        %>
    </body>
</html>