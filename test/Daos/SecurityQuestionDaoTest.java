/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.SecurityQuestion;
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
public class SecurityQuestionDaoTest {
    
    // Setting up to use the SecurityQuestionDao class' methods.
    SecurityQuestionDao sqDao = new SecurityQuestionDao(Dao.getTestDatabaseName());

    /**
     * Test of getSecurityQuestions method, of class SecurityQuestionDao.
     */
    @Test
    public void testGetSecurityQuestions() {
        System.out.println("getSecurityQuestions");
        int expResult = 7;
        ArrayList<SecurityQuestion> securityQuestions = sqDao.getSecurityQuestions();
        int result = securityQuestions.size();
        assertEquals(expResult, result);
    }

    /**
     * Test of getSecurityQuestionById method, of class SecurityQuestionDao.
     */
    @Test
    public void testGetSecurityQuestionById() {
        System.out.println("getSecurityQuestionById");
        String expResult = "In which city were you born?";
        SecurityQuestion securityQuestion = sqDao.getSecurityQuestionById(1);
        String result = securityQuestion.getQuestion();
        assertEquals(expResult, result);
    }
    
}
