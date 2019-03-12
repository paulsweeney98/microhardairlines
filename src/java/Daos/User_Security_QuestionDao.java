/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.User;
import Dtos.User_Security_Question;
import java.sql.Connection;
import java.sql.Date;
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
    public boolean addUser_Security_Question(User_Security_Question u) {
        // Required for DB interation
        Connection con = null;
        PreparedStatement ps = null;
        
        boolean added = true;
        
        String hashedAnswer = BCrypt.hashpw(u.getAnswer(), BCrypt.gensalt());
        
        try {
            con = getConnection();
            // Make query
            String query = " INSERT INTO user_security_question (userId, securityQuestionId, answer) "
                    + " VALUES (?, ?, ?) ";
            // Compile into SQL
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            // Setting the name variable for the statement
            ps.setInt(1, u.getUserId());
            ps.setInt(2, u.getSecurityQuestionId());
            ps.setString(3, hashedAnswer);
            //Execute the SQL
            ps.executeUpdate();
            
        } catch(SQLException ex) {
            System.out.println("An exception occured when querying the user_security_question table in the addUser_Security_Question() method\n" + ex.getMessage());
            System.out.println("\t"+ex.getMessage());
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
        ArrayList<User_Security_Question> usq = new ArrayList();

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

                User_Security_Question u = new User_Security_Question(userId, securityQuestionId, answer);

                // Store each user_security_question in the ArrayList
                usq.add(u);
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
        return usq;
    }

    @Override
    public ArrayList<User_Security_Question> getUser_Security_QuestionById(int userId) {
        // Required for DB interation
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        // Required for data/result storage
        ArrayList<User_Security_Question> usq = new ArrayList();
        
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

            while(rs.next()) {
                userId = rs.getInt("userId");
                int securityQuestionId = rs.getInt("securityQuestionId");
                String answer = (rs.getString("answer"));
                
                User_Security_Question u = new User_Security_Question(userId, securityQuestionId, answer);
                
                // Store each user_security_question in the ArrayList
                usq.add(u);
            }
        } catch(SQLException ex) {
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
        
        return usq;
    }
    
    @Override
    public User_Security_Question checkUser_Security_Answer(int userId, int securityQuestionId, String answer) {
        // Required for DB interation
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        // Required for data/result storage
        User_Security_Question u = null;
        
        try {
            con = getConnection();
            // Make query
            String query = " SELECT * FROM user_security_question "
                    + " WHERE userId = ? "
                    + " AND securityQuestionId = ? ";
            // Compile into SQL
            ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, securityQuestionId);
            //Execute the SQL
            rs = ps.executeQuery();
            
            if(rs.next()){
                boolean answerMatches = false;
                String answerFromDatabase = rs.getString("answer");
                if (BCrypt.checkpw(answer, answerFromDatabase))
                        answerMatches = true;
                else
                        answerMatches = false;
            
                if (answerMatches) {
                    userId = rs.getInt("userId");
                    securityQuestionId = rs.getInt("securityQuestionId");
                    answer = rs.getString("answer");
                    
                    

                    u = new User_Security_Question(userId, securityQuestionId, answer);
                } else {
                    u = null;
                }
            }
            
        } catch(SQLException ex) {
            System.out.println("An exception occured when querying the user_security_question table in the checkUser_Security_Answer() method\n" + ex.getMessage());
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
        
        return u;
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
