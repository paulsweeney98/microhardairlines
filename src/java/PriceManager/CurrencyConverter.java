/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PriceManager;

/**
 *
 * @author Paul Sweeney
 */
public class CurrencyConverter {
    
    public double convert(double originalAmount, String newCurrency) {
        double newAmount = -1;
        
        if (newCurrency.equals("EUR")) {
            newAmount = originalAmount;
        } else if (newCurrency.equals("USD")) {
            newAmount = originalAmount * 1.12;
        } else if (newCurrency.equals("GBP")) {
            newAmount = originalAmount * 0.86;
        } else {
            newAmount = -1;
        }
        
        return newAmount;
    }
    
}
