<%-- 
    Document   : seatSelectionBusiness
    Created on : 23-Feb-2019, 09:54:10
    Author     : pauls
--%>

<%@page import="Dtos.User_Flight"%>
<%@page import="Validation.Validation"%>
<%@page import="Daos.User_FlightDao"%>
<%@page import="Daos.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("seatSelection_title")%></title>
    </head>
    <body>
        <%
            if (loggedInUser != null) {
                
                Validation v = new Validation();
                int flightId = v.convertStringToInt(request.getParameter("flightId"));

                if (flightId > -1) {
                    User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
                    ArrayList<String> takenSeats = ufDao.getTakenSeats(flightId, "business");
                    ArrayList<User_Flight> user_flights = ufDao.getUser_FlightsByFlightIdUserIdTravelClass(flightId, loggedInUser.getUserId(), "business");
                        if (takenSeats != null && !takenSeats.isEmpty() && user_flights != null && !user_flights.isEmpty()) {
                            session.setAttribute("user_flights", user_flights);
        %>
        
        <%
            if (session.getAttribute("errorMessage") != null) {
        %>
        <div class="row text-center">
            <div class="col">
                <h3 class="text-danger"><%=session.getAttribute("errorMessage")%></h3></br>
            </div>
        </div>
        <%
            }
        %>
        
        <div class="row mt-3">
            <div class="col-5 text-center">
                <h3><%=dataBundle.getString("seatSelection_pleaseSelect")%> <%=user_flights.size()%> <%=dataBundle.getString("seatSelection_seatsFor")%></h3>
                <%
                    for (User_Flight user_flight : user_flights) {
                %>
                <h4><%=user_flight.getPassengerFirstName()%> <%=user_flight.getPassengerLastName()%></h4>
                <%
                    }
                %>
            </div>
            <div class="col-2 border border-primary rounded text-center">
                <div class="float-left">
                    <%
                        String colourA = "limegreen";
                        String colourB = "limegreen";
                        String colourC = "limegreen";
                        String colourD = "limegreen";
                        String colourE = "limegreen";
                        String colourF = "limegreen";
                        
                        String classA = "";
                        String classB = "";
                        String classC = "";
                        String classD = "";
                        String classE = "";
                        String classF = "";
                        
                        for (int i = 1; i <= 7; i++) {
                            if (takenSeats.contains(i + "a")) {
                                colourA = "red";
                                classA = "disabled";
                            } else {
                                colourA = "limegreen";
                                classA = "";
                            }
                            if (takenSeats.contains(i + "b")) {
                                colourB = "red";
                                classB = "disabled";
                            } else {
                                colourB = "limegreen";
                                classB = "";
                            }
                            if (takenSeats.contains(i + "c")) {
                                colourC = "red";
                                classC = "disabled";
                            } else {
                                colourC = "limegreen";
                                classC = "";
                            }
                    %>
                    <a href="#" id="<%=i%>a" class="<%=classA%>" style="font-size: 30px; color: <%=colourA%>;"><i class="fas fa-user"></i></a>
                    <a href="#" id="<%=i%>b" class="<%=classB%>" style="font-size: 30px; color: <%=colourB%>;"><i class="fas fa-user"></i></a>
                    <a href="#" id="<%=i%>c" class="<%=classC%>" style="font-size: 30px; color: <%=colourC%>;"><i class="fas fa-user"></i></a></br>
                    <%
                        }
                    %>
                </div>
                
                <div class="float-right">
                    <%
                        for (int i = 1; i <= 7; i++) {
                            if (takenSeats.contains(i + "d")) {
                                colourD = "red";
                                classD = "disabled";
                            } else {
                                colourD = "limegreen";
                                classD = "";
                            }
                            if (takenSeats.contains(i + "e")) {
                                colourE = "red";
                                classE = "disabled";
                            } else {
                                colourE = "limegreen";
                                classE = "";
                            }
                            if (takenSeats.contains(i + "f")) {
                                colourF = "red";
                                classF = "disabled";
                            } else {
                                colourF = "limegreen";
                                classF = "";
                            }
                    %>
                    <a href="#" id="<%=i%>d" class="<%=classD%>" style="font-size: 30px; color: <%=colourD%>;"><i class="fas fa-user"></i></a>
                    <a href="#" id="<%=i%>e" class="<%=classE%>" style="font-size: 30px; color: <%=colourE%>;"><i class="fas fa-user"></i></a>
                    <a href="#" id="<%=i%>f" class="<%=classF%>" style="font-size: 30px; color: <%=colourF%>;"><i class="fas fa-user"></i></a></br>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="col-2"></div>
            <form action="Servlet" method="post">
                
                
                </br><button type="submit" class="btn btn-success"><%=dataBundle.getString("seatSelection_submit")%></button>
                <input type="hidden" name="seatsBookedJSON" id="seatsBookedJSON" value="" />
                <input type="hidden" name ="action" value="selectSeat" />
            </form>
        </div>
            
        <%          } else {
                        out.println(dataBundle.getString("seatSelection_problemRetrievingTakenSeats"));
                    }
                } else {
                    out.println(dataBundle.getString("seatSelection_invalidFlight"));
                }
            } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("seatSelection_pleaseLogin")%></h3>
            <a href="login.jsp" class="btn btn-success"><%=dataBundle.getString("login_login")%></a>
            <a href="register.jsp" class="btn btn-success"><%=dataBundle.getString("login_dontHaveAnAccountRegisterHere")%></a>
        </div>
        <%
            }
        %>
                
        <script>
            
            $(document).ready(function(){
                
//                if (document.getElementById("seatsBookedJSON").value.length === 12) {
//                    var aLinks = document.getElementsByTagName("a");
//                    for (var i = 1; i <= 30; i++) {
//                        aLinks[i].className += "disabled";
//                    }
//                }S
                
                // Example of code properly structured
//                $("#2a").click(function(){ 
//                    if (this.style.color === "limegreen") {
//                        this.style.color = "blue";
//                        document.getElementById("seatsBookedJSON").value += "2a%%"; 
//                    } else {
//                        this.style.color = "limegreen";
//                        document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("2a%%", "");
//                    }
//                });
                
                // Seats on left side of aisle
                $("#1a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "1a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("1a%%", ""); } });

                $("#1b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "1b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("1b%%", ""); } });

                $("#1c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "1c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("1c%%", ""); } });

                $("#2a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "2a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("2a%%", ""); } });

                $("#2b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "2b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("2b%%", ""); } });

                $("#2c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "2c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("2c%%", ""); } });

                $("#3a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "3a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("3a%%", ""); } });

                $("#3b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "3b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("3b%%", ""); } });

                $("#3c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "3c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("3c%%", ""); } });

                $("#4a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "4a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("4a%%", ""); } });

                $("#4b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "4b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("4b%%", ""); } });

                $("#4c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "4c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("4c%%", ""); } });

                $("#5a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "5a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("5a%%", ""); } });

                $("#5b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "5b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("5b%%", ""); } });

                $("#5c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "5c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("5c%%", ""); } });

                $("#6a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "6a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("6a%%", ""); } });

                $("#6b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "6b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("6b%%", ""); } });

                $("#6c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "6c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("6c%%", ""); } });

                $("#7a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "7a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("7a%%", ""); } });

                $("#7b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "7b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("7b%%", ""); } });

                $("#7c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "7c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("7c%%", ""); } });

                $("#8a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "8a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("8a%%", ""); } });

                $("#8b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "8b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("8b%%", ""); } });

                $("#8c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "8c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("8c%%", ""); } });

                $("#9a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "9a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("9a%%", ""); } });

                $("#9b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "9b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("9b%%", ""); } });

                $("#9c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "9c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("9c%%", ""); } });

                $("#10a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "10a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("10a%%", ""); } });

                $("#10b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "10b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("10b%%", ""); } });

                $("#10c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "10c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("10c%%", ""); } });

                $("#11a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "11a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("11a%%", ""); } });

                $("#11b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "11b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("11b%%", ""); } });

                $("#11c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "11c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("11c%%", ""); } });

                $("#12a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "12a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("12a%%", ""); } });

                $("#12b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "12b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("12b%%", ""); } });

                $("#12c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "12c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("12c%%", ""); } });

                $("#13a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "13a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("13a%%", ""); } });

                $("#13b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "13b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("13b%%", ""); } });

                $("#13c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "13c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("13c%%", ""); } });

                $("#14a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "14a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("14a%%", ""); } });

                $("#14b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "14b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("14b%%", ""); } });

                $("#14c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "14c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("14c%%", ""); } });

                $("#15a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "15a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("15a%%", ""); } });

                $("#15b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "15b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("15b%%", ""); } });

                $("#15c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "15c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("15c%%", ""); } });

                $("#16a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "16a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("16a%%", ""); } });

                $("#16b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "16b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("16b%%", ""); } });

                $("#16c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "16c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("16c%%", ""); } });

                $("#17a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "17a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("17a%%", ""); } });

                $("#17b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "17b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("17b%%", ""); } });

                $("#17c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "17c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("17c%%", ""); } });

                $("#18a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "18a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("18a%%", ""); } });

                $("#18b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "18b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("18b%%", ""); } });

                $("#18c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "18c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("18c%%", ""); } });

                $("#19a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "19a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("19a%%", ""); } });

                $("#19b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "19b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("19b%%", ""); } });

                $("#19c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "19c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("19c%%", ""); } });

                $("#20a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "20a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("20a%%", ""); } });

                $("#20b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "20b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("20b%%", ""); } });

                $("#20c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "20c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("20c%%", ""); } });

                $("#21a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "21a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("21a%%", ""); } });

                $("#21b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "21b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("21b%%", ""); } });

                $("#21c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "21c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("21c%%", ""); } });

                $("#22a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "22a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("22a%%", ""); } });

                $("#22b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "22b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("22b%%", ""); } });

                $("#22c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "22c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("22c%%", ""); } });

                $("#23a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "23a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("23a%%", ""); } });

                $("#23b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "23b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("23b%%", ""); } });

                $("#23c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "23c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("23c%%", ""); } });

                $("#24a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "24a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("24a%%", ""); } });

                $("#24b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "24b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("24b%%", ""); } });

                $("#24c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "24c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("24c%%", ""); } });

                $("#25a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "25a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("25a%%", ""); } });

                $("#25b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "25b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("25b%%", ""); } });

                $("#25c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "25c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("25c%%", ""); } });

                $("#26a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "26a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("26a%%", ""); } });

                $("#26b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "26b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("26b%%", ""); } });

                $("#26c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "26c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("26c%%", ""); } });

                $("#27a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "27a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("27a%%", ""); } });

                $("#27b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "27b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("27b%%", ""); } });

                $("#27c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "27c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("27c%%", ""); } });

                $("#28a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "28a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("28a%%", ""); } });

                $("#28b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "28b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("28b%%", ""); } });

                $("#28c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "28c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("28c%%", ""); } });

                $("#29a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "29a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("29a%%", ""); } });

                $("#29b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "29b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("29b%%", ""); } });

                $("#29c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "29c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("29c%%", ""); } });

                $("#30a").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "30a%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("30a%%", ""); } });

                $("#30b").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "30b%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("30b%%", ""); } });

                $("#30c").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "30c%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("30c%%", ""); } });
                
                // Seats on right side of aisle
                $("#1d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "1d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("1d%%", ""); } });

                $("#1e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "1e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("1e%%", ""); } });

                $("#1f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "1f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("1f%%", ""); } });

                $("#2d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "2d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("2d%%", ""); } });

                $("#2e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "2e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("2e%%", ""); } });

                $("#2f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "2f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("2f%%", ""); } });

                $("#3d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "3d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("3d%%", ""); } });

                $("#3e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "3e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("3e%%", ""); } });

                $("#3f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "3f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("3f%%", ""); } });

                $("#4d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "4d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("4d%%", ""); } });

                $("#4e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "4e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("4e%%", ""); } });

                $("#4f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "4f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("4f%%", ""); } });

                $("#5d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "5d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("5d%%", ""); } });

                $("#5e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "5e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("5e%%", ""); } });

                $("#5f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "5f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("5f%%", ""); } });

                $("#6d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "6d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("6d%%", ""); } });

                $("#6e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "6e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("6e%%", ""); } });

                $("#6f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "6f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("6f%%", ""); } });

                $("#7d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "7d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("7d%%", ""); } });

                $("#7e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "7e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("7e%%", ""); } });

                $("#7f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "7f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("7f%%", ""); } });

                $("#8d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "8d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("8d%%", ""); } });

                $("#8e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "8e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("8e%%", ""); } });

                $("#8f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "8f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("8f%%", ""); } });

                $("#9d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "9d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("9d%%", ""); } });

                $("#9e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "9e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("9e%%", ""); } });

                $("#9f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "9f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("9f%%", ""); } });

                $("#10d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "10d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("10d%%", ""); } });

                $("#10e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "10e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("10e%%", ""); } });

                $("#10f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "10f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("10f%%", ""); } });

                $("#11d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "11d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("11d%%", ""); } });

                $("#11e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "11e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("11e%%", ""); } });

                $("#11f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "11f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("11f%%", ""); } });

                $("#12d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "12d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("12d%%", ""); } });

                $("#12e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "12e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("12e%%", ""); } });

                $("#12f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "12f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("12f%%", ""); } });

                $("#13d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "13d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("13d%%", ""); } });

                $("#13e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "13e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("13e%%", ""); } });

                $("#13f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "13f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("13f%%", ""); } });

                $("#14d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "14d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("14d%%", ""); } });

                $("#14e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "14e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("14e%%", ""); } });

                $("#14f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "14f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("14f%%", ""); } });

                $("#15d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "15d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("15d%%", ""); } });

                $("#15e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "15e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("15e%%", ""); } });

                $("#15f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "15f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("15f%%", ""); } });

                $("#16d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "16d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("16d%%", ""); } });

                $("#16e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "16e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("16e%%", ""); } });

                $("#16f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "16f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("16f%%", ""); } });

                $("#17d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "17d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("17d%%", ""); } });

                $("#17e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "17e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("17e%%", ""); } });

                $("#17f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "17f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("17f%%", ""); } });

                $("#18d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "18d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("18d%%", ""); } });

                $("#18e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "18e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("18e%%", ""); } });

                $("#18f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "18f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("18f%%", ""); } });

                $("#19d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "19d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("19d%%", ""); } });

                $("#19e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "19e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("19e%%", ""); } });

                $("#19f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "19f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("19f%%", ""); } });

                $("#20d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "20d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("20d%%", ""); } });

                $("#20e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "20e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("20e%%", ""); } });

                $("#20f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "20f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("20f%%", ""); } });

                $("#21d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "21d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("21d%%", ""); } });

                $("#21e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "21e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("21e%%", ""); } });

                $("#21f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "21f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("21f%%", ""); } });

                $("#22d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "22d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("22d%%", ""); } });

                $("#22e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "22e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("22e%%", ""); } });

                $("#22f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "22f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("22f%%", ""); } });

                $("#23d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "23d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("23d%%", ""); } });

                $("#23e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "23e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("23e%%", ""); } });

                $("#23f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "23f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("23f%%", ""); } });

                $("#24d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "24d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("24d%%", ""); } });

                $("#24e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "24e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("24e%%", ""); } });

                $("#24f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "24f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("24f%%", ""); } });

                $("#25d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "25d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("25d%%", ""); } });

                $("#25e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "25e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("25e%%", ""); } });

                $("#25f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "25f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("25f%%", ""); } });

                $("#26d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "26d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("26d%%", ""); } });

                $("#26e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "26e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("26e%%", ""); } });

                $("#26f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "26f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("26f%%", ""); } });

                $("#27d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "27d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("27d%%", ""); } });

                $("#27e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "27e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("27e%%", ""); } });

                $("#27f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "27f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("27f%%", ""); } });

                $("#28d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "28d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("28d%%", ""); } });

                $("#28e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "28e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("28e%%", ""); } });

                $("#28f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "28f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("28f%%", ""); } });

                $("#29d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "29d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("29d%%", ""); } });

                $("#29e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "29e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("29e%%", ""); } });

                $("#29f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "29f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("29f%%", ""); } });

                $("#30d").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "30d%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("30d%%", ""); } });

                $("#30e").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "30e%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("30e%%", ""); } });

                $("#30f").click(function(){ if (this.style.color === "limegreen") { this.style.color = "blue"; document.getElementById("seatsBookedJSON").value += "30f%%"; } else { this.style.color = "limegreen"; document.getElementById("seatsBookedJSON").value = document.getElementById("seatsBookedJSON").value.replace("30f%%", ""); } });
                
            });
            
        </script>
    </body>
</html>
