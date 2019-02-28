<%-- 
    Document   : flights
    Created on : 30-Jan-2019, 10:37:20
    Author     : D00191889
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
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
        <title><%=dataBundle.getString("flights_title")%></title>
    </head>
    <body>
        <%
            ArrayList<Flight> flights = (ArrayList<Flight>) session.getAttribute("flights");
            FlightDao fDao = new FlightDao(Dao.getDatabaseName());
            Validation v = new Validation();
            
            if (flights != null && !flights.isEmpty()) {
            
                Flight flight = flights.get(0);

//                 Cookies evaluate the amount of times a user has search for these flights 
//                 and raises the price if user has shown interest
                double priceInflation = 1;
                boolean cookieFound = false;
                String cookieTest = "Nothing";
                
                Cookie[] cookies = request.getCookies();
                if (cookies != null && cookies.length != 0) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("timesFlightSearched" + flight.getArrivalAirportAbbreviation())) {
                            int timesFlightSearched = Integer.valueOf(cookie.getValue());
                            
                            timesFlightSearched = timesFlightSearched + 1;
                            
                            String stringVersion = Integer.toString(timesFlightSearched);
                            
//                            cookie.setValue(stringVersion);
                            Cookie newCookie = new Cookie("timesFlightSearched" + flight.getArrivalAirportAbbreviation(), stringVersion);
                            response.addCookie(newCookie);
                            
                            
                            if ((timesFlightSearched > 2) && (timesFlightSearched <= 4)) {
                                priceInflation = 1.2;
                            } else if (timesFlightSearched > 4) {
                                priceInflation = 1.3;
                            }
                            
                            cookieFound = true;
                            cookieTest = "Cookie created " + cookie.getValue();
                        }
                    }
                }
                
                if (cookieFound == false) {
                    if (flight.getArrivalAirportAbbreviation().equals("DUB")) {
                        Cookie newCookie = new Cookie("timesFlightSearched" + flight.getArrivalAirportAbbreviation() + flight.getDate(), "1");
                        response.addCookie(newCookie);
                        cookieTest = "Cookie being created" + newCookie.getValue();
                    } else if (flight.getArrivalAirportAbbreviation().equals("LHR")) {
                        Cookie timesFlightSearchedLHR = new Cookie("timesFlightSearchedLHR", "1");
                        response.addCookie(timesFlightSearchedLHR);
                    } else if (flight.getArrivalAirportAbbreviation().equals("CDG")) {
                        Cookie timesFlightSearchedCDG = new Cookie("timesFlightSearchedCDG", "1");
                        response.addCookie(timesFlightSearchedCDG);
                    } else if (flight.getArrivalAirportAbbreviation().equals("JFK")) {
                        Cookie timesFlightSearchedJFK = new Cookie("timesFlightSearchedJFK", "1");
                        response.addCookie(timesFlightSearchedJFK);
                    }
                }

                String numPassengers = request.getParameter("numPassengers");
                String returnDate = request.getParameter("returnDate");
                String departureFlightId = request.getParameter("departureFlightId");
                String departureFlightPricePaid = request.getParameter("departureFlightPricePaid");
                String departureFlightTravelClass = request.getParameter("departureFlightTravelClass");

                String bookingStage = "one_way";

                if (departureFlightId != null && !departureFlightId.equals("") && departureFlightPricePaid != null && !departureFlightPricePaid.equals("") && departureFlightTravelClass != null && !departureFlightTravelClass.equals("")) {
                    bookingStage = "return2";
                } else if (returnDate != null && !returnDate.equals("")) {
                    bookingStage = "return1";
                }
        %>
        <h1 class="text-center"><%=dataBundle.getString("flights_flightsFrom")%> <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("flights_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>)</h1></br>
        
        <%
            // Getting the searched for date
            java.sql.Date searchedDate = flight.getDate();
            LocalDate searchedDateLD = searchedDate.toLocalDate();
        %>
        <% if (bookingStage.equals("one_way")) { %>
        <div class="row mt-3">
            <div class="col-2"></div>
            <div class="col-8 text-center">
                <ul class="nav nav-tabs">
                    <% if (searchedDateLD.minusDays(4).isAfter(LocalDate.now())) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(4))%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(4)))%></a>
                    </li>
                    <% } else {%>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(4))%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(4)))%></a>
                    </li>
                    <% } %>
                    <% if (searchedDateLD.minusDays(3).isAfter(LocalDate.now())) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(3))%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(3)))%></a>
                    </li>
                    <% } else {%>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(3))%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(3)))%></a>
                    </li>
                    <% } %>
                    <% if (searchedDateLD.minusDays(2).isAfter(LocalDate.now())) { %>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(2))%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(2)))%></a>
                    </li>
                    <% } else { %>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(2))%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(2)))%></a>
                    </li>
                    <% } %>
                    <% if (searchedDateLD.minusDays(1).isAfter(LocalDate.now())) { %>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(1))%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(1)))%></a>
                    </li>
                    <% } else { %>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(1))%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(1)))%></a>
                    </li>
                    <% } %>
                    <li class="nav-item">
                      <a class="nav-link active" href="#" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD))%></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.plusDays(1))%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.plusDays(1)))%></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.plusDays(2))%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.plusDays(2)))%></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.plusDays(3))%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.plusDays(3)))%></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.plusDays(4))%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.plusDays(4)))%></a>
                    </li>
                </ul>
            </div>
            <div class="col-2"></div>
        </div></br>
        <% } else if (bookingStage.equals("return1")) { %>
        <div class="row mt-3">
            <div class="col-2"></div>
            <div class="col-8 text-center">
                <ul class="nav nav-tabs">
                    <% if (searchedDateLD.minusDays(4).isAfter(LocalDate.now())) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(4))%>&returnDate=<%=returnDate%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(4)))%></a>
                    </li>
                    <% } else {%>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(4))%>&returnDate=<%=returnDate%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(4)))%></a>
                    </li>
                    <% } %>
                    <% if (searchedDateLD.minusDays(3).isAfter(LocalDate.now())) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(3))%>&returnDate=<%=returnDate%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(3)))%></a>
                    </li>
                    <% } else {%>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(3))%>&returnDate=<%=returnDate%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(3)))%></a>
                    </li>
                    <% } %>
                    <% if (searchedDateLD.minusDays(2).isAfter(LocalDate.now())) { %>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(2))%>&returnDate=<%=returnDate%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(2)))%></a>
                    </li>
                    <% } else { %>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(2))%>&returnDate=<%=returnDate%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(2)))%></a>
                    </li>
                    <% } %>
                    <% if (searchedDateLD.minusDays(1).isAfter(LocalDate.now())) { %>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(1))%>&returnDate=<%=returnDate%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(1)))%></a>
                    </li>
                    <% } else { %>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(1))%>&returnDate=<%=returnDate%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(1)))%></a>
                    </li>
                    <% } %>
                    <li class="nav-item">
                      <a class="nav-link active" href="#" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD))%></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.plusDays(1))%>&returnDate=<%=returnDate%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.plusDays(1)))%></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.plusDays(2))%>&returnDate=<%=returnDate%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.plusDays(2)))%></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.plusDays(3))%>&returnDate=<%=returnDate%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.plusDays(3)))%></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.plusDays(4))%>&returnDate=<%=returnDate%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.plusDays(4)))%></a>
                    </li>
                </ul>
            </div>
            <div class="col-2"></div>
        </div></br>
        <%
            } else if (bookingStage.equals("return2")) {
                Flight departureFlight = fDao.getFlightById(v.convertStringToInt(departureFlightId));
                    if (departureFlight != null) {
        %>
        <div class="row mt-3">
            <div class="col-2"></div>
            <div class="col-8 text-center">
                <ul class="nav nav-tabs">
                    <% if (searchedDateLD.minusDays(4).isAfter(departureFlight.getDate().toLocalDate())) { %>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?actio=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(4))%>&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&departureFlightTravelClass=<%=departureFlightTravelClass%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(4)))%></a>
                    </li>
                    <% } else {%>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(4))%>&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&departureFlightTravelClass=<%=departureFlightTravelClass%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(4)))%></a>
                    </li>
                    <% } %>
                    <% if (searchedDateLD.minusDays(3).isAfter(departureFlight.getDate().toLocalDate())) { %>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(3))%>&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&departureFlightTravelClass=<%=departureFlightTravelClass%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(3)))%></a>
                    </li>
                    <% } else {%>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(3))%>&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&departureFlightTravelClass=<%=departureFlightTravelClass%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(3)))%></a>
                    </li>
                    <% } %>
                    <% if (searchedDateLD.minusDays(2).isAfter(departureFlight.getDate().toLocalDate())) { %>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(2))%>&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&departureFlightTravelClass=<%=departureFlightTravelClass%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(2)))%></a>
                    </li>
                    <% } else { %>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(2))%>&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&departureFlightTravelClass=<%=departureFlightTravelClass%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(2)))%></a>
                    </li>
                    <% } %>
                    <% if (searchedDateLD.minusDays(1).isAfter(departureFlight.getDate().toLocalDate())) { %>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(1))%>&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&departureFlightTravelClass=<%=departureFlightTravelClass%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(1)))%></a>
                    </li>
                    <% } else { %>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.minusDays(1))%>&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&departureFlightTravelClass=<%=departureFlightTravelClass%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.minusDays(1)))%></a>
                    </li>
                    <% } %>
                    <li class="nav-item">
                      <a class="nav-link active" href="#" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD))%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.plusDays(1))%>&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&departureFlightTravelClass=<%=departureFlightTravelClass%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.plusDays(1)))%></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.plusDays(2))%>&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&departureFlightTravelClass=<%=departureFlightTravelClass%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.plusDays(2)))%></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.plusDays(3))%>&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&departureFlightTravelClass=<%=departureFlightTravelClass%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.plusDays(3)))%></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="Servlet?action=searchFlight&departureAirport=<%=flight.getDepartureAirport()%>&destinationAirport=<%=flight.getArrivalAirport()%>&numPassengers=<%=numPassengers%>&departureDate=<%=java.sql.Date.valueOf(searchedDateLD.plusDays(4))%>&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&departureFlightTravelClass=<%=departureFlightTravelClass%>" ><%=dateFormatter.format(java.sql.Date.valueOf(searchedDateLD.plusDays(4)))%></a>
                    </li>
                </ul>
            </div>
            <div class="col-2"></div>
        </div></br>
        <% } } %>
        <%
                if (flights != null && !flights.isEmpty()) {
                    for (Flight f: flights) {
                        String departureTime = v.changeMinutesToHours(f.getDepartureTime());
                        String arrivalTime = v.changeMinutesToHours(f.getArrivalTime());
                        String duration = v.changeMinutesToHours2(f.getDuration());
        %>
        
        <%
                // PRICING
                double standardPrice = f.getPrice() * priceInflation;
                double businessPrice = (f.getPrice() * priceInflation) * 1.4;
                double firstClassPrice = (f.getPrice() * priceInflation) * 3;
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
                
                <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#collapseFares<%=f.getId()%>" aria-expanded="false" aria-controls="collapseFares<%=f.getId()%>">From <%=currencyFormatter.format(standardPrice)%></button>
                
                </br></br>
                <a class="float-left" data-toggle="collapse" href="#collapseFlightDetails<%=f.getId()%>" role="button" aria-expanded="false" aria-controls="collapseFlightDetails<%=f.getId()%>">Flight Details</a>
                <p href="#" class="float-right"><%=f.getFlightNumber()%></p>
                
                </br></br>
                <div class="collapse" id="collapseFares<%=f.getId()%>">
                    <div class="card card-body">
                        <div class="row text-left">
                            <div class="col-4 border-right border-muted">
                                <h4 class='text-center'><%=dataBundle.getString("flights_standard")%></h4></br>
                                <p><%=dataBundle.getString("flights_10kgCabinBag")%></p>
                            </div>
                            <div class="col-4 border-right border-muted">
                                <h4 class='text-center'><%=dataBundle.getString("flights_business")%></h4></br>
                                <p><%=dataBundle.getString("flights_10kgCabinBag")%></p>
                                <p><%=dataBundle.getString("flights_20kgCheckedBag")%></p>
                                <p><%=dataBundle.getString("flights_selectSeat")%></p>
                                <p><%=dataBundle.getString("flights_PriorityBoarding")%></p>
                            </div>
                            <div class="col-4">
                                <h4 class='text-center'><%=dataBundle.getString("flights_firstClass")%></h4></br>
                                <p><%=dataBundle.getString("flights_10kgCabinBag")%></p>
                                <p><%=dataBundle.getString("flights_20kgCheckedBag")%></p>
                                <p><%=dataBundle.getString("flights_selectSeat")%></p>
                                <p><%=dataBundle.getString("flights_PriorityBoarding")%></p>
                                <p><%=dataBundle.getString("flights_freeChangesRefunds")%></p>
                                <p><%=dataBundle.getString("flights_loungeAccess")%></p>
                                <p><%=dataBundle.getString("flights_FastTrackSecurity")%></p>
                            </div>
                        </div>
                            
                        <%
                            if (bookingStage.equals("one_way")) {
                        %>
                        <div class="row text-center">
                            <div class="col-4">
                                <a type="submit" class='btn btn-success' href='passengerDetails.jsp?numPassengers=<%=numPassengers%>&departureFlightTravelClass=standard&departureFlightId=<%=f.getId()%>&departureFlightPricePaid=<%=standardPrice%>'><%=currencyFormatter.format(standardPrice)%></a>
                            </div>
                            <div class="col-4">
                                <a class='btn btn-success' href='passengerDetails.jsp?numPassengers=<%=numPassengers%>&departureFlightTravelClass=business&departureFlightId=<%=f.getId()%>&departureFlightPricePaid=<%=businessPrice%>'><%=currencyFormatter.format(businessPrice)%></a>
                            </div>
                            <div class="col-4">
                                <a class='btn btn-success' href='passengerDetails.jsp?numPassengers=<%=numPassengers%>&departureFlightTravelClass=firstClass&departureFlightId=<%=f.getId()%>&departureFlightPricePaid=<%=firstClassPrice%>'><%=currencyFormatter.format(firstClassPrice)%></a>
                            </div>
                        </div>
                        <%
                            } else if (bookingStage.equals("return1")) {
                        %>
                        <div class="row text-center">
                            <div class="col-4">
                                <a type="submit" class='btn btn-success' href='Servlet?action=searchFlight&numPassengers=<%=numPassengers%>&departureFlightTravelClass=standard&departureDate=<%=returnDate%>&departureAirport=<%=f.getArrivalAirport()%>&destinationAirport=<%=f.getDepartureAirport()%>&departureFlightId=<%=f.getId()%>&departureFlightPricePaid=<%=standardPrice%>'><%=currencyFormatter.format(standardPrice)%></a>
                            </div>
                            <div class="col-4">
                                <a class='btn btn-success' href='Servlet?action=searchFlight&numPassengers=<%=numPassengers%>&departureFlightTravelClass=business&departureDate=<%=returnDate%>&departureAirport=<%=f.getArrivalAirport()%>&destinationAirport=<%=f.getDepartureAirport()%>&departureFlightId=<%=f.getId()%>&departureFlightPricePaid=<%=businessPrice%>'><%=currencyFormatter.format(businessPrice)%></a>
                            </div>
                            <div class="col-4">
                                <a class='btn btn-success' href='Servlet?action=searchFlight&numPassengers=<%=numPassengers%>&departureFlightTravelClass=firstClass&departureDate=<%=returnDate%>&departureAirport=<%=f.getArrivalAirport()%>&destinationAirport=<%=f.getDepartureAirport()%>&departureFlightId=<%=f.getId()%>&departureFlightPricePaid=<%=firstClassPrice%>'><%=currencyFormatter.format(firstClassPrice)%></a>
                            </div>
                        </div>
                        <%
                            } else if (bookingStage.equals("return2")) {
                        %>
                        <div class="row text-center">
                            <div class="col-4">
                                <a type="submit" class='btn btn-success' href='passengerDetails.jsp?numPassengers=<%=numPassengers%>&departureFlightTravelClass=<%=departureFlightTravelClass%>&returnFlightTravelClass=standard&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&returnFlightId=<%=f.getId()%>&returnFlightPricePaid=<%=standardPrice%>'><%=currencyFormatter.format(standardPrice)%></a>
                            </div>
                            <div class="col-4">
                                <a class='btn btn-success' href='passengerDetails.jsp?numPassengers=<%=numPassengers%>&departureFlightTravelClass=<%=departureFlightTravelClass%>&returnFlightTravelClass=business&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&returnFlightId=<%=f.getId()%>&returnFlightPricePaid=<%=businessPrice%>'><%=currencyFormatter.format(businessPrice)%></a>
                            </div>
                            <div class="col-4">
                                <a class='btn btn-success' href='passengerDetails.jsp?numPassengers=<%=numPassengers%>&departureFlightTravelClass=<%=departureFlightTravelClass%>&returnFlightTravelClass=firstClass&departureFlightId=<%=departureFlightId%>&departureFlightPricePaid=<%=departureFlightPricePaid%>&returnFlightId=<%=f.getId()%>&returnFlightPricePaid=<%=firstClassPrice%>'><%=currencyFormatter.format(firstClassPrice)%></a>
                            </div>
                        </div>
                        <%
                            }
                        %>
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
            <div class="col-4"></div>
        </div>
        <%
                    }
                }
            } else {
        %>
        <h3><%=dataBundle.getString("flights_noFlightsAvailable")%></h3>
        <a href="index.jsp"><%=dataBundle.getString("flights_searchForDifferentDates")%></a>
        <%
            }
        %>
    </body>
</html>
