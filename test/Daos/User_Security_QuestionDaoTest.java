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
        User_Security_Question u = new User_Security_Question(6, 1, "Dundalk");
        int result = usqDao.addUser_Security_Question(u);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsDeleted = usqDao.removeUser_Security_QuestionById(result);
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

//    /**
//     * Test of getUser_Security_QuestionById method, of class User_Security_QuestionDao.
//     */
//    @Test
//    public void testGetUser_Security_QuestionById() {
//        System.out.println("getUser_Security_QuestionById");
//        int userId = 0;
//        User_Security_QuestionDao instance = null;
//        ArrayList<User_Security_Question> expResult = null;
//        ArrayList<User_Security_Question> result = instance.getUser_Security_QuestionById(userId);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of checkUser_Security_Answer method, of class User_Security_QuestionDao.
//     */
//    @Test
//    public void testCheckUser_Security_Answer() {
//        System.out.println("checkUser_Security_Answer");
//        int userId = 0;
//        int securityQuestionId = 0;
//        String answer = "";
//        User_Security_QuestionDao instance = null;
//        User_Security_Question expResult = null;
//        User_Security_Question result = instance.checkUser_Security_Answer(userId, securityQuestionId, answer);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of removeUser_Security_QuestionById method, of class User_Security_QuestionDao.
//     */
//    @Test
//    public void testRemoveUser_Security_QuestionById() {
//        System.out.println("removeUser_Security_QuestionById");
//        int userId = 0;
//        User_Security_QuestionDao instance = null;
//        instance.removeUser_Security_QuestionById(userId);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
    
}
