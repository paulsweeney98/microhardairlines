/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PriceChanger;

import Dtos.Flight;
import java.time.LocalDate;

/**
 *
 * @author Paul Sweeney
 */
public class PriceChanger {
    
    public double setPrice(Flight flight) {
        double currentPrice = flight.getPrice();
        double newPrice = currentPrice;
        
        LocalDate todaysDate = LocalDate.now();
        
        if (flight.getStandardSeatsAvailable() < 10) {
            
        }
        
        return newPrice;
    }
    
}
