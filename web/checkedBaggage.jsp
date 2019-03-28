<%-- 
    Document   : checkedBaggage
    Created on : 07-Feb-2019, 14:59:37
    Author     : D00191889
--%>

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
            
            if (session.getAttribute("departureFlight") != null) {
                int departureFlightId = -1;
                User_Flight departureFlight = (User_Flight) session.getAttribute("departureFlight0");
                departureFlightId = departureFlight.getFlightId();
                
                Flight flight = fDao.getFlightById(departureFlightId);
            
                if (session.getAttribute("returnFlight") != null) {
                    User_Flight returnFlight = (User_Flight) session.getAttribute("returnFlight0");
        %>
        
        <h3 class="ml-3">
            <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_return")%>
            <span class="float-right mr-3"><%=dataBundle.getString("checkedBaggage_total")%>: <%=currencyFormatter.format(departureFlight.getPricePaid() + returnFlight.getPricePaid())%></span>
        </h3>
        <hr></br></br>
        
        <%
                } else {
        %>
        
        <h3 class="ml-3">
            <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_oneWay")%>
            <span class="float-right mr-3"><%=dataBundle.getString("checkedBaggage_total")%>: <%=currencyFormatter.format(departureFlight.getPricePaid())%></span>
        </h3>
        <hr></br></br>
        
        <%
                }
                
                int numPassengers = 0;
                numPassengers = (Integer)session.getAttribute("numPassengers");

                if (numPassengers > 0) {

        %>
        
        <%
            if (session.getAttribute("travelClass") != null) {
                String travelClass = (String)session.getAttribute("travelClass");
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
        
        <!--Checked baggage-->
        <div class="row">
            <div class="col-0 col-md-3"></div>
            <div class="col-12 col-md-6 text-center">
                <form action="Servlet" method="post">
                    <%
                        for (int i = 0; i < numPassengers; i++) {
                            if (session.getAttribute("departureFlight" + i) != null) {
                                departureFlight = (User_Flight) session.getAttribute("departureFlight" + i);
                    %>
                    <div class="form-row">
                        <div class="col">
                            <h3><%=departureFlight.getPassengerFirstName()%> <%=departureFlight.getPassengerLastName()%></h3>
                        </div>
                        <div class="col mr-3 mr-md-0">
                            <label for="weight"><%=dataBundle.getString("checkedBaggage_weight")%></label>
                            <select name="weight<%=i%>" id="weight" class="form-control">
                                <option value="0"><%=dataBundle.getString("checkedBaggage_noBag")%></option>
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
                    </br><a href="Servlet?action=cancelBooking" class="btn btn-light border float-left ml-3 ml-md-0"><%=dataBundle.getString("checkedBaggage_startAgain")%></a>
                    <button type="submit" class="btn btn-success float-right mr-3 mr-md-0"><%=dataBundle.getString("checkedBaggage_submit")%></button>
                    <input type="hidden" name ="action" value="storeCheckedBaggage" />
                </form>
            </div>
            <div class="col-0 col-md-3"></div>
        </div>
        
        <%     
                } else {
                    out.println(dataBundle.getString("checkedBaggage_youMustBookForAtLeastOnePassenger"));
                }
            } else {
                out.println(dataBundle.getString("checkedBaggage_noFlightsFound"));
            }
        %>
    </body>
</html>
