<%-- 
    Document   : flightStatusByFlightNumAndDate
    Created on : 14-Mar-2019, 13:30:05
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Search Flights Status By Location and Departure Date</h1>
        <div id="return_content">
                <form action="Servlet" method="post" class="px-4 py-3">
                    <div class="row mt-3">
                        <div class="col-3"></div>
                        <div class="col-6">
                        <div class="border border-primary">
                        <div class="row">
                            <div class="col-6 text-center">
                                <label>Departure Airport</label>
                                <input list="departureAirport" name="departureAirport" placeholder='<%=dataBundle.getString("index_departure")%>' size='40'>
                                </br></br>
                                <label>Arrival Airport</label>
                                <input list="destinationAirport" name<datalist id="destinationAirport">
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
                                
                                </br></br>
                                <label><%=dataBundle.getString("index_departureDate")%></label>
                                <input name="departureDate" id="departureDate" required type="date" />
                                <input type="submit" value="<%=dataBundle.getString("index_search")%>" />
                            </div>
                        </div>
                    </div>
                <div class="col-3"></div>
            </div>
                            <input type="hidden" name ="action" value="flightStatusByLocationAndDate" />
                    <form>            
    </body>
</html>
