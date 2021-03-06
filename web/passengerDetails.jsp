<%-- 
    Document   : passengerDetails
    Created on : 01-Feb-2019, 13:41:05
    Author     : pauls
--%>

<%@page import="Dtos.User_Flight"%>
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
        <title><%=dataBundle.getString("passengerDetails_title")%></title>
    </head>
    <body>
        <%
            User_Flight departureFlight = null;
            User_Flight returnFlight = null;
            
            // One-way and return flights
            String numPassengersString = request.getParameter("numPassengers");
            String departureFlightTravelClass = request.getParameter("departureFlightTravelClass");
            String departureFlightIdString = request.getParameter("departureFlightId");
            String departureFlightPricePaidString = request.getParameter("departureFlightPricePaid");
            
            // Return flights only
            String returnFlightIdString = request.getParameter("returnFlightId");
            String returnFlightPricePaidString = request.getParameter("returnFlightPricePaid");
            String returnFlightTravelClass = request.getParameter("returnFlightTravelClass");
            
            
            Validation v = new Validation();
            
            int departureFlightId = v.convertStringToInt(departureFlightIdString);
            double departureFlightPricePaid = v.convertStringToDouble(departureFlightPricePaidString);

            FlightDao fDao = new FlightDao(Dao.getDatabaseName());
            Flight flight = fDao.getFlightById(departureFlightId);
            
            int numPassengers = -1;
            if (numPassengersString != null && !numPassengersString.equals("")) {
                numPassengers = v.convertStringToInt(numPassengersString);
            }
            
            if ((numPassengers > 0) && (numPassengers <= 10)) {
            
                if (flight != null && departureFlightPricePaidString != null && !departureFlightPricePaidString.equals("")) {
                    
                    if (departureFlightIdString != null && !departureFlightIdString.equals("") && departureFlightPricePaidString != null && !departureFlightPricePaidString.equals("") && departureFlightTravelClass != null && !departureFlightTravelClass.equals("") && returnFlightIdString != null && !returnFlightIdString.equals("") && returnFlightPricePaidString != null && !returnFlightPricePaidString.equals("") && returnFlightTravelClass != null && !returnFlightTravelClass.equals("")) {
                        
                        int returnFlightId = v.convertStringToInt(returnFlightIdString);
                        double returnFlightPricePaid = v.convertStringToDouble(returnFlightPricePaidString);
                        
                        if (loggedInUser != null) {
                            
                            if (departureFlightTravelClass.equals("standard")) {
                                departureFlight = new User_Flight(loggedInUser.getUserId(), departureFlightId, null, null, departureFlightTravelClass, "non-priority", null, null, 0, departureFlightPricePaid);
                            } else {
                                departureFlight = new User_Flight(loggedInUser.getUserId(), departureFlightId, null, null, departureFlightTravelClass, "priority", null, null, 0, departureFlightPricePaid);
                            }
                            
                            if (returnFlightTravelClass.equals("standard")) {
                                returnFlight = new User_Flight(loggedInUser.getUserId(), returnFlightId, null, null, returnFlightTravelClass, "non-priority", null, null, 0, returnFlightPricePaid);
                            } else {
                                returnFlight = new User_Flight(loggedInUser.getUserId(), returnFlightId, null, null, returnFlightTravelClass, "priority", null, null, 0, returnFlightPricePaid);
                            }
                            
                        } else {
                            
                            if (departureFlightTravelClass.equals("standard")) {
                                departureFlight = new User_Flight(-1, departureFlightId, null, null, departureFlightTravelClass, "non-priority", null, null, 0, departureFlightPricePaid);
                            } else {
                                departureFlight = new User_Flight(-1, departureFlightId, null, null, departureFlightTravelClass, "priority", null, null, 0, departureFlightPricePaid);
                            }
                            
                            if (returnFlightTravelClass.equals("standard")) {
                                returnFlight = new User_Flight(-1, returnFlightId, null, null, returnFlightTravelClass, "non-priority", null, null, 0, returnFlightPricePaid);
                            } else {
                                returnFlight = new User_Flight(-1, returnFlightId, null, null, returnFlightTravelClass, "priority", null, null, 0, returnFlightPricePaid);
                            }
                            
                        }
                        
                        session.setAttribute("numPassengers", numPassengers);
                        session.setAttribute("departureFlight", departureFlight);
                        session.setAttribute("returnFlight", returnFlight);
                        
                        // Getting the return date to display it in the summary
                        Flight returnFlightObject = fDao.getFlightById(returnFlight.getFlightId());
        %>
        
        <!--Return Flight Version-->
        
        <!--Desktop and Mobile Version-->
        <h3 class="ml-3">
            <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_return")%> <br class="d-flex d-md-none"><hr class="d-flex d-md-none"> <%=dateFormatter.format(flight.getDate())%> <%=dataBundle.getString("passengerDetails_to")%> <%=dateFormatter.format(returnFlightObject.getDate())%>
            <span class="float-md-right mr-md-3"><br class="d-flex d-md-none"><hr class="d-flex d-md-none"><%=dataBundle.getString("paymentDetails_total")%> <%=currencyFormatter.format(converter.convert((departureFlight.getPricePaid() + returnFlight.getPricePaid()) * numPassengers, country))%></span>
        </h3>
        <hr></br>
        
        <%
                    } else if (departureFlightIdString != null && !departureFlightIdString.equals("") && departureFlightPricePaidString != null && !departureFlightPricePaidString.equals("") && departureFlightTravelClass != null && !departureFlightTravelClass.equals("")) {
        
                        if (loggedInUser != null) {
                            
                            if (departureFlightTravelClass.equals("standard")) {
                                departureFlight = new User_Flight(loggedInUser.getUserId(), departureFlightId, null, null, departureFlightTravelClass, "non-priority", null, null, 0, departureFlightPricePaid);
                            } else {
                                departureFlight = new User_Flight(loggedInUser.getUserId(), departureFlightId, null, null, departureFlightTravelClass, "priority", null, null, 0, departureFlightPricePaid);
                            }
                            
                        } else {
                            
                            if (departureFlightTravelClass.equals("standard")) {
                                departureFlight = new User_Flight(-1, departureFlightId, null, null, departureFlightTravelClass, "non-priority", null, null, 0, departureFlightPricePaid);
                            } else {
                                departureFlight = new User_Flight(-1, departureFlightId, null, null, departureFlightTravelClass, "priority", null, null, 0, departureFlightPricePaid);
                            }
                            
                        }

                        session.setAttribute("numPassengers", numPassengers);
                        session.setAttribute("departureFlight", departureFlight);
        %>
        
        <!--One-Way Flight Version-->
        
        <!--Desktop and Mobile Version-->
        <h3 class="ml-3">
            <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <br class="d-flex d-md-none"><hr class="d-flex d-md-none"> <%=dateFormatter.format(flight.getDate())%>
            <span class="float-md-right mr-md-3"><br class="d-flex d-md-none"><hr class="d-flex d-md-none"><%=dataBundle.getString("paymentDetails_total")%> <%=currencyFormatter.format(converter.convert(departureFlight.getPricePaid() * numPassengers, country))%></span>
        </h3>
        <hr></br>
        
        <%
                    } else {
                        out.println(dataBundle.getString("passengerDetails_thereWasAProblemWithYourSelection"));
                    }
        %>
        </br><h3 class="text-center"><%=dataBundle.getString("passengerDetails_enterThePassportDetailsForEachPassenger")%></h3>
        
        </br>
        <div class="row">
            <div class="col-0 col-md-3"></div>
            <div class="col-12 col-md-6">
                <form action="Servlet" method="post">
                    <%
                        for (int i = 0; i < numPassengers; i++) {
                    %>
                    </br></br>
                    <h3 class="ml-1 ml-md-0"><%=dataBundle.getString("passengerDetails_passenger")%> <%=i+1%></h3>
                    <div class="form-row">
                      <div class="col">
                        <label for="title" class="ml-1 ml-md-0"><%=dataBundle.getString("passengerDetails_title")%></label>
                        <select name="title<%=i%>" id="title" class="form-control ml-1 ml-md-0">
                            <option value="Mr">Mr</option>
                            <option value="Mrs">Mrs</option>
                            <option value="Miss">Miss</option>
                            <option value="Ms">Ms</option>
                        </select>
                      </div>
                      <div class="col">
                        <label for="firstName"><%=dataBundle.getString("passengerDetails_firstName")%></label>
                        <input name="firstName<%=i%>" type="text" id="firstName" class="form-control" placeholder="<%=dataBundle.getString("passengerDetails_firstNamePlaceholder")%>" required>
                      </div>
                      <div class="col">
                        <label for="lastName"><%=dataBundle.getString("passengerDetails_lastName")%></label>
                        <input name="lastName<%=i%>" type="text" id="lastName" class="form-control mr-3 mr-md-0" placeholder="<%=dataBundle.getString("passengerDetails_lastNamePlaceholder")%>" required>
                      </div>
                    </div>
                    <%
                        }
                    %>
                    </br><a href="Servlet?action=cancelBooking" class="btn btn-light border float-left ml-1 ml-md-0"><%=dataBundle.getString("passengerDetails_startAgain")%></a>
                    <button type="submit" class="btn btn-success float-right mr-3 mr-md-0"><%=dataBundle.getString("passengerDetails_next")%></button>
                    <input type="hidden" name ="action" value="storePassengerDetails" />
                </form>
            </div>
            <div class="col-0 col-md-3"></div>
        </div>
            
        <%
                } else {
                    out.println(dataBundle.getString("passengerDetails_noFlightFound"));
                }
            } else {
                out.println(dataBundle.getString("passengerDetails_youMustBookForAtLeastOnePassenger"));
            }
        %>
    </body>
</html>
