/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.Dao;
import Daos.FlightDao;
import Daos.User_FlightDao;
import Dtos.Flight;
import Dtos.User;
import Dtos.User_Flight;
import QR_Code.QRCodeGenerator;
import Validation.Validation;
import com.google.zxing.WriterException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Paul Sweeney
 */
public class GenerateBoardingPassCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        Validation v = new Validation();
        QRCodeGenerator qrGenerator = new QRCodeGenerator();
        User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
        FlightDao fDao = new FlightDao(Dao.getDatabaseName());
        
        String flightIdString = request.getParameter("flightId");
        int flightId = v.convertStringToInt(flightIdString);
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        if (flightId > -1 && loggedInUser != null) {
            
            // Getting the flight
            Flight flight = fDao.getFlightById(flightId);
            
            // Getting the user_flights
            ArrayList<User_Flight> user_flights = ufDao.getUser_FlightsByFlightIdUserId(flightId, loggedInUser.getUserId());
            
            // Generating the boarding passes
            boolean boardingPassesGenerated = true;
            for (User_Flight user_flight : user_flights) {
                try {
                    qrGenerator.generateQRCodeImage("ID: " + user_flight.getId() + "\nPassenger: " + user_flight.getPassengerFirstName() + " " + user_flight.getPassengerLastName() + "\nGoing From: " + flight.getDepartureAirport() + "\nTo: " + flight.getArrivalAirport(), 350, 350, "MyQRCode" + user_flight.getPassengerLastName() + user_flight.getId() + ".png");
                } catch (WriterException ex) {
                    Logger.getLogger(GenerateBoardingPassCommand.class.getName()).log(Level.SEVERE, null, ex);
                    boardingPassesGenerated = false;
                } catch (IOException ex) {
                    Logger.getLogger(GenerateBoardingPassCommand.class.getName()).log(Level.SEVERE, null, ex);
                    boardingPassesGenerated = false;
                }
            }
            
            if (boardingPassesGenerated == true) {
                forwardToJsp = "boardingPass.jsp?flightId=" + flightId;
            } else {
                String errorMessage = "Problem generating boarding passes.";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
            
        } else {
            String errorMessage = "Invalid flight and/or user information.";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        
        return forwardToJsp;
    }
    
}
