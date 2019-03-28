<%-- 
    Document   : addPriorityBoarding
    Created on : 05-Mar-2019, 16:05:04
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
        <title><%=dataBundle.getString("priorityBoarding_title")%></title>
    </head>
    <body>
        <%

            FlightDao fDao = new FlightDao(Dao.getDatabaseName());
            Validation v = new Validation();

            // If a user is adding priority boarding to a flight that's already been booked
            if (loggedInUser != null) {

                int flightId = v.convertStringToInt(request.getParameter("flightId"));
                int userId = v.convertStringToInt(request.getParameter("userId"));

                if (flightId > -1 && userId > -1) {
                    Flight flight = fDao.getFlightById(flightId);
                    User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
                    ArrayList<User_Flight> user_flights = ufDao.getUser_FlightsByFlightIdUserId(flightId, userId);

                    if (flight != null && user_flights != null && !user_flights.isEmpty()) {
                        for (int i = 0; i < user_flights.size(); i++) {
                            session.setAttribute("departureFlight" + i, user_flights.get(i));
                        }

                        //session.setAttribute("departureFlight0", user_flights.get(0));
                        session.setAttribute("departureFlight", user_flights.get(0));
                        session.setAttribute("numPassengers", user_flights.size());
                        boolean firstClassOnly = true;
                        boolean standardOnly = true;
                        for (User_Flight user_flight : user_flights) {
                            if (user_flight.getTravelClass().equals("standard") || user_flight.getTravelClass().equals("business")) {
                                firstClassOnly = false;
                            }
                            if (user_flight.getTravelClass().equals("business") || user_flight.getTravelClass().equals("firstClass")) {
                                standardOnly = false;
                            }
                        }

                        if (firstClassOnly == false) {
                            if (standardOnly == false) {
                                session.setAttribute("travelClass", "business");
                            } else {
                                session.setAttribute("travelClass", "standard");
                            }
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
        %>

        <h3>
            &nbsp;&nbsp;<%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_oneWay")%>
            <span class="float-right"><%=dataBundle.getString("priorityBoarding_total")%>: <%=currencyFormatter.format(departureFlight.getPricePaid())%>&nbsp;&nbsp;</span>
        </h3>
        <hr></br></br>

        <%
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
                <p><%=dataBundle.getString("priorityBoarding_wouldYouLikePriorityBoarding")%></p>
                <form action="Servlet" method="post">
                    <% for (int i = 0; i < numPassengers; i++) {
                            if (session.getAttribute("departureFlight" + i) != null) {
                                departureFlight = (User_Flight) session.getAttribute("departureFlight" + i);
                                if (departureFlight.getQueue().equals("non-priority")) {
                    %>
                    <div class="form-row">
                        <div class="col">
                            <h3><%=departureFlight.getPassengerFirstName()%> <%=departureFlight.getPassengerLastName()%></h3>
                        </div>
                        <div class="col">
                            <input type="checkbox" name="priorityBoarding<%=i%>" value="<%=dataBundle.getString("priorityBoarding_yes")%>" class="form-control">
                        </div>
                    </div>
                    <%
                                } else {
                                %>
                                <div class="form-row">
                                    <div class="col">
                                        <h3><%=departureFlight.getPassengerFirstName()%> <%=departureFlight.getPassengerLastName()%></h3>
                                    </div>
                                    <div class="col">
                                        <%=dataBundle.getString("priorityBoarding_alreadyHasPriority")%>
                                    </div>
                                </div>
                                <%
                                }
                            }
                        }
                    %>
                    </br><button type="submit" class="btn btn-success"><%=dataBundle.getString("priorityBoarding_submit")%></button>
                    <input type="hidden" name ="action" value="addPriorityBoarding"/>
                </form>
            </div>
            <div class="col-3"></div>
        </div>

        <%
                }
            }

        %>


        <%                } else {
                    out.println(dataBundle.getString("priorityBoarding_youMustBookForAtLeastOnePassenger"));
                }
            } else {
                out.println(dataBundle.getString("priorityBoarding_noFlightsFound"));
            }
        %>
    </body>
</html>
