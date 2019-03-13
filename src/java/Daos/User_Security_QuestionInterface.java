/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.User_Security_Question;
import java.util.ArrayList;

/**
 *
 * @author Dean Farrelly
 */
public interface User_Security_QuestionInterface {
    
    public int addUser_Security_Question(User_Security_Question u);
    public ArrayList<User_Security_Question> getUser_Security_Question();
    public ArrayList<User_Security_Question> getUser_Security_QuestionById(int userId);
    public User_Security_Question checkUser_Security_Answer(int userId, int securityQuestionId, String answer);
    public int removeUser_Security_QuestionById(int userId);
}
