/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

/**
 *
 * @author D00191889
 */
public class User_Flight {
    
    private int id;
    private int userId;
    private int flightId;
    private String passengerFirstName;
    private String passengerLastName;
    private String travelClass;
    private String queue;
    private String seat;
    private String boardingDoor;
    private int specialAssistanceRequired;
    private double pricePaid;

    public User_Flight() {
        this.id = -1;
    }
    
    public User_Flight(int userId, int flightId, String passengerFirstName, String passengerLastName, String travelClass, String queue, String seat, String boardingDoor, int specialAssistanceRequired, double pricePaid) {
        this.id = -1;
        this.userId = userId;
        this.flightId = flightId;
        this.passengerFirstName = passengerFirstName;
        this.passengerLastName = passengerLastName;
        this.travelClass = travelClass;
        this.queue = queue;
        this.seat = seat;
        this.boardingDoor = boardingDoor;
        this.specialAssistanceRequired = specialAssistanceRequired;
        this.pricePaid = pricePaid;
    }
    
    public User_Flight(int id, int userId, int flightId, String passengerFirstName, String passengerLastName, String travelClass, String queue, String seat, String boardingDoor, int specialAssistanceRequired, double pricePaid) {
        this.id = id;
        this.userId = userId;
        this.flightId = flightId;
        this.passengerFirstName = passengerFirstName;
        this.passengerLastName = passengerLastName;
        this.travelClass = travelClass;
        this.queue = queue;
        this.seat = seat;
        this.boardingDoor = boardingDoor;
        this.specialAssistanceRequired = specialAssistanceRequired;
        this.pricePaid = pricePaid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public String getPassengerFirstName() {
        return passengerFirstName;
    }

    public void setPassengerFirstName(String passengerFirstName) {
        this.passengerFirstName = passengerFirstName;
    }

    public String getPassengerLastName() {
        return passengerLastName;
    }

    public void setPassengerLastName(String passengerLastName) {
        this.passengerLastName = passengerLastName;
    }

    public String getTravelClass() {
        return travelClass;
    }

    public void setTravelClass(String travelClass) {
        this.travelClass = travelClass;
    }

    public String getQueue() {
        return queue;
    }

    public void setQueue(String queue) {
        this.queue = queue;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat;
    }

    public String getBoardingDoor() {
        return boardingDoor;
    }

    public void setBoardingDoor(String boardingDoor) {
        this.boardingDoor = boardingDoor;
    }

    public int getSpecialAssistanceRequired() {
        return specialAssistanceRequired;
    }

    public void setSpecialAssistanceRequired(int specialAssistanceRequired) {
        this.specialAssistanceRequired = specialAssistanceRequired;
    }

    public double getPricePaid() {
        return pricePaid;
    }

    public void setPricePaid(double pricePaid) {
        this.pricePaid = pricePaid;
    }

    @Override
    public String toString() {
        return "User_Flight{" + "id=" + id + ", userId=" + userId + ", flightId=" + flightId + ", passengerFirstName=" + passengerFirstName + ", passengerLastName=" + passengerLastName + ", travelClass=" + travelClass + ", queue=" + queue + ", seat=" + seat + ", boardingDoor=" + boardingDoor + ", specialAssistanceRequired=" + specialAssistanceRequired + ", pricePaid=" + pricePaid + '}';
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 29 * hash + this.id;
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
        final User_Flight other = (User_Flight) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }
    
    
}
