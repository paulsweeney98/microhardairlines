/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

import java.sql.Date;



/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 * 
 * The author of this class is Paul Sweeney
 */
public class Flight {
    private int id;
    private String flightNumber;
    private double price;
    private int standardSeatsAvailable;
    private int businessSeatsAvailable;
    private int firstClassSeatsAvailable;
    private Date date;
    private int departureTime;
    private int arrivalTime;
    private int duration;
    private String departureAirport;
    private String departureAirportAbbreviation;
    private String arrivalAirport;
    private String arrivalAirportAbbreviation;
    private String departureTerminal;
    private String arrivalTerminal;

    public Flight() {
        this.id = -1;
    }
    
    public Flight(String flightNumber, double price, int standardSeatsAvailable, int businessSeatsAvailable, int firstClassSeatsAvailable, Date date, int departureTime, int arrivalTime, int duration, String departureAirport, String departureAirportAbbreviation, String arrivalAirport, String arrivalAirportAbbreviation, String departureTerminal, String arrivalTerminal) {
        this.id = -1;
        this.flightNumber = flightNumber;
        this.price = price;
        this.standardSeatsAvailable = standardSeatsAvailable;
        this.businessSeatsAvailable = businessSeatsAvailable;
        this.firstClassSeatsAvailable = firstClassSeatsAvailable;
        this.date = date;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.duration = duration;
        this.departureAirport = departureAirport;
        this.departureAirportAbbreviation = departureAirportAbbreviation;
        this.arrivalAirport = arrivalAirport;
        this.arrivalAirportAbbreviation = arrivalAirportAbbreviation;
        this.departureTerminal = departureTerminal;
        this.arrivalTerminal = arrivalTerminal;
    }
    
    public Flight(int id, String flightNumber, double price, int standardSeatsAvailable, int businessSeatsAvailable, int firstClassSeatsAvailable, Date date, int departureTime, int arrivalTime, int duration, String departureAirport, String departureAirportAbbreviation, String arrivalAirport, String arrivalAirportAbbreviation, String departureTerminal, String arrivalTerminal) {
        this.id = id;
        this.flightNumber = flightNumber;
        this.price = price;
        this.standardSeatsAvailable = standardSeatsAvailable;
        this.businessSeatsAvailable = businessSeatsAvailable;
        this.firstClassSeatsAvailable = firstClassSeatsAvailable;
        this.date = date;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.duration = duration;
        this.departureAirport = departureAirport;
        this.departureAirportAbbreviation = departureAirportAbbreviation;
        this.arrivalAirport = arrivalAirport;
        this.arrivalAirportAbbreviation = arrivalAirportAbbreviation;
        this.departureTerminal = departureTerminal;
        this.arrivalTerminal = arrivalTerminal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStandardSeatsAvailable() {
        return standardSeatsAvailable;
    }

    public void setStandardSeatsAvailable(int standardSeatsAvailable) {
        this.standardSeatsAvailable = standardSeatsAvailable;
    }

    public int getBusinessSeatsAvailable() {
        return businessSeatsAvailable;
    }

    public void setBusinessSeatsAvailable(int businessSeatsAvailable) {
        this.businessSeatsAvailable = businessSeatsAvailable;
    }

    public int getFirstClassSeatsAvailable() {
        return firstClassSeatsAvailable;
    }

    public void setFirstClassSeatsAvailable(int firstClassSeatsAvailable) {
        this.firstClassSeatsAvailable = firstClassSeatsAvailable;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(int departureTime) {
        this.departureTime = departureTime;
    }

    public int getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(int arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getDepartureAirport() {
        return departureAirport;
    }

    public void setDepartureAirport(String departureAirport) {
        this.departureAirport = departureAirport;
    }

    public String getDepartureAirportAbbreviation() {
        return departureAirportAbbreviation;
    }

    public void setDepartureAirportAbbreviation(String departureAirportAbbreviation) {
        this.departureAirportAbbreviation = departureAirportAbbreviation;
    }

    public String getArrivalAirport() {
        return arrivalAirport;
    }

    public void setArrivalAirport(String arrivalAirport) {
        this.arrivalAirport = arrivalAirport;
    }

    public String getArrivalAirportAbbreviation() {
        return arrivalAirportAbbreviation;
    }

    public void setArrivalAirportAbbreviation(String arrivalAirportAbbreviation) {
        this.arrivalAirportAbbreviation = arrivalAirportAbbreviation;
    }

    public String getDepartureTerminal() {
        return departureTerminal;
    }

    public void setDepartureTerminal(String departureTerminal) {
        this.departureTerminal = departureTerminal;
    }

    public String getArrivalTerminal() {
        return arrivalTerminal;
    }

    public void setArrivalTerminal(String arrivalTerminal) {
        this.arrivalTerminal = arrivalTerminal;
    }

    @Override
    public String toString() {
        return "Flight{" + "id=" + id + ", flightNumber=" + flightNumber + ", price=" + price + ", standardSeatsAvailable=" + standardSeatsAvailable + ", businessSeatsAvailable=" + businessSeatsAvailable + ", firstClassSeatsAvailable=" + firstClassSeatsAvailable + ", date=" + date + ", departureTime=" + departureTime + ", arrivalTime=" + arrivalTime + ", duration=" + duration + ", departureAirport=" + departureAirport + ", departureAirportAbbreviation=" + departureAirportAbbreviation + ", arrivalAirport=" + arrivalAirport + ", arrivalAirportAbbreviation=" + arrivalAirportAbbreviation + ", departureTerminal=" + departureTerminal + ", arrivalTerminal=" + arrivalTerminal + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 13 * hash + this.id;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Flight other = (Flight) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    
}
