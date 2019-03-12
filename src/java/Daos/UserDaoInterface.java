/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.User;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 * 
 * The author of this class is Paul Sweeney
 */
public interface UserDaoInterface {
    
    /**
     * Adds a User to the database.
     * 
     * Adds a User passed from the app to the database by inserting the user's data into the user table.
     * 
     * @param u The User that is to be entered into the database.
     * @return Returns an int which is the id of the new row inserted in the database
     */
    public int addUser(User u);
    
    /**
     * Disables a member.
     * 
     * This method allows an admin to disable a standard user by passing that user as an
     * argument.
     * 
     * @param u The user that will be disabled.
     * @return An int containing the amount of rows affected in the table.
     */
    public int disableMember(User u);
    
    /**
     * Enables a member.
     * 
     * This method allows an admin to enable a standard user that is disabled by passing that user as an
     * argument.
     * 
     * @param u The user that will be enabled.
     * @return An int containing the amount of rows affected in the table.
     */
    public int enableMember(User u);
    
    /**
     * Gets a user by their username and password.
     * 
     * In the app, when a user is logged in, their username and password is already
     * provided so this method allows the user's details to be stored for further use
     * in other methods.
     * 
     * @param username The username of the user.
     * @param password The password of the user.
     * @return The user that matches this username and password.
     */
    public User getCurrentUser(String username, String password);
    
    /**
     * Gets a user by their username.
     * 
     * Gets a user by their username by finding the user that matches this username
     * in the database.
     * 
     * @param username The username of the user.
     * @return The user that matches this username.
     */
    public User getUserByUsername(String username);
    
    /**
     * Gets a user by their id.
     * 
     * Gets a user by their id by finding the user that matches this id
     * in the database.
     * 
     * @param user_id The username of the user.
     * @return The user that matches this id.
     */
    public User getUserById(int user_id);
    
    public User getUserByEmail(String email);
    
    /**
     * Removes a user by their id.
     * 
     * Removes a user by passing their id as an argument and removing the
     * user that has that id in the database.
     * 
     * @param userId The userId of the user.
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int removeUserById(int userId);
    
    /**
     * Updates a User's Email.
     * 
     * If the information entered by the user to update there email
     * is correct then the email is updated and if not an error is displayed.
     * 
     * @param user The user being passed through.
     * @param email The username of the user.
     * 
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int updateUserEmail(User user, String email);
    
    /**
     * Updates a User's Phone Number.
     * 
     * If the information entered by the user to update there phone number
     * is correct then the phone number is updated and if not an error is displayed.
     * 
     * @param user The user being passed through.
     * @param phoneNumber The username of the user.
     * 
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int updateUserPhone(User user, String phoneNumber);
}
