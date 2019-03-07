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
public class Plane {
    private int id;
    private String make;
    private String model;
    private int standardSeatsCapacity;
    private int businessSeatsCapacity;
    private int firstClassSeatsCapacity;

    public Plane() {
        this.id = -1;
    }
    
    public Plane(String make, String model, int standardSeatsCapacity, int businessSeatsCapacity, int firstClassSeatsCapacity) {
        this.id = -1;
        this.make = make;
        this.model = model;
        this.standardSeatsCapacity = standardSeatsCapacity;
        this.businessSeatsCapacity = businessSeatsCapacity;
        this.firstClassSeatsCapacity = firstClassSeatsCapacity;
    }
    
    public Plane(int id, String make, String model, int standardSeatsCapacity, int businessSeatsCapacity, int firstClassSeatsCapacity) {
        this.id = id;
        this.make = make;
        this.model = model;
        this.standardSeatsCapacity = standardSeatsCapacity;
        this.businessSeatsCapacity = businessSeatsCapacity;
        this.firstClassSeatsCapacity = firstClassSeatsCapacity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getStandardSeatsCapacity() {
        return standardSeatsCapacity;
    }

    public void setStandardSeatsCapacity(int standardSeatsCapacity) {
        this.standardSeatsCapacity = standardSeatsCapacity;
    }

    public int getBusinessSeatsCapacity() {
        return businessSeatsCapacity;
    }

    public void setBusinessSeatsCapacity(int businessSeatsCapacity) {
        this.businessSeatsCapacity = businessSeatsCapacity;
    }

    public int getFirstClassSeatsCapacity() {
        return firstClassSeatsCapacity;
    }

    public void setFirstClassSeatsCapacity(int firstClassSeatsCapacity) {
        this.firstClassSeatsCapacity = firstClassSeatsCapacity;
    }

    @Override
    public String toString() {
        return "Plane{" + "id=" + id + ", make=" + make + ", model=" + model + ", standardSeatsCapacity=" + standardSeatsCapacity + ", businessSeatsCapacity=" + businessSeatsCapacity + ", firstClassSeatsCapacity=" + firstClassSeatsCapacity + '}';
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 31 * hash + this.id;
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
        final Plane other = (Plane) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }
    
    
}
