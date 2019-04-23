/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.ArchiveDao;
import Daos.Checked_baggageDao;
import Daos.Dao;
import Daos.FlightDao;
import Daos.PlaneDao;
import Daos.Plane_InventoryDao;
import Daos.User_FlightDao;
import Dtos.Checked_baggage;
import Dtos.Flight;
import Dtos.Plane;
import Dtos.User_Flight;
import Validation.Validation;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author D00194995
 */
public class AdminArchiveCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        FlightDao fDao = new FlightDao(Dao.getDatabaseName());
        User_FlightDao ufDao = new User_FlightDao(Dao.getDatabaseName());
        Checked_baggageDao cbDao = new Checked_baggageDao(Dao.getDatabaseName());
        ArchiveDao aDao = new ArchiveDao(Dao.getDatabaseName());

        String departureDateString = request.getParameter("departureDate");

        if (departureDateString != null && !departureDateString.equals("")) {

            // Converting the departureDate to the correct format
            java.sql.Date departureDate = java.sql.Date.valueOf(departureDateString);

            int successes = 0;

            // Archive flights
            ArrayList<Flight> flightsForArchive = fDao.getFlightsBeforeDepartureDate(departureDate);
            for (Flight flight : flightsForArchive) {
                int archivedFlight = -1;
                archivedFlight = aDao.archiveFlight(flight);
                // If successful, archive user_flights
                if (archivedFlight > 0) {
                    ArrayList<User_Flight> user_flightsForArchive = ufDao.getUser_FlightsByFlightId(flight.getId());
                    for (User_Flight user_flight : user_flightsForArchive) {
                        int archivedUser_Flight = -1;
                        archivedUser_Flight = aDao.archiveUser_Flight(user_flight);
                        // If successful, archive checked_baggage
                        if (archivedUser_Flight > 0) {
                            ArrayList<Checked_baggage> checked_baggageForArchive = cbDao.getChecked_baggageByUser_flightId(user_flight.getId());
                            for (Checked_baggage checked_baggage : checked_baggageForArchive) {
                                int archivedChecked_baggage = -1;
                                archivedChecked_baggage = aDao.archiveChecked_baggage(checked_baggage);
                                // If successful, remove checked_baggage
                                if (archivedChecked_baggage > 0) {
                                    cbDao.removeChecked_baggage(checked_baggage.getId());
                                }
                            }
                            // Remove user_flight
                            ufDao.removeUser_Flight(user_flight.getId());
                        }
                    }
                    // Remove flight
                    fDao.removeFlight(flight.getId());
                    successes++;
                }
            }

            forwardToJsp = "adminArchiveFlights.jsp";
            String successMessage = successes + " out of " + flightsForArchive.size() + " flights were archived.";
            session.setAttribute("successMessage", successMessage);

        } else {
            String errorMessage = "Invalid date.";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }

}
