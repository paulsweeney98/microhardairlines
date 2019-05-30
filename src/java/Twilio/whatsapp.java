/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Twilio;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import java.util.Random;

/**
 *
 * @author Paul Sweeney
 */
public class whatsapp {
    public static final String ACCOUNT_SID = "";
    public static final String AUTH_TOKEN = "";

//    public static void main(String[] args) {
//        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
//        Message message = Message.creator(
//                new com.twilio.type.PhoneNumber("whatsapp:+"),
//                new com.twilio.type.PhoneNumber("whatsapp:+"),
//                "Hello World!")
//            .create();
//
//        System.out.println(message.getSid());
//    }
    
    public String sendWhatsAppMessage(String code, String phoneNumber) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message message = Message.creator(
                new com.twilio.type.PhoneNumber("whatsapp:" + phoneNumber),
                new com.twilio.type.PhoneNumber("whatsapp:+0"),
                code)
            .create();

        message.getSid();
        return message.getSid();
    }
    
    public String createCode() {
        Random rand = new Random();

        int number1 = rand.nextInt(10);
        int number2 = rand.nextInt(10);
        int number3 = rand.nextInt(10);
        int number4 = rand.nextInt(10);
        
        String code = number1 + "" + number2 + "" + number3 + "" + number3 + "";
        
        return code;
    }
}
