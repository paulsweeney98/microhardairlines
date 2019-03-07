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
public class Plane_Inventory {
    private int id;
    private int planeId;

    public Plane_Inventory() {
        this.id = -1;
    }
    
    public Plane_Inventory(int planeId) {
        this.id = -1;
        this.planeId = planeId;
    }
    
    public Plane_Inventory(int id, int planeId) {
        this.id = id;
        this.planeId = planeId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPlaneId() {
        return planeId;
    }

    public void setPlaneId(int planeId) {
        this.planeId = planeId;
    }

    @Override
    public String toString() {
        return "Plane_Inventory{" + "id=" + id + ", planeId=" + planeId + '}';
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 59 * hash + this.id;
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
        final Plane_Inventory other = (Plane_Inventory) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }
    
    
}
