/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.SecurityQuestion;
import java.util.ArrayList;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 * 
 * The author of this class is Gerard Hoey
 */
public interface SecurityQuestionDaoInterface {
    public ArrayList<SecurityQuestion> getSecurityQuestions();
    public SecurityQuestion getSecurityQuestionById(int id);
}
