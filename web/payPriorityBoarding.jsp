<%-- 
    Document   : payPriorityBoarding
    Created on : 08-Mar-2019, 15:21:00
    Author     : Gerard
--%>

<%@page import="Dtos.User_Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dtos.Flight"%>
<%@page import="Validation.Validation"%>
<%@page import="Daos.FlightDao"%>
<%@page import="Daos.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("paymentDetails_title")%></title>
    </head>
    <body>
        <%
            if (loggedInUser != null) {

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

                    // Get Priority Boarding price
                    double priorityBoardingPrice = 0;
                    if (session.getAttribute("departureFlightPriorityBoarding0") != null) {
                        for (int i = 0; i < numPassengers; i++) {
                            User_Flight priorityBoarding = (User_Flight) session.getAttribute("departureFlightPriorityBoarding" + i);
                            if (priorityBoarding.getQueue().equals("priority")) {
                                priorityBoardingPrice += 50.00;
                            }
                        }
                    }

        %>

        <h3>
            &nbsp;&nbsp;<%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_oneWay")%>
            <span class="float-right">Total: <%=currencyFormatter.format(priorityBoardingPrice)%>&nbsp;&nbsp;</span>
        </h3>
        <hr></br></br>

        <%

            if (numPassengers > 0) {

        %>

        <div class="row text-center">
            <%            for (int i = 0; i < numPassengers; i++) {
                    if (session.getAttribute("departureFlight" + i) != null && session.getAttribute("departureFlightPriorityBoarding" + i) != null) {
                        departureFlight = (User_Flight) session.getAttribute("departureFlight" + i);
                        User_Flight priorityBoarding = (User_Flight) session.getAttribute("departureFlightPriorityBoarding" + i);
                        if (priorityBoarding.getQueue().equals("priority")) {
            %>

            <div class="col border border-primary rounded">
                <%=departureFlight.getPassengerFirstName()%> <%=departureFlight.getPassengerLastName()%>
                </br><%=dataBundle.getString("paymentDetails_priorityBoarding")%>: Yes
            </div>

            <%
            } else {
            %>

            <div class="col border border-primary rounded">
                <%=departureFlight.getPassengerFirstName()%> <%=departureFlight.getPassengerLastName()%>
                </br><%=dataBundle.getString("paymentDetails_priorityBoarding")%>: No
            </div>

            <%
                        }
                    }
                }
            %>
        </div>

        </br>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <form action="Servlet" method="post">
                    </br></br>
                    <h3 class=""><%=dataBundle.getString("paymentDetails_paymentDetails")%></h3>
                    <div class="form-row">
                        <div class="col-3">
                            <label for="type"><%=dataBundle.getString("paymentDetails_cardType")%></label>
                            <select name="type" id="type" class="form-control">
                                <option value="visa"><%=dataBundle.getString("paymentDetails_visa")%></option>
                                <option value="mastercard"><%=dataBundle.getString("paymentDetails_mastercard")%></option>
                            </select>
                        </div>
                        <div class="col-9">
                            <label for="number"><%=dataBundle.getString("paymentDetails_cardNumber")%></label>
                            <input name="number" type="text" id="number" class="form-control" size="30" pattern="[0-9]{16}" placeholder="16 digits" required>
                        </div>
                    </div></br>

                    <div class="form-row">
                        <div class="col">
                            <label for="expiryMonth"><%=dataBundle.getString("paymentDetails_cardExpiryMonth")%></label>
                            <input name="expiryMonth" type="text" id="expiryMonth" class="form-control" pattern="[0-9]{2}" placeholder="MM" required>
                        </div>
                        <div class="col">
                            <label for="expiryYear"><%=dataBundle.getString("paymentDetails_cardExpiryYear")%></label>
                            <input name="expiryYear" type="text" id="expiryYear" class="form-control" pattern="[0-9]{4}" placeholder="YYYY" required>
                        </div>
                        <div class="col">
                            <label for="cvv"><%=dataBundle.getString("paymentDetails_cvv")%></label>
                            <input name="cvv" type="text" id="cvv" class="form-control" size="30" pattern="[0-9]{3}" placeholder="3 digits" required>
                        </div>
                    </div>

                    </br><button type="submit" class="btn btn-success"><%=dataBundle.getString("paymentDetails_payPriorityBoarding")%></button>
                    <input type="hidden" name ="action" value="payPriorityBoarding" />
                </form>
            </div>
            <div class="col-3"></div>
        </div>

        <%
                } else {
                    out.println("Invalid number of passengers or passenger details");
                }
            } else {
                out.println("No flight found.");
            }

        } else {
        %>

        <div class="text-center">
            <h3>You must log in or register to add priority boarding to your flight</h3></br>
            <a href="login.jsp" class="btn btn-success">Login</a>&nbsp;&nbsp;
            <a href="register.jsp" class="btn btn-success">Register</a>
        </div>

        <%
            }
        %>
    </body>
</html>
