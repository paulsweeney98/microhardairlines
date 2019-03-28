<%-- 
    Document   : payCheckedBaggage
    Created on : 25-Feb-2019, 12:15:47
    Author     : Gerard
--%>

<%@page import="Dtos.Checked_baggage"%>
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

                    // Get departure checked baggage prices
                    double departureCheckedBaggagePrice = 0;
                    if (session.getAttribute("departureFlightCheckedBaggage0") != null) {
                        for (int i = 0; i < numPassengers; i++) {
                            Checked_baggage checkedBaggage = (Checked_baggage) session.getAttribute("departureFlightCheckedBaggage" + i);
                            departureCheckedBaggagePrice = departureCheckedBaggagePrice + checkedBaggage.getPricePaid();
                        }
                    }

        %>

        <h3>
            &nbsp;&nbsp;<%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_oneWay")%>
            <span class="float-right"><%=dataBundle.getString("paymentDetails_total")%> <%=currencyFormatter.format(departureCheckedBaggagePrice)%>&nbsp;&nbsp;</span>
        </h3>
        <hr></br></br>

        <%

            if (numPassengers > 0) {

        %>

        <div class="row text-center">
            <%            for (int i = 0; i < numPassengers; i++) {
                    if (session.getAttribute("departureFlight" + i) != null && session.getAttribute("departureFlightCheckedBaggage" + i) != null) {
                        departureFlight = (User_Flight) session.getAttribute("departureFlight" + i);
                        Checked_baggage departureFlightCheckedBaggage = (Checked_baggage) session.getAttribute("departureFlightCheckedBaggage" + i);
            %>

            <div class="col border border-primary rounded">
                <%=departureFlight.getPassengerFirstName()%> <%=departureFlight.getPassengerLastName()%>
                </br><%=dataBundle.getString("paymentDetails_checkedBaggage")%>: <%=departureFlightCheckedBaggage.getWeight()%> kg
            </div>

            <%
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

                    </br><button type="submit" class="btn btn-success"><%=dataBundle.getString("paymentDetails_payCheckedBaggage")%></button>
                    <input type="hidden" name ="action" value="payCheckedBaggage" />
                </form>
            </div>
            <div class="col-3"></div>
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
            <a href="login.jsp" class="btn btn-success"><%=dataBundle.getString("login_login")%></a>&nbsp;&nbsp;
            <a href="register.jsp" class="btn btn-success"><%=dataBundle.getString("login_dontHaveAnAccountRegisterHere")%></a>
        </div>

        <%
            }
        %>
    </body>
</html>
