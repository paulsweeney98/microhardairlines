/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.User_Security_Question;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author D00191889
 */
public class User_Security_QuestionDaoTest {
    
    // Setting up to use the FlightDao class' methods.
    User_Security_QuestionDao usqDao = new User_Security_QuestionDao(Dao.getTestDatabaseName());

    /**
     * Test of addUser_Security_Question method, of class User_Security_QuestionDao.
     */
    @Test
    public void testAddUser_Security_Question() {
        System.out.println("addUser_Security_Question");
        User_Security_Question u = new User_Security_Question(2, 1, "Dundalk");
        boolean result = usqDao.addUser_Security_Question(u);
        
        if (result) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsDeleted = usqDao.removeUser_Security_QuestionById(2, 1);
            assertEquals(1, rowsDeleted);
        }
    }

    /**
     * Test of getUser_Security_Question method, of class User_Security_QuestionDao.
     */
    @Test
    public void testGetUser_Security_Question() {
        System.out.println("getUser_Security_Question");
        int expResult = 1;
        ArrayList<User_Security_Question> user_security_question = usqDao.getUser_Security_Question();
        int result = user_security_question.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of getUser_Security_QuestionById method, of class User_Security_QuestionDao.
     */
    @Test
    public void testGetUser_Security_QuestionById() {
        System.out.println("getUser_Security_QuestionById");
        int expResult = 1;
        ArrayList<User_Security_Question> user_security_question = usqDao.getUser_Security_QuestionById(3);
        int result = user_security_question.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of checkUser_Security_Answer method, of class User_Security_QuestionDao.
     */
    @Test
    public void testCheckUser_Security_Answer() {
        System.out.println("checkUser_Security_Answer");
        int expResult = 1;
        User_Security_Question user_security_answer = usqDao.checkUser_Security_Answer(3, 1, "Dundalk");
        int result = user_security_answer.getSecurityQuestionId();
        assertEquals(expResult, result);
    }

    /**
     * Test of removeUser_Security_QuestionById method, of class User_Security_QuestionDao.
     */
    @Test
    public void testRemoveUser_Security_QuestionById() {
        System.out.println("removeUser_Security_QuestionById");
        User_Security_Question u = new User_Security_Question(2, 1, "Dundalk");
        boolean result = usqDao.addUser_Security_Question(u);
        
        if (result) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsDeleted = usqDao.removeUser_Security_QuestionById(2, 1);
            assertEquals(1, rowsDeleted);
        }
    }
    
}
