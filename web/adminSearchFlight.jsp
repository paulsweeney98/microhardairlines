<%-- 
    Document   : adminSearchFlight
    Created on : 07-Mar-2019, 15:41:01
    Author     : D00191889
--%>

<%@page import="Dtos.Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.FlightDao"%>
<%@page import="Daos.Dao"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("adminSearchFlight_title")%></title>
    </head>
    <body>
        <script>
            $(document).ready(function(){
                // Flights dropdown
                $("input").click(function(){
                    $(this).next().show();
                    $(this).next().hide();
                });
            });
        </script>
        
        <%
            if (loggedInUser != null && loggedInUser.getPrivileges() == 2) {
        %>
        
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-4"><%=dataBundle.getString("adminSearchFlight_adminPage")%></h1>
                <p class="lead"><%=dataBundle.getString("adminSearchFlight_welcome")%>, <%=loggedInUser.getFirstName()%> <%=loggedInUser.getLastName()%></p>
            </div>
        </div>
            
        <h3 class="text-center"><%=dataBundle.getString("adminSearchFlight_searchForTheFlight")%></h3>
           
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8 border border-primary rounded"></br>
                <form action="adminSearchFlightResults.jsp" method="post">
                    <div class="form-row">
                      <div class="col">
                        <label for="departureAirport"><%=dataBundle.getString("adminSearchFlight_departureAirport")%></label>
                        <input list="departureAirport" name="departureAirport" id="departureAirport" class="form-control" required >
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
                        <label for="destinationAirport"><%=dataBundle.getString("adminSearchFlight_destinationAirport")%></label>
                        <input name="destinationAirport" id="destinationAirport" type="text" class="form-control" required >
                      </div>
                    </div></br>
                    
                    <div class="form-row">
                      <div class="col">
                        <label for="departureDate"><%=dataBundle.getString("adminSearchFlight_departureDate")%></label>
                        <input list="departureDate" name="departureDate" id="departureDate" required type="date" min="<%=LocalDate.now()%>" class="form-control" required />
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
                    </div></br>
                    
                    <div class="form-row text-center">
                      <div class="col">
                          <input class="btn btn-success" type="submit" value="<%=dataBundle.getString("adminSearchFlight_searchFlights")%>" />&nbsp;&nbsp;
                        <input class="btn btn-danger" type="reset" value="<%=dataBundle.getString("adminSearchFlight_reset")%>">
                      </div>
                    </div></br>
                </form></br>
            </div>
            <div class="col-2"></div>
        </div>
        
        <%
            } else {
        %>
        <div class="text-center">
            <h3><%=dataBundle.getString("adminSearchFlight_mustBeAdmin")%></h3>
            <a href="index.jsp" class="btn btn-success"><%=dataBundle.getString("adminSearchFlight_normalUserHomepage")%></a>
        </div>
        <%
            }
        %>
    </body>
</html>
