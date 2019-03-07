/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Plane_Inventory;
import java.util.ArrayList;

/**
 *
 * @author D00191889
 */
public interface Plane_InventoryDaoInterface {
    
    /**
     * Gets every Plane_Inventory in the database.
     * 
     * @return An ArrayList of Plane_Inventory items.
     */
    public ArrayList<Plane_Inventory> getAllPlane_Inventory();
    
    /**
     * Gets a Plane_Inventory by its id.
     * 
     * @param id The id of the Plane_Inventory.
     * @return The Plane_Inventory.
     */
    public Plane_Inventory getPlane_InventoryById(int id);
    
}
