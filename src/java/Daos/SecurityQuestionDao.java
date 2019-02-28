/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.SecurityQuestion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 * 
 * The author of this class is Gerard Hoey
 */
public class SecurityQuestionDao extends Dao implements SecurityQuestionDaoInterface {
    
    public SecurityQuestionDao(String databaseName) {
        super(databaseName);
    }

    @Override
    public ArrayList<SecurityQuestion> getSecurityQuestions() {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        ArrayList<SecurityQuestion> securityQuestions = new ArrayList();

        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM security_question";
            // Compile into SQL
            ps = con.prepareStatement(query);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                int id = rs.getInt("id");
                String question = rs.getString("question");

                SecurityQuestion securityQuestion = new SecurityQuestion(id, question);

                // Store each security question in the ArrayList
                securityQuestions.add(securityQuestion);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the security_question table in the getSecurityQuestions() method\n"
                    + ex.getMessage());
        } // Close open components
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                freeConnection(con);
            }
        }
        // Return results
        return securityQuestions;
    }

    @Override
    public SecurityQuestion getSecurityQuestionById(int id) {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        SecurityQuestion securityQuestion = null;

        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM flight "
                    + "WHERE id = ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                id = rs.getInt("id");
                String question = rs.getString("question");

                securityQuestion = new SecurityQuestion(id, question);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the security_question table in the getSecurityQuestions() method\n"
                    + ex.getMessage());
        } // Close open components
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FlightDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                freeConnection(con);
            }
        }
        // Return results
        return securityQuestion;
    }
}
