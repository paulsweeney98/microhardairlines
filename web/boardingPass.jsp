<%-- 
    Document   : boardingPass
    Created on : 14-Mar-2019, 13:02:30
    Author     : D00191889
--%>

<%@page import="java.io.InputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="QR_Code.QRCodeGenerator"%>
<%@page import="Dtos.Flight"%>
<%@page import="Daos.FlightDao"%>
<%@page import="Dtos.User_Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.User_FlightDao"%>
<%@page import="Validation.Validation"%>
<%@page import="Daos.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Microhard Airlines</title>
    </head>
    <body>
        <%
            Validation v = new Validation();
            User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
            FlightDao fDao = new FlightDao(Dao.getDatabaseName());
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            
            if (loggedInUser != null) {
                String flightIdString = request.getParameter("flightId");
                int flightId = v.convertStringToInt(flightIdString);
                
                if (flightId > 0) {
                    Flight flight = fDao.getFlightById(flightId);
                    
                    ArrayList<User_Flight> user_flights = ufDao.getUser_FlightsByFlightIdUserId(flightId, loggedInUser.getUserId());
        %>
        
        <div class="text-center">
            <a href="printBoaringPass.jsp?flightId=<%=flightId%>" class="btn btn-success">Print Boarding Pass(es)</a>
        </div>
        
        <h1 class="text-center">OR</h1>
        
        <div class="row mt-3">
            <div class="col-4"></div>
            <div class="col-4">
                <div id="demo" class="carousel slide" data-ride="carousel">

                  <!-- Indicators -->
                  <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active bg-primary"></li>
                    <li data-target="#demo" data-slide-to="1" class="bg-primary"></li>
                    <li data-target="#demo" data-slide-to="2" class="bg-primary"></li>
                  </ul>

                  <!-- The slideshow -->
                  <div class="carousel-inner">
                    <%
                        int counter = 0;
                        for (User_Flight user_flight : user_flights) {
                            // Generating QR code
                            qrGenerator.generateQRCodeImage("ID: " + user_flight.getId() + "\nPassenger: " + user_flight.getPassengerFirstName() + " " + user_flight.getPassengerLastName() + "\nGoing From: " + flight.getDepartureAirport() + "\nTo: " + flight.getArrivalAirport(), 350, 350, "MyQRCode" + user_flight.getPassengerLastName() + user_flight.getId() + ".png");
                            
                            if (counter == 0) {
                    %>
                    <div class="carousel-item active border rounded">
                        <div class="bg-primary text-light">
                            <h4 class="text-center">Microhard Airlines</h4>

                            <h3 class="float-left ml-4"><%=flight.getDepartureAirportAbbreviation()%></h3>
                            <h3 class="float-right mr-4"><%=flight.getArrivalAirportAbbreviation()%></h3>
                            <div class="text-center">
                                <span style="font-size: 3em;">
                                    <i class="fas fa-plane"></i>
                                </span>
                            </div>
                        </div>
                            
                        <div class="bg-success text-light">
                            <h3 class="float-left ml-4"><%=user_flight.getQueue()%></h3>
                            <h3 class="float-right mr-4"><%=user_flight.getTravelClass()%></h3>
                            <h3 class="text-center">-</h3>
                        </div>
                            
                        <div class="row">
                            <div class="col text-left ml-4">
                                <label for="name"><strong>Name:</strong></label>
                                <p id="name"><%=user_flight.getPassengerFirstName()%> <%=user_flight.getPassengerLastName()%></p>
                            </div>
                            <div class="col text-left ml-4">
                                <label for="flightNumber"><strong>Flight Number:</strong></label>
                                <p id="flightNumber"><%=flight.getFlightNumber()%></p>
                            </div>
                        </div>
                            
                        <div class="row">
                            <div class="col text-left ml-4">
                                <label for="date"><strong>Date:</strong></label>
                                <p id="date"><%=flight.getDate()%></p>
                            </div>
                            <div class="col text-left">
                                <label for="departureTime"><strong>Departure Time:</strong></label>
                                <p id="departureTime"><%=v.changeMinutesToHours(flight.getDepartureTime())%></p>
                            </div>
                            <div class="col text-left">
                                <label for="arrivalTime"><strong>Arrival Time</strong></label>
                                <p id="arrivalTime"><%=v.changeMinutesToHours(flight.getArrivalTime())%></p>
                            </div>
                        </div>
                            
                        <div class="row">
                            <div class="col text-left ml-4">
                                <label for="seat"><strong>Seat:</strong></label>
                                <p id="seat"><%=user_flight.getSeat()%></p>
                            </div>
                            <div class="col text-left">
                                <label for="boardingDoor"><strong>Boarding Door:</strong></label>
                                <p id="boardingDoor"><%=user_flight.getBoardingDoor()%></p>
                            </div>
                            <div class="col text-left">
                                <label for="terminal"><strong>Terminal:</strong></label>
                                <p id="terminal"><%=flight.getDepartureTerminal()%></p>
                            </div>
                        </div>
                        
                        <img src="QRCodeImages/MyQRCode<%=user_flight.getPassengerLastName()%><%=user_flight.getId()%>.png" alt="QR Code" width="350">
                    </div>
                    <% 
                            } else {
                    %>
                    <div class="carousel-item border rounded">
                        <div class="bg-primary text-light">
                            <h4 class="text-center">Microhard Airlines</h4>

                            <h3 class="float-left ml-4"><%=flight.getDepartureAirportAbbreviation()%></h3>
                            <h3 class="float-right mr-4"><%=flight.getArrivalAirportAbbreviation()%></h3>
                            <div class="text-center">
                                <span style="font-size: 3em;">
                                    <i class="fas fa-plane"></i>
                                </span>
                            </div>
                        </div>
                            
                        <div class="bg-success text-light">
                            <h3 class="float-left ml-4"><%=user_flight.getQueue()%></h3>
                            <h3 class="float-right mr-4"><%=user_flight.getTravelClass()%></h3>
                            <h3 class="text-center">-</h3>
                        </div>
                            
                        <div class="row">
                            <div class="col text-left ml-4">
                                <label for="name"><strong>Name:</strong></label>
                                <p id="name"><%=user_flight.getPassengerFirstName()%> <%=user_flight.getPassengerLastName()%></p>
                            </div>
                            <div class="col text-left ml-4">
                                <label for="flightNumber"><strong>Flight Number:</strong></label>
                                <p id="flightNumber"><%=flight.getFlightNumber()%></p>
                            </div>
                        </div>
                            
                        <div class="row">
                            <div class="col text-left ml-4">
                                <label for="date"><strong>Date:</strong></label>
                                <p id="date"><%=flight.getDate()%></p>
                            </div>
                            <div class="col text-left">
                                <label for="departureTime"><strong>Departure Time:</strong></label>
                                <p id="departureTime"><%=v.changeMinutesToHours(flight.getDepartureTime())%></p>
                            </div>
                            <div class="col text-left">
                                <label for="arrivalTime"><strong>Arrival Time</strong></label>
                                <p id="arrivalTime"><%=v.changeMinutesToHours(flight.getArrivalTime())%></p>
                            </div>
                        </div>
                            
                        <div class="row">
                            <div class="col text-left ml-4">
                                <label for="seat"><strong>Seat:</strong></label>
                                <p id="seat"><%=user_flight.getSeat()%></p>
                            </div>
                            <div class="col text-left">
                                <label for="boardingDoor"><strong>Boarding Door:</strong></label>
                                <p id="boardingDoor"><%=user_flight.getBoardingDoor()%></p>
                            </div>
                            <div class="col text-left">
                                <label for="terminal"><strong>Terminal:</strong></label>
                                <p id="terminal"><%=flight.getDepartureTerminal()%></p>
                            </div>
                        </div>
                        
                        <img src="QRCodeImages/MyQRCode<%=user_flight.getPassengerLastName()%><%=user_flight.getId()%>.png" alt="QR Code" width="350">
                    </div>
                    <%
                            }
                            counter++;
                        }
                    %>
                  </div>

                  <!-- Left and right controls -->
                  <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon bg-primary"></span>
                  </a>
                  <a class="carousel-control-next " href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon bg-primary"></span>
                  </a>
                </div>
            </div>
            <div class="col-4"></div>
        </div>
                  
        <%
                } else {
                    out.println("Invalid flight id.");
                }
            } else {
        %>
        <div class="text-center">
            <h3>Please login</h3>
            <a href="login.jsp" class="btn btn-success">Login</a>
            <a href="register.jsp" class="btn btn-success">Register</a>
        </div>
        <%
            }
        %>
    </body>
</html>
