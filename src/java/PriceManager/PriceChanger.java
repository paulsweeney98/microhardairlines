/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PriceManager;

import Dtos.Flight;
import java.time.LocalDate;

/**
 *
 * @author Paul Sweeney
 */
public class PriceChanger {
    
    public double setPrice(Flight flight, double currentPrice, String travelClass) {
        double newPrice = currentPrice;
        
        LocalDate todaysDate = LocalDate.now();
        LocalDate flightDate = LocalDate.parse(flight.getDate()+"");
        
        if (todaysDate.isBefore(flightDate)) {
        
            // Getting the difference between today's date and the date of the flight
            int yearDifference = (flightDate.getYear() - todaysDate.getYear()) * 365;
            int dayDifference = (yearDifference + flightDate.getDayOfYear()) - todaysDate.getDayOfYear();

            // Flight is long haul
            if (flight.getArrivalAirportAbbreviation().equals("JFK") || flight.getDepartureAirportAbbreviation().equals("JFK")) {

                // 150 standard seats
                if (travelClass.equals("standard")) {

                    // Flight is 7 days away
                    if (dayDifference <= 7) {
                        if (flight.getStandardSeatsAvailable() <= 10) {
                            newPrice = currentPrice * 1.70;
                        } else if (flight.getStandardSeatsAvailable() > 10 && flight.getStandardSeatsAvailable() <= 50) {
                            newPrice = currentPrice * 1.40;
                        } else if (flight.getStandardSeatsAvailable() > 50 && flight.getStandardSeatsAvailable() <= 100) {
                            newPrice = currentPrice * 1.20;
                        } else if (flight.getStandardSeatsAvailable() > 100 && flight.getStandardSeatsAvailable() <= 150) {
                            newPrice = currentPrice * 1;
                        }
                        
                    // Flight is one month away
                    } else if (dayDifference > 7  && dayDifference <= 31) {
                        if (flight.getStandardSeatsAvailable() <= 10) {
                            newPrice = currentPrice * 1.60;
                        } else if (flight.getStandardSeatsAvailable() > 10 && flight.getStandardSeatsAvailable() <= 50) {
                            newPrice = currentPrice * 1.30;
                        } else if (flight.getStandardSeatsAvailable() > 50 && flight.getStandardSeatsAvailable() <= 100) {
                            newPrice = currentPrice * 1.10;
                        } else if (flight.getStandardSeatsAvailable() > 100 && flight.getStandardSeatsAvailable() <= 150) {
                            newPrice = currentPrice * 1;
                        }
                        
                    // Flight is more than one month away
                    } else if (dayDifference > 31) {
                        if (flight.getStandardSeatsAvailable() <= 10) {
                            newPrice = currentPrice * 1.60;
                        } else if (flight.getStandardSeatsAvailable() > 10 && flight.getStandardSeatsAvailable() <= 50) {
                            newPrice = currentPrice * 1.20;
                        } else if (flight.getStandardSeatsAvailable() > 50 && flight.getStandardSeatsAvailable() <= 100) {
                            newPrice = currentPrice * 1.05;
                        } else if (flight.getStandardSeatsAvailable() > 100 && flight.getStandardSeatsAvailable() <= 150) {
                            newPrice = currentPrice * 1;
                        }
                    } else {
                        newPrice = 0;
                    }

                // 42 business seats
                } else if (travelClass.equals("business")) {

                    // Flight is 7 days away
                    if (dayDifference <= 7) {
                        if (flight.getBusinessSeatsAvailable() <= 5) {
                            newPrice = currentPrice * 1.70;
                        } else if (flight.getBusinessSeatsAvailable() > 5 && flight.getBusinessSeatsAvailable() <= 10) {
                            newPrice = currentPrice * 1.40;
                        } else if (flight.getBusinessSeatsAvailable() > 10 && flight.getBusinessSeatsAvailable() <= 20) {
                            newPrice = currentPrice * 1.20;
                        } else if (flight.getBusinessSeatsAvailable() > 20 && flight.getBusinessSeatsAvailable() <= 42) {
                            newPrice = currentPrice * 1;
                        }
                        
                    // Flight is one month away
                    } else if (dayDifference > 7  && dayDifference <= 31) {
                        if (flight.getBusinessSeatsAvailable() <= 5) {
                            newPrice = currentPrice * 1.60;
                        } else if (flight.getBusinessSeatsAvailable() > 5 && flight.getBusinessSeatsAvailable() <= 10) {
                            newPrice = currentPrice * 1.30;
                        } else if (flight.getBusinessSeatsAvailable() > 10 && flight.getBusinessSeatsAvailable() <= 20) {
                            newPrice = currentPrice * 1.10;
                        } else if (flight.getBusinessSeatsAvailable() > 20 && flight.getBusinessSeatsAvailable() <= 42) {
                            newPrice = currentPrice * 1;
                        }
                        
                    // Flight is more than one month away
                    } else if (dayDifference > 31) {
                        if (flight.getBusinessSeatsAvailable() <= 5) {
                            newPrice = currentPrice * 1.60;
                        } else if (flight.getBusinessSeatsAvailable() > 5 && flight.getBusinessSeatsAvailable() <= 10) {
                            newPrice = currentPrice * 1.20;
                        } else if (flight.getBusinessSeatsAvailable() > 10 && flight.getBusinessSeatsAvailable() <= 20) {
                            newPrice = currentPrice * 1.05;
                        } else if (flight.getBusinessSeatsAvailable() > 20 && flight.getBusinessSeatsAvailable() <= 42) {
                            newPrice = currentPrice * 1;
                        }
                    } else {
                        newPrice = 0;
                    }

                // 12 first class seats
                } else if (travelClass.equals("firstClass")) {

                    // Flight is 7 days away
                    if (dayDifference <= 7) {
                        newPrice = currentPrice * 1.15;
                        
                    // Flight is one month away
                    } else if (dayDifference > 7  && dayDifference <= 31) {
                        newPrice = currentPrice * 1.05;
                        
                    // Flight is more than one month away
                    } else if (dayDifference > 31) {
                        newPrice = currentPrice * 1;
                        
                    } else {
                        newPrice = 0;
                    }
                    
                }

            // Flight is short haul
            } else {

                // 138 standard seats
                if (travelClass.equals("standard")) {

                    // Flight is 7 days away
                    if (dayDifference <= 7) {
                        if (flight.getStandardSeatsAvailable() <= 10) {
                            newPrice = currentPrice * 1.70;
                        } else if (flight.getStandardSeatsAvailable() > 10 && flight.getStandardSeatsAvailable() <= 50) {
                            newPrice = currentPrice * 1.40;
                        } else if (flight.getStandardSeatsAvailable() > 50 && flight.getStandardSeatsAvailable() <= 100) {
                            newPrice = currentPrice * 1.20;
                        } else if (flight.getStandardSeatsAvailable() > 100 && flight.getStandardSeatsAvailable() <= 138) {
                            newPrice = currentPrice * 1;
                        }
                        
                    // Flight is one month away
                    } else if (dayDifference > 7  && dayDifference <= 31) {
                        if (flight.getStandardSeatsAvailable() <= 10) {
                            newPrice = currentPrice * 1.60;
                        } else if (flight.getStandardSeatsAvailable() > 10 && flight.getStandardSeatsAvailable() <= 50) {
                            newPrice = currentPrice * 1.30;
                        } else if (flight.getStandardSeatsAvailable() > 50 && flight.getStandardSeatsAvailable() <= 100) {
                            newPrice = currentPrice * 1.10;
                        } else if (flight.getStandardSeatsAvailable() > 100 && flight.getStandardSeatsAvailable() <= 138) {
                            newPrice = currentPrice * 1;
                        }
                        
                    // Flight is more than one month away
                    } else if (dayDifference > 31) {
                        if (flight.getStandardSeatsAvailable() <= 10) {
                            newPrice = currentPrice * 1.60;
                        } else if (flight.getStandardSeatsAvailable() > 10 && flight.getStandardSeatsAvailable() <= 50) {
                            newPrice = currentPrice * 1.20;
                        } else if (flight.getStandardSeatsAvailable() > 50 && flight.getStandardSeatsAvailable() <= 100) {
                            newPrice = currentPrice * 1.05;
                        } else if (flight.getStandardSeatsAvailable() > 100 && flight.getStandardSeatsAvailable() <= 138) {
                            newPrice = currentPrice * 1;
                        }
                    } else {
                        newPrice = 0;
                    }

                // 24 business seats
                } else if (travelClass.equals("business")) {

                    // Flight is 7 days away
                    if (dayDifference <= 7) {
                        if (flight.getBusinessSeatsAvailable() <= 10) {
                            newPrice = currentPrice * 1.60;
                        } else if (flight.getBusinessSeatsAvailable() > 10) {
                            newPrice = currentPrice * 1.40;
                        }
                        
                    // Flight is one month away
                    } else if (dayDifference > 7  && dayDifference <= 31) {
                        if (flight.getBusinessSeatsAvailable() <= 10) {
                            newPrice = currentPrice * 1.20;
                        } else if (flight.getBusinessSeatsAvailable() > 10) {
                            newPrice = currentPrice * 1.10;
                        }
                        
                    // Flight is more than one month away
                    } else if (dayDifference > 31) {
                        if (flight.getBusinessSeatsAvailable() <= 10) {
                            newPrice = currentPrice * 1.15;
                        } else if (flight.getBusinessSeatsAvailable() > 10) {
                            newPrice = currentPrice * 1;
                        }
                        
                    } else {
                        newPrice = 0;
                    }

                // 12 first class seats
                } else if (travelClass.equals("firstClass")) {

                    // Flight is 7 days away
                    if (dayDifference <= 7) {
                        newPrice = currentPrice * 1.15;
                        
                    // Flight is one month away
                    } else if (dayDifference > 7  && dayDifference <= 31) {
                        newPrice = currentPrice * 1.05;
                        
                    // Flight is more than one month away
                    } else if (dayDifference > 31) {
                        newPrice = currentPrice * 1;
                        
                    } else {
                        newPrice = 0;
                    }
                    
                }
                
            }
        
        } else {
            newPrice = 0;
        }
        
        return newPrice;
    }
    
}
