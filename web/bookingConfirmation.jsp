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
        <title><%=dataBundle.getString("bookingConfirmation_title")%></title>
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

                    // Checking if return flight exists to know whether to display information on it for each passenger in 
                    // the passenger summary
                    boolean returnFlightExists = false;
                    // Getting the travel class of the return flight for the passenger summary
                    String returnFlightTravelClass = "";
                    if (session.getAttribute("returnFlight") != null) {
                        returnFlightExists = true;
                        User_Flight returnFlight = (User_Flight) session.getAttribute("returnFlight0");
                        returnFlightTravelClass = returnFlight.getTravelClass();
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
        %>

        <!--Return Flight Version-->
        
        <!--Desktop Version-->
        <div class="d-none d-md-flex" >
            <div class="col-12">
                <img style="object-fit: contain; width: 100%;" src="images/microhard plane cropped.png" alt=""/>
                <h1 style="position: absolute; top: 25px; left: 50px; color: white;" class="display-4"><%=dataBundle.getString("bookingConfirmation_bookingConfirmed")%>!</h1>
                <p style="position: absolute; top: 100px; left: 55px; color: white;"class="lead d-none d-md-flex"><%=dataBundle.getString("bookingConfirmation_thankYou")%>, <%=loggedInUser.getFirstName()%> <%=loggedInUser.getLastName()%></p>
            </div>
        </div>
        
        <!--Mobile Version-->
        <div class="d-flex d-md-none" >
            <div class="col-12">
                <img style="object-fit: contain; width: 100%;" src="images/microhard plane cropped.png" alt=""/>
                <h1 style="position: absolute; top: 5px; left: 25px; color: white; font-size: 200%;" class="display-4"><%=dataBundle.getString("bookingConfirmation_bookingConfirmed")%>!</h1>
            </div>
        </div>
        
        <!--Desktop and Mobile Version-->
        <br>
        <h3 class="ml-3">
            <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_return")%> <br class="d-flex d-md-none"><hr class="d-flex d-md-none"> <%=dateFormatter.format(flight.getDate())%> <%=dataBundle.getString("passengerDetails_to")%> <%=dateFormatter.format(returnFlightObject.getDate())%>
            <span class="float-md-right mr-md-3"><br class="d-flex d-md-none"><hr class="d-flex d-md-none"><%=dataBundle.getString("paymentDetails_total")%> <%=currencyFormatter.format(converter.convert(departureFlight.getPricePaid() + returnFlight.getPricePaid() + departureCheckedBaggagePrice + returnCheckedBaggagePrice, country))%></span>
        </h3>
        <hr></br>

        <%
        } else {
        %>

        <!--One-Way Flight Version-->
        
        <!--Desktop Version-->
        <div class="d-none d-md-flex" >
            <div class="col-12">
                <img style="object-fit: contain; width: 100%;" src="images/microhard plane cropped.png" alt=""/>
                <h1 style="position: absolute; top: 25px; left: 50px; color: white;" class="display-4"><%=dataBundle.getString("bookingConfirmation_bookingConfirmed")%>!</h1>
                <p style="position: absolute; top: 100px; left: 55px; color: white;"class="lead d-none d-md-flex"><%=dataBundle.getString("bookingConfirmation_thankYou")%>, <%=loggedInUser.getFirstName()%> <%=loggedInUser.getLastName()%></p>
            </div>
        </div>
        
        <!--Mobile Version-->
        <div class="d-flex d-md-none" >
            <div class="col-12">
                <img style="object-fit: contain; width: 100%;" src="images/microhard plane cropped.png" alt=""/>
                <h1 style="position: absolute; top: 5px; left: 25px; color: white; font-size: 200%;" class="display-4"><%=dataBundle.getString("bookingConfirmation_bookingConfirmed")%>!</h1>
            </div>
        </div>
        
        <!--Desktop and Mobile Version-->
        <br>
        <h3 class="ml-3">
            <%=flight.getDepartureAirport()%> (<%=flight.getDepartureAirportAbbreviation()%>) <%=dataBundle.getString("passengerDetails_to")%> <%=flight.getArrivalAirport()%> (<%=flight.getArrivalAirportAbbreviation()%>) <br class="d-flex d-md-none"><hr class="d-flex d-md-none"> <%=dateFormatter.format(flight.getDate())%>
            <span class="float-md-right mr-md-3"><br class="d-flex d-md-none"><hr class="d-flex d-md-none"><%=dataBundle.getString("paymentDetails_total")%> <%=currencyFormatter.format(converter.convert(departureFlight.getPricePaid() + departureCheckedBaggagePrice, country))%></span>
        </h3>
        <hr></br>

        <%
            }

            if (numPassengers > 0) {

        %>
        
        <h3 class="text-center"><%=dataBundle.getString("paymentDetails_passengersBooked")%></h3>
        <div class="row text-center">
            <div class="col-0 col-md-2"></div>
            <div class="container col-12 col-md-8">
                <div class="d-flex flex-wrap text-center">
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
                        
                        <!-- Each of these links open a modal with information on the different travel classes -->
                        <!-- Code for the modal is at the bottom of the page -->
                        <%
                            if (departureFlight.getTravelClass().equals("standard")) {
                        %>
                        </br><%=dataBundle.getString("paymentDetails_departureFlightClass")%> <a href="#" data-toggle="modal" data-target="#travelClassesModal">Standard</a>
                        <%
                            } else if (departureFlight.getTravelClass().equals("business")) {
                        %>
                        </br><%=dataBundle.getString("paymentDetails_departureFlightClass")%> <a href="#" data-toggle="modal" data-target="#travelClassesModal">Business</a>
                        <%
                            } else if (departureFlight.getTravelClass().equals("firstClass")) {
                        %>
                        </br><%=dataBundle.getString("paymentDetails_departureFlightClass")%> <a href="#" data-toggle="modal" data-target="#travelClassesModal">First Class</a>
                        <%
                            }
                        %>
                        
                        <%
                            if (returnFlightExists) {
                        %>
                        
                            <%
                                if (returnFlightTravelClass.equals("standard")) {
                            %>
                            </br><%=dataBundle.getString("paymentDetails_returnFlightClass")%> <a href="#" data-toggle="modal" data-target="#travelClassesModal">Standard</a>
                            <%
                                } else if (returnFlightTravelClass.equals("business")) {
                            %>
                            </br><%=dataBundle.getString("paymentDetails_returnFlightClass")%> <a href="#" data-toggle="modal" data-target="#travelClassesModal">Business</a>
                            <%
                                } else if (returnFlightTravelClass.equals("firstClass")) {
                            %>
                            </br><%=dataBundle.getString("paymentDetails_returnFlightClass")%> <a href="#" data-toggle="modal" data-target="#travelClassesModal">First Class</a>
                            <%
                                }
                            %>
                        
                        <%
                            }
                        %>
                    </div>

                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <div class="col-0 col-md-2"></div>
        </div></br></br>
            
        <div class="row text-center">
            <div class="col-0 col-md-2"></div>
            <div class="col-0 col-md-8 border border-primary rounded">
                <h3><%=dataBundle.getString("bookingConfirmation_manageUpcomingTrips")%></h3>
                <p><%=dataBundle.getString("bookingConfirmation_toCheckInAndViewBoardingPasses")%></p>
                <a href="upcomingTrips.jsp" class="btn btn-success"><%=dataBundle.getString("bookingConfirmation_manage")%></a><p></p>
            </div>
            <div class="col-0 col-md-2"></div>
        </div></br>
        
        <!-- Travel Classes Modal -->
        <div class="modal fade" id="travelClassesModal" tabindex="-1" role="dialog" aria-labelledby="travelClassesModalTitle" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="travelClassesModalTitle"><%=dataBundle.getString("paymentDetails_travelClasses")%></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <div class="row text-left">
                        <div class="col-3 border-right border-muted">
                          <h3><%=dataBundle.getString("paymentDetails_benefits")%></h3>
                          <p><%=dataBundle.getString("flights_10kgCabinBag")%></p>
                          <p><%=dataBundle.getString("flights_selectSeat")%></p>
                          <p><%=dataBundle.getString("flights_20kgCheckedBag")%></p>
                          <p><%=dataBundle.getString("flights_PriorityBoarding")%></p>
                          <p><%=dataBundle.getString("flights_freeRefunds")%></p>
                          <p><%=dataBundle.getString("flights_loungeAccess")%></p>
                          <p><%=dataBundle.getString("flights_FastTrackSecurity")%></p>
                        </div>
                        <div class="col-3 border-right border-muted text-center">
                          <h3><%=dataBundle.getString("paymentDetails_standard")%></h3>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                          <p><span style="color: red;"><i class="fas fa-times-circle"></i></span></p>
                          <p><span style="color: red;"><i class="fas fa-times-circle"></i></span></p>
                          <p><span style="color: red;"><i class="fas fa-times-circle"></i></span></p>
                          <p><span style="color: red;"><i class="fas fa-times-circle"></i></span></p>
                          <p><span style="color: red;"><i class="fas fa-times-circle"></i></span></p>
                        </div>
                        <div class="col-3 border-right border-muted text-center">
                          <h3><%=dataBundle.getString("paymentDetails_business")%></h3>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                          <p><span style="color: red;"><i class="fas fa-times-circle"></i></span></p>
                          <p><span style="color: red;"><i class="fas fa-times-circle"></i></span></p>
                          <p><span style="color: red;"><i class="fas fa-times-circle"></i></span></p>
                        </div>
                        <div class="col-3 text-center">
                          <h3><%=dataBundle.getString("paymentDetails_firstClass")%></h3>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                          <p><span style="color: limegreen;"><i class="fas fa-check-circle"></i></span></p>
                        </div>
                  </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button
              </div>
            </div>
          </div>
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
//            session.removeAttribute("numPassengers");
//            session.removeAttribute("departureFlight");
//            session.removeAttribute("returnFlight");
//            for (int i = 0; i <= 10; i++) {
//                session.removeAttribute("departureFlight" + i);
//                session.removeAttribute("returnFlight" + i);
//                session.removeAttribute("departureFlightCheckedBaggage" + i);
//                session.removeAttribute("returnFlightCheckedBaggage" + i);
//            }
        %>
    </body>
</html>
