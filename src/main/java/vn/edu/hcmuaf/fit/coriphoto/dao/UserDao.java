package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.time.LocalDate;

public class UserDao {
    public UserDao() {
    }

    public User findByEmail(String email) {
        User user = null;
        try {
            Jdbi jdbi = DBConnect.get();
            String query = "SELECT * FROM users WHERE email = :email";

            user = jdbi.withHandle(handle ->
                    handle.createQuery(query)
                            .bind("email", email) // Gắn giá trị tham số email
                            .map((rs, ctx) -> new User(
                                    rs.getInt("uid"),             // Mapping cột "uid"
                                    rs.getInt("role"),            // Mapping cột "role"
                                    rs.getString("fullName"),     // Mapping cột "fullName"
                                    rs.getString("username"),     // Mapping cột "username"
                                    rs.getString("password"),     // Mapping cột "password"
                                    rs.getString("email"),        // Mapping cột "email"
                                    rs.getObject("createDate", LocalDate.class) // Mapping cột "createDate"
                            ))
                            .findOne()
                            .orElse(null) // Trả về null nếu không tìm thấy
            );

        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để debug
        }
        return user;
    }

    public boolean createUser(String email, String password, String username) {
        try {
            Jdbi jdbi = DBConnect.get();
            // Băm mật khẩu trước khi lưu vào cơ sở dữ liệu
            String hashedPassword = hashPasswordMD5(password);
            if (hashedPassword == null) return false;

            jdbi.useHandle(handle -> handle.execute(
                    "INSERT INTO users (role, username, email, password, createDate) VALUES (?, ?, ?, ?, ?)",
                    2, username, email, hashedPassword, LocalDate.now()
            ));

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public String hashPasswordMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hashBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
//    public static void main(String[] args) {
//        UserDao userDao = new UserDao();
//        System.out.println(userDao.createUser("123@gmail.com","a","Test"));
//    }
}
