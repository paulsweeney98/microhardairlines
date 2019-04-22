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
    
    public double convert(double originalAmount, String newCurrencyCountry) {
        double newAmount = originalAmount;
        
        if (newCurrencyCountry.equals("IE") || newCurrencyCountry.equals("FR")) {
            newAmount = originalAmount;
        } else if (newCurrencyCountry.equals("GB")) {
            newAmount = originalAmount * 0.87;
        } else if (newCurrencyCountry.equals("US")) {
            newAmount = originalAmount * 1.13;
        } else if (newCurrencyCountry.equals("en-CA") || newCurrencyCountry.equals("fr-CA")) {
            newAmount = originalAmount * 1.50;
        } else {
            newAmount = -1;
        }
        
        return newAmount;
    }
    
}
