<%-- 
    Document   : printBoaringPass
    Created on : 14-Mar-2019, 17:13:12
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
        <title><%=dataBundle.getString("boardingPass_printBoardingPass")%></title>
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
            <button class="btn btn-success" onclick="print()"><%=dataBundle.getString("boardingPass_printBoardingPass")%></button>
        </div>
        
        <%
            for (User_Flight user_flight : user_flights) {
                // Generating QR code
                qrGenerator.generateQRCodeImage("ID: " + user_flight.getId() + "\nPassenger: " + user_flight.getPassengerFirstName() + " " + user_flight.getPassengerLastName() + "\nGoing From: " + flight.getDepartureAirport() + "\nTo: " + flight.getArrivalAirport(), 350, 350, "MyQRCode" + user_flight.getPassengerLastName() + ".png");

        %>
        <div class="row mt-3">
            <!--<div class="col-2"></div>-->
            <div class="col">
                <div class="bg-primary text-light">
                    <h4 class="text-center"><%=dataBundle.getString("boardingPass_microhardAirlines")%></h4>

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
                        <label for="name"><strong><%=dataBundle.getString("boardingPass_printBoardingPass")%>:</strong></label>
                        <p id="name"><%=user_flight.getPassengerFirstName()%> <%=user_flight.getPassengerLastName()%></p>
                    </div>
                    <div class="col text-left ml-4">
                        <label for="flightNumber"><strong><%=dataBundle.getString("boardingPass_flightNumber")%>:</strong></label>
                        <p id="flightNumber"><%=flight.getFlightNumber()%></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col text-left ml-4">
                        <label for="date"><strong><%=dataBundle.getString("boardingPass_date")%>:</strong></label>
                        <p id="date"><%=flight.getDate()%></p>
                    </div>
                    <div class="col text-left">
                        <label for="departureTime"><strong><%=dataBundle.getString("boardingPass_departureTime")%>:</strong></label>
                        <p id="departureTime"><%=v.changeMinutesToHours(flight.getDepartureTime())%></p>
                    </div>
                    <div class="col text-left">
                        <label for="arrivalTime"><strong><%=dataBundle.getString("boardingPass_arrivalTime")%>:</strong></label>
                        <p id="arrivalTime"><%=v.changeMinutesToHours(flight.getArrivalTime())%></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col text-left ml-4">
                        <label for="seat"><strong><%=dataBundle.getString("boardingPass_seat")%>:</strong></label>
                        <p id="seat"><%=user_flight.getSeat()%></p>
                    </div>
                    <div class="col text-left">
                        <label for="boardingDoor"><strong><%=dataBundle.getString("boardingPass_boardingDoor")%>:</strong></label>
                        <p id="boardingDoor"><%=user_flight.getBoardingDoor()%></p>
                    </div>
                    <div class="col text-left">
                        <label for="terminal"><strong><%=dataBundle.getString("boardingPass_terminal")%>:</strong></label>
                        <p id="terminal"><%=flight.getDepartureTerminal()%></p>
                    </div>
                </div>

                <img src="QRCodeImages/MyQRCode<%=user_flight.getPassengerLastName()%>.png" alt="QR Code" width="350">
                </br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
            </div>
            <!--<div class="col-2"></div>-->
        </div>
        <%
                    }
                } else {
                    out.println(dataBundle.getString("boardingPass_invalidFlightId"));
                }
            } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("boardingPass_pleaseLogin")%></h3>
            <a href="login.jsp" class="btn btn-success"><%=dataBundle.getString("boardingPass_login")%></a>
            <a href="register.jsp" class="btn btn-success"><%=dataBundle.getString("boardingPass_register")%></a>
        </div>
        <%
            }
        %>
    </body>
</html>
