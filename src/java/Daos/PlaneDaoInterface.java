/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Plane;

/**
 *
 * @author D00191889
 */
public interface PlaneDaoInterface {
    
    /**
     * Gets a Plane by its id.
     * 
     * @param id The id of the Plane.
     * @return The Plane.
     */
    public Plane getPlaneById(int id);
    
}
