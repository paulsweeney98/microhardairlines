/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.User;
import java.sql.Date;
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
public class UserDaoTest {
    
    // Setting up to use the UserDao class' methods.
    UserDao uDao = new UserDao(Dao.getTestDatabaseName());

    /**
     * Test of addUser method, of class UserDao.
     */
    @Test
    public void testAddUser() {
        System.out.println("addUser");
        User u = new User("test@test.com", "password1", "test", "test", java.sql.Date.valueOf("1998-06-06"), "0000000", "test", "test", "test", "test", "test", "test", User.STANDARD, User.ENABLED);
        int result = uDao.addUser(u);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsDeleted = uDao.removeUserById(result);
            assertEquals(1, rowsDeleted);
        }
    }

    /**
     * Test of disableMember method, of class UserDao.
     */
    @Test
    public void testDisableMember() {
        System.out.println("disableMember");
        User u = uDao.getUserById(6);
        int result = uDao.disableMember(u);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsUpdated = uDao.enableMember(u);
            assertEquals(1, rowsUpdated);
        }
    }

    /**
     * Test of enableMember method, of class UserDao.
     */
    @Test
    public void testEnableMember() {
        System.out.println("enableMember");
        User u = uDao.getUserById(2);
        int result = uDao.enableMember(u);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsUpdated = uDao.disableMember(u);
            assertEquals(1, rowsUpdated);
        }
    }

    /**
     * Test of getCurrentUser method, of class UserDao.
     */
    @Test
    public void testGetCurrentUser() {
        System.out.println("getCurrentUser");
        String expResult = "Paul";
        User user = uDao.getCurrentUser("pauls@gmail.com", "password1");
        String result = user.getFirstName();
        assertEquals(expResult, result);
    }

    /**
     * Test of getUserById method, of class UserDao.
     */
    @Test
    public void testGetUserById() {
        System.out.println("getUserById");
        int userId = 6;
        String expResult = "Paul";
        User user = uDao.getUserById(userId);
        String result = user.getFirstName();
        assertEquals(expResult, result);
    }

    /**
     * Test of removeUserById method, of class UserDao.
     */
    @Test
    public void testRemoveUserById() {
        System.out.println("removeUserById");
        User u = new User("test@test.com", "password1", "test", "test", java.sql.Date.valueOf("1998-06-06"), "0000000", "test", "test", "test", "test", "test", "test", User.STANDARD, User.ENABLED);
        int result = uDao.addUser(u);
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsDeleted = uDao.removeUserById(result);
            assertEquals(1, rowsDeleted);
        }
    }
    
    /**
     * Test of updateUserEmail method, of class UserDao.
     */
    @Test
    public void testUpdateUserEmail() {
        System.out.println("updateUserEmail");
        int userId = 6;
        int expResult = 0;
        int result = uDao.updateUserEmail(userId, "test@test.com");
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsUpdated = uDao.updateUserEmail(userId, "pauls@gmail.com");
            assertEquals(1, rowsUpdated);
        }
    }

    /**
     * Test of updateUserPhone method, of class UserDao.
     */
    @Test
    public void testUpdateUserPhone() {
        System.out.println("updateUserPhone");
        User user = uDao.getUserById(6);
        int expResult = 0;
        int result = uDao.updateUserPhone(user, "0000000");
        
        if (result > 0) {
            System.out.println("Method returned appropriately, confirming database changed by trying to remove what was added");
            int rowsUpdated = uDao.updateUserPhone(user, "0877777777");
            assertEquals(1, rowsUpdated);
        }
    }

    /**
     * Test of getUserByEmail method, of class UserDao.
     */
    @Test
    public void testGetUserByEmail() {
        System.out.println("getUserByEmail");
        String expResult = "Paul";
        User user = uDao.getUserByEmail("pauls@gmail.com");
        String result = user.getFirstName();
        assertEquals(expResult, result);
    }
    
}
