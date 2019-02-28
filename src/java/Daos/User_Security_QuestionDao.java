/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Daos.Dao;
import Daos.FlightDao;
import Dtos.User_Security_Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Dean Farrelly
 */
public class User_Security_QuestionDao extends Dao implements User_Security_QuestionInterface {

    public User_Security_QuestionDao(String databaseName) {
        super(databaseName);
    }

    @Override
    public boolean addUser_Security_Question(User_Security_Question usq) {
        // Required for DB interation
        Connection con = null;
        PreparedStatement ps = null;

        boolean added = true;

        String hashedAnswer = BCrypt.hashpw(usq.getAnswer(), BCrypt.gensalt());

        try {
            con = getConnection();
            // Make query
            String query = " INSERT INTO user_security_question (userId, securityQuestionId, answer) "
                    + " VALUES (?, ?, ?) ";
            // Compile into SQL
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            // Setting the name variable for the statement
            ps.setInt(1, usq.getUserId());
            ps.setInt(2, usq.getSecurityQuestionId());
            ps.setString(3, hashedAnswer);
            //Execute the SQL
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("An exception occured when querying the user_security_question table in the addUser_Security_Question() method\n" + ex.getMessage());
            System.out.println("\t" + ex.getMessage());
            added = false;
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("SQL Exception with ps\n" + ex.getMessage());
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    System.out.println("SQL Exception with con\n" + ex.getMessage());
                }
            }
        }

        return added;
    }

    @Override
    public ArrayList<User_Security_Question> getUser_Security_Question() {
        // DB interaction
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // ArrayList to store results
        ArrayList<User_Security_Question> usqs = new ArrayList();

        try {
            con = getConnection();
            // Query
            String query = "SELECT * FROM user_security_question";
            // Compile into SQL
            ps = con.prepareStatement(query);
            // Execute SQL
            rs = ps.executeQuery();

            // While loop through rows returned from query
            while (rs.next()) {
                int userId = rs.getInt("userId");
                int securityQuestionId = rs.getInt("securityQuestionId");
                String answer = rs.getString("answer");

                User_Security_Question usq = new User_Security_Question(userId, securityQuestionId, answer);

                // Store each user_security_question in the ArrayList
                usqs.add(usq);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occurred while querying the user_security_question table in the getUser_Security_Question() method\n"
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
        return usqs;
    }

    @Override
    public ArrayList<User_Security_Question> getUser_Security_QuestionById(int userId) {
        // Required for DB interation
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // Required for data/result storage
        ArrayList<User_Security_Question> usqs = new ArrayList();

        try {
            con = getConnection();
            // Make query
            String query = "SELECT * FROM user_security_question "
                    + " WHERE userId = ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            //Execute the SQL
            rs = ps.executeQuery();
            
            while (rs.next()) {
                userId = rs.getInt("userId");
                int securityQuestionId = rs.getInt("securityQuestionId");
                String answer = rs.getString("answer");
                
                User_Security_Question usq = new User_Security_Question(userId, securityQuestionId, answer);

                // Store each user_security_question in the ArrayList
                usqs.add(usq);
            }
        } catch (SQLException ex) {
            System.out.println("An exception occured when querying the user_security_question table in the getUser_Security_QuestionById() method\n" + ex.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    System.out.println("SQL Exception with rs\n" + ex.getMessage());
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("SQL Exception with ps\n" + ex.getMessage());
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    System.out.println("SQL Exception with con\n" + ex.getMessage());
                }
            }
        }

        return usqs;
    }

    @Override
    public void removeUser_Security_QuestionById(int userId) {
        // Required for DB interation
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = getConnection();
            // Make query
            String query = "DELETE FROM user_security_question "
                    + " WHERE userId = ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            //Execute the SQL
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("An exception occured when querying the user_security_question table in the removeUser_Security_QuestionById() method\n" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("SQL Exception with ps\n" + ex.getMessage());
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    System.out.println("SQL Exception with con\n" + ex.getMessage());
                }
            }
        }
    }

}
