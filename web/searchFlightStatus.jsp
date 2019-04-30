<%-- 
    Document   : flightStatusByFlightNumberAndDate
    Created on : 11-Apr-2019, 10:41:53
    Author     : Dean Farrelly
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
        <title>Flight Status</title>
    </head>
    <body>
        <div id="byFlightNumber">
            <div class="row">
                <div class="col-0 col-md-3"></div>
                <div class="col-12 col-md-6 border border-primary">
                    <form action="Servlet" method="post">
                        <div class="form-row">
                            <div class="col">
                                <label>Flight Number</label>
                                <input name="flightNumber" placeholder='Flight Number' class="form-control">
                            </div>
                            
                            <div class="col">
                                <label><%=dataBundle.getString("index_departureDate")%></label>
                                <input name="departureDate" id="departureDate" required type="date" class="form-control"/>
                            </div>
                        </div>
                            
                        <br>
                        <div class="form-row">
                            <div class="col text-center">
                                <input class="btn btn-success" type="submit" value="<%=dataBundle.getString("index_search")%>" />
                            </div>
                        </div>
                        <input type="hidden" name ="action" value="flightStatusByFlightNumberAndDate" />
                    </form>
                </div>
                <div class="col-0 col-md-3"></div>
            </div>
        </div>
                            
        <div id="byLocation">
            <div class="row">
                <div class="col-0 col-md-3"></div>
                <div class="col-12 col-md-6 border border-primary">
                    <form action="Servlet" method="post">
                        <div class="form-row">
                            <div class="col">
                                <label>Departure Airport</label>
                                <input list="departureAirport" name="departureAirport" placeholder='Departure' class="form-control">
                                
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
                                <label>Destination Airport</label>
                                <input list="destinationAirport" name="destinationAirport" placeholder='Destination' class="form-control">
                                
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
                        </div>
                                
                        <br>
                        <div class="form-row">
                            <div class="col">
                                <label><%=dataBundle.getString("index_departureDate")%></label>
                                <input name="departureDate" id="departureDate" required type="date" class="form-control"/>
                            </div>
                        </div>
                            
                        <br>
                        <div class="form-row">
                            <div class="col text-center">
                                <input class="btn btn-success" type="submit" value="<%=dataBundle.getString("index_search")%>" />
                            </div>
                        </div>
                        <input type="hidden" name ="action" value="flightStatusByLocationAndDate" />
                    </form>
                </div>
                <div class="col-0 col-md-3"></div>
            </div>
        </div>
    </body>
</html>
