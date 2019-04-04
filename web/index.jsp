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
                // Tabs
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
                
                // Flights dropdown
                $("input").click(function(){
                    $(this).next().show();
                    $(this).next().hide();
                });
                
                // Set min for return date
                $("#returnDate").click(function(){
                    document.getElementById("returnDate").min = document.getElementById("departureDate").value;
                });
                
                 // Set max for departure date
                $("#departureDate").click(function(){
                    document.getElementById("departureDate").max = document.getElementById("returnDate").value;
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
            <div class="col-0 col-md-1"></div>
            <div class="col-12 col-md-10">
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
            <div class="col-0 col-md-1"></div>
        </div>
        
        </br></br>
        <div class="row mt-3">
            <div class="col-0 col-md-2"></div>
            <div class="col-12 col-md-8 text-center">
                
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
                        <div class="form-row">
                            <div class="col">
                                <label><%=dataBundle.getString("index_departure")%></label>
                                <input list="departureAirport" name="departureAirport" placeholder='<%=dataBundle.getString("index_departure")%>' class="form-control">
                                <datalist id="departureAirport">
                                    <%
                                        FlightDao fDao = new FlightDao(Dao.getDatabaseName());
                                        ArrayList<Flight> departureAirports = fDao.getDepartureAirports();
                                        if (departureAirports != null && !departureAirports.isEmpty()){
                                            for (Flight f: departureAirports){
                                    %>
                                        <option value="<%=f.getDepartureAirport()%>"><%=f.getDepartureAirportAbbreviation()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </datalist>
                            </div>

                            <div class="col">
                                <label><%=dataBundle.getString("index_destination")%></label>
                                <input list="destinationAirport" name="destinationAirport" placeholder='<%=dataBundle.getString("index_destination")%>' class="form-control">
                                <datalist id="destinationAirport">
                                    <%
                                        ArrayList<Flight> arrivalAirports = fDao.getArrivalAirports();
                                        if (arrivalAirports != null && !arrivalAirports.isEmpty()){
                                            for (Flight f: arrivalAirports){
                                    %>
                                        <option value="<%=f.getArrivalAirport()%>"><%=f.getArrivalAirportAbbreviation()%></option>
                                    <%
                                            }
                                        } else {

                                        }
                                    %>
                                </datalist>
                            </div>
                        </div><br/>

                        <div class="form-row">
                            <div class="col">
                                <label><%=dataBundle.getString("index_departureDate")%></label>
                                <input name="departureDate" id="departureDate" required type="date" min="<%=todaysDate.toString()%>" class="form-control" />
                            </div>

                            <div class="col">
                                <label><%=dataBundle.getString("index_returnDate")%></label>
                                <input name="returnDate" onfocusin="updateDate()" id="returnDate" required type="date" min="" class="form-control" />
                            </div>
                        </div><br/>

                        <div class="form-row">
                            <div class="col-6">
                                <label><%=dataBundle.getString("index_numberOfPassengers")%></label>
                                <input name="numPassengers" required min="1" max="10" type="number" placeholder="<%=dataBundle.getString("index_max10")%>" class="form-control" />
                            </div>
                        </div><br/>
                            
                        <div class="form-row">
                            <div class="col-0 col-md-3"></div>
                            <div class="col-12 col-md-6">
                                <input type="submit" value="<%=dataBundle.getString("index_search")%>" class="form-control btn btn-success" />
                            </div>
                            <div class="col-0 col-md-3"></div>
                        </div><br/>
                                
                        <!-- Include a hidden field to identify what the user wants to do -->
                        <input type="hidden" name ="action" value="searchFlight" />
                    </form>
                </div>
                            
                <div id="one_way_content">
                    <form action="Servlet" method="post">
                        <div class="form-row">
                            <div class="col">
                                <label><%=dataBundle.getString("index_departure")%></label>
                                <input list="departureAirport" name="departureAirport" placeholder='<%=dataBundle.getString("index_departure")%>' class="form-control">
                                <datalist id="departureAirport">
                                    <%
                                        if (departureAirports != null && !departureAirports.isEmpty()){
                                            for (Flight f: departureAirports){
                                    %>
                                        <option value="<%=f.getDepartureAirport()%>"><%=f.getDepartureAirportAbbreviation()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </datalist>
                            </div>

                            <div class="col">
                                <label><%=dataBundle.getString("index_destination")%></label>
                                <input list="destinationAirport" name="destinationAirport" placeholder='<%=dataBundle.getString("index_destination")%>' class="form-control">
                                <datalist id="destinationAirport">
                                    <%
                                        if (arrivalAirports != null && !arrivalAirports.isEmpty()){
                                            for (Flight f: arrivalAirports){
                                    %>
                                        <option value="<%=f.getArrivalAirport()%>"><%=f.getArrivalAirportAbbreviation()%></option>
                                    <%
                                            }
                                        } else {

                                        }
                                    %>
                                </datalist>
                            </div>
                        </div><br/>

                        <div class="form-row">
                            <div class="col">
                                <label><%=dataBundle.getString("index_departureDate")%></label>
                                <input name="departureDate" id="departureDate" required type="date" min="<%=todaysDate.toString()%>" class="form-control" />
                            </div>
                            
                            <div class="col">
                                <label><%=dataBundle.getString("index_numberOfPassengers")%></label>
                                <input name="numPassengers" required min="1" max="10" type="number" placeholder="<%=dataBundle.getString("index_max10")%>" class="form-control" />
                            </div>
                        </div><br/>
                            
                        <div class="form-row">
                            <div class="col-0 col-md-3"></div>
                            <div class="col-12 col-md-6">
                                <input type="submit" value="<%=dataBundle.getString("index_search")%>" class="form-control btn btn-success" />
                            </div>
                            <div class="col-0 col-md-3"></div>
                        </div><br/>
                                
                        <!-- Include a hidden field to identify what the user wants to do -->
                        <input type="hidden" name ="action" value="searchFlight" />
                    </form>
                </div>
            </div>
            <div class="col-0 col-md-2"></div>
        </div>
    
</html>
