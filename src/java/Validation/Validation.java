/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Validation;

import java.sql.Date;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.Calendar;
import javax.servlet.http.HttpSession;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 * 
 * The author of this class is Paul Sweeney
 */
public class Validation {
    
    /**
     * Checks to see if a date is valid.
     * 
     * Takes in a date as an argument and checks to see if
     * it's valid.
     * 
     * @param date The date to be checked
     * @return A boolean to show if the date is valid or not.
     */
    public boolean checkDate(Date date) {
        int day = date.getDay();
        day = day - 2;
        int month = date.getMonth();
        month = month + 1;
        int year = date.getYear();
        year = year + 1800;
        
        boolean appropriateResponse = true;
        boolean leapYear = false;
        if (((2020 - year) % 4) == 0) {
            leapYear = true;
        }
        if ((year < 1800) || (year > 2018)) {
            appropriateResponse = false;
        }
        if ((month < 1) || (month > 12)) {
            appropriateResponse = false;
        }
        if (((leapYear == true) && (month == 2)) && ((day > 29) || (day < 1))) {
            appropriateResponse = false;
        }
        if (((leapYear == false) && (month == 2)) && ((day > 28) && (day < 1))) {
            appropriateResponse = false;
        }
        if (((month == 1) || (month == 3) || (month == 5) || ((month == 7) || (month == 8) || (month == 10) || (month == 12))) && ((day > 31) || (day < 1))) {
            appropriateResponse = false;
        }
        if (((month == 4) || (month == 6) || (month == 9) || ((month == 11))) && ((day > 30) || (day < 1))) {
            appropriateResponse = false;
        }
        
        return appropriateResponse;
    }
    
    /**
     * Checks if a credit or debit card is valid.
     * 
     * @param type The type of the card e.g. Visa or Mastercard.
     * @param number The card number.
     * @param expiry_month The card's expiry month.
     * @param expiry_year The card's expiry year.
     * @param cvv The card's cvv code.
     * @return A boolean indicating if the card is valid.
     */
    public boolean checkCard(String type, String number, String expiry_month, String expiry_year, String cvv) {
        boolean valid = true;
        
        // Getting today's date
        // Calendar todaysDateCalender = Calendar.getInstance();
        Date todaysDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        int expiry_monthInt = Integer.parseInt(expiry_month);
        int expiry_yearInt = Integer.parseInt(expiry_year);
        // Date expiry_date = new java.sql.Date(1, expiry_monthInt, expiry_yearInt);
        
        if (type.equalsIgnoreCase("visa") && !number.startsWith("4")) {
            valid = false;
        } else if (type.equalsIgnoreCase("visa") && number.length() != 16) {
            valid = false;
        } else if (type.equalsIgnoreCase("mastercard") && (number.substring(0, 3).equalsIgnoreCase("51") || number.substring(0, 3).equalsIgnoreCase("52")  || number.substring(0, 3).equalsIgnoreCase("53") || number.substring(0, 3).equalsIgnoreCase("54")  || number.substring(0, 3).equalsIgnoreCase("55"))) {
            valid = false;
        } else if (type.equalsIgnoreCase("mastercard") && number.length() != 16) {
            valid = false;
        } else if (type.equalsIgnoreCase("mastercard") && number.length() != 16) {
            valid = false;
        } else if (cvv.length() != 3) {
            valid = false;
        } else if ((todaysDate.getYear() + 1900) > expiry_yearInt) {
            valid = false;
        } else if (((todaysDate.getMonth() + 1) > expiry_monthInt) && ((todaysDate.getYear() + 1900) == expiry_yearInt)) {
            valid = false;
        }
        
        int month = todaysDate.getMonth() + 1;
        int year = todaysDate.getYear() + 1900;
        
        return valid;
    }
    
    /**
     * Changes the time in minutes into a time structured String.
     * 
     * @param minutes The time in minutes.
     * @return A String of the time in hours and minutes.
     */
    public String changeMinutesToHours(int minutes) {
        int hours = Math.floorDiv(minutes, 60);
        minutes = minutes % 60;
        
        String minutesString = minutes + "";
        if (minutes == 0) {
            minutesString = "00";
        }
        
        return hours + ":" + minutesString;
    }
    
    /**
     * Changes the time in minutes into a String with number of hours and minutes.
     * 
     * @param minutes The time in minutes.
     * @return A String of hours and minutes.
     */
    public String changeMinutesToHours2(int minutes) {
        int hours = Math.floorDiv(minutes, 60);
        minutes = minutes % 60;
        
        return hours + "h " + minutes + "m";
    }
    
    /**
     * Converts a String to an int, or returns -1 if not possible.
     * 
     * @param numberString The String to be converted.
     * @return A int of the number.
     */
    public int convertStringToInt(String numberString) {
        int number = -1;
        
        // Check if it's a valid int
        try
        {
            // Parse number information
            number = Integer.parseInt(numberString);
        } // Deal with where the user supplied text instead of a number
        catch (NumberFormatException e)
        {
            number = -1;
        }
        
        return number;
    }
    
    /**
     * Converts a String to a double, or returns -1 if not possible.
     * 
     * @param numberString The String to be converted.
     * @return A double of the number.
     */
    public double convertStringToDouble(String numberString) {
        double number = -1;
        
        // Check if it's a valid int
        try
        {
            // Parse number information
            number = Double.parseDouble(numberString);
        } // Deal with where the user supplied text instead of a number
        catch (NumberFormatException e)
        {
            number = -1;
        }
        
        return number;
    }
    
    /**
     * Checks if the departure date is either today or later.
     * 
     * @param departureDate The date to be checked.
     * @return A boolean indicating if the departure date is valid.
     */
    public boolean checkDepartureDate(Date departureDate) {
        boolean valid = true;
        
        LocalDate todaysDateLocalDate = LocalDate.now();
        Date todaysDate = java.sql.Date.valueOf(todaysDateLocalDate);
        
        if (departureDate.before(todaysDate)) {
            valid = false;
        }
        
        return valid;
    }
    
    /**
     * 
     * 
     * @param departureDate
     * @param returnDate
     * @return 
     */
    public boolean checkReturnDate(Date departureDate, Date returnDate) {
        boolean valid = true;
        
        if (returnDate.before(departureDate)) {
            valid = false;
        }
        
        return valid;
    }
    
    public boolean checkPassport(String country, String documentNumber, Date expiryDate) {
        boolean valid = false;
        
        
        
        return valid;
    }
}
