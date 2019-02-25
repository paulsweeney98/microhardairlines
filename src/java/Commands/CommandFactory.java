/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 * 
 * The author of this class is Paul Sweeney
 */
public class CommandFactory {
    
    private CommandFactory(){
        
    }
    
    public static Command createCommand(String action){
        Command c = null;
        // If there was an action provided, choose which method should run and where the user should go next
        if(action != null){
            switch(action){
                case "login":
                    // Handle where the user wants to login
                    c = new LoginCommand();
                    break;
                case "register":
                    // Handle where the user wants to register
                    c = new RegisterCommand();
                    break;
                case "logout":
                    // Do all logic for logging out user
                    c = new LogoutCommand();
                    break;
                case "changeLanguage":
                    // Do all logic for chaging the language
                    c = new ChangeLanguageCommand();
                    break;
                case "searchFlight":
                    // Do all logic for searching for a flight
                    c = new SearchFlightCommand();
                    break;
                case "storePassengerDetails":
                    // Do all logic for storing the passenger details
                    c = new StorePassengerDetailsCommand();
                    break;
                case "storeCheckedBaggage":
                    // Do all logic for storing the checked baggage
                    c = new StoreCheckedBaggageCommand();
                    break;
                case "bookFlight":
                    // Do all logic to book a flight
                    c = new BookFlightCommand();
                    break;
                case "selectSeat":
                    // Do all logic to select seat
                    c = new SelectSeatCommand();
                    break;
                case "cancelFlight":
                    // Do all logic cancel a flight
                    c = new CancelFlightCommand();
                    break;
                default:
                    // Do all logic for incorrect action processing 
                    c = new NoActionSuppliedCommand();
                    break;
            }
        }else{
            c = new NoActionSuppliedCommand();
        }
        
        return c;
    }
}
