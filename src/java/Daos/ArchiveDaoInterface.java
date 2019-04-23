/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Checked_baggage;
import Dtos.Flight;
import Dtos.User_Flight;
import java.sql.Date;
import java.util.ArrayList;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 * 
 * The author of this class is Gerard Hoey
 */
public interface ArchiveDaoInterface {
    /**
     * Archives a <code>Flight</code> in the flight_archive table in the
     * database.
     *
     * @param flight The <code>Flight</code> to be archived.
     * @return <code>int</code> indicating the number of rows affected by the
     * insert, should be 1 if successful and -1 if not.
     */
    public int archiveFlight(Flight flight);
    
    public int archiveChecked_baggage(Checked_baggage checked_baggage);
    
    public int archiveUser_Flight(User_Flight user_flight);
}
