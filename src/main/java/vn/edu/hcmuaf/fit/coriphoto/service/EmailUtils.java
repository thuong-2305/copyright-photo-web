package vn.edu.hcmuaf.fit.coriphoto.services;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class EmailUtils {
    // Thông tin cấu hình SMTP (Gmail trong ví dụ này)
    private static final String host = "smtp.gmail.com";
    private static final String user = "coriphototpk@gmail.com";
    private static final String password = "nhcvjdilsplrztps";
    // Hàm gửi email
    public static boolean sendEmail(String to, String subject, String body) {

        // Cấu hình thuộc tính SMTP
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Tạo session email
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            // Tạo đối tượng MimeMessage
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(body);

            // Gửi email
            Transport.send(message);
            System.out.println("Email đã được gửi thành công");
            return true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
            return false;
        }
    }

    public static int generateOTP(){
        Random rd = new Random();
        return 100000 + rd.nextInt(900000);
    }

    public static void main(String[] args) {
        sendEmail("vophuc1909@gmail.com", "Test OTP", "Your OTP is: 123456");
    }
}

