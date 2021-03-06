/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.User;
import java.util.ArrayList;

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
     * This method allows an admin to disable a standard user by passing that user's id as an
     * argument.
     * 
     * @param id The id of the user that will be disabled.
     * @return An int containing the amount of rows affected in the table.
     */
    public int disableMember(int id);
    
    /**
     * Enables a member.
     * 
     * This method allows an admin to enable a standard user that is disabled by passing that user's id as an
     * argument.
     * 
     * @param id The id of the user that will be enabled.
     * @return An int containing the amount of rows affected in the table.
     */
    public int enableMember(int id);
    
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
     * @param userId The id of the user.
     * @param email The username of the user.
     * 
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int updateUserEmail(int userId, String email);
    
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
    
    /**
     * Updates a User's first address line.
     * 
     * If the information entered by the user to update there first address line
     * is correct then the first address line is updated and if not an error is displayed.
     * 
     * @param user The user being passed through.
     * @param addressLine1 The second address line of the user.
     * 
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int updateUserAddressLine1(User user, String addressLine1);
    
    /**
     * Updates a User's second address line.
     * 
     * If the information entered by the user to update there second address line
     * is correct then the second address line is updated and if not an error is displayed.
     * 
     * @param user The user being passed through.
     * @param addressLine2 The second address line of the user.
     * 
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int updateUserAddressLine2(User user, String addressLine2);
    
    /**
     * Updates a User's city or town.
     * 
     * If the information entered by the user to update there city or town
     * is correct then the city or town is updated and if not an error is displayed.
     * 
     * @param user The user being passed through.
     * @param cityOrTown The second address line of the user.
     * 
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int updateCityOrTown(User user, String cityOrTown);
    
    /**
     * Updates a User's postal code.
     * 
     * If the information entered by the user to update there postal code
     * is correct then the postal code is updated and if not an error is displayed.
     * 
     * @param user The user being passed through.
     * @param postalCode The second address line of the user.
     * 
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int updatePostalCode(User user, String postalCode);
    
    /**
     * Updates a User's county.
     * 
     * If the information entered by the user to update there county
     * is correct then the county is updated and if not an error is displayed.
     * 
     * @param user The user being passed through.
     * @param county The second address line of the user.
     * 
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int updateCounty(User user, String county);
    
    /**
     * Updates a User's country.
     * 
     * If the information entered by the user to update there country
     * is correct then the country is updated and if not an error is displayed.
     * 
     * @param user The user being passed through.
     * @param country The second address line of the user.
     * 
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int updateCountry(User user, String country);
    
    /**
     * Updates a User's first name.
     * 
     * If the information entered by the user to update there first name
     * is correct then the first name is updated and if not an error is displayed.
     * 
     * @param user The user being passed through.
     * @param firstName The second address line of the user.
     * 
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int updateFirstName(User user, String firstName);
    
    /**
     * Updates a User's last name.
     * 
     * If the information entered by the user to update there last name
     * is correct then the last name is updated and if not an error is displayed.
     * 
     * @param user The user being passed through.
     * @param lastName The second address line of the user.
     * 
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int updateLastName(User user, String lastName);
    
    /**
     * Updates a User's password.
     * 
     * If the information entered by the user to update there password
     * is correct then the password is updated and if not an error is displayed.
     * 
     * @param user The user being passed through.
     * @param password The second address line of the user.
     * 
     * @return An int containing how many rows in the database were affected. Should
     * contain 1 if a row was removed, and 0 if not.
     */
    public int updateUserPassword(User user, String password);
    
    /**
     * Gets Users from the database.
     * 
     * Gets all from all Users from the database.
     * 
     * @return Returns an arraylist of Users.
     */
    public ArrayList<User> getUsers();
}
