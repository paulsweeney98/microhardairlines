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
                case "addSecurityQuestions":
                    // Do all logic for adding security questions
                    c = new AddSecurityQuestionsCommand();
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
                case "addCheckedBaggage":
                    // Do all logic to add checked baggage
                    c = new AddCheckedBaggageCommand();
                    break;
                case "payCheckedBaggage":
                    // Do all logic to pay for checked baggage
                    c = new PayCheckedBaggageCommand();
                    break;
                case "addPriorityBoarding":
                    // Do all logic to add priority boarding
                    c = new AddPriorityBoardingCommand();
                    break;
                case "payPriorityBoarding":
                    // Do all logic to pay for priority boarding
                    c = new PayPriorityBoardingCommand();
                    break;
                case "cancelFlight":
                    // Do all logic to cancel a flight
                    c = new CancelFlightCommand();
                    break;
                case "adminAddFlight":
                    // Do all logic to add a flight
                    c = new AdminAddFlightCommand();
                    break;
                case "adminEditFlight":
                    // Do all logic to edit a flight
                    c = new AdminEditFlightCommand();
                    break;
                case "adminRemoveFlight":
                    // Do all logic to remove a flight
                    c = new AdminRemoveFlightCommand();
                    break;
                case "adminSuspendUser": 
                    // Do all logic to suspend a user
                    c = new AdminSuspendUserCommand();
                    break;
                case "adminUnsuspendUser": 
                    // Do all logic to unsuspend a user
                    c = new AdminUnsuspendUserCommand();
                    break;
                case "cancelBooking":
                    // Do all logic cancel a booking
                    c = new CancelBookingCommand();
                    break;
                case "editAccountDetails":
                    // Do all logic for editing account details
                    c = new EditAccountDetailsCommand();
                    break;
                case "answerSecurityQuestion":
                    // Do all logic for answering security questions
                    c = new AnswerSecurityQuestionCommand();
                    break;
                case "changePassword":
                    // Do all logic for changing password
                    c = new ChangePasswordCommand();
                    break;
                case "verifyWhatsAppCode":
                    // Do all logic for changing password
                    c = new VerifyWhatsAppCodeCommand();
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
