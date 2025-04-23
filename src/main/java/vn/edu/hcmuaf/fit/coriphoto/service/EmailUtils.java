package vn.edu.hcmuaf.fit.coriphoto.service;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.activation.URLDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.util.ByteArrayDataSource;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.*;
import java.util.regex.Pattern;

public class EmailUtils {
    // Thông tin cấu hình SMTP (Gmail trong ví dụ này)
    private static final String host = "smtp.gmail.com";
    private static final String user = "coriphototpk@gmail.com";
    private static final String password = "nhcvjdilsplrztps";
    private static final String EMAIL_REGEX = "^[A-Za-z0-9._%+-]+@gmail\\.com$";

    public static boolean isValidEmail(String email) {
        return Pattern.matches(EMAIL_REGEX, email);
    }

    // Hàm gửi email chi mỗi text
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

    public static boolean sendEmailWithAttachments(String to, String subject, String body, List<String> imagePaths, List<String> imageNames, List<Integer> licenseIds) {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);

            // Nội dung email chính
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setText(body);

            // Tạo nội dung file license.txt
            String licenseContent = generateLicenseContent(imageNames, licenseIds);

            // Tạo file đính kèm license.txt
            MimeBodyPart licensePart = new MimeBodyPart();
            DataSource licenseSource = new ByteArrayDataSource(licenseContent, "text/plain");
            licensePart.setDataHandler(new DataHandler(licenseSource));
            licensePart.setFileName("license.txt");

            // Tạo danh sách file ảnh đính kèm
            List<MimeBodyPart> imageParts = new ArrayList<>();
            for (int i = 0; i < imagePaths.size(); i++) {
                MimeBodyPart imagePart = new MimeBodyPart();
                File imageFile = new File(imagePaths.get(i));
                DataSource imageSource = new FileDataSource(imageFile);
                imagePart.setDataHandler(new DataHandler(imageSource));
                imagePart.setFileName(imageNames.get(i)); // Đặt tên file ảnh theo tên ảnh
                imageParts.add(imagePart);
            }

            // Gộp nội dung email, license.txt và ảnh
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(textPart);
            multipart.addBodyPart(licensePart);
            for (MimeBodyPart imagePart : imageParts) {
                multipart.addBodyPart(imagePart);
            }

            message.setContent(multipart);

            // Gửi email
            Transport.send(message);
            return true;
        } catch (MessagingException | IOException mex) {
            mex.printStackTrace();
            return false;
        }
    }

    // Phương thức tạo nội dung file license.txt
    private static String generateLicenseContent(List<String> imageNames, List<Integer> licenseIds) {
        StringBuilder content = new StringBuilder("Danh sách ảnh và license:\n");
        for (int i = 0; i < imageNames.size(); i++) {
            String licenseType = (licenseIds.get(i) == 1) ? "Tiêu chuẩn" : "Nâng cao";
            content.append(imageNames.get(i)).append(" - License: ").append(licenseType).append("\n");
        }
        return content.toString();
    }

    public static boolean sendEmailWithAttachment(String to, String subject, String body, String imagePath, String imageName, int licenseId) {
        // Cấu hình các thuộc tính cho SMTP server
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Tạo phiên làm việc với thông tin xác thực
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

            // Tạo phần nội dung chính của email
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setText(body);

            // Tạo nội dung cho tệp license.txt
            String licenseContent = generateLicenseContent(imageName, licenseId);

            // Tạo tệp đính kèm license.txt
            MimeBodyPart licensePart = new MimeBodyPart();
            DataSource licenseSource = new ByteArrayDataSource(licenseContent, "text/plain");
            licensePart.setDataHandler(new DataHandler(licenseSource));
            licensePart.setFileName("license.txt");

            // Tạo tệp đính kèm cho ảnh
            MimeBodyPart imagePart = new MimeBodyPart();
            File imageFile = new File(imagePath);
            DataSource imageSource = new FileDataSource(imageFile);
            imagePart.setDataHandler(new DataHandler(imageSource));
            imagePart.setFileName(imageName);

            // Tạo đối tượng Multipart và thêm các phần nội dung
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(textPart);
            multipart.addBodyPart(licensePart);
            multipart.addBodyPart(imagePart);

            // Thiết lập nội dung cho thông điệp
            message.setContent(multipart);

            // Gửi email
            Transport.send(message);
            return true;
        } catch (MessagingException | IOException mex) {
            mex.printStackTrace();
            return false;
        }
    }

    // Phương thức tạo nội dung cho tệp license.txt
    private static String generateLicenseContent(String imageName, int licenseId) {
        String licenseType = (licenseId == 1) ? "Tiêu chuẩn" : "Nâng cao";
        return "Tên ảnh: " + imageName + "\nLicense: " + licenseType + "\n";
    }


    public static int generateOTP(){
        Random rd = new Random();
        return 100000 + rd.nextInt(900000);
    }

}

