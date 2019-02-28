/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

/**
 *
 * @author Dean Farrelly
 */
public class User_Security_Question {
    private int userId;
    private int securityQuestionId;
    private String answer;
    
    
    public User_Security_Question() {
        this.userId = -1;
    }

    public User_Security_Question(int userId, int securityQuestionId, String answer) {
        this.userId = userId;
        this.securityQuestionId = securityQuestionId;
        this.answer = answer;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getSecurityQuestionId() {
        return securityQuestionId;
    }

    public void setSecurityQuestionId(int securityQuestionId) {
        this.securityQuestionId = securityQuestionId;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 29 * hash + this.userId;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final User_Security_Question other = (User_Security_Question) obj;
        if (this.userId != other.userId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "User_Security_Question{" + "userId=" + userId + ", securityQuestionId=" + securityQuestionId + ", answer=" + answer + '}';
    }
    
    
}
