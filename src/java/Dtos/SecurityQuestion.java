/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

/**
 * Microhard - Paul Sweeney, Dean Farrelly and Gerard Hoey
 *
 * The author of this class is Gerard Hoey
 */
public class SecurityQuestion {

    private int id;
    private String question;

    public SecurityQuestion() {
        this.id = -1;
    }

    public SecurityQuestion(String question) {
        this.id = -1;
        this.question = question;
    }

    public SecurityQuestion(int id, String question) {
        this.id = id;
        this.question = question;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 47 * hash + this.id;
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
        final SecurityQuestion other = (SecurityQuestion) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "SecurityQuestion{" + "id=" + id + ", question=" + question + '}';
    }
}
