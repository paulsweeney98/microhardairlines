/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

/**
 *
 * @author pauls
 */
public class Checked_baggage {
    private int id;
    private double weight;
    private double pricePaid;
    private int user_flightId;

    public Checked_baggage() {
        this.id = -1;
    }
    
    public Checked_baggage(double weight, double pricePaid, int user_flightId) {
        this.id = -1;
        this.weight = weight;
        this.pricePaid = pricePaid;
        this.user_flightId = user_flightId;
    }
    
    public Checked_baggage(int id, double weight, double pricePaid, int user_flightId) {
        this.id = id;
        this.weight = weight;
        this.pricePaid = pricePaid;
        this.user_flightId = user_flightId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getPricePaid() {
        return pricePaid;
    }

    public void setPricePaid(double pricePaid) {
        this.pricePaid = pricePaid;
    }

    public int getUser_flightId() {
        return user_flightId;
    }

    public void setUser_flightId(int user_flightId) {
        this.user_flightId = user_flightId;
    }

    @Override
    public String toString() {
        return "Checked_baggage{" + "id=" + id + ", weight=" + weight + ", pricePaid=" + pricePaid + ", user_flightId=" + user_flightId + '}';
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
        final Checked_baggage other = (Checked_baggage) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }
    
    
}
