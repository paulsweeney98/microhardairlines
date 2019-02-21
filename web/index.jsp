<%-- 
    Document   : index
    Created on : 25-Nov-2018, 19:23:33
    Author     : pauls
--%>



<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Dtos.Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.FlightDao"%>
<%@page import="Daos.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("index_title")%></title>
    </head>
    
        <script>
            $(document).ready(function(){
                $("#one_way_content").hide();
                
                $("#return_trip").click(function(){
                  $("#one_way_content").hide();
                  $("#return_content").show();
                  
                  this.className += " active";
                  document.getElementById("one_way").className = "nav-link";
                });
                $("#one_way").click(function(){
                  $("#return_content").hide();
                  $("#one_way_content").show();
                  
                  this.className += " active";
                  document.getElementById("return_trip").className = "nav-link";
                });
                
                $("input").click(function(){
                    $(this).next().show();
                    $(this).next().hide();
                });
            });
        </script>
        
        <%
            // Dates for advertisement
            LocalDate plusOneWeek = LocalDate.now().plusWeeks(1);
            LocalDate plusOneWeekThreeDays = plusOneWeek.plusDays(1);
            
            // Min date for searching
            LocalDate todaysDate = LocalDate.now();
        %>
        
        <div class="row mt-3">
            <div class="col-1"></div>
            <div class="col-10">
                <div id="demo" class="carousel slide" data-ride="carousel">

                  <!-- Indicators -->
                  <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                  </ul>

                  <!-- The slideshow -->
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                        <a href='Servlet?action=searchFlight&departureAirport=Dublin&destinationAirport=New%20York&departureDate=<%=plusOneWeek.toString()%>&returnDate=<%=plusOneWeekThreeDays.toString()%>&numPassengers=1'>
                            <img src="images/new_york.jpg" alt="New York" width="1200">
                        </a>
                    </div>
                    <div class="carousel-item">
                        <a href='Servlet?action=searchFlight&departureAirport=Dublin&destinationAirport=London%20Heathrow&departureDate=<%=plusOneWeek.toString()%>&returnDate=<%=plusOneWeekThreeDays.toString()%>&numPassengers=1'>
                            <img src="images/london.jpg" alt="London" width="1200">
                        </a>
                    </div>
                    <div class="carousel-item">
                        <a href='Servlet?action=searchFlight&departureAirport=Dublin&destinationAirport=Paris&departureDate=<%=plusOneWeek.toString()%>&returnDate=<%=plusOneWeekThreeDays.toString()%>&numPassengers=1'>
                            <img src="images/paris.jpg" alt="Paris" width="1200">
                        </a>
                    </div>
                  </div>

                  <!-- Left and right controls -->
                  <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                  </a>
                  <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                  </a>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
        
        </br></br>
        <div class="row mt-3">
            <div class="col-3"></div>
            <div class="col-6 text-center">
                
                <div>
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                          <a class="nav-link active" href="#" id="return_trip" ><%=dataBundle.getString("index_returnTrip")%></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#" id="one_way" ><%=dataBundle.getString("index_oneWay")%></a>
                        </li>
                    </ul>
                </div>
                
                </br>
                <div id="return_content">
                    <form action="Servlet" method="post">
                        <div class="row">
                            <div class="col-6">
                                <input list="departureAirport" name="departureAirport" placeholder='<%=dataBundle.getString("index_departure")%>' size='40'>
                                <datalist id="departureAirport">
                                    <%
                                        FlightDao fDao = new FlightDao(Dao.getDatabaseName());
                                        ArrayList<Flight> departureAirports = fDao.getDepartureAirports();
                                        if (departureAirports != null && !departureAirports.isEmpty()){
                                            for (Flight f: departureAirports){
                                    %>
                                        <!--Problem: Only want all of the departure airports, we're getting all of the flights--> 
                                        <option value="<%=f.getDepartureAirport()%>"><%=f.getDepartureAirportAbbreviation()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </datalist>

                                </br></br>
                                <label><%=dataBundle.getString("index_departureDate")%></label>
                                <input name="departureDate" id="departureDate" required type="date" min="<%=todaysDate.toString()%>" />
                            </div>

                            <div class="col-6">
                                <input list="destinationAirport" name="destinationAirport" placeholder='<%=dataBundle.getString("index_destination")%>' size='40'>
                                <datalist id="destinationAirport">
                                    <%
                                        ArrayList<Flight> arrivalAirports = fDao.getArrivalAirports();
                                        if (arrivalAirports != null && !arrivalAirports.isEmpty()){
                                            for (Flight f: arrivalAirports){
                                    %>
                                        <!--Problem: Only want all of the departure airports, we're getting all of the flights--> 
                                        <option value="<%=f.getArrivalAirport()%>"><%=f.getArrivalAirportAbbreviation()%></option>
                                    <%
                                            }
                                        } else {

                                        }
                                    %>
                                </datalist>

                                </br></br>
                                <label><%=dataBundle.getString("index_returnDate")%></label>
                                <input name="returnDate" required type="date" min="document.getElementById('departureDate').value" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-3"></div>
                            <div class="col-6">
                                </br>
                                <input name="numPassengers" required min="1" size="40" type="number" placeholder="<%=dataBundle.getString("index_numberOfPassengers")%>" />
                                </br></br>
                                <input type="submit" value="<%=dataBundle.getString("index_search")%>" />
                            </div>
                            <div class="col-3"></div>
                        </div>
                                
                        <!-- Include a hidden field to identify what the user wants to do -->
                        <input type="hidden" name ="action" value="searchFlight" />
                    </form>
                </div>
                <div id="one_way_content">
                    <form action="Servlet" method="post">
                        <div class="row">
                            <div class="col-6">
                                <input list="departureAirport" name="departureAirport" placeholder='<%=dataBundle.getString("index_departure")%>' size='40'>
                                <datalist id="departureAirport">
                                    <%
                                        if (departureAirports != null && !departureAirports.isEmpty()){
                                            for (Flight f: departureAirports){
                                    %>
                                        <!--Problem: Only want all of the departure airports, we're getting all of the flights--> 
                                        <option value="<%=f.getDepartureAirport()%>"><%=f.getDepartureAirportAbbreviation()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </datalist>

                                </br></br>
                                <label><%=dataBundle.getString("index_departureDate")%></label>
                                <input name="departureDate" required type="date" min="<%=todaysDate.toString()%>" />
                            </div>

                            <div class="col-6">
                                <input list="destinationAirport" name="destinationAirport" placeholder='<%=dataBundle.getString("index_destination")%>' size='40'>
                                <datalist id="destinationAirport">
                                    <%
                                        if (arrivalAirports != null && !arrivalAirports.isEmpty()){
                                            for (Flight f: arrivalAirports){
                                    %>
                                        <!--Problem: Only want all of the departure airports, we're getting all of the flights--> 
                                        <option value="<%=f.getArrivalAirport()%>"><%=f.getArrivalAirportAbbreviation()%></option>
                                    <%
                                            }
                                        } else {

                                        }
                                    %>
                                </datalist>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-3"></div>
                            <div class="col-6">
                                </br>
                                <input name="numPassengers" required min="1" size="40" type="number" placeholder="<%=dataBundle.getString("index_numberOfPassengers")%>" />
                                </br></br>
                                <input type="submit" value="<%=dataBundle.getString("index_search")%>" />
                            </div>
                            <div class="col-3"></div>
                        </div>
                                
                        <!-- Include a hidden field to identify what the user wants to do -->
                        <input type="hidden" name ="action" value="searchFlight" />
                    </form>
                </div>
            </div>
            <div class="col-3"></div>
        </div>
    
</html>
