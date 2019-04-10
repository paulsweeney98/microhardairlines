<%-- 
    Document   : paymentDetails
    Created on : 10-Feb-2019, 12:42:35
    Author     : pauls
--%>

<%@page import="java.text.DecimalFormat"%>
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

                if (session.getAttribute("departureFlight") != null && ((numPassengers > 0) && (numPassengers <= 10))) {
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
                        // Getting the return date to display it in the summary
                        Flight returnFlightObject = fDao.getFlightById(returnFlight.getFlightId());

                        // Get return checked baggage prices
                        double returnCheckedBaggagePrice = 0;
                        if (session.getAttribute("returnFlightCheckedBaggage0") != null) {
                            for (int i = 0; i < numPassengers; i++) {
                                Checked_baggage checkedBaggage = (Checked_baggage) session.getAttribute("returnFlightCheckedBaggage" + i);
                                returnCheckedBaggagePrice = returnCheckedBaggagePrice + checkedBaggage.getPricePaid();
                            }
                        }
                        
                        // Caculating the total price
                        double totalPrice = departureFlight.getPricePaid() + returnFlight.getPricePaid() + departureCheckedBaggagePrice + returnCheckedBaggagePrice;
                        DecimalFormat df = new DecimalFormat("#.##");
                        totalPrice = v.convertStringToDouble(df.format(totalPrice));
        %>
        
        <!--Return Flight Version-->
        
        <!--Total price to be sent to Paypal javascript function-->
        <input id="totalPrice" value="<%=totalPrice%>" type="hidden"/>
        
        <!--Desktop and Mobile Version-->
        <h3 class="ml-3">
            <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_return")%> <br class="d-flex d-md-none"><hr class="d-flex d-md-none"> <%=dateFormatter.format(flight.getDate())%> <%=dataBundle.getString("passengerDetails_to")%> <%=dateFormatter.format(returnFlightObject.getDate())%>
            <span class="float-md-right mr-md-3"><br class="d-flex d-md-none"><hr class="d-flex d-md-none"><%=dataBundle.getString("paymentDetails_total")%> <%=currencyFormatter.format(departureFlight.getPricePaid() + returnFlight.getPricePaid() + departureCheckedBaggagePrice + returnCheckedBaggagePrice)%>&nbsp;&nbsp;</span>
        </h3>
        <hr></br>

        <%
        } else {
            // Caculating the total price
            double totalPrice = departureFlight.getPricePaid() + departureCheckedBaggagePrice;
            DecimalFormat df = new DecimalFormat("#.##");
            totalPrice = v.convertStringToDouble(df.format(totalPrice));
        %>
        
        <!--One-Way Flight Version-->
        
        <!--Total price to be sent to Paypal javascript function-->
        <input id="totalPrice" value="<%=totalPrice%>" type="hidden"/>
        
        <!--Desktop and Mobile Version-->
        <h3 class="ml-3">
            <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <br class="d-flex d-md-none"><hr class="d-flex d-md-none"> <%=dateFormatter.format(flight.getDate())%>
            <span class="float-md-right mr-md-3"><br class="d-flex d-md-none"><hr class="d-flex d-md-none"><%=dataBundle.getString("paymentDetails_total")%> <%=currencyFormatter.format(departureFlight.getPricePaid() + departureCheckedBaggagePrice)%></span>
        </h3>
        <hr></br>

        <%
            }

            if (numPassengers > 0) {

        %>

        <div class="row text-center">
            <div class="col-0 col-md-2"></div>
            <div class="col-0 col-md-8 flex-wrap">
                <%
                    for (int i = 0; i < numPassengers; i++) {
                        if (session.getAttribute("departureFlight" + i) != null && session.getAttribute("departureFlightCheckedBaggage" + i) != null) {
                            departureFlight = (User_Flight) session.getAttribute("departureFlight" + i);
                            Checked_baggage departureFlightCheckedBaggage = (Checked_baggage) session.getAttribute("departureFlightCheckedBaggage" + i);
                %>

                <div class="col-4 border border-primary rounded">
                    <i class="fas fa-user"></i><br>
                    <%=departureFlight.getPassengerFirstName()%> <%=departureFlight.getPassengerLastName()%>
                    </br><%=dataBundle.getString("paymentDetails_checkedBaggage")%>: <%=departureFlightCheckedBaggage.getWeight()%> kg
                </div>

                <%
                        }
                    }
                %>
            </div>
            <div class="col-0 col-md-2"></div>
        </div></br>
        
        </br>
        <h3 class="text-center"><%=dataBundle.getString("paymentDetails_payByCard")%></h3>
        <div class="row d-none d-md-flex">
            <div class="col-3"></div>
            <div class="col-6">
                <form action="Servlet" method="post">
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

                    </br><a href="Servlet?action=cancelBooking" class="btn btn-light border float-left"><%=dataBundle.getString("paymentDetails_startAgain")%></a>
                    <button type="submit" class="btn btn-success float-right"><%=dataBundle.getString("paymentDetails_bookFlight")%></button>
                    <input type="hidden" name ="action" value="bookFlight" />
                </form>
            </div>
            <div class="col-3"></div>
        </div>
                    
        <div class="row d-flex d-md-none">
            <div class="col-12">
                <form action="Servlet" method="post">
                    <div class="form-row">
                        <div class="col ml-3 mr-3">
                            <label for="type"><%=dataBundle.getString("paymentDetails_cardType")%></label>
                            <select name="type" id="type" class="form-control">
                                <option value="visa"><%=dataBundle.getString("paymentDetails_visa")%></option>
                                <option value="mastercard"><%=dataBundle.getString("paymentDetails_mastercard")%></option>
                            </select>
                        </div>
                    </div></br>
                    
                    <div class="form-row">
                        <div class="col ml-3 mr-3">
                            <label for="number"><%=dataBundle.getString("paymentDetails_cardNumber")%></label>
                            <input name="number" type="text" id="number" class="form-control" size="30" pattern="[0-9]{16}" placeholder="16 digits" required>
                        </div>
                    </div></br>

                    <div class="form-row">
                        <div class="col ml-3">
                            <label for="expiryMonth"><%=dataBundle.getString("paymentDetails_cardExpiryMonth")%></label>
                            <input name="expiryMonth" type="text" id="expiryMonth" class="form-control" pattern="[0-9]{2}" placeholder="MM" required>
                        </div>
                        <div class="col mr-3">
                            <label for="expiryYear"><%=dataBundle.getString("paymentDetails_cardExpiryYear")%></label>
                            <input name="expiryYear" type="text" id="expiryYear" class="form-control" pattern="[0-9]{4}" placeholder="YYYY" required>
                        </div>
                    </div>
                            
                    <div class="form-row">
                        <div class="col ml-3 mr-3">
                            <label for="cvv"><%=dataBundle.getString("paymentDetails_cvv")%></label>
                            <input name="cvv" type="text" id="cvv" class="form-control" size="30" pattern="[0-9]{3}" placeholder="3 digits" required>
                        </div>
                    </div>

                    </br><a href="Servlet?action=cancelBooking" class="btn btn-light border float-left ml-3"><%=dataBundle.getString("paymentDetails_startAgain")%></a>
                    <button type="submit" class="btn btn-success float-right mr-3"><%=dataBundle.getString("paymentDetails_bookFlight")%></button>
                    <input type="hidden" name ="action" value="bookFlight" />
                </form>
            </div>
        </div>
                    
        </br></br>
                    
        <h3 class="text-center"><%=dataBundle.getString("paymentDetails_payWithPaypal")%></h3>
        <div class="row text-center">
            <div class="col-0 col-md-4"></div>
            <div id="paypal-button-container" class="col-12 col-md-4"></div>
            <div class="col-0 col-md-4"></div>
        </div>
        
        <script>
            paypal.Buttons({
              createOrder: function(data, actions) {
                var amountValue = document.getElementById("totalPrice").value;
                return actions.order.create({
                  purchase_units: [{
                    amount: {
//                      value: '0.01'
                      value: amountValue
                    }
                  }]
                });
              },
              onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                  alert('Transaction completed by ' + details.payer.name.given_name);
                  window.location = 'http://localhost:8084/microhard_airlines/Servlet?action=bookFlight&paidWithPaypal=true';
                  // Call your server to save the transaction
//                  return fetch('/paypal-transaction-complete', {
//                    method: 'post',
//                    headers: {
//                      'content-type': 'application/json'
//                    },
//                    body: JSON.stringify({
//                      orderID: data.orderID
//                    })
//                  });
                });
              }
            }).render('#paypal-button-container');
        </script>

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
        %>
    </body>
</html>
